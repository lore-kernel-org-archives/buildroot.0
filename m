Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541AACF6BF3
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 07:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16ADB60D4B;
	Wed,  7 Jan 2026 07:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pn7PnUTDm1TU; Wed,  7 Jan 2026 07:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EEC760D4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767771275;
	bh=Mg0xKOn9HmKagxVArSOhhqPbCukt1/8t4CsL/nh039k=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hiqOkFMy9kcMVIT6YPsWcN1f2fadvM9OVF9iJqykMFvcByWUqxQQg8WUd2mYcQqgF
	 NL4cgIEDHm9JRLP6fFLhqZ6jbhcAuqLoTl6aPaJ94kdBXwxYEawQ3zca6t76cPvVM4
	 3jnmVqvD1x3RIBGqBj95X+baQHViJ6Ra5Jc8gGHd6F/RjQjskEJrHEmWA/nBX6IvLp
	 Awd7WZxOjIuCjNuO6vD9hHRDy1cr9gGwKJ24Z9h6RASphTMkqIGKCgU2gzcPDcwKxI
	 D/yz+c+Qp0Cl+nrKB2mfANfx8Tya2M81RpTOJQq/nPFVT0EQjIhG2zWNxpzd7ETetn
	 uQ32FwRYVyGJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEC760D4F;
	Wed,  7 Jan 2026 07:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 068C770B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E11F440052
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTge-gXdHmv5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 07:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=cnoize@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A25C4004D
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A25C4004D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:12 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 6077Y5qr006954
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Wed, 7 Jan 2026 15:34:05 +0800 (+08)
 (envelope-from cnoize@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 15:34:05 +0800
To: <buildroot@buildroot.org>
CC: Leo Yu-Chi Liang <ycliang@andestech.com>, Che-Wei Chuang
 <cnoize@andestech.com>
Date: Wed, 7 Jan 2026 15:33:59 +0800
Message-ID: <20260107073401.3004368-1-cnoize@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6077Y5qr006954
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH 0/2] board/andes: add AE350 OP-TEE support
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
From: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Reply-To: Che-Wei Chuang <cnoize@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This series adds initial Buildroot support for the Andes AE350 platform
with OP-TEE.

Patch 1/2 updates DEVELOPERS to list the maintainer for this support.
Patch 2/2 adds the board support files, including defconfig, genimage
configuration, rootfs overlay (extlinux), kernel/U-Boot config fragments,
and a post-build script. It also adds hash files for the required
components and includes a small optee-test (xtest) compatibility patch
to avoid building stats code that depends on free2_sum when using older
OP-TEE OS versions.

Tested with:
  - make andes_ae350_45_optee_defconfig
  - make

Thanks,
Che-Wei Chuang

Che-Wei Chuang (2):
  DEVELOPERS: add Che-Wei Chuang for andes boards
  board/andes: add AE350 OP-TEE board support

 DEVELOPERS                                    |   4 +
 board/andes/ae350-optee/genimage_sdcard.cfg   |  31 +++
 board/andes/ae350-optee/linux.config.fragment |   1 +
 .../ae350-optee/patches/linux/linux.hash      |   2 +
 .../ae350-optee/patches/opensbi/opensbi.hash  |   2 +
 .../patches/optee-os/optee-os.hash            |   2 +
 ...ble-fragmentation-calculation-for-ol.patch |  43 ++++
 .../ae350-optee/patches/uboot/uboot.hash      |   2 +
 board/andes/ae350-optee/post-build.sh         |  13 ++
 board/andes/ae350-optee/readme.txt            | 204 ++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |   4 +
 board/andes/ae350-optee/uboot.config.fragment |  14 ++
 configs/andes_ae350_45_optee_defconfig        |  56 +++++
 13 files changed, 378 insertions(+)
 create mode 100644 board/andes/ae350-optee/genimage_sdcard.cfg
 create mode 100644 board/andes/ae350-optee/linux.config.fragment
 create mode 100644 board/andes/ae350-optee/patches/linux/linux.hash
 create mode 100644 board/andes/ae350-optee/patches/opensbi/opensbi.hash
 create mode 100644 board/andes/ae350-optee/patches/optee-os/optee-os.hash
 create mode 100644 board/andes/ae350-optee/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
 create mode 100644 board/andes/ae350-optee/patches/uboot/uboot.hash
 create mode 100755 board/andes/ae350-optee/post-build.sh
 create mode 100644 board/andes/ae350-optee/readme.txt
 create mode 100644 board/andes/ae350-optee/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/andes/ae350-optee/uboot.config.fragment
 create mode 100644 configs/andes_ae350_45_optee_defconfig

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
