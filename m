Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC8606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jZQtnax3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5D280DA9;
	Sun, 25 Oct 2026 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8PiNNjeqBzN; Sun, 25 Oct 2026 20:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 475FB80D80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960938;
	b=SVUiFgcQjG2toHTEXdoRlIr2ZpZDazXNR/sC0GMxq9bht3w1UVePCiXAJysiZnOflqOX
	 lJFdp8b5EnZs9sOWLIb2RiBj5QyvjSjeZibTNOoiaxqKDcZ0P9NJtU6YuGqvRh1ddX1uR
	 dE1KdtRKBQ8A8OXokTw9KG3HGWy/uP9KVftHsrZ9FcXgZAaCUhIctoGQUlzQMTnDSR/kP
	 ukLa23RLu/TTf0D72v1Rh/AWrCm2XRIauEJILG2zX4wZj88uEpsYRIxw1yQ35qjeAF+Bw
	 hDP0fX+iX3s6BC/i3Yidgj94eBCU/Y+MHPuvvheFpw80oKOsj7ElR7D17s1tjSDJoaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gDduLlzKpeMvL9BvMD2xVT2NrGvt8kbVmrWnNCCN7w0=;
	b=YatiT9r1Mltq7Ic6m6u4plGuPUdzAn3fTLiHwEV9nfBrkmrvTMkxVFHb+MPYc6jjQveC
	 TvAhmROZBvtVWbnpvg9nC3KOTdi3F4ZjdmByjJpKrrXrbvNt7zPeOmslYfMC0NvmsIx6b
	 qyy7Jqiygv05dadPv9B1ZaL+fCxYMUwbNYdlXOykis0ajUk5Ig7QEcf51phdrLR5cjOjk
	 QANXsWvPbO3Tyr0mBbVygROcLdkKcPYTQfci/0gAq8tie0zKqnsvTMgVChwlpKJjhsfla
	 p/W0GRuP82tROMIc4gmSCJPf2ocBgJ/fbAerMF42ugH8y/xZh4wRX4Lz2frqrHMyvOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960938;
	bh=gDduLlzKpeMvL9BvMD2xVT2NrGvt8kbVmrWnNCCN7w0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jZQtnax3fr6+tNUKW5NoQqtUsfWemlDtaG8qXNgLq3wJUCRJy4rXUz7IOxZWSJNh5
	 raPwnVQDeWYlOyn0Ls14phWScZu3nlbkpUAkxJjegf+nqSAsBQspmFS6yxB92D99V/
	 l1vZZhWD3m9ZZyvKxq+i84O+TraS0h076cCgF5MFzXgaDMjSJyf0f6sR2eCrxTxTM4
	 i6bn4GFHzwcaeJkBZGgA6UaW62jO2duFzigyzBlXk31AdP+iuvr4yhn/dNAALbJ0wV
	 QUmLGRCIZO4hlw8F55D2SCZbaf8etkC6zMPNhczG0nsbhp7yhUCMZLmusrPuIPFvz4
	 hoIBtSQIM3LzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475FB80D80;
	Sun, 25 Oct 2026 20:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9DAB356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0686060B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTFgrHOY3Y06 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:42:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2152C605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960935;
 b=AB7vchxm6/EWdi781nwSqdK/R5aByuXc5Lv/D4IrWUM/NcbG1yk9fuCVF99SBJuFR8rk
 KBl51ymgi533oEsKpJ82FKQtbm5ewNuYEa48vLxMK+FRWYjl/1hFnWVTECPYi5OcMJNhX
 Ell1A87TXdllFeAUP44BPMC5VKrjBAUxjGLXuNR+FfoPfpZra3GUUE15s9oE8YslZ9pDy
 cLhc6jKBz1SvGS9l2rYMifMRZMooBJkSJ6lmYBTSxiZ7TOdMUuwN0GovPH7RgrjhqFhx3
 xqmxrseai8UPFc7DunpwLzJxEYBSNeKwlZUMnSEHRMP8UQvrY5Jb6FNhyWSJSLYG9Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960935;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rpY5iH2094y2YDxziQiv22yGZt8piIOf71xIszgN4F4=;
 b=BLIZUTvmp4x+TIs1qQbw9J7LocLL5prM1DmiG9v3K6kxaIxOBRFkRF9yVYW0apcHVo0V
 UpkrK42tQErqjk030GwGmRKe0iNgOifwvHbO31DvYpvVwaLxnGi//kBM5CFi603B3n7rY
 xj56sZQus4wIpdjUTkWYZhnQy51DgIsCEm9U0bXpbfKBDg4M5yoonBIvZHYb0v9BDHaLe
 oRF/8LYX+w0GN+d30Fj78WVhbNc2OGg0WorqwukM2Bco7I9C+8aIIZ+gvY9fiCcksVQPA
 Y1gPkETeRCnlB5kOSDvbSOAX43AUl5o6alyaCP77+62A/btlH09RM9Tdq9vDH3fv3Sg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YXm123lq; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2152C605DB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:42:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 14BD44E41308;
 Sun, 25 Oct 2026 20:42:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C86E660740;
 Sun, 25 Oct 2026 20:42:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9A61F10328E76; Sun, 25 Oct 2026 21:42:11 +0100 (CET)
Date: Sun, 25 Oct 2026 21:42:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>
Message-ID: <at5plTvXu3ikwffX@windsurf>
References: <20261025131531.45754-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025131531.45754-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: radeonsi needs wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 02:15:31PM +0100, Bernd Kuhls wrote:
> BR2_PACKAGE_MESA3D_LLVM depends on BR2_USE_WCHAR, so does
> BR2_PACKAGE_ELFUTILS.
> 
> Buildroot commit a24698054b4cf6c994c91d49513bbe5e7b270201 removed the
> dependency to BR2_PACKAGE_MESA3D_LLVM from the radeonsi driver but
> forgot to propagate the dependency to BR2_USE_WCHAR needed by elfutils
> which still is a dependency for the radeonsi driver.
> 
> Fixes Kconfig warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_ELFUTILS
>   Depends on [n]: BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_USE_MMU [=y] && (BR2_i386 [=n] || BR2_x86_64 [=y])
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've added a Config.in comment, and applied. Thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
