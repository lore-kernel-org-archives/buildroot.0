Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72610C05052
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBD58405F;
	Fri, 18 Aug 2023 10:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBD58405F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZRcplwJWwkM; Fri, 18 Aug 2023 10:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6068784065;
	Fri, 18 Aug 2023 10:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6068784065
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43E641BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29FAE61122
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FAE61122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HX7wjVp2l0y1 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:43:16 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5445361095
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5445361095
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="70777"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2023 03:43:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 18 Aug 2023 03:42:56 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 18 Aug 2023 03:42:54 -0700
To: <buildroot@buildroot.org>
Date: Fri, 18 Aug 2023 11:43:01 +0100
Message-ID: <20230818104301.403429-4-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818104301.403429-1-jamie.gibbons@microchip.com>
References: <20230818104301.403429-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692355396; x=1723891396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVyGqNfO9+GeKizI6+wSROTNgt/Ty+2s+p8XMZQdefM=;
 b=mWfGTxF9/pxD5t2rVpqRYvVaz4W7nmJoK/nD9C3903JTNfmWoi6bYLWt
 oA8muDZai5JQAjeJdLtuBXFtaRSDxekmP9Hdoc9YM2LjoMnGGDs5oZLX7
 2kCPlt7Z1l/hgDSFvlpQLv/t4QBLsHQqHvwCPMEg081FyQvzuwbtx+1kO
 FY1xe4w9R/h7OY2ZLAR74iE7b5AtepuplAB18QVYDKu0aYtfwO4J5c5UD
 ik2dUJTjitGu+otH6nYL7Fmhs4Iv+GLYvWVFwnjLx7bSz2NQ2ACPRgyh4
 vxazMEFAEsoXmQEYR+BbAueo0D6LtR4fpHLNXKtiW+Gl4mIIjKvLWU/e+
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=mWfGTxF9
Subject: [Buildroot] [PATCH v3 3/3] board/microchip/mpfs_icicle: update
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
