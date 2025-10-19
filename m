Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390B8CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 16:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A58410D6;
	Sun, 19 Oct 2025 16:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDegafFTo1Jk; Sun, 19 Oct 2025 16:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BECE410D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BECE410D7;
	Sun, 19 Oct 2025 16:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C23B143F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 16:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3342404A3
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYOIHGc5ae8O for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 16:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B63B4005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B63B4005A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B63B4005A
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 16:34:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B14AA19F522;
 Sun, 19 Oct 2025 18:34:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 18:34:08 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 18:34:08 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>
In-Reply-To: <a6ba019c1d839d140f241539ed3dfc5c@free.fr>
References: <20251013202335.3835882-1-dario.binacchi@amarulasolutions.com>
 <a6ba019c1d839d140f241539ed3dfc5c@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <a21adb8dd707dc1f94cd1bd324b3f944@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760891652;
 bh=gHByw6STcK1Xt6gppBZW/0Q9+SFpd71xwMJYUtfL2ZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MMdGiwPi+av9QBkZYKkD27GDpZCVlZ71rcy91wTAW9fpQQHBzO4MSWlFyS0ommdOD
 sJXH3NkGNZ+QnszB7PW/RVuMhZrKAr6GOjvzDQt9fpeXePKMRiAm2Wpqf9fGpqTM21
 LLw1l31mqcf9gwV1WUujwxbGroCNELFTpSAolhnL+AWil9xg0hqRc+NqnAKCVq3V+c
 RbW4NBN+9eVGcNWTAXmL1IlITiKjJWVEQmv+yJsnljSX8Qq58vjfHmNos+yk7MufP4
 dQvglEg76gqrjbdc+hxZKQiqqsp9UMbX425BqYjifqFIaFV0CzFzDTofvmxkaokEwy
 tDvLEtCnKEX8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MMdGiwPi
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: bump Linux
 to 6.1.155
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

On 19/10/2025 17:46, Julien Olivain via buildroot wrote:
> Hi Dario,
> 
> On 13/10/2025 22:23, Dario Binacchi wrote:
>> The patch bumps the Linux kernel to version 6.1.155. The size of
>> xipImage has increased by only 1126 bytes (1673444 bytes compared to
>> 1672318 in version 6.1.143).
>> 
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> Applied to master, thanks.
> 
> Could you consider a followup patch switching this defconfig to
> use an external Bootlin glibc stable toolchain, please?
> 
> See for example:
> https://gitlab.com/buildroot.org/buildroot/-/commit/9f9ec04c73f0b59eff324c1f23ac036dada3a185

I just realized this defconfig is Cortex-M4, so the glibc part is not 
possible.
I should have said uclibc instead. I think the following change could 
work:

-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y

Could you try if this works on the board?

> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
