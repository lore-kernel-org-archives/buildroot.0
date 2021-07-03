Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560F7C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1950A610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1950A610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E31D342399;
	Wed,  4 Aug 2021 00:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvofu-3rqu3r; Wed,  4 Aug 2021 00:04:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1033C423E1;
	Wed,  4 Aug 2021 00:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB4C1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2491D40E61
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zD3q783JFyZt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7ED240625
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EFB0387B09; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:58:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 547069999170dec4ad9a50d50e73444a7e9e90d2
X-Git-Newrev: 534f4d6c68d80ca53bb8d19216fae2d1ecb1b2ec
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.EFB0387B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-gmmlib: bump
 version to 21.2.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=534f4d6c68d80ca53bb8d19216fae2d1ecb1b2ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added patch to remove hardening-related flags.

Updated license hash due to upstream commit
https://github.com/intel/gmmlib/commit/9253eb8b949515d2a5030f99163a35567fe81838

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Drop-hardening-related-flags.patch        | 28 ++++++++++++++++++++++
 package/intel-gmmlib/intel-gmmlib.hash             |  4 ++--
 package/intel-gmmlib/intel-gmmlib.mk               |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
new file mode 100644
index 0000000000..581afd9066
--- /dev/null
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -0,0 +1,28 @@
+From 1528980ee15e9589a7e27ec6d12a33cd8aab57b4 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 8 Jun 2021 07:51:40 +0200
+Subject: [PATCH] Drop hardening-related flags
+
+These will be set by Buildroot depending on toolchain capabilities and
+global Buildroot options.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/GmmLib/Linux.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
+index 1a09bc4..b28fc1b 100644
+--- a/Source/GmmLib/Linux.cmake
++++ b/Source/GmmLib/Linux.cmake
+@@ -62,7 +62,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+     -DUSE_SSE3
+     -DUSE_SSSE3
+     # Other common flags
+-    -fstack-protector
+     -fdata-sections
+     -ffunction-sections
+     -fmessage-length=0
+-- 
+2.29.2
+
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1e8baba6c7..2f50646677 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bb874b41c499abb8f6253b1834e93a02ed9744de71f2503ee9cd4100af7c1860  intel-gmmlib-19.4.1.tar.gz
-sha256 b61d639c5d84ec710ffcf5600ac92f8a4ace66670c1f9bd921f3bde671d36033  LICENSE.md
+sha256  912cd86e4cb564b6fa549d69a28b72b9cdcb5a3eab9320955ed70ac37381fc2f  intel-gmmlib-21.2.1.tar.gz
+sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 517fc09131..451eec7287 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 19.4.1
+INTEL_GMMLIB_VERSION = 21.2.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
