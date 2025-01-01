Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEC7E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 13:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C79810D2;
	Wed,  1 Jan 2025 13:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMAezjiVh1Xs; Wed,  1 Jan 2025 13:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE649810D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE649810D5;
	Wed,  1 Jan 2025 13:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A36BF24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B373810D2
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRziJQUDTFab for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 13:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2B508100B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B508100B
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2B508100B
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:13:11 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 0DD1F44083C;
 Wed,  1 Jan 2025 15:08:37 +0200 (IST)
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
In-Reply-To: <6114083.lOV4Wx5bFT@kilian-laptop> (Kilian Zinnecker via
 buildroot's message of "Wed, 01 Jan 2025 13:59:04 +0100")
References: <6114083.lOV4Wx5bFT@kilian-laptop>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 01 Jan 2025 15:13:07 +0200
Message-ID: <87r05mpti4.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1735736917;
 bh=6he84DIUx7FZsttMq3xofZYKDCJMqL2kH+fZSWjvd4k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HsH+pJvVmkWFhgbVSpv5eEqE+zNwUJ4d+l1Hj8Vf1TF3tfpz6K+VPgLKzt87CHu9x
 Xnwe5DxT/F8jhdFwm5/1vfLJFAKigh051dHgcoMEb+sWbGFEvjyAOsxGfFXGJX/r+y
 aN2EnCRAlus/AdEX+e4EHMYDm38E7nOcx8hDCoqZdANuiXFZxEYZzwVsx0COaJgCIf
 BFFgFxggrjR42uXJUWJhulq860GX2sii6oEPN8hGBxYWmJCTZej18LhDGDSCdUSg6s
 2VKcg7vz/9K9j5niSdgJB5rzIM/Q0B3I2G39TKKy3LGaY1o+/dMPgBHui+QioH+1k/
 NcJ3XUYhkIiVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=HsH+pJvV
Subject: Re: [Buildroot] [Help] Problem with
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and kernel 6.12
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On Wed, Jan 01 2025, Kilian Zinnecker via buildroot wrote:
> I am struggeling to get a custom device tree compiled as part of a developing 
> a board support (i.e., for the beaglev-ahead). And I suspect it might have to 
> do with a recent change to mainline kernel 6.12, which buildroot might not 
> take into account yet. Here is what I try:
>
> I add my own device tree source file into the board folder and set the 
> following lines in my defconfig:
>
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.7"
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> # BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/beaglev-ahead/beaglev-ahead.dts"
> BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
>
> Now when the kernel gets build, the Makefile throws the error, that there 
> exists no rule to build my particular dtb.

See the link below for a recent discussions of this issue on the list:

  https://lore.kernel.org/buildroot/dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr/

Edgar Bonet suggested a fix that you might want to test:

  https://lore.kernel.org/buildroot/035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr/

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
