Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD75C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61DD5610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61DD5610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7BF415AC;
	Wed,  4 Aug 2021 00:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jM8uCXvv7GMX; Wed,  4 Aug 2021 00:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A684069B;
	Wed,  4 Aug 2021 00:04:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3DB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5562A406A0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bx_tYUYf6e1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B656A4069B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 171B882926; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:59:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 42a58a9bcb0789d52742f36e15f773514fa6b40c
X-Git-Newrev: 8bfdc2663de713776e35becc6a183ac529093b5c
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.171B882926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-mediasdk: bump
 version to 21.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bfdc2663de713776e35becc6a183ac529093b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed dependency to X.org following changes in intel-mediadriver.
Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediasdk/Config.in           | 5 -----
 package/intel-mediasdk/intel-mediasdk.hash | 4 ++--
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
index 05293d7604..c1f609e3f8 100644
--- a/package/intel-mediasdk/Config.in
+++ b/package/intel-mediasdk/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
-	depends on BR2_PACKAGE_XORG7  # intel-mediadriver
 	select BR2_PACKAGE_INTEL_MEDIADRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -21,10 +20,6 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 
 	  http://mediasdk.intel.com/
 
-comment "intel-mediasdk needs X.org"
-	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on !BR2_PACKAGE_XORG7
-
 comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 103c8bb52d..27cfdda08d 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 289a40ffe73dc291461d97edf452bdc622f76e52666483fd1eb4f131d2921cd1  intel-mediasdk-19.4.0.tar.gz
-sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
+sha256  f7750bd3a307d796e71a3d4ebb16a730b2e9364669513e110e9ec59af159b4cd  intel-mediasdk-21.2.2.tar.gz
+sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 5467c96380..c3412d622d 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 19.4.0
+INTEL_MEDIASDK_VERSION = 21.2.2
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
