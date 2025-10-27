Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A1CCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 03:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F9F5611F8;
	Mon, 27 Oct 2025 03:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD3loYs1tyvq; Mon, 27 Oct 2025 03:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F83611F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F83611F0;
	Mon, 27 Oct 2025 03:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97D47D7
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A385611F0
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPnGHjPp1IXA for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 03:53:57 +0000 (UTC)
X-Greylist: delayed 1255 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Oct 2025 03:53:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E45611EF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19E45611EF
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 03:53:56 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 59R3X8fX065480
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:33:08 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 59R3WssM065327
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 11:32:54 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Oct
 2025 11:32:54 +0800
To: <buildroot@buildroot.org>
CC: <tim609@andestech.com>, Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 27 Oct 2025 11:32:38 +0800
Message-ID: <20251027033242.1797230-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59R3X8fX065480
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH 0/4] Make andes_ae350_45_defconfig more properly
 maintained
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
From: Leo Yu-Chi Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Yu-Chi Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are some warning when building with andes_ae350_45_defconfig.
1. Tarball source should be a tag instead of branch
2. Lack of "Upstream" tag in the patch files
3. Post-build script does not pass Shellcheck
4. Missing hash files for some packages

Fix them by

1. Modify the source to a tag
2. Update u-boot and opensbi version to remove the patch files
3. Fix the post-build script
4. Add hash files for u-boot, opensbi, and kernel

Leo Yu-Chi Liang (4):
  configs/andes_ae350_45_defconfig: Fix post-build.sh Shellcheck error
  configs/andes_ae350_45_defconfig: Fix linux tarball source
  configs/andes_ae350_45_defconfig: bump to opensbi v1.5
  configs/andes_ae350_45_defconfig: bump to uboot v2024.10

 .../patches/linux-headers/linux-headers.hash  |  2 +
 board/andes/ae350/patches/linux/linux.hash    |  2 +
 .../andes/ae350/patches/opensbi/opensbi.hash  |  2 +
 ...-Support-DTS-of-ftsdc010-driver-for-.patch | 38 -----------------
 ...-tree-blob-address-at-8-byte-boundar.patch | 42 -------------------
 board/andes/ae350/patches/uboot/uboot.hash    |  2 +
 board/andes/ae350/post-build.sh               |  4 +-
 configs/andes_ae350_45_defconfig              | 12 +++---
 8 files changed, 16 insertions(+), 88 deletions(-)
 create mode 100644 board/andes/ae350/patches/linux-headers/linux-headers.hash
 create mode 100644 board/andes/ae350/patches/linux/linux.hash
 create mode 100644 board/andes/ae350/patches/opensbi/opensbi.hash
 delete mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
 delete mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
 create mode 100644 board/andes/ae350/patches/uboot/uboot.hash

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
