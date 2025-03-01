Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84912C282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D9866FBE8;
	Sat,  1 Mar 2025 12:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhD3TJvU9hMy; Sat,  1 Mar 2025 12:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 292886FC31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 292886FC31;
	Sat,  1 Mar 2025 12:49:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB6EE1CB
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC9BA84A79
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-wu0dsV0QHp for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD9E8366E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD9E8366E
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9855687E83; Sat,  1 Mar 2025 12:49:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:31:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 44355f79980562177228c5f010683fa4cffe47b9
X-Git-Newrev: f34a7a13af0afc2d977439dccf6e0e4240e95044
X-Patchwork-Hint: ignore
Message-Id: <20250301124922.9855687E83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/firmware-ele-imx: bump to version 1.3.0
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
Content-Type: multipart/mixed; boundary="===============8081942958629992132=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8081942958629992132==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f34a7a13af0afc2d977439dccf6e0e4240e95044
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v57 July 2024".
Add SCR.txt file to _LICENSE_FILES.

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash | 7 ++++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index 0923e546b0..6182dc57be 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,4 +1,5 @@
 # Locally calculated
-sha256  4a0440168d8dfb95989a17be8fafb149589e110e7d4518e5e8a33463dfb5e5ca  firmware-ele-imx-0.1.0.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  8791109824767346237e53ac2c712824e54608e2092859161e6bb3e5385a7595  firmware-ele-imx-1.3.0-17945fc.bin
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index d493fe4a96..4225805d50 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 0.1.0
+FIRMWARE_ELE_IMX_VERSION = 1.3.0
+FIRMWARE_ELE_IMX_REVISION = 17945fc
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
-FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION).bin
+FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 
 FIRMWARE_ELE_IMX_LICENSE = NXP Semiconductor Software License Agreement
-FIRMWARE_ELE_IMX_LICENSE_FILES = COPYING EULA
+FIRMWARE_ELE_IMX_LICENSE_FILES = COPYING EULA SCR.txt
 FIRMWARE_ELE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_ELE_IMX_INSTALL_IMAGES = YES

--===============8081942958629992132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8081942958629992132==--
