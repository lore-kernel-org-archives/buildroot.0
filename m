Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787ABFCC055
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB9940645;
	Fri,  6 Mar 2026 18:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIwNV0oirPpz; Fri,  6 Mar 2026 18:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0414061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772821054;
	bh=rQYhOVFEgrmgGeasA7PKWwnFm7HSo/56etidcTfECEQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZUwoXpyNzFcsmaXzXbuIi0AnqaL+MzUBMSjPc5clr6SyRJMcShkRk+dQSjO57eKC9
	 670PVjUFFbq+Dmfhov/YLsNi7VAu1VYyFM0TM/bBdhIgvDrB8FboVFdHAWsP5MyEd6
	 +hKyqhHejeHiRrq0IF0rH1o5YlfuyCbrqbmGeyFG6WZ5GLZJ1QqrsX4DL0S5qu5teI
	 y1trhzqURMXCUR/7bos/PZR9+fMXGdIq44tf7vUjfIJOA8XrjDCZGsetTX7jNOF1d2
	 U/z4+E0P1UZAXbDrYlKizH5fUz4FT+Gg0u46RsDoyJSvkuUFI0nkoYI38LI6hdHT/p
	 wkgl9FZpdpWIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0414061A;
	Fri,  6 Mar 2026 18:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5166339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAF53817E4
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ7MjgLiQM_2 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFFAA80B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFAA80B84
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFFAA80B84
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:17:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AD23A19F59C;
 Fri,  6 Mar 2026 19:17:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:17:28 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:17:28 +0100
To: Dowan Gullient <dowan.gullient@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260306093448.707547-2-dowan.gullient@smile.fr>
References: <20260306093448.707547-1-dowan.gullient@smile.fr>
 <20260306093448.707547-2-dowan.gullient@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <592b1e4f1ab4d721e7e4efbf4f01aeae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772821049;
 bh=Mq1MUssedUfdhUaFb29+m5lmXfC61h4XA/nD30P+vFE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S24r8Wm5d7nQAsguHEX7abRHADuQRr9Pwg1jsfGnR69vtvruinJZo+Iadx1Rjw5Um
 OzfDfdFM/OjirwCtBn2SApyEUbNH+Rr63bddWAZSE5H4aCY+vnDNsifr1znBWJwuDU
 TXFzoewQOixvWdeRq0jhvMbgyp2FGersWJ/jiGzs60Adw6MIxTQfXkeAmBNPCBfd6j
 GMBzs/NfUMGQ3m06BnoN6Bap8dZoOYFVkd7DQ7OdM3sQXHy+y5L2b2OCcto9XDI1lH
 7DlGOBoGcDZneFB1Beor5Oc6wvF6yyB9IyAwb+hFWo5yud+WkrNL63GWyTf24ur+17
 OwL+cU1SxsUxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S24r8Wm5
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/khadas_vim3_defconfig: use
 prebuilt Bootlin toolchain
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dowan,

Thanks for your first contribution!

On 06/03/2026 10:34, Dowan Gullient via buildroot wrote:
> Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>

I applied this series to master. I have made few minor changes:

I squashed linux and u-boot bumps into a single commit.
I changed linux.hash comment reuse hashes published upstream
I increased BR2_TARGET_ROOTFS_EXT2_SIZE to 256M: the default
arch defconfig builds more/bigger drivers and reached the 128M
limit.
Therefore, I removed partition size constraint in genimage.cfg
to make sure the sdcard image will adjust to the right partition
size.
I removed .checkpackageignore entry to fix check-package error.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/2093bfa0aa48e8803bc93634beca9e0b176fecbb

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
