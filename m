Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B40D0D78F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 13:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C8F6119F;
	Fri, 11 Oct 2024 13:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPv7eJR71l-L; Fri, 11 Oct 2024 13:07:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FB9614E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81FB9614E1;
	Fri, 11 Oct 2024 13:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2103C1BF859
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 101A9404FE
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 13:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZdknu5d7YOz for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF65B401CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF65B401CC
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FEA785C6A; Fri, 11 Oct 2024 13:07:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 14:46:48 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2520b55ae9d7bf8bf4bacb440f961b7583faf18e
X-Git-Newrev: 11d52d7e4d65704c87c6e85b31341ed2a6320f73
X-Patchwork-Hint: ignore
Message-Id: <20241011130719.3FEA785C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/procps-ng: link
 the w command with systemd or elogin libs.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11d52d7e4d65704c87c6e85b31341ed2a6320f73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The build of procps-ng was broken when systemd was enabled.  Applying
commit ca004d46 of procps-ng upstream to explictly link the 'w'
command to libsystemd or elogind even though libproc2 is linked to it.

This was (likely) broken since the upgrade to procps-ng v4.0.4 with
commit d79f40dbbe98983bc657d4c82d46b38b8283351b.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/28
Fixes: http://autobuild.buildroot.org/results/e8b/e8bae7bfd7d6a7987f3afa199d8d944429144817/build-end.log

Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
[yann.morin.1998@free.fr: don't number patch 1/1; add fixes tag]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3b870057c646a6b7abc822d3ce2ea0f41683420b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-build-sys-Add-systemd-elogind-to-w.patch  | 48 ++++++++++++++++++++++
 package/procps-ng/procps-ng.mk                     |  3 ++
 2 files changed, 51 insertions(+)

diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
new file mode 100644
index 0000000000..4a8b2a6a8b
--- /dev/null
+++ b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
@@ -0,0 +1,48 @@
+From 788248ee631b3b5f82073c36320fc3f4a3c8f9ba Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 31 Aug 2023 22:24:23 +1000
+Subject: [PATCH] build-sys: Add systemd/elogind to w
+
+Depending on the compiler flags, w needs to be explictly linked
+to libsystemd or elogind even though libproc2 is linked to it.
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/ca004d4657d5e8b468a4552ede429be53193a3a9
+Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
+---
+ Makefile.am | 7 +++++++
+ NEWS        | 3 +++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index f70c8fb1..ddfc0141 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -149,6 +149,13 @@ endif
+ 
+ dist_man_MANS += man/w.1
+ src_w_SOURCES = src/w.c local/fileutils.c
++src_w_LDADD = $(LDADD)
++if WITH_SYSTEMD
++src_w_LDADD += @SYSTEMD_LIBS@
++endif
++if WITH_ELOGIND
++src_w_LDADD += @ELOGIND_LIBS@
++endif
+ else
+   EXTRA_DIST += man/w.1
+ endif
+diff --git a/NEWS b/NEWS
+index 3f2158d4..4ad9f74e 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,6 @@
++procps-ng-NEXT
++---------------
++
+ procps-ng-4.0.4
+ ---------------
+   * library (API & ABI unchanged)
+-- 
+2.34.1
+
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 2f28e3571e..1002d6340f 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -14,6 +14,9 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
+# Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
+PROCPS_NG_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
