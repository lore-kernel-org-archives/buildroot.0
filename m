Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DA606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gA1D56Dx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA088606C2;
	Thu, 22 Oct 2026 15:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6gtv4A3R-BN; Thu, 22 Oct 2026 15:33:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1AF6E6069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683193;
	b=pkTD2bshfwus8G8dfQP1n6w01oETn20hatznzzhP4xHprHKYFA2mvCFZNsT8teiaxGUE
	 pnnIWxwuqFUtqAyYAq0xmdNI1YM5LUWYiLQBYnhsMzY1MRa/XLtRhcvcl7ZUZbNsA3wI2
	 HU5TNVaRQ6RU1YQn5urbWNRWNzWqx1Br03+s/TYhz7FEiCG3o8SMVnEyRIUqzXMgMWK69
	 aHjUTk9K21T7EnZ3lUXQFZIQfnVy49WJvJu0Y1qUxo0k+sECRxlicJwaTJUhwDXZYfoHX
	 71ujOyFQHN++GRLIVBp4MzuQqMy0gV2qvE7lzMrUsAkm1IeySSpUQja/KrtHF4fCzeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p02lAdClKkKNC49/FJw+777k79r3MKA+rbKFiBtHl4c=;
	b=tYTLbWfjR8ffXu/HDNehVt/cTJ7DaK3ASaxOwwkGGUT5JKZzIdJpVWEpvVEDuzUpMGYw
	 tdbQhGOuCnP5Y3wj/rmnTeYrn5Zm1Dik/d3SmY4zEzoAduHF0PfM4nZVYGXA3Di4LyNdh
	 zqptfa1s/jSSwntieW/kQ9i64cXsIyER1W2XQN2igJWsqBOIxO9DaaB5ZAivoVjTkpE2Z
	 hx5ct4/CtUHeqozsaYBCXvBubld9/dN6Y32Dumf6v9xRYzYx15ueSCrVQ081JIc3MB3tt
	 iqvGHrZZWYyXjyQKtNuZ82XknnyHlf8hy5lR7SOIp3bpgT3Qkowoc3hsMHL1i6Dw6rw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683193;
	bh=p02lAdClKkKNC49/FJw+777k79r3MKA+rbKFiBtHl4c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gA1D56Dx6xrT21pmtCdV8WXBOCHM4weJstDQVWcMj7bhDSojyiBqgNWAErAaKWdlb
	 3taFCh2LvQwspR9AJ3q2A/JgMLQVeRlMuHj2zWfC2zAuxptWcLm92Ku9ODoF6fsaEl
	 Gp2BFsFTB7lVONfYmOaYrTaFYrFnrc/avGgTXeROWs2Y2IfVrOVL2hn3jYTg2qP1zc
	 vG17Rf4HsfLsQpaxf0/Qvq5LA67+TUYcwIlD6lfscgRmbW4zpVQjc8MlftriFmbw9t
	 ASwf+Qc/eL1TXOffI9TYSDfPTsxTK8coV9lBEhk1kbsD9kCDw9cq94kHmjZe0fC9HO
	 TZVe/xSiE8abw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AF6E6069C;
	Thu, 22 Oct 2026 15:33:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C31323A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B550040938
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKnX7k3rAUVu for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CAF9F4083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683191;
 b=JySGiaTEvFQNs+9RTkTfF23iYuVUHFj440QxPltY3cHLkDcSmh6S/Dyl6SaG3I4W4vyk
 ioXuLlqaoJF/pMUCSJvD8QUL45EpNq4TaTtc9KlMgVMPLZx3BcYrWrIrhn2Ai4rrxca2a
 LpUoSMGlRJ/Kl6Mq6Ojw1niD322fnGGnqXFHW5Meutva9xZuPwYRxUp4oOkStJTexyZ0D
 bPyokNdqAWCDAHmFuizy7G2qgfqemGwxLNM+vzumCWVs3kmZBevVDjXxOKBRN7mSvw5hO
 ZyCO70xFaZYGco9jEBf2rGmqyMIn7T2pTWDvxH3EetiTpy243Nrj0HfvyzkLESiDVWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683191;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=y2Et9XWTNtqbHf0R/JW6gU9Aa9n82qx+LGkN5swjQ4M=;
 b=FIbYsOo6Alj1Q3kUkiWnqdMo9Lhje1QUlVGrR10iDbrN7LyQsASEiIDd8erSNFJS2t52
 t9mbKzIjipA0iVeP/AURowXNCu+T5TWbvGb0oTH+Ii0ilgBfJ+vQaceaa6LZWaAIi38Pj
 7y4jcrAixkod+7Qr1aWW9XhDzuHJFdiZKLMxc6+7Xio+W71Wfuz1IJ2P1Hsvgu9ajsJi/
 WUXFdwDGUnzhavvZ7jGh7gBGOcljBhwk21GIOdJle2GvLkYpJv1zVW9cgZ27R9z2oo+oK
 9N/UYs6D9dmhfXiU9jpWPPiBc6PXmuGft6EWo6huAWMMsAhhp8TeyQvLcOOxIae54Rw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MocxObml; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF9F4083D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:33:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A63004E412A1;
 Thu, 22 Oct 2026 15:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 746FE60360;
 Thu, 22 Oct 2026 15:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3B6E10328E5A; 
 Thu, 22 Oct 2026 17:33:04 +0200 (CEST)
Date: Thu, 22 Oct 2026 17:33:04 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Message-ID: <atosrBkLBAvqBsv2@windsurf>
References: <20261022121102.3130117-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022121102.3130117-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/gauche: disable TLS support in
 host-gauche
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

On Thu, Oct 22, 2026 at 02:11:02PM +0200, Yegor Yefremov via buildroot wrote:
> host-gauche fails to build on build machines that have mbedtls 4.x
> installed, e.g. Arch Linux:
> 
>   checking for mbedtls/version.h... yes
>   ...
>              tls/ssl: mbedtls
>   ...
>   ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
>      41 | #include <mbedtls/ctr_drbg.h>
>         |          ^~~~~~~~~~~~~~~~~~~~
> 
> Since version 0.9.6, Gauche's configure enables mbedtls support by
> default whenever it finds mbedtls on the system. For host-gauche, this
> means the mbedtls of the build machine is used, and mbedtls 4.x no
> longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.
> 
> host-gauche only provides the gosh interpreter used to build the target
> gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
> not depend on whatever mbedtls the build machine has.
> 
> This issue has been present since commit 73e836e13982 ("package/gauche:
> bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
> support) and thereby made host-gauche auto-detect the build machine's
> mbedtls. It therefore affects 2019.11 and later, including all
> maintained branches.
> 
> Fixes:
> https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d
> 
> Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

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
