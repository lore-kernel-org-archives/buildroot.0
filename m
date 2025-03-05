Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E14C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 21:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B910140979;
	Wed,  5 Mar 2025 21:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cVdc1HgvfsY; Wed,  5 Mar 2025 21:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A224240DA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A224240DA7;
	Wed,  5 Mar 2025 21:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AA59E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A6B380E0A
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ug9OGF8uy0Da for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 21:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24CD380E95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24CD380E95
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24CD380E95
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 21:18:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6BBC760D05;
 Wed,  5 Mar 2025 22:17:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Mar 2025 22:17:58 +0100
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 22:17:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20250226090108.1007137-1-adam.duskett@amarulasolutions.com>
References: <20250226090108.1007137-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <02f012b977e2dfc900344bd60e14cd65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741209481;
 bh=zpAWohhtfpCjI+LoKlvvxkvRDreHMKTh8JHjq0AKKac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T3BZn71cOVn66v9KT86UrT6SvswFg2NiNb+aEBP8Xv7t8DXr2wVzSHkNSvZ3rmj2F
 V5NtGUG7sOpRxNExllejb7qF0g6fjSV8sbFqnPJdWLUperiGrVkL5jo91GWlNZ3CNX
 pvIprOBITpkw5XHNeZLEhRxcgxxe4QWvHo6ycoPektufAidWx8tuZ8191OBm94XlNK
 Ux21VFrqWruK61DZd1YxE6/1Em7VwtbwVO/CcAvU8+brXSxfB8qX5YsvkEfkkzgvQU
 Ghbmz/8+XEdf74oWxZ43P+rnzy/y9u2VIExv0Or2vrRM6h2sfXwcSnn/J3n0WhYtGS
 5SUMJr+xRETxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T3BZn71c
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: enable tmpfs kernel
 option
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

On 26/02/2025 10:01, Adam Duskett wrote:
> systemd automatically creates tmpfs mounts for /tmp, /run, /dev/shm, 
> and
> others. If tmpfs is not enabled in the kernel, systemd crashes with an
> unknown filesystem error on boot. This hasn't manifested itself during
> tests with defconfigs such as pc_x86_64_efi_defconfig for a few 
> reasons:
> 
>   - No defconfig uses systemd as the init system by default
>   - Even if a user does use pc_x86_64_efi_defconfig and changes to 
> systemd,
>     the board/pc/linux.config file enables CONFIG_PCI, which selects
>     CONFIG_TMPFS.
>   - The systemd init tests use a prebuilt kernel with tmpfs enabled.
> 
> Enable tmpfs unconditionally to ensure that systemd always boots, even 
> with
> a minimal kernel built.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
