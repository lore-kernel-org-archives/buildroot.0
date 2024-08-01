Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFF2C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B4AB81F5E;
	Thu,  1 Aug 2024 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOCnPhgyekKX; Thu,  1 Aug 2024 21:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B3A81F87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B3A81F87;
	Thu,  1 Aug 2024 21:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD00E1BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99ECA606F1
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTc_ea0Vg0bd for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C139F60615
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C139F60615
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:40:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B71CA839F3; Thu,  1 Aug 2024 21:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:24:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 008e37b3aeb304919a3eb4d1c47b2b4d49ec49db
X-Git-Newrev: b6404f78cd2c1179884c9551aee050db49aaf2db
X-Patchwork-Hint: ignore
Message-Id: <20240801214028.B71CA839F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6404f78cd2c1179884c9551aee050db49aaf2db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v56 April 2024".

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP. See [1].

[1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-bsp/firmware-imx/firmware-imx-8.24.inc#L10

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index d9443374c5..d606ae6da6 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  94c8bceac56ec503c232e614f77d6bbd8e17c7daa71d4e651ea8fd5034c30350  firmware-imx-8.22.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  2e27962332197ebebbb30138f6dfb365361d48d7efa565df97c4f79285b1ca50  firmware-imx-8.24-fbe0a4c.bin
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index c131558c37..8666d76a73 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.22
+FIRMWARE_IMX_VERSION = 8.24
+FIRMWARE_IMX_REVISION = fbe0a4c
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
-FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
+FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION)-$(FIRMWARE_IMX_REVISION).bin
 
 FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING SCR.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
