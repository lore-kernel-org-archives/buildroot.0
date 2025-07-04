Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DDC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2971884016;
	Fri,  4 Jul 2025 17:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iBPIBXWymJ6; Fri,  4 Jul 2025 17:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48F3584012
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48F3584012;
	Fri,  4 Jul 2025 17:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5D015F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79E241070
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RR3Igt08ZAaS for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:31:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E96440FFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E96440FFB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E96440FFB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:31:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 63CBA5FFC0;
 Fri,  4 Jul 2025 19:31:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 19:31:17 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 19:31:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165336.3647761-1-bernd@kuhls.net>
References: <20250704165336.3647761-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <251c5a756b1b4ae37027f7e199536516@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751650278;
 bh=rslknofofPd0cpAQH1fBBTZOUoHrLq4kYmgedIDDsdw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mesaDVDXelFpdYs6hK+TW3hXDjuuzhGadwwj8OgzyaAZJiTEyphEgxzIffXBfGICN
 OW1Ux5SxzWn/pvoNza4W/mlPy/CRGtoaoH3EZRdIlKnp7ZLzgvvvifO2rEqcadf5Ks
 oGCNLujWGnOl+Maro5Qc+YDrd+jKCWTgMs4/ueYBKsFZXdKyjhb5799fH/AJ9f36k0
 QRKFrgWHAlza71164xaOgcWzrZA+2Zry1mYGtfzAv4XlzfxzPmI8vcphKSq8mHGpGe
 h27sYlbEfpY5niuzT2tJmB/ao0Gq920wIc5qu+c6Em9B4wl9OJlD2XZeN6JhwmasQh
 k2xjPsJfComxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mesaDVDX
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.20.1
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

Hi Bernd,

Thanks for the patch!

On 04/07/2025 18:53, Bernd Kuhls wrote:
> Release notes: https://github.com/strukturag/libheif/releases
> 
> Version 1.19.6 fixes CVE-2025-43966 & CVE-2025-43967:
> https://github.com/strukturag/libheif/releases/tag/v1.19.6

Have you considered the comment from Thomas, in:
https://patchwork.ozlabs.org/project/buildroot/patch/20250518174058.2148313-1-bernd@kuhls.net/#3521954

Do you think those CVE fixes could be back-ported first,
prior the bump?

> 
> Updated license hash due to upstream commit:
> https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

[...]

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
