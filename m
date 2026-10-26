Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433F606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kETaX/hZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5247580ADE;
	Mon, 26 Oct 2026 21:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbjG4x7eBmvy; Mon, 26 Oct 2026 21:51:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B82E80CEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051474;
	b=X7bpiis1Jt/3nDodw0yxW13M2U5i+MwNhRtjSsTa5qvFnUhcZFk3Knh/vE8SP4ForbJG
	 x/8+iHyjxrxUu7f/KqvNqRZPXCdJozjQF51Kq+ZsMwPKAddF5KlQaivDQH1iyJA2mGpJr
	 Ts/01Sga8p64ET2kwMqIeObP9zU0Vw6NxXdEKowz9Cl2Gyq/cQaxjInit4TUPoy4wfM7J
	 UxpJMao/pkiifS4sa1yRJ7sox8p/7jA4Uee46mIQDHQmPWHmPO+ydGvFAWydcH683YqEi
	 5H3Ph2S5f2Z7a4bezT7geCYpgDBHaGBXecwN7ux9xfuHE7HyrceORUHKWsjU2i4gP6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/jNKi7Ts0eqU/JnbAqSQ1+kMOWFiffOx1I/dw1v2JoE=;
	b=TYSsmzs0473LjG1xnntUSoYKgzDky5Bomx21G47QtWg9NgxdY6oAqprq66PJJQYoMOpe
	 P1Uvigg2sGSJmrLLALuZhHUofDlX0gaHDWdc/e47vdqNnMfN5Q9msEO1U4YX3xzT5llsn
	 hSTAmQgt+h6464HZHERS+3CvB33TKqnc3YK7SZvhorzzUhHeRdbpg6C2ijTnn75EJw4MF
	 XxBTPqFNiqC6T+fIApFIFPLY7TVz75yIxdgTEzR8evetlHRGcplaseus+RxJe8EZ9O2UF
	 HkWfGatjL+3Z5B79ORZfu6yY1WlfTJq8ijmcggDQFNX5MszRZZuYcuHtGTUIeKNbR6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051474;
	bh=/jNKi7Ts0eqU/JnbAqSQ1+kMOWFiffOx1I/dw1v2JoE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kETaX/hZm/P39RciHT/0inRSYwjOiAj0Kskwk6QkEyQaBDAuX2Xv5odCT1/tAVGMC
	 SQ+4Uqkh6TjA8FskkPPJIOmfe1kRY5tyUdlLORKClxPB8S+hLrLKFWLInqFREVfZAx
	 X6iUuQVwJRteztc2E47YnSxRKdajBexUV96awOZgpQn7eZCWY87R9tJR6QCWmZynKv
	 Gywb9ATbcekA2TytPi/TUZCy4A8Kub3aUis/PnO3QZUSNtmaOkqhKlwkFXN/sO8kkd
	 WWRLws1TZQ3636sP31K4DZ1D2NnRbCAdbsxXEaLwt0fMgBG2FWRD1U+z1JTV1pTS9u
	 BHAMEPSIo6+Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B82E80CEA;
	Mon, 26 Oct 2026 21:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0943421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C4FF80CEA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOAgsKsyUSGS for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:51:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D303680ADE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051472;
 b=foQ0KyhZHVRmbjLx1TRiI3rPFllrOQy9f4U42FaP4Ch2GDKOuJZNURK1dvZq+k36L6aR
 /CxT2d7uOFV7M2TNBtrhpi9TGe8fQX0pNRAZ1IpxOzOINZ5l4BDaMcOubh9oaOnbhB2fH
 zUIjCXxBlKd9MYnfvHd4iQpZ0lOTH+uYEsCpPgXiffx8Wcfa4vSlBlWGFuAASeBppLHa5
 OsUJyKQ5NauQ7+hoIeGdIwbqjRqjIhAjPa37gZfgAd7T2VvuE5B7FFM1fbVVteThgRSaJ
 A2laQEmdeMkaBVV4Pc6k0NNFqWgEaFuTaylhbxD9hgLLwTdTX31t/t/7h+JvLrgZWoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051472;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BWT8zKMp30Uni+SsdiLS5Iig4eCZ6wox9+ozibceZGg=;
 b=CpShXD106d0Jpqt+ioNNmXiKBwdLuw6OsSvHwsFTXOqrZlFcFz1dL9Vbrdbb4WW60D84
 b9QVbHAxKyuGMsUjKvrTDpigr6zzE6IfnL1c8VarwyLSNc65spAyS/YgsrOqNqRnE94tX
 mbpUMyTl6GqeOoHMIqhd/sgdAD1RQhGOW3aeFJ5rTIPnzyVrB8w9i6HLV5R6g4kLy33lq
 BZnsaLOk7Kayw9N0DyuajfRyUUTmLZetnNxyc76tc/X4YszEW2D517ygcUDaeoalHE7x5
 LJSl5oYHm+q8nGDJEZnhYOC5idT1qwCch9p/AKdnYUQ22r383K8a5qPwfVfor8oLTiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SDFoSUal; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D303680ADE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 97E354E41324
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:51:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4EE5960740;
 Mon, 26 Oct 2026 21:51:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 729C110329061; Mon, 26 Oct 2026 22:51:03 +0100 (CET)
Date: Mon, 26 Oct 2026 22:51:02 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at_LGuRSbDPCUp60@windsurf>
References: <20261026135226.1614907-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026135226.1614907-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ccrypt: fix build with GCC 15 on
 musl
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

On Mon, Oct 26, 2026 at 02:52:26PM +0100, Yegor Yefremov via buildroot wrote:
> When cross-compiling, ccrypt's configure can't run its getopt_long
> test and always falls back to the bundled getopt. Its getopt.h only
> prototypes getopt() when __GNU_LIBRARY__ is defined (glibc, uClibc),
> so on musl it declares "extern int getopt ();", and getopt.c declares
> "extern char *getenv ();". GCC 15 defaults to C23, where an empty
> parameter list means (void), so the build fails:
> 
>   unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
>   ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
>   getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
> 
> Add a patch that always uses the full POSIX prototype for getopt()
> and gives getenv() its standard prototype.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"), which made a C23-by-default compiler
> available. It therefore affects 2025.08 and later, including the
> 2026.02.x LTS branch.
> 
> Fixes:
> https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks! To be honest, I'm not sure we should keep
ccrypt. No release since 2018... for a crypto related program. That
doesn't smell like a very active/maintained project.

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
