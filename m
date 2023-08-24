Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E7C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F491415C2;
	Thu, 24 Aug 2023 20:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F491415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2Nwpue83S3t; Thu, 24 Aug 2023 20:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7320640AB1;
	Thu, 24 Aug 2023 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7320640AB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4DA51BF27E
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB3E60C08
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 20:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB3E60C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9BK6BlgtoMG for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 20:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C139260BA4
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 20:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C139260BA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADF2186247; Thu, 24 Aug 2023 20:24:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 20:58:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2b765178f41bed3720f16e9c850b0d0efc332531
X-Git-Newrev: 0389e298a65ae8d1bb96d55961a99d0cf1b4ee2a
X-Patchwork-Hint: ignore
Message-Id: <20230824202403.ADF2186247@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfuse3: bump to
 version 3.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0389e298a65ae8d1bb96d55961a99d0cf1b4ee2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Let's drop local patch that has been upstreamed:
https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...und-test-applications-for-cross-compiler-.patch | 43 ----------------------
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
deleted file mode 100644
index b99b4c23f4..0000000000
--- a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b58a0014bff619f1810af49441d987d732c4244e Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 13 Jun 2023 20:02:01 +1000
-Subject: [PATCH] Wrapper around test applications for cross compiler
- environment in meson.build (#804)
-
-This enhances commit 7be56c57f93e3436b1fbd9ecc320de5c03a3e4b8 to allow build
-fuse to be built using a cross compiler
-
-Fixes:
-../meson.build:180:12: ERROR: Can not run test applications in this cross environment.
-
-Upstream: https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 7aa4e0d..9707ea3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -177,10 +177,12 @@ int main()
- }
- '''
- 
--result = cc.run(detect_getmntent_needs_unescape)
--if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
--  message('getmntent does not unescape')
--  add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
-+if not meson.is_cross_build()
-+  result = cc.run(detect_getmntent_needs_unescape)
-+  if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
-+    message('getmntent does not unescape')
-+    add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
-+  endif
- endif
- 
- # Write private test results into fuse_config.h (stored in build directory)
--- 
-2.34.1
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 0397efc542..e812bb81e8 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  cb93e170288804d2e83da9b69925d968655ed75883476773ba5268d08bb1d335  libfuse3-3.15.1.tar.gz
+sha256  17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693  libfuse3-3.16.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 32e35ff32b..a4b1f08266 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.15.1
+LIBFUSE3_VERSION = 3.16.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
