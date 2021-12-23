Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A426EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D87B40A9A;
	Thu, 23 Dec 2021 17:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvcO2NGgWecr; Thu, 23 Dec 2021 17:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CBA840386;
	Thu, 23 Dec 2021 17:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A74AA1BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96AE181440
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOUUSC-fD6hY for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D07A081420
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:36:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6013682945; Thu, 23 Dec 2021 17:30:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 18:36:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e814227caa0a5d190e36cd5174239fe5c627279
X-Git-Newrev: 8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c
X-Patchwork-Hint: ignore
Message-Id: <20211223173056.6013682945@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-tools: bump to version 2.13.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-tools/0001-configure.ac-add-disable-tests.patch | 4 ++--
 package/lttng-tools/lttng-tools.hash                          | 4 ++--
 package/lttng-tools/lttng-tools.mk                            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
index f569c7ec70..4bc9239c3d 100644
--- a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
+++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -23,8 +23,8 @@ index 04f9cef4..372cdf3d 100644
 +	      [Disable the build of the test components]))
  
  
- # Always build libconfig since it a dependency of libcommon
-@@ -1027,6 +1029,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
+ build_lib_consumer=no
+@@ -1013,6 +1015,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
  
  # Export the tests and extras build conditions.
  AS_IF([\
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index a94ecc4a35..5b5f55da30 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.12.3.tar.bz2.sha256
-sha256  2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153  lttng-tools-2.12.3.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2.sha256
+sha256  ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd  lttng-tools-2.13.2.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index fdc5c33bd2..efa22a52e3 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.12.3
+LTTNG_TOOLS_VERSION = 2.13.2
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
