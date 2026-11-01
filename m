Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB6606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jEqqooz9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BAD240554;
	Sun,  1 Nov 2026 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSenkxHDhoqT; Sun,  1 Nov 2026 21:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7414140533
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568834;
	b=hKwgJfPWtmesibNoSpy/kc5l6a0pST4fLABncP9+1cLqt9+5ouvavIMMxlU7HwoZFcfa
	 YBKludgfQXSk8bPN7HVtucs1XCalniNEGYV3tcpduHnRCiaHi9LKxUHwImCqTRwWKycBu
	 uaw+Q6Ux3Kw9KgdPuRKCDnpxWJ/JWRo82Jt6oevBsLSHcjCzOfVWLQfgvzF/kZMdZJImC
	 P8mdyV8pK+eScZuBa9DnVDylWitj7AonD/th6tv+4jnn/fyx4wy0gqgAA3n+QFnkH608I
	 EAUtgrX01SjFqkqehetmMUUQ3fNALt9MAG4PJM8/XE0f00VRRZaTq+wKKjdYL1R97YA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X91Lyo+VbpZBwVjKqN+SiKUbKt3+dViP3EK23nUDmMQ=;
	b=YYHeTXiz5HbQIJp+j3afCk++a9HL70OoI++tOLyLLtCVOYiD10hXuDSQLZxh707JJN19
	 GWIYOqBt2y4fz2JNJ50gGOlFOgaIsBN3kN9H4RPRHWPY+ImGaFdu8Kuu9ET72N4c8DDWu
	 NCG0Jl+uruSj+6spahU12LkK2a6cM3hfpVPI37MXyW2A46jDrF9ays629t+Nr+j6hk/XZ
	 EzHtIk4NSKpD+3VtZvBVSdR+nYsZKGgpB9HXjaYpBg0dMS2RhjelULrUZuEO9Es0dMEy0
	 XGKhLyJrwEjwwIFc3k+jzT0TXFuq6lusdC4DwjwKS+oh5BiGyCnPMLi+W8sJY+NyITw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568834;
	bh=X91Lyo+VbpZBwVjKqN+SiKUbKt3+dViP3EK23nUDmMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jEqqooz9nXpig6SrylQQIu09mqvqSilwX16og6nNCVb2UG900QZK3SiFzlBIsUdYE
	 Zzk/6IAZrc7a6GMk0U/hxvpHDsyDk9Y1ZGqhG3pvOPn8ahdMyAcpotDs8axK/stefu
	 FC9M0fFav6ljt5lGEmFHtuywYgJi6Jai7Kwt7/smGUkmUCIJd8B8LaCJZ1HMgQEckV
	 wqzJIYd/nDtS6u4KZfLyvfBxla3mCX5/dOJT/bq9hsJYP0LJ2+/+AxVklyCr+Oor4X
	 ZGjwvAv4s8JvCzUJUA/PusPDGSMc/7JgarFg7CzSPSNAZRskyX3i34qXM9mHgJKRz9
	 +oBeCzWPJWyzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7414140533;
	Sun,  1 Nov 2026 21:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFA8435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F60640079
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWDb4nBpOyoO for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2ADF94004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568832;
 b=prarsmS1bMqdJeotm9R5sSnCyzV9vt07qfeOM7ckdWQzTeZVFVheIxSl6Gv/kWD12oJw
 qcNLSk9geKVIOPJ9QRjeXLsaPXmfMI5b1NJcNExVVMbPaxJ5hQ/uFeXaAHkXoxLtDqEDN
 bn9pNKdaSHuJGLTuI0kAGw9FXMPc9Bul0HfQ8OUuvvXG1hAy+MAJFC4+WU6t/5esGm1x3
 rZZahvHbSb7p35Rg1r58LEdfmbYLitjm1nXPGAHnNjtnr3dKxKbJZ62ENyxR0CKiKH6CS
 Cc3ovAb2cfubfqRNTTvD2Xbhrroeogz2D7XAUU6tE/92EoaHeKeLTLP69D1y2p1xQlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568832;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Bt0o0B2fJXstwU2VOG4FzIppLwrJs3xJyNpW2yKz/Lw=;
 b=RuM8KAANZ73EObcGaRjTvpLMjH5Y+sVoAht/y1EAOQCTQW6d+tIUC0CSbP+pOGAbbaA3
 1JlTMHaaFGdd/BlB3mTW0+/qDZKMb0bTncfZ0j+msPNuEmQgbDkAviSGDqTlD+4y2zHwF
 obyWM1B90YAQhqduRQdcbSggwdAjYD3cgUgt0dCQWvqTlc/zU73pX8jZA1Mv/60GoxYTv
 eyYFQdMTqS5kY39d445DJGzvE0QlUWT+9yFKGnCCPQh+HLhbLPJvcz6VBBJcfefe7iUP1
 mhzRnsC0tbFhladplvSnXWhIhXdTsxxSB1w6xAy7kVH6kDrQzSN8LvugYm090WA7SOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2IjEO6X3; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ADF94004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:33:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3407E4E41378;
 Sun,  1 Nov 2026 21:33:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 08D9E60750;
 Sun,  1 Nov 2026 21:33:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C982510328C5E; Sun,  1 Nov 2026 22:33:47 +0100 (CET)
Date: Sun, 1 Nov 2026 22:33:47 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <auevvxHpO8g11oFb@windsurf>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261030152434.3738285-6-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030152434.3738285-6-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 6/9] package/falcosecurity-libs: convert to
 a virtual package
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Angelo,

On Fri, Oct 30, 2026 at 04:24:31PM +0100, Angelo Compagnucci wrote:
> Since version 0.11.0, the falcosecurity-libs userspace libraries only
> support 64-bit architectures, as they get the system call numbers from
> tables which only exist for them.
> 
> In order to provide a different version for 32-bit architectures,
> convert falcosecurity-libs into a virtual package. For now, it is only
> provided by falcosecurity-libs-latest, which is the former
> falcosecurity-libs package, unchanged.
> 
> The license, the driver name, the kernel module make options and the
> Linux kernel configuration fixups, which will be shared by the
> providers, stay in the virtual package.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I'm afraid but this is not really what virtual packages are
for. Virtual packages are to support different implementations of the
same API (OpenGL, OpenSSL, jpeg, etc.).

In addition, we don't want to support in Buildroot things that are no
longer supported upstream, so your proposal to add
falcosecurity-libs-legacy and sysdig-legacy will not fly in
Buildroot. Those packages would no longer be updated, would no longer
receive security updates, etc. This is not something that Buildroot
can support.

If support for 32-bit architectures in sysdig is important for you,
you need to work with upstream to get back support for these in the
latest versions.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
