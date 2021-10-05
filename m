Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B330C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A4E6120F
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19A4E6120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E242183E4D;
	Tue,  5 Oct 2021 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtwT-gtgS8qA; Tue,  5 Oct 2021 20:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36ED983E4A;
	Tue,  5 Oct 2021 20:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 847581BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73FFE408B8
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eguFAeYl1Uis for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:36:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD3D4408B7
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54D88912A5; Tue,  5 Oct 2021 20:34:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 22:36:15 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f819b0458abaef219d64c56b6f764d116933e4dc
X-Git-Newrev: a52b46e00ecb4a54147fe792202ce30b8d3dc524
X-Patchwork-Hint: ignore
Message-Id: <20211005203406.54D88912A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/kodi-pvr-octonet:
 fix json dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a52b46e00ecb4a54147fe792202ce30b8d3dc524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

While creating the initial package file a wrong dependency was chosen.

This package really depends on jsoncpp, not json-for-modern-cpp:
https://github.com/DigitalDevices/pvr.octonet/commit/f724c5934c63c64a0085c3dbe4cd3c3fc58f1318

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(cherry picked from commit 2d8e45289531fda33d1a157dffc60b758d6a8377)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-octonet/Config.in           | 8 ++++----
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
index b8bcd7e218..93f4fbae4b 100644
--- a/package/kodi-pvr-octonet/Config.in
+++ b/package/kodi-pvr-octonet/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_OCTONET
 	bool "kodi-pvr-octonet"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
-	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_LIBPLATFORM
 	help
@@ -9,5 +9,5 @@ config BR2_PACKAGE_KODI_PVR_OCTONET
 
 	  https://github.com/DigitalDevices/pvr.octonet
 
-comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index 890a283565..0b8e197967 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -8,6 +8,6 @@ KODI_PVR_OCTONET_VERSION = e35cc373476a92aee11ec8e8a14fb8fc086a4f84
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = debian/copyright
-KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi-platform libplatform
+KODI_PVR_OCTONET_DEPENDENCIES = jsoncpp kodi-platform libplatform
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
