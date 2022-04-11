Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF61C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65B48408C3;
	Mon, 11 Apr 2022 08:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gp5y0-LdrHxn; Mon, 11 Apr 2022 08:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61B0140556;
	Mon, 11 Apr 2022 08:03:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 454521BF9AD
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3058D83E84
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifmTXy7xhViC for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 08:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6865982FCB
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 08:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D26F8397D; Mon, 11 Apr 2022 07:53:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:46:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e666b0d743cf55d233e4da04c05f084e8ee59b95
X-Git-Newrev: a52018aba6e9c2f201ababcbefdc1b178aebb608
X-Patchwork-Hint: ignore
Message-Id: <20220411075311.0D26F8397D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tvheadend: bump
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=a52018aba6e9c2f201ababcbefdc1b178aebb608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Removed patch which was applied upstream:
https://github.com/tvheadend/tvheadend/commit/fb7b24114685a7e38d842168dce4c613360cd330

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0846221426b1cefa9e569f1927bc6fed102acb36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-configure-add-execinfo-option.patch       | 55 ----------------------
 package/tvheadend/tvheadend.hash                   |  2 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 3 files changed, 2 insertions(+), 57 deletions(-)

diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
deleted file mode 100644
index c55d127d58..0000000000
--- a/package/tvheadend/0002-configure-add-execinfo-option.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 1 Jan 2022 16:53:29 +0100
-Subject: [PATCH] configure: add execinfo option
-
-Add execinfo option to allow the user to disable the feature even if
-execinfo.h is found on the system
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
----
- configure | 17 +++++++++++++++--
- 1 file changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 4dad024c4..c087502bf 100755
---- a/configure
-+++ b/configure
-@@ -75,6 +75,7 @@ OPTIONS=(
-   "ddci:yes"
-   "cclang_threadsan:no"
-   "gperftools:no"
-+  "execinfo:auto"
- )
- 
- #
-@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
-     # If we don't have libunwind then fallback to execinfo.
-     if ! enabled libunwind
-     then
--        check_cc_header execinfo
-+        if enabled_or_auto execinfo; then
-+            if check_cc_header execinfo; then
-+                enable execinfo
-+            else
-+                die "execinfo.h not found (use --disable-execinfo)"
-+           fi
-+        fi
-     fi
- 
- else
--    check_cc_header execinfo
-+    if enabled_or_auto execinfo; then
-+        if check_cc_header execinfo; then
-+            enable execinfo
-+        else
-+            die "execinfo.h not found (use --disable-execinfo)"
-+        fi
-+    fi
- fi
- check_cc_option mmx
- check_cc_option sse2
--- 
-2.33.0
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index db06af53b7..44ff745221 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11eeca461e74fbe8306916933cab96d35a99fa89d81e26126e194875c41b6fad  tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6.tar.gz
+sha256  10b8e8387cf341a8c639b3ecbab17dd245dc109afd6c99ca6b7fc3f2b5efc50e  tvheadend-1295dd2be863f5beb764290fce9317b24193dfc0.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 58ebdcb054..d2547b8746 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = b8710206eb073c72b142bce95846b77a0ffa34a6
+TVHEADEND_VERSION = 1295dd2be863f5beb764290fce9317b24193dfc0
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
