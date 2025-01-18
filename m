Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274DEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD431850EF;
	Fri, 28 Feb 2025 17:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zw9hq-7Q2XXO; Fri, 28 Feb 2025 17:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F07850E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F07850E3;
	Fri, 28 Feb 2025 17:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0583068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C1C42E19
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDa-2ko4XaeF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E09042E30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E09042E30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45D6684109; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 21:00:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0aadb0b5dc45ccb940d6ea4be3a73cc0bd7bb222
X-Git-Newrev: 2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a
X-Patchwork-Hint: ignore
Message-Id: <20250228163014.45D6684109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lighttpd: bump to
 1.4.77
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

News:
- https://www.lighttpd.net/2025/1/10/1.4.77/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...default-lighttpd-configuration-file-to-ha.patch | 30 ++++----
 ...-special-value-for-Linux-POLLRDHUP-on-SPA.patch | 34 ---------
 ...l-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch | 85 ----------------------
 package/lighttpd/lighttpd.hash                     |  8 +-
 package/lighttpd/lighttpd.mk                       |  2 +-
 5 files changed, 21 insertions(+), 138 deletions(-)

diff --git a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
index 2eab2a84e5..61f58c609f 100644
--- a/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
+++ b/package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
@@ -1,4 +1,4 @@
-From d9e1c9c4a95797c812dd4906ecbbc532ae459364 Mon Sep 17 00:00:00 2001
+From bb0a1cc656b2df4184a0794fb67ae74c634c1ecd Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Mon, 13 Dec 2021 22:07:17 +0100
 Subject: [PATCH] Modify the default lighttpd configuration file to have one a
@@ -15,16 +15,18 @@ Signed-off-by: Simon Dawson <spdawson@gmail.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Thomas: update for 1.4.69 - drop server.use-ipv6]
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+[Thomas: update for 1.4.77 - move lighttpd.conf to lighttpd.annotated.conf]
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
- doc/config/conf.d/access_log.conf |  2 +-
- doc/config/lighttpd.conf          | 14 +++++++-------
+ doc/config/conf.d/access_log.conf  |  2 +-
+ doc/config/lighttpd.annotated.conf | 14 +++++++-------
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/doc/config/conf.d/access_log.conf b/doc/config/conf.d/access_log.conf
-index e685d437..92cff4f0 100644
+index f8294802..9886cddf 100644
 --- a/doc/config/conf.d/access_log.conf
 +++ b/doc/config/conf.d/access_log.conf
-@@ -9,7 +9,7 @@ server.modules += ( "mod_accesslog" )
+@@ -7,7 +7,7 @@ server.modules += ( "mod_accesslog" )
  ##
  ## Default access log.
  ##
@@ -33,10 +35,10 @@ index e685d437..92cff4f0 100644
  
  ##
  ## The default format produces CLF compatible output.
-diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
-index d45a284d..4e926d5a 100644
---- a/doc/config/lighttpd.conf
-+++ b/doc/config/lighttpd.conf
+diff --git a/doc/config/lighttpd.annotated.conf b/doc/config/lighttpd.annotated.conf
+index c94f703b..35263a1e 100644
+--- a/doc/config/lighttpd.annotated.conf
++++ b/doc/config/lighttpd.annotated.conf
 @@ -13,8 +13,8 @@
  ## if you add a variable here. Add the corresponding variable in the
  ## chroot example as well.
@@ -48,9 +50,9 @@ index d45a284d..4e926d5a 100644
  var.state_dir   = "/run"
  var.home_dir    = "/var/lib/lighttpd"
  var.conf_dir    = "/etc/lighttpd"
-@@ -97,8 +97,8 @@ server.port = 80
+@@ -97,8 +97,8 @@ include conf_dir + "/modules.conf"
  ## Run as a different username/groupname.
- ## This requires root permissions during startup. 
+ ## This requires root permissions during startup.
  ##
 -server.username  = "lighttpd"
 -server.groupname = "lighttpd"
@@ -76,10 +78,10 @@ index d45a284d..4e926d5a 100644
 +server.errorlog             = log_root + "/lighttpd-error.log"
  
  ##
- ## If you want to log to syslog you have to unset the 
+ ## If you want to log to syslog you have to unset the
 @@ -187,7 +187,7 @@ include conf_dir + "/conf.d/debug.conf"
  ## and write(). Every modern OS provides its own syscall to help network
- ## servers transfer files as fast as possible 
+ ## servers transfer files as fast as possible
  ##
 -#server.network-backend = "sendfile"
 +server.network-backend = "writev"
@@ -87,5 +89,5 @@ index d45a284d..4e926d5a 100644
  ##
  ## As lighttpd is a single-threaded server, its main resource limit is
 -- 
-2.39.0
+2.43.0
 
