Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B1606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SAsageRw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B6E608C6;
	Thu, 22 Oct 2026 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx3pdP-wdV9x; Thu, 22 Oct 2026 21:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5EE1D606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704248;
	b=mKeSCY9dCkhw20EId26URINTgWZRPW4v3VU+bY+SagUc2pmlRbTRONHbctptj1ZUQleS
	 8c5QZ9W2+aYzVqen/cYJjgJnXvGbtjZFKmYZLpwMkjISVO5GaUU1c7DGcE4LwdQoOgK2n
	 3P4se6TZ8BQywSOnXOjwAenAnZQEpX5RyZb8G7BGHYMe4fuS4GgppgJnlWj3bGgvjxXDU
	 FpNn7V7PTEVrnMdR9D06cGeRH0agnD/DP4jvg4C1IYHtX3eYoseGRlPi53iB4Q35OXY6b
	 9ybEG3PB2EbYwESj7gxCe5vYLUdrz8cMJ0dtO1b0XbyyDA08DpzjtwjJi8jABzMJekQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8X1NlBqHKjIE2hluoZJSjmBGQqwGVw3R2wLksdQbF2Y=;
	b=XT/QMBbOhNw+Khdec5G6I7ubf3XwOhwT9bNvbGQ6tTufMylMHzEBkFg9ydqTgHiI8Cjr
	 MhQNvf93LuCw5WMVgIURkaG4uMuwWqXLpRHwnhs76xd/O/LSiho6PLFWObuy305/W15LR
	 +cPjDrUsYj0wK7+4kzWCsIarWruiM2RqFjoUklNkucK2h3+S3TIj6w1e7Qt+uRQt29qh6
	 k6RWni5ZLI+DVW+8Nth1Dnd62sNaLiIQJZIcES/LZYXONOqdzcnJ40UFyGgFbqdoMaUGK
	 w6wvG/gxnhSriVHchhj0Xgxb5B4GYgmXa0jeBMCtaEO/Nzt4axDFN3yk8RjEIuglSUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704248;
	bh=8X1NlBqHKjIE2hluoZJSjmBGQqwGVw3R2wLksdQbF2Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SAsageRwBewrM4f8pv8Lyw3vC86XaPxZjPbuAoM1p/jvQFYYspGYzl8rrEpq0IOlc
	 Ujm/p8/5tmEeTHPEjUebVlzAXXlXl3wVvTLiTDDmlQf8mk8tNaYbaSQ2TWvceGz3Do
	 urZY86AqCgjbtG2NogL8U7711RXLWArX7hc13QmaCCj4mP8LfzJbmYv8iqJt7W7CMF
	 IErovnjk6cSNT7cqJfergwW/DVaBZ57iZwLUXo8BQnwo/EmGqP4rBTw16phFGAIbnJ
	 nju4ttdiNDhkj7wIDemoyQkvmNe1rZn/EpubqvpmAVIfbuAbWHqdFa4QQF6E2ozcNH
	 MfaMMQjKdmtPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE1D606C4;
	Thu, 22 Oct 2026 21:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52A073AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44CAA811E5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBEZRewG60Nj for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 489F181205
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704243;
 b=DaQxOcfGwgy4/PQK+npsajo65BHbAOIsN/yZ1FtCoB0JPd8qnk9W09PUhihxYERCjluj
 KYHencH2u6DPS1xy0ogJOWIdrSBSV3tg7Z41xyJWqAw9R0XvPubDkD78zri4h15aKYLxO
 5y+4TKzu6pixRbV0JwySaAIxis5QSI8zQQYmGkpTFM+FxnA097wpP2If9RbXenJqui/VU
 chI2MDyxvIlhUBgnJ/GEMCtkkH6EAo7xkGdZ3BtnAgDXujJMS5DCtQaaGbihTy8LADM6V
 ZBQe1XA7V9WEIrgxLIRo4KCIfKCBf9lJ7pTOCXVB2q+QDxK4YX+GlEC1TrBoA7yYp2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704243;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6Bgxdk5J5Jv+RB3q1lLSoPuavAdD2wI5he3ahm634j4=;
 b=dgohlodCPOqbseQumsCJqsvUGUmH74sJq+Ph6ALUTaYtYN/TmVkwU5whKDYuundIZKCj
 +v8iWCVitxO9FCvpaidiq7FexcOAns2AdzolIj7g7Z4FqNv8WunjRuhLdPsAdFtOzhLwk
 VAMRO7CMAThSboBmZRq08q8vuX9JVpImgVrx+zpudbHeaZi6paTtR2NbDvoADuJy2/d77
 JOgoHnVuR1wqtx1iuBwo+vIBmKQeGqHyLPi4VXD+jSW2C5nhAmTjVfwTBKoc9cGIpfb6o
 HEdgXdh/062MbiU6ExYtHRwhlw80rLMavWIROEQ5QSngr1xugNTJMdonC3Ce5Kgt9xw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="0L9/uqjx"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 489F181205
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:24:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B74E14E412BD;
 Thu, 22 Oct 2026 21:24:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 757CC60763;
 Thu, 22 Oct 2026 21:24:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28431103281B0; 
 Thu, 22 Oct 2026 23:23:54 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:23:54 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
Message-ID: <atp-5quxInY8VV1h@windsurf>
References: <20261022205926.3431624-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022205926.3431624-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/iozone: fix build without ASYNC_IO
 with GCC >= 15
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

On Thu, Oct 22, 2026 at 10:59:26PM +0200, Yegor Yefremov wrote:
> With uClibc, iozone is built with the linux-noaio target, where the
> async_*() stubs are declared and defined without parameter lists. GCC 15
> defaults to C23, where an empty parameter list means the function takes
> no arguments, so the build fails:
> 
>   iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
>   iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
>   iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'
> 
> Add a patch, sent upstream, that gives the stubs full prototypes
> matching their ASYNC_IO counterparts. iozone 3.510, the latest release,
> still has the same stubs, so a version bump wouldn't help.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"), as GCC 15 is the first version defaulting
> to C23. It therefore affects 2025.08 and later, i.e. 2025.11.x,
> 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used. 2025.02.x is
> not affected as it doesn't support GCC 15.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4090fb0d0a3b8bee60707b1672c35dada744bff5
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
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
