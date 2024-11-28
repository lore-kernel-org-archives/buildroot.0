Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24E5D70DEE
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B1E60743;
	Thu, 28 Nov 2024 21:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vp-csm1e3acB; Thu, 28 Nov 2024 21:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A2760722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A2760722;
	Thu, 28 Nov 2024 21:21:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E8F1A6A
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F7FC840FA
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVObs6lbtnSZ for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 21:20:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72BF9840F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BF9840F9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72BF9840F9
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 21:20:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D4A2119F522;
 Thu, 28 Nov 2024 22:20:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52570])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 28 Nov 2024 22:20:47 +0100
MIME-Version: 1.0
Date: Thu, 28 Nov 2024 22:20:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, yann.morin.1998@free.fr
In-Reply-To: <20241128081629.3100977-1-neal.frager@amd.com>
References: <20241128081629.3100977-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f59740459535dbe8e78affa238fc2138@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732828855;
 bh=o2dkHN4CYxY3GUgr90g3vmUzd0b9M5dfUORodMjBFCI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b5tyQru68EgHYrvX1/gAqv5zQdbydAzgc6Pr5ll0nw3qSGxau2Cz3fDGoNHDSj1Sv
 RZaa9vrkTX2Ll7+zFKGAFqFCJu1a6PlYYb08Lm/eHRzvNm4Gu/GJ76la4f8Wq3G0Xl
 Yc1eALRwx0KpbDV8RQH3pbZO/XTYF6Hgp7ObdyRjQyAPtSPFW3xysYhmEq0bjhKXJk
 g4f5lMdz4lRXKDnRsPo1cbfjVSJ6esjDOJrH3Er0XQewDwvfk5+o0HWztal4vgma/t
 ORQlrt+Bewgd72L+9McSJ2xJg3eUMATaV8UQS28yP2ezUkyJco5qStOAdOnz1qm2vd
 N5tfBTiVwQ/Fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b5tyQru6
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vek280_defconfig:
 bump to xilinx-v2024.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 28/11/2024 09:16, Neal Frager via buildroot wrote:
> This patch bumps the versal_vek280_defconfig to xilinx-v2024.2 which 
> includes
> the following updates:
> 
> - ATF v2.10
> - Linux v6.6.40
> - PLM xilinx-v2024.2
> - PSMFW xilinx-v2024.2
> - U-Boot v2024.01
> 
> The board specific Linux patch for the vek280 needs to be changed for 
> the
> 2024.2 release.  While the Linux vek280 dts files were correctly 
> updated, the
> prebuilt vpl_gen_fixed.pdi file is still not defining the DDR memory 
> region
> from address 0x8 0000 0000 to 0x8 8000 0000.
> 
> For this reason, a new patch is needed for 2024.2 which is only a work 
> around
> until the pdi file is corrected.  This is why the dts patch will not be
> applied upstream.
> 
> The following patch has thus been removed:
> board/versal/vek280/patches/linux/0001-arm64-versal-Fix-vek280-memory-configuration.patch
> 
> And replaced with:
> board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch
> 
> Upstream: n/a
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I applied this patch to next, thanks!

I fixed a minor error found by running "utils/docker-run make 
check-package",
which was reporting:

     
board/versal/vek280/patches/linux/0001-arm64-versal-vek280-prebuilt-pdi-is-incorrect.patch:4: 
generate your patches with 'git format-patch -N'

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
