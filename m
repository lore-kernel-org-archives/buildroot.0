Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A789CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E4360F9C
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75E4360F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DCF40319;
	Sun, 26 Sep 2021 19:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Za5XDiPXBXzV; Sun, 26 Sep 2021 19:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D084029E;
	Sun, 26 Sep 2021 19:56:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3341BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A70C56079C
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTcXYbjKGHWl for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81EA860754
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 24DAF8D25B; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53495c204b84675f5f4b2bd255bfeb1cbcb100e9
X-Git-Newrev: 2d8e45289531fda33d1a157dffc60b758d6a8377
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.24DAF8D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-octonet: fix json
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d8e45289531fda33d1a157dffc60b758d6a8377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While creating the initial package file a wrong dependency was chosen.

This package really depends on jsoncpp, not json-for-modern-cpp:
https://github.com/DigitalDevices/pvr.octonet/commit/f724c5934c63c64a0085c3dbe4cd3c3fc58f1318

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-octonet/Config.in           | 8 ++++----
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
index e831194ba5..7b46cccb2a 100644
--- a/package/kodi-pvr-octonet/Config.in
+++ b/package/kodi-pvr-octonet/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_KODI_PVR_OCTONET
 	bool "kodi-pvr-octonet"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
-	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
 	help
 	  DigitalDevices Octonet PVR client addon for Kodi
 
 	  https://github.com/DigitalDevices/pvr.octonet
 
-comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index becd43a4e4..76366eb540 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -8,6 +8,6 @@ KODI_PVR_OCTONET_VERSION = 4.1.0-2-Matrix
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
-KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi
+KODI_PVR_OCTONET_DEPENDENCIES = jsoncpp kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
