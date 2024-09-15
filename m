Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6DCC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714EC84A43;
	Sun, 15 Sep 2024 21:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sw5l4GAU9h6; Sun, 15 Sep 2024 21:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264F8848FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264F8848FC;
	Sun, 15 Sep 2024 21:43:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35CFA1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0D8B60A49
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hzvfJ75sqKZ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0E0608A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0E0608A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8DE5821B6; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:58:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70519b2d239a3336869c2eb3814f8e124c43a564
X-Git-Newrev: 06b1f1fbd36b063ef5c2322817ee78b43dd1c7b3
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.A8DE5821B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: fix sparc/sparc64
 compilation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06b1f1fbd36b063ef5c2322817ee78b43dd1c7b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From Upstream git, two patches to fix sparc/sparc64 specific
compile issues.

Fixes:

 http://autobuild.buildroot.org/results/c35/c35f9b78b8f114bb795ed162585d707331954b4b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-special-value-for-Linux-POLLRDHUP-on-SPA.patch | 34 +++++++++
 ...l-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch | 85 ++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
new file mode 100644
index 0000000000..eebfa3a113
--- /dev/null
+++ b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
@@ -0,0 +1,34 @@
+From 88ff3763dae65371eab9f8a22ac1c95c96fe4490 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Tue, 23 Apr 2024 00:16:29 -0400
+Subject: [PATCH] Revert "[core] special value for Linux POLLRDHUP on SPARC"
+ (fixes #3251)
+
+This reverts commit f14f9142f4487704e2ce0f196263c091accdb12c.
+
+x-ref:
+  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
+  https://redmine.lighttpd.net/issues/3251
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/88ff3763dae65371eab9f8a22ac1c95c96fe4490
+---
+ src/fdevent.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/fdevent.h b/src/fdevent.h
+index e9c380b0..1b0a062f 100644
+--- a/src/fdevent.h
++++ b/src/fdevent.h
+@@ -40,8 +40,6 @@ struct fdnode_st {
+ #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
+  || defined(__FreeBSD__)
+ #define FDEVENT_RDHUP  0x4000
+-#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
+-#define FDEVENT_RDHUP  0x0800
+ #else
+ #define FDEVENT_RDHUP  0x2000
+ #endif
+-- 
+2.30.2
+
diff --git a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
new file mode 100644
index 0000000000..f3996d185e
--- /dev/null
+++ b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
@@ -0,0 +1,85 @@
+From 524614455554163ec78b27b89ff52bbf7fe96958 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 24 Apr 2024 03:07:37 -0400
+Subject: [PATCH] [core] special value for Linux POLLRDHUP on SPARC (fixes
+ #3251)
+
+x-ref:
+  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
+  https://redmine.lighttpd.net/issues/3251
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/524614455554163ec78b27b89ff52bbf7fe96958
+---
+ src/fdevent.h      |  2 ++
+ src/fdevent_impl.c | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/src/fdevent.h b/src/fdevent.h
+index 1b0a062f..556a1445 100644
+--- a/src/fdevent.h
++++ b/src/fdevent.h
+@@ -40,6 +40,8 @@ struct fdnode_st {
+ #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
+  || defined(__FreeBSD__)
+ #define FDEVENT_RDHUP  0x4000
++#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++#define FDEVENT_RDHUP  0x2800 /*(0x2000 EPOLLRDHUP | 0x0800 POLLRDHUP)*/
+ #else
+ #define FDEVENT_RDHUP  0x2000
+ #endif
+diff --git a/src/fdevent_impl.c b/src/fdevent_impl.c
+index 8bfc1cc6..c84c8df5 100644
+--- a/src/fdevent_impl.c
++++ b/src/fdevent_impl.c
+@@ -338,6 +338,11 @@ fdevent_linux_sysepoll_event_set (fdevents *ev, fdnode *fdn, int events)
+     struct epoll_event ep;
+   #ifndef EPOLLRDHUP
+     events &= ~FDEVENT_RDHUP;
++  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    if (events & FDEVENT_RDHUP) {
++        events &= ~FDEVENT_RDHUP;
++        events |= EPOLLRDHUP;
++    }
+   #endif
+     ep.events = events | EPOLLERR | EPOLLHUP;
+     ep.data.ptr = fdn;
+@@ -376,7 +381,11 @@ fdevent_linux_sysepoll_init (fdevents *ev)
+     ck_static_assert(EPOLLERR   == FDEVENT_ERR);
+     ck_static_assert(EPOLLHUP   == FDEVENT_HUP);
+   #ifdef EPOLLRDHUP
++   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    ck_static_assert(EPOLLRDHUP  & FDEVENT_RDHUP);
++   #else
+     ck_static_assert(EPOLLRDHUP == FDEVENT_RDHUP);
++   #endif
+   #endif
+ 
+     ev->type      = FDEVENT_HANDLER_LINUX_SYSEPOLL;
+@@ -770,6 +779,11 @@ fdevent_poll_event_set (fdevents *ev, fdnode *fdn, int events)
+ 
+   #ifndef POLLRDHUP
+     events &= ~FDEVENT_RDHUP;
++  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    if (events & FDEVENT_RDHUP) {
++        events &= ~FDEVENT_RDHUP;
++        events |= POLLRDHUP;
++    }
+   #endif
+ 
+     if (k >= 0) {
+@@ -854,7 +868,11 @@ fdevent_poll_init (fdevents *ev)
+     ck_static_assert(POLLHUP   == FDEVENT_HUP);
+     ck_static_assert(POLLNVAL  == FDEVENT_NVAL);
+   #ifdef POLLRDHUP
++   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    ck_static_assert(POLLRDHUP  & FDEVENT_RDHUP);
++   #else
+     ck_static_assert(POLLRDHUP == FDEVENT_RDHUP);
++   #endif
+   #endif
+ 
+     ev->type      = FDEVENT_HANDLER_POLL;
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
