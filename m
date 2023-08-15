Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C9FC001E0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 10:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3078640BF9;
	Tue, 15 Aug 2023 10:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3078640BF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BL1m1kAAbC0R; Tue, 15 Aug 2023 10:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B9DC40BFF;
	Tue, 15 Aug 2023 10:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9DC40BFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47E521BF2C0
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2032781ECC
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 10:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2032781ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WdGECKAnUguX for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 10:05:56 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73EC081EC8
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 10:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EC081EC8
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="229879105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Aug 2023 03:05:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 15 Aug 2023 03:05:55 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 15 Aug 2023 03:05:53 -0700
To: <buildroot@buildroot.org>
Date: Tue, 15 Aug 2023 11:06:00 +0100
Message-ID: <20230815100600.297932-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815100600.297932-1-jamie.gibbons@microchip.com>
References: <20230815100600.297932-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692093956; x=1723629956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVyGqNfO9+GeKizI6+wSROTNgt/Ty+2s+p8XMZQdefM=;
 b=yPThx2a6wHoM+/npuKnEK9rFhbuP9DZFPgqgKSE9bqRUSU/YQ95q97rh
 PlkGStNrqEP2GF7tdwyGgESi6WIQeUQPDU6hhiUUbdU+sz09gbk0peQJD
 UOXiVUOj5O1ce8b74l3dnE34ppX4WptQ8qR0Lz8FFwFCI1DQp6HjddKD9
 Y6QOZxyw0wy+TUpYCofN4BEtLKQsKbs/iFziThNLMZ+e3pfFcSU5QYmc2
 vZuLtXjBp3sErJi1OZIZndXdm9b/UnceelOQk4oiGsnQRFW5frE7Pdl68
 lKMy04uVM7UmBVS77Vu2PEamM21V4+DvBesGdVGATRjk8/InbugpmdD1t
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=yPThx2a6
Subject: [Buildroot] [PATCH 3/3] board/microchip/mpfs_icicle: update
 post-image script
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The hss-payload-generator could not find where u-boot.bin was when
looking for it using the config.yaml. This needs to be ran in the
same directory as the u-boot.bin file to enable it to find it. Fix the
post image script to allow an image to get built.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/post-image.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
index 04b34bbd40..2368aa42f6 100755
--- a/board/microchip/mpfs_icicle/post-image.sh
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -2,7 +2,9 @@
 HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
 MKIMAGE=${HOST_DIR}/bin/mkimage
 
-"${HSS_PAYLOAD_GENERATOR}" -c board/microchip/mpfs_icicle/config.yaml "${BINARIES_DIR}"/payload.bin
-cp board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
+cd "${BINARIES_DIR}" || exit
+"${HSS_PAYLOAD_GENERATOR}" -c "${CONFIG_DIR}"/board/microchip/mpfs_icicle/config.yaml payload.bin
+cd "${CONFIG_DIR}" || exit
+cp "${CONFIG_DIR}"/board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
 (cd "${BINARIES_DIR}" && "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)
 support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