diff --git a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
deleted file mode 100644
index eebfa3a113..0000000000
--- a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 88ff3763dae65371eab9f8a22ac1c95c96fe4490 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Tue, 23 Apr 2024 00:16:29 -0400
-Subject: [PATCH] Revert "[core] special value for Linux POLLRDHUP on SPARC"
- (fixes #3251)
-
-This reverts commit f14f9142f4487704e2ce0f196263c091accdb12c.
-
-x-ref:
-  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
-  https://redmine.lighttpd.net/issues/3251
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/88ff3763dae65371eab9f8a22ac1c95c96fe4490
----
- src/fdevent.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/fdevent.h b/src/fdevent.h
-index e9c380b0..1b0a062f 100644
---- a/src/fdevent.h
-+++ b/src/fdevent.h
-@@ -40,8 +40,6 @@ struct fdnode_st {
- #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
-  || defined(__FreeBSD__)
- #define FDEVENT_RDHUP  0x4000
--#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
--#define FDEVENT_RDHUP  0x0800
- #else
- #define FDEVENT_RDHUP  0x2000
- #endif
--- 
-2.30.2
-
diff --git a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
deleted file mode 100644
index f3996d185e..0000000000
--- a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 524614455554163ec78b27b89ff52bbf7fe96958 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Wed, 24 Apr 2024 03:07:37 -0400
-Subject: [PATCH] [core] special value for Linux POLLRDHUP on SPARC (fixes
- #3251)
-
-x-ref:
-  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
-  https://redmine.lighttpd.net/issues/3251
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/524614455554163ec78b27b89ff52bbf7fe96958
----
- src/fdevent.h      |  2 ++
- src/fdevent_impl.c | 18 ++++++++++++++++++
- 2 files changed, 20 insertions(+)
-
-diff --git a/src/fdevent.h b/src/fdevent.h
-index 1b0a062f..556a1445 100644
---- a/src/fdevent.h
-+++ b/src/fdevent.h
-@@ -40,6 +40,8 @@ struct fdnode_st {
- #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
-  || defined(__FreeBSD__)
- #define FDEVENT_RDHUP  0x4000
-+#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+#define FDEVENT_RDHUP  0x2800 /*(0x2000 EPOLLRDHUP | 0x0800 POLLRDHUP)*/
- #else
- #define FDEVENT_RDHUP  0x2000
- #endif
-diff --git a/src/fdevent_impl.c b/src/fdevent_impl.c
-index 8bfc1cc6..c84c8df5 100644
---- a/src/fdevent_impl.c
-+++ b/src/fdevent_impl.c
-@@ -338,6 +338,11 @@ fdevent_linux_sysepoll_event_set (fdevents *ev, fdnode *fdn, int events)
-     struct epoll_event ep;
-   #ifndef EPOLLRDHUP
-     events &= ~FDEVENT_RDHUP;
-+  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    if (events & FDEVENT_RDHUP) {
-+        events &= ~FDEVENT_RDHUP;
-+        events |= EPOLLRDHUP;
-+    }
-   #endif
-     ep.events = events | EPOLLERR | EPOLLHUP;
-     ep.data.ptr = fdn;
-@@ -376,7 +381,11 @@ fdevent_linux_sysepoll_init (fdevents *ev)
-     ck_static_assert(EPOLLERR   == FDEVENT_ERR);
-     ck_static_assert(EPOLLHUP   == FDEVENT_HUP);
-   #ifdef EPOLLRDHUP
-+   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    ck_static_assert(EPOLLRDHUP  & FDEVENT_RDHUP);
-+   #else
-     ck_static_assert(EPOLLRDHUP == FDEVENT_RDHUP);
-+   #endif
-   #endif
- 
-     ev->type      = FDEVENT_HANDLER_LINUX_SYSEPOLL;
-@@ -770,6 +779,11 @@ fdevent_poll_event_set (fdevents *ev, fdnode *fdn, int events)
- 
-   #ifndef POLLRDHUP
-     events &= ~FDEVENT_RDHUP;
-+  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    if (events & FDEVENT_RDHUP) {
-+        events &= ~FDEVENT_RDHUP;
-+        events |= POLLRDHUP;
-+    }
-   #endif
- 
-     if (k >= 0) {
-@@ -854,7 +868,11 @@ fdevent_poll_init (fdevents *ev)
-     ck_static_assert(POLLHUP   == FDEVENT_HUP);
-     ck_static_assert(POLLNVAL  == FDEVENT_NVAL);
-   #ifdef POLLRDHUP
-+   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
-+    ck_static_assert(POLLRDHUP  & FDEVENT_RDHUP);
-+   #else
-     ck_static_assert(POLLRDHUP == FDEVENT_RDHUP);
-+   #endif
-   #endif
- 
-     ev->type      = FDEVENT_HANDLER_POLL;
--- 
-2.30.2
-
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c5545150b0..d4742b5746 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha512sum
-sha512  940f00f2d84e3424c389108d09756a0af41db3559474135b6c502deccd08ad051b5184f3f7907436384964d2b05045e27dca463af98c889cee69b0ae6e202782  lighttpd-1.4.76.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha256sum
-sha256  8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011  lighttpd-1.4.76.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha512sum
+sha512  696fd4fd8486a6c3fd1131c7e8a935a02b5384882b74ddc19bf79d085e2a0abed9184a30f97e3a7aafb816d3589e110e8d70115daa15cdc52cf61aa4129e3565  lighttpd-1.4.77.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.77.sha256sum
+sha256  acafabdbfa2267d8b6452d03d85fdd2a66525f3f05a36a79b6645c017f1562ce  lighttpd-1.4.77.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b54f5dd213..3f97e84585 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).76
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).77
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
