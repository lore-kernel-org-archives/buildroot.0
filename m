Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE45C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD5A409F0;
	Sat, 15 Mar 2025 23:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnMS8oluS04l; Sat, 15 Mar 2025 23:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3363340C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3363340C20;
	Sat, 15 Mar 2025 23:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB2F61
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CF614011C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_ZZfYfrrxad for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4924A400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4924A400D6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4924A400D6
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:14:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E9D47B0053E;
 Sun, 16 Mar 2025 00:14:00 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 00:13:58 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 00:13:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <d16d5f276345efd9a9abf3d177da8bd7341bd5e6.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
 <d16d5f276345efd9a9abf3d177da8bd7341bd5e6.1742068624.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <205df8c1cd27cb8498835a3178055bc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742080444;
 bh=NMVqiQV9qCkaYF6oCPQE3EaoSSN82cN4tGsGuA/0zME=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZduGnLqg4nSMfUmHZrgs/avG0lj9ffv6qckuNqa9U2f7QX4TedfAsLwd1SnzjPqoQ
 iXPBdBqMSh+R/cyjtJtbcQaTGWRCmGC0nvNAb3M35A88rsITrFeh2AFeSfOWWgS2nW
 jM5ygie6cKDW/EdT/eR93pz+xLs5OFF1yFuBQenfqE5t1WGRL+lTRzFUiYGZGZ1arh
 vlx5SHpTHUcAbZLjL86Fxr9bxU8yX/jJ+QHhEAxOQ3pJlXFEJtNO/sUAg014DgZnVm
 h4PddG6pgJTmcIA8z6QbUZhzsYBfZENuqXaz7ZO9Xpkh5CH/LxGq/DSjTJE9TYDDmc
 rQBGTGr04Dk5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZduGnLqg
Subject: Re: [Buildroot] [PATCH 01/14 v4] support/testing: set date in
 emulated machine
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

Hi Yann, All,

On 15/03/2025 20:56, Yann E. MORIN wrote:
> When time comes to check certificates, the date and time in the 
> emulated
> machine should be close enough to the actual values, so that 
> certificate
> validity can be checked.
> 
> Some Qemu machines have an RTC (e.g. arm vexpress-a9 has a pl031), and
> the kernel needs a driver for those RTC. It is not guaranteed that the
> machine used for a test meets those two conditions; in such a case, the
> time in the machine starts way back in the past (1970-01-01T00:00:00Z 
> on
> sysv, or the release date of systemd). This is the case with the 
> default
> kernel, so such tests do not have the proper time.
> 
> Set the date to the date of the host system. This is going to be 
> accurate
> to the second, which is, by far, enough for our purpose.
> 
> To avoid having to consider what combination of emulated machine and 
> kernel
> configuration are being used, we always set the date, as this is a
> generic step that should be done by the infra (like login in as root 
> is).
> 
> The Emulator() class doesn't inherit from unittest.TestCase, so we 
> can't
> call any of the usual self.assertXXX() methods; instead, we just raise
> a standard exception, like is done a few lines above to detect the 
> login
> prompt.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I applied this series in branch next.

This series was starting to get big, and I think that it is in a good
shape to be merged. It is also a good time to merge that in the
branch next, early in the release cycle. It will give time to have
all the runtime tests running on it and let people test it. We'll do
follow up fixes, if needed.

Thanks for this great work!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
