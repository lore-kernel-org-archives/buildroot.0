Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA7C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E271607C9;
	Mon, 22 Jul 2024 19:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AW67m0uxPohP; Mon, 22 Jul 2024 19:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D264F607CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D264F607CE;
	Mon, 22 Jul 2024 19:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3231BF281
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62D1E40200
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cr2tSGsE8BhU for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:17:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D696240204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D696240204
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D696240204
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:17:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHrfV034015;
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MJHrVh121482
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 14:17:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 14:17:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 14:17:52 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MJHqKx111044;
 Mon, 22 Jul 2024 14:17:52 -0500
Date: Mon, 22 Jul 2024 14:17:37 -0500
MIME-Version: 1.0
Message-ID: <20240722-tfa-src-update-v1-1-e68bba62f146@ti.com>
References: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
In-Reply-To: <20240722-tfa-src-update-v1-0-e68bba62f146@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9539; i=bb@ti.com;
 h=from:subject:message-id; bh=3rNTzWBBTt6R6M8Sgqzwjc8gsty7LuL+awqb3dgQ24U=;
 b=owNCWmg5MUFZJlNZ/oV/HQAAbf///7bPN+v//767nO7r/1+f1N2388X36d+P/2l+iv34i3ywA
 RsYHagBo0AAAGgBk0A0PUAAAA0GmgAAaGgDQGQAeoB6hieoB6jT1PU/SnlNP1RABpoAbUPUaAaf
 qg0aaNA9J6gaAaAAMmEAABjU0HqNGjQGQHqHpNNMjQDI00ACGhkHqDTQNNNAwQANMBDQGCGgAAZ
 NMmJiYEMjEA0DRoZMg00BkGg0AMBgzgB0Il+X4QL0SEuBJ1FaltBgC3zSL4/BkilVaiZiG8nwLP
 1cTvCjt5+C2NDLBNJg6pAWsWZE97inUfpW9hpwnca5IpS+CgKWjNoakL2RfBunlFWiNvhsJLMQT
 l2hMM4EMEzH60WjH3c62CERDsm8UJoKuoEiNSA0zjqYY36sl2xEyVb+E2TzewhzjgyiQSuWspf5
 6FYxBX1S6uD486xcsAeuf5c3YH8ksQdHNQ3IetEjovF3EUP9SBg9GSB2MzkN+pVt1nwSKyZGIpU
 7aNeqBbD87j14MWDSTdHeCcCtgPSe4zWQg6Mk8uZRzDdLJXNBBs0DYl8T7FccMyJXxbSkoXU4kp
 boln58+UWdZMFDuxz1QEhoiPhLKH6hPc1SL8oVfSsjxCPOp/kz2cb+0zFUEF9CnHfAQiohE/iHX
 lV4f8XckU4UJD+hX8dA
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721675873;
 bh=IlCM+t0pIwO+Ge4vtmsiI7zzcRV+GoFx5t5oxQmmv5U=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=O+JK+/ap/Fj1EtJSLYu3gF5vneP4B5L+MguiBZa6ZW1a0CED1c8JQxYwQwSzAfcry
 ZzyGOP32y1KEpLGIfXs/rad49QJEoQdtSDfqAGmHDZOfTeIEPfrKIE4wgkPXDtOQ7E
 qqnKoDuabi19PR/x1yMDsj+aQxZkfNa5USFXZinQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=O+JK+/ap
Subject: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: update source to
 the new mirror
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tags are no longer being pused to the old ARM-softwre
mirror. Let's move to the new mirror at TrustedFirmware-A which
continues to publish newer tags

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 2 +-
 board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash     | 2 +-
 .../stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 .../am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 .../am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 .../am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash                   | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk                     | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..c056d6ad0ddc8 100644
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..c056d6ad0ddc8 100644
--- a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 02714d06a09c0..c056d6ad0ddc8 100644
--- a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 80e592dab6065..6dcfb66431f22 100644
--- a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
+sha256  ad8a2ffcbcd12d919723da07630fc0840c3c2fba7656d1462e45488e42995d7c  arm-trusted-firmware-v2.5.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index c9d043c46f129..2f00eec47ccd3 100644
--- a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
+sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 74fe35c9bc733..5f8b9fa4419cd 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  53422dc649153838e03820330ba17cb10afe3e330ecde0db11e4d5f1361a33e6  arm-trusted-firmware-v2.7.tar.gz
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b69a5a96453b..5a4e619135aa2 100644
--- a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  06d32acf42808b682859008292f0591d2d872f19aa1a8021bfcd1c1c626285e6  arm-trusted-firmware-v2.9.tar.gz
+sha256  76a66a1de0c01aeb83dfc7b72b51173fe62c6e51d6fca17cc562393117bed08b  arm-trusted-firmware-v2.9.tar.gz
diff --git a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8f60864fbf67f..ded5f952cd3d7 100644
--- a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  05f08e6728474e7af3cca3c0d6f6d065e5b2622aabaca942d57377a46d4ae0ab  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead5d0..b7927be6e85b9 100644
--- a/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  05f08e6728474e7af3cca3c0d6f6d065e5b2622aabaca942d57377a46d4ae0ab  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7494e04ead5d0..b7927be6e85b9 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
+sha256  05f08e6728474e7af3cca3c0d6f6d065e5b2622aabaca942d57377a46d4ae0ab  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 73ab431b9fc97..2c541674bf54b 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
-sha256  e55ae7105c996b60f748b2eb6adeaf5ac8946425e1d4294ecc1c56aebf435274  arm-trusted-firmware-lts-v2.8.13.tar.gz
+sha256  88215a62291b9ba87da8e50b077741103cdc08fb6c9e1ebd34dfaace746d3201  arm-trusted-firmware-v2.10.tar.gz
+sha256  24b530f15cd714fa82cd8b80fbde0c18b8b8ea33778104532185ad67cb364bf9  arm-trusted-firmware-lts-v2.8.13.tar.gz
 sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index abf917948eeee..d13998ce091c2 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -16,7 +16,7 @@ ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUST
 ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 else
 # Handle stable official ATF versions
-ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+ARM_TRUSTED_FIRMWARE_SITE = $(call github,TrustedFirmware-A,trusted-firmware-a,$(ARM_TRUSTED_FIRMWARE_VERSION))
 # The licensing of custom or from-git versions is unknown.
 # This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
