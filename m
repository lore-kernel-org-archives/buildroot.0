Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA52C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 13:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1708241B22;
	Thu, 25 Apr 2024 13:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY5YHCy_QM9w; Thu, 25 Apr 2024 13:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6FEB41AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6FEB41AB2;
	Thu, 25 Apr 2024 13:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E53C1BF489
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28077612AD
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 13:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shADViVt0Jl9 for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 13:11:42 +0000 (UTC)
X-Greylist: delayed 551 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 25 Apr 2024 13:11:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84D55612AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D55612AC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.56.217;
 helo=16.mo561.mail-out.ovh.net; envelope-from=julien.boibessot@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 16.mo561.mail-out.ovh.net (16.mo561.mail-out.ovh.net
 [188.165.56.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84D55612AC
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:11:41 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.22])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4VQGGr15RMz19l3
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 13:02:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8v59n (unknown [10.110.178.126])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB2C71FE30;
 Thu, 25 Apr 2024 13:02:27 +0000 (UTC)
Received: from armadeus.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-8v59n with ESMTPSA
 id CtisKWNUKmY1rAAAEWuwAA
 (envelope-from <julien.boibessot@armadeus.com>);
 Thu, 25 Apr 2024 13:02:27 +0000
X-OVh-ClientIp: 86.235.104.210
From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 15:02:10 +0200
Message-Id: <20240425130212.3060913-1-julien.boibessot@armadeus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6080985398641480145
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudeljedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefluhhlihgvnhcuuefqkfeugffuuffqvfcuoehjuhhlihgvnhdrsghoihgsvghsshhothesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeekvdevjeeggeduhefhgfdtheeiheevueefgfevtdetiedtgedvgfegteelvedvheenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeduvdejrddtrddtrddupdekiedrvdefhedruddtgedrvddutddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhulhhivghnrdgsohhisggvshhsohhtsegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055102e432-1720-40b9-850c-65c575a5dd44,
 40DC0920FA9C89C16861B553EE18EC898EA20FED)
 smtp.auth=julien.boibessot@armadeus.com
Subject: [Buildroot] [PATCH 1/3] configs/armadeus_apf27: bump Linux version
 to 5.10.215
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
Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119384
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 .../{linux-4.12.config => linux-5.10.config}  | 45 ++++++++++++-------
 configs/armadeus_apf27_defconfig              |  8 ++--
 2 files changed, 32 insertions(+), 21 deletions(-)
 rename board/armadeus/apf27/{linux-4.12.config => linux-5.10.config} (89%)

diff --git a/board/armadeus/apf27/linux-4.12.config b/board/armadeus/apf27/linux-5.10.config
similarity index 89%
rename from board/armadeus/apf27/linux-4.12.config
rename to board/armadeus/apf27/linux-5.10.config
index d0fb5d35dd..5f5776f8a6 100644
--- a/board/armadeus/apf27/linux-4.12.config
+++ b/board/armadeus/apf27/linux-5.10.config
@@ -3,26 +3,26 @@ CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CGROUPS=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_MXC=y
+CONFIG_AEABI=y
+CONFIG_PM_DEBUG=y
 CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_MXC=y
 CONFIG_MACH_IMX27_DT=y
-CONFIG_PREEMPT=y
-CONFIG_AEABI=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_PM_DEBUG=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -30,10 +30,8 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
+CONFIG_IPV6=y
 CONFIG_CAN=m
 CONFIG_CAN_VCAN=m
 CONFIG_CAN_MCP251X=m
@@ -68,6 +66,11 @@ CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_CHR_DEV_SCH=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
@@ -98,6 +101,7 @@ CONFIG_KEYBOARD_IMX=m
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_TSC2102=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
@@ -123,16 +127,20 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_USB_PWC=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SOC_CAMERA=m
+CONFIG_VIDEO_MX2=m
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_CODA=m
+CONFIG_VIDEO_MX2_EMMAPRP=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+CONFIG_SOC_CAMERA_MT9M111=m
+# CONFIG_DVB_AU8522_V4L is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+# CONFIG_DVB_TUNER_DIB0090 is not set
 CONFIG_FB=y
-# CONFIG_FB_MX3 is not set
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FB_IMX=y
+CONFIG_LCD_L4F00242T03=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_MIXER_OSS=m
@@ -150,12 +158,16 @@ CONFIG_USB_ACM=y
 CONFIG_USB_PRINTER=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_CHIPIDEA_DEBUG=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_FTDI_SIO=y
 CONFIG_USB_SERIAL_PL2303=y
+CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
+CONFIG_USB_FSL_USB2=y
 CONFIG_USB_ETH=m
 CONFIG_USB_GADGETFS=m
 CONFIG_USB_MASS_STORAGE=m
@@ -183,7 +195,6 @@ CONFIG_IMX_SDMA=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_MAX1027=y
-CONFIG_MAX5821=y
 CONFIG_PWM=y
 CONFIG_PWM_IMX=y
 CONFIG_EXT2_FS=y
@@ -204,6 +215,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_15=m
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
@@ -212,5 +225,3 @@ CONFIG_DEBUG_FS=y
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_LL=y
 CONFIG_EARLY_PRINTK=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 457a14b02d..97e8d49d7c 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf27"
@@ -18,9 +18,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-4.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
