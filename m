Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D6AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B9860E60;
	Sat, 12 Mar 2022 17:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEdo13VRX2On; Sat, 12 Mar 2022 17:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A76560E64;
	Sat, 12 Mar 2022 17:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50D721BF969
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C01B408D2
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLdlXbwR-pWM for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B9F40867
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C470C82AD8; Sat, 12 Mar 2022 17:01:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7a71ba33db24738c6c3ab92daf82fe8348ad387
X-Git-Newrev: 0846221426b1cefa9e569f1927bc6fed102acb36
X-Patchwork-Hint: ignore
Message-Id: <20220312170117.C470C82AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=0846221426b1cefa9e569f1927bc6fed102acb36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://github.com/tvheadend/tvheadend/commit/fb7b24114685a7e38d842168dce4c613360cd330

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
