Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0639CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 08:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BAC83F78;
	Mon, 18 Aug 2025 08:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBbbJPyOztze; Mon, 18 Aug 2025 08:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC94E83E86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC94E83E86;
	Mon, 18 Aug 2025 08:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9AE0196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C82D6613B8
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbSfVPmacOdA for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 08:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D04AA6129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D04AA6129A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D04AA6129A
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:07:32 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 31A07780504;
 Mon, 18 Aug 2025 10:07:21 +0200 (CEST)
Date: Mon, 18 Aug 2025 10:07:20 +0200
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>, 
 Ioana Ciornei <ciorneiioana@gmail.com>, Romain Naour <romain.naour@smile.fr>, 
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>, 
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <hhhu2cl4shracbhuuaejhyukde2rxhkrkon2pgpexfedobtme2@c7p77s2tpbtc>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755504449;
 bh=Yo9QfF8YOps9gWojwLXgYvKm7hF9KbJLDtF3oYBEIS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxyV/WTt4jYvw1hYjimC/tlwZRzn+W4tmaGobBl6Y6s2pgfZutm8Gg7KI+9pVW3ek
 Z5WNWY5aMx8ZCkjojg2R3tmrKmyLmXc7LIzjprdg/0WSMCiiNrEBg8NvIV3bFfjdxu
 mDWHAkMux2p0ZGUJAJKnw7g3rdPLpF1VqLevJJF7REnyNRPpMXV9o8feVI+EF7xGnY
 qw9PrYBF0qoxlOgnOfDwWqif72PAkh2DNFKZj6Ddok1R2LD04Glbz+tfQ8u/Hxi9R9
 glfIZD44u4+icSOoZ4vWQVwBpy7mC7aPVzyP2FnMQNUCHLetThLRd+NA4ykh/HhSRq
 yxLaPovSFLMOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YxyV/WTt
Subject: Re: [Buildroot] [PATCH v3 00/11] Layerscape uprev to
 lf-6.12.20-2.0.0, initial LX2160A-RDB support
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This is logically a continuation of "[PATCH v2 00/11] Initial support
> for SolidRun LX2160A-CEX7":
> https://lore.kernel.org/buildroot/20241208143802.1048266-1-olteanv@gmail.com/
> 
> where I was requested to split out the Layerscape BSP uprev and initial
> LX2160A support from the more problematic Solidrun board support.
> But as with any splitting of a larger series, the version counter reset
> at v1 (which can be found here):
> https://lore.kernel.org/buildroot/20250302215219.1276480-1-olteanv@gmail.com/
> 
> Major change log, more details in individual patches:
> - Bump Linux Factory tag to lf-6.12.20-2.0.0 (patches 01-09)
> - Add the remaining DPAA2 components (patch 10)
> - Support the NXP LX2160A-RDB as a vehicle for pushing this patch set
>   forward (patch 11)
> 
> v2 at:
> https://lore.kernel.org/buildroot/20250328180427.3434693-1-olteanv@gmail.com/
> 
> Disclaimer copied from original cover letter:
> Although I also work at NXP, I am submitting this in a personal
> capacity, and for personal use.
> 
> Vladimir Oltean (11):
>   package/qoriq-rcw: bump to version lf-6.12.20-2.0.0
>   package/fmc: bump version to lf-6.12.20-2.0.0
>   package/fmlib: bump version to lf-6.12.20-2.0.0
>   package/qoriq-fm-ucode: bump version to lf-6.12.20-2.0.0
>   package/qoriq-ddr-phy-binary: bump version to lf-6.12.20-2.0.0
>   configs/ls1028ardb: bump BSP tag to lf-6.12.20-2.0.0
>   configs/ls1043a-rdb: bump BSP tag to lf-6.12.20-2.0.0
>   configs/ls1046a-rdb: bump BSP tag to lf-6.12.20-2.0.0
>   configs/ls1046a-frwy: bump BSP tag to lf-6.12.20-2.0.0
>   package/qoriq-restool: new package
>   board/lx2160ardb: new platform
> 

This serie is OK for me. Let's merge it.

Thanks Vladimir for this support that enriches the Layerscale CPU
support.

Best regards,
  Vincent

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
