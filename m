Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA28C4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E55480CE6;
	Mon,  5 Dec 2022 12:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E55480CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYoPBYuSG4oA; Mon,  5 Dec 2022 12:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978D88130A;
	Mon,  5 Dec 2022 12:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978D88130A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 114E81BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66AD405EF
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66AD405EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWUpfnb6_WTK for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 692DB408A5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 692DB408A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6114B85BA2; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 23:07:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd96b942d9e6252c9d7fd94592996885210bc32c
X-Git-Newrev: f9ef3fbed57add6491e26e1c40f7c500f8c02aeb
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.6114B85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nitrogen8*: bump arm trusted
 firmware revision
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9ef3fbed57add6491e26e1c40f7c500f8c02aeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump ATF to boundary-lf-5.15.52-2.1.0.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 configs/nitrogen8mp_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 41e2ddb79d..be2ce0cb3c 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index c20c64b121..e0a7552e94 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 5a78df3865..e2a36c0c75 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 078476b004..3e275f101e 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
