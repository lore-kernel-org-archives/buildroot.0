Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCBDC4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 04:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CBB040C2F;
	Thu, 13 Oct 2022 04:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CBB040C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSdwbSiw7kGk; Thu, 13 Oct 2022 04:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27AC7405B0;
	Thu, 13 Oct 2022 04:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27AC7405B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFF41BF2B7
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 04:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B23610F6
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 04:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B23610F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kiQeLbJ4oJeg for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 04:23:27 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3DE60812
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD3DE60812
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 04:23:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="213672262"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 12:16:19 +0800
IronPort-SDR: mWfmq9Mdp4xZSgXlGUd/RdEDul+XhXuZsNiRN/9gOmngsbvEiUp9ZZ/7llnyYB2+zU858pMyyG
 KH0vQf86z6VMxZolYbjTBjCqyD6vu4v1veg8VotItBIinRdenaaz/U5GPIqM46kXP/LIN0BBCv
 AMrpszWkAhPlePch0hxSdugBpIJmVL1peIpTKq3DlycqWflGahGxlfi3Xcq3gV2DA7ilmK5PgY
 fErjUjoJ36ewPYC84I4BBiKxUVWEzYmie4W06t1KGhyVoWkyGSAmCyzY2n/cd1p31CQFOz47CW
 UiVDLgzHqnzlHARSiXpF4wFf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 20:30:20 -0700
IronPort-SDR: jD3PQHOko2Naky2rKSPRy2U+yv4elNwJdAGDD1zE9ZQWFZl6HeEKIzXLhhXr/XJET64VrZg5fy
 6BQOdff400HjuvR3AVg/DAdDHsYzAIEqJ0mY1QaWNAhwwTtS32OlYcZDENX+kofBfS+PE2P9YW
 rUbd3MCyoeWuuXbcUSZjbrPEmXXcqabXLxRUaa/DIzR7YVCZHuk8/kbvLpKMnc2aOJBvee3bkK
 HOUDsyo73nRzIFJAtcVy/vlfg0SiL9DLXNRIcVOtJ2MUo15pdrs5nk2F4gIS7pUMc2BJ/ZmBlG
 Sak=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 21:16:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mnx6C1tQSz1RvTp
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 21:16:19 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AnuK6dks6xO8 for <buildroot@buildroot.org>;
 Wed, 12 Oct 2022 21:16:18 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mnx696WCMz1RvLy;
 Wed, 12 Oct 2022 21:16:17 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Oct 2022 13:16:16 +0900
Message-Id: <20221013041616.491620-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665635006; x=1697171006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cBb0NNvjb1Qey0iBWIpd/KGWe71CAZrRvbzFfEID574=;
 b=UgzCo+49aKXxP/S25OcqGzDEChAZkBmNiDloK+d9Rq5CNUvHv+auKkKc
 AWQDaJLpqbC9uR96ZlgjPh5DcfaH7E8xzm5U9l/ZQl+YMeKmvA39TMEnB
 wxk1CndL5k8GyJHLp5GtFJpqVC98IWIEwy5TqJAhSRKorDdR02U7aEtNF
 eA+piD+xLGrgo0b837B+jM7ZqKggc+wkuaSVKhByh5lxwOiLO1cUVU9bS
 jleAXG7ISgRaA2hIkQOYHCzplE/aTm8ZZY2OmZFJ6oRZSpf5p66xX99rn
 TGHtLjQAtx2tfUs0ynRvMdA9YKXJCg9v7PCemSr9W3JnJO4+aG7cnO6Du
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665634578;
 x=1668226579; bh=cBb0NNvjb1Qey0iBWIpd/KGWe71CAZrRvbzFfEID574=; b=
 Xs57M1lmk42hRut6QE27+w3CEsfcXP0eBrO31xr2YysUNrotPLo0Fgi3QJp4RQWB
 dm9ci4582QBfQsNLBefzlELLIF+azcAltzmFafha1CeF8u4aWXSbLXSJEUrvaNnF
 mn1flhuKb1OIDvsz/ZcuqvLC08Ep37cXOO3QZ6Er1y1ZKJAPqa3D2Rfoo4cqzx+W
 A7sJHJ4QiShM5yRXhH8gtgLiBfjpFFeKUQ6RRfC3j04c7y9gqdC76HBwJ8qyZudr
 eYcy9OxmHM5B8rhZxYSkxfKvgB6IV/ncbu3OuMdLqz259DEsIqNZBYESOqTKqomg
 AL8pXXwrGRnPgOaOTg5C7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=UgzCo+49; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=Xs57M1lm
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: [Buildroot] [PATCH] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gitlab CI reported build failures for the sipeed RISC-V nommu boards
with the u-boot/sdcard enabled default configuration. The compilation
errors are related to the openssl/evp.h header file missing, e.g.:

In file included from tools/imagetool.h:24,
                 from tools/fit_common.c:20:
include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
directory
 1166 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
files so that host-openssl gets built as a dependency of U-Boot.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 +
 configs/sipeed_maix_dock_sdcard_defconfig | 1 +
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 8a19996090..34769eeca8 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index d3d0f405e1..62f6a0e0b8 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 75300997b8..6c61e3aaaf 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index add9369747..da8cbe45f9 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
