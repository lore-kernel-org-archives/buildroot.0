Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C85CA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 09:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB72811CA;
	Tue, 19 Aug 2025 09:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKyNUdOKeqLD; Tue, 19 Aug 2025 09:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D79811C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D79811C5;
	Tue, 19 Aug 2025 09:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64070E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498BF4099A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvFS5kpBV2JA for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 09:46:00 +0000 (UTC)
X-Greylist: delayed 389 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Aug 2025 09:45:59 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3B94098C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB3B94098C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:45:59 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 57J9dcnW012411
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:39:38 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 57J9dCuv012079
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 19 Aug 2025 17:39:12 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 17:39:12 +0800
Date: Tue, 19 Aug 2025 17:39:09 +0800
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: <buildroot@buildroot.org>
Message-ID: <aKRGPS7VOFk7VNCs@swlinux02>
References: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 57J9dcnW012411
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH] configs/andes_ae350_45: remove defconfig,
 broken
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 18, 2025 at 10:32:22PM +0200, Thomas Petazzoni wrote:
> [EXTERNAL MAIL]
> 
> This configuration doesn't build anymore as its kernel version has
> been removed from https://github.com/andestech/linux/.
> 
> This has been failing for over 2 months without anyone bothering to
> fix it, so let's drop this defconfig.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272348
> 
> Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .checkpackageignore                           |   4 -
>  DEVELOPERS                                    |   2 -
>  board/andes/ae350/genimage_sdcard.cfg         |  26 -----
>  ...-Support-DTS-of-ftsdc010-driver-for-.patch |  38 -------
>  ...-tree-blob-address-at-8-byte-boundar.patch |  42 -------
>  board/andes/ae350/post-build.sh               |   3 -
>  board/andes/ae350/readme.txt                  | 106 ------------------
>  .../boot/extlinux/extlinux.conf               |   4 -
>  board/andes/ae350/uboot.config.fragment       |   6 -
>  configs/andes_ae350_45_defconfig              |  40 -------
>  10 files changed, 271 deletions(-)
>  delete mode 100644 board/andes/ae350/genimage_sdcard.cfg
>  delete mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
>  delete mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
>  delete mode 100755 board/andes/ae350/post-build.sh
>  delete mode 100644 board/andes/ae350/readme.txt
>  delete mode 100644 board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
>  delete mode 100644 board/andes/ae350/uboot.config.fragment
>  delete mode 100644 configs/andes_ae350_45_defconfig

Hi Thomas,

My apologies for not catching the CI failure earlier;
my email filter was misconfigured.

I've fixed the Linux tarball link and confirmed that the defconfig builds.

Would it be possible to drop this patch?

Best regards,
Leo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
