Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F207C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 04:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47DC40654;
	Tue, 30 Jul 2024 04:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkYKhKFIGd1o; Tue, 30 Jul 2024 04:18:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B6A40659
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B6A40659;
	Tue, 30 Jul 2024 04:18:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7B21BF3A3
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AABD4012B
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0XQ16ZvCUfI for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 04:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2171400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2171400AF
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2171400AF
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 04:18:45 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BF3FD353616F; Tue, 30 Jul 2024 06:18:43 +0200 (CEST)
Date: Tue, 30 Jul 2024 06:18:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zqhpow4vmdZzO5TI@waldemar-brodkorb.de>
References: <20240728190115.2e9fc088@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240728190115.2e9fc088@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722313123; bh=/mvCBmp1o4s06qW40kCZW1JU/ZQRVC6kzXuKysPADaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pYFuPxbjwGq4J0M7ALCB2rXr5LvKm1meIUx8Fg1P/kNg5iI+86OZwXOVzyyt39fEX
 tWe/3uJLOpj0hJovovqfPnUH2kvvQJtQJg92zsFqQAwrHjjccafdXOp7G93ZpIMWBr
 HqmkU8x/kQpfsLWAjZWy7PAUCbil8cepHXnGmhKkcchsA4PpDszrOTNpiSI5doN9+C
 Ey/jeCpNzPw6v298YDKSiH4W68k7iA3CenR6zr+XbzOHKQ6LuE47UEKCt8JJKGzG3u
 Ju5ariBnP9zVvYPid5gpRt3tGjjfmzJ6SbFuNbaJkDm+Aq6LCMNU5Db7+HjlCEuoay
 Q05tRhBlQyMsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=pYFuPxbj
Subject: Re: [Buildroot] Weird issue with uClibc RISC-V 32-bit in Qemu
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@smile.fr>,
 Dmitry Chestnykh <dm.chestnykh@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> I am working on updating the toolchains of toolchains.bootlin.com, and
> as part of that rebuilding all toolchains with Buildroot 2024.05 + a
> few patches:
> 
>   https://github.com/bootlin/buildroot-toolchains/tree/toolchains.bootlin.com-2024.05
> 
> On riscv32-ilp32d, I have the uClibc stable toolchain that generates a
> system that doesn't boot under Qemu: the kernel boots fine, but when
> switching to user-space, nothing happens:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/7378190992
> 
> The interesting thing is that the uClibc bleeding-edge toolchain works
> fine. The only difference is that GCC is 14.x instead of 13.x, and
> binutils is 2.42 instead of 2.41. Bleeding edge toolchain:

Okay, that is not the only difference.
You are using pre-time64 headers in your gcc 13.x defconfig
(BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y) and newer headers in your
gcc 14.x defconfig (BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15=y).

That seems the reason for the weird behaviour.
This might be a bug in uClibc-ng time64 implementation. I am unsure
about it.
@Dmitry: What do you think? 

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
