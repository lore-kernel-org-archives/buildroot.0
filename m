Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B983606A31F
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PCgAD6pV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0618E40550;
	Sun, 25 Oct 2026 17:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNacR8hNI3bF; Sun, 25 Oct 2026 17:44:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5B6240522
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792950283;
	b=JfQF0u5iNReYzMSC1XjBMo+ueJodjldyz9ZvShlGU02y9SivjGx+RrFzpQrGqZGyOMqo
	 IZZQX159ii95Q0EAqlCrG3F8mUYA5tQqqb0WKxzi0mWJIouL4EFIfcx4ac8icuhaqZ+Un
	 pDf+QQgy9siy7AXHHi29tjeBrETRXrCQ37H+o/fNJ/WnFkPlAo1kWuB7swwIrrJ1qlkMp
	 EYRqVwfE7rP9SK1Bf/RJguoIRe8Sqyh7tWF5nyYcojBWDbFp5NYYTVgQQylyhWz8MMcjC
	 GYABhBbRpPDnTXWTiBfYQYKKsvYMCnbET7SAbXfV+IlJWCT8aRe1oHSfXwXhBscqbWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792950283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wJwVn95XkX1asSTFy5fIxIgE8/6IXT+MKl/Rd/nYnus=;
	b=JxGZK6m9jeNOLR5QA2P4nqy71T9Dp1E9mXfWKuB28nhjBR18V2i8rN7euNIp67/bSGtk
	 LyZNCAyKMEoM5DIRMGJFK8jslTUmSGe/c2os76eCA/Qwu4IZdxd/E5ITINBZhoduUyNdM
	 imApI8raDcHPuvvF+yCsLcE0+ULkjUD06xLDD2yQqbvcc9U1ybqE4astbe482KV37dwmw
	 aPmJf/RXyoJYVWXP1R1oCn+4aviXrv7GSGVKs3EJ+w/ZbMXXEQ97gd52TUqY2jhN0IHes
	 g/y+CoRY7DmI/8m7MVLlxJa7FICJUwU0gHOAcypbnPfP+Rgmy5rdcJNne1UX4fgz/Og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792950282;
	bh=wJwVn95XkX1asSTFy5fIxIgE8/6IXT+MKl/Rd/nYnus=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PCgAD6pVRRXaaPw8pOWHEyiOfq8KMNXOjir11vmA8gzIUGvvYHXklk3SrGSjSxrIC
	 2WPogeWagwT3pp00rIzB+ZYoLBuIZK5kWLkteRmKwBvvkha70o2H8xr3Ugxz2Ev+Bq
	 nxM4GHW677n1uzugEuz3XX5ARxXrtIkFHohVMCpvYEBzJk5I9ktWIOeF9ko0Pii0Zx
	 EooFSY+gVxA5KlWk0nleT87QVWW0bXxED6inyeB0Ek+2cSKqh+FcC91UsZuMLqSJTo
	 OJ1Nxzny14MaqphDpDZotTPyU7z7KiOtr86NLP9KyPm5+d7++YUyUB5n++Y8CudnLx
	 1hRg5rweI/W+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B6240522;
	Sun, 25 Oct 2026 17:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F44D3D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20B89605FD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBO8LZAnhEgH for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:44:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC420605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792950281;
 b=FGlHOe0RZ7Ga92q5iv2Jj8cJhNrtYeanNiRhevD5z3PqCWYnCD40sMzlmgZxSWBMZbRU
 Ev5nyjM6jRKxzzQqWcQ1Gc5ymKAHiyUg2hMzneLZHlIGsIOj8WnT8ecV2mgwxEhaCLBcQ
 HCxEj4jgD2Cz+Nj9lnqHIOOi/Cerf+pRI6uyE4hN6cUktJEEaaBpscjp6ez6fzfBYvgIR
 SkvuyXXrZxCna7owBoQrlkIw98WA+Z3QzerxsfpHa8x3bLCal7Gri2l3va3W8R/zmo84j
 IQWY29rsV2E2COar0Tbes5Zrw8c7zxI99QTqxcaOdBH1jFSYu4LePaE9lk6PIeEpS6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792950281;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=D3p5dT3P69jCF+YjC2ACZimL3kLDuK+EfIXeh8MzRK4=;
 b=q3r1fnvpVBbhwTsG7PqT9c9UpHY9+hGDMzOargDs9cHUbKCDouxmsFecVxQrFKMq2x6A
 9VnkiNGNf1GNmo9Vwh/xQj8oaZFQsg00NTAQpkjuIXXWyebvNm95W5vI3C8gAQ2JLiAwB
 wrr+S64//Xagjn5budeL0dg25Fa/VnHSRm8+SJeCfnK9NSnub02vycfsen353vJ5cuxpp
 JbdQV2P29/At0K+UdzTDSJj0e+3PCZqQwBYXBSux/vC0vQqglOOKQFaYgVKdyIXrEq1KO
 aO75DCVvQDn1yXpBWeO+hWCOD181YKrNSwDgTSFSC/GFJHyESw1mnDxfCBbS33D+sJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZznB+Yli; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC420605F9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:44:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DCAFF4E4130A;
 Sun, 25 Oct 2026 17:44:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A38AC60740;
 Sun, 25 Oct 2026 17:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BC1910328E76; Sun, 25 Oct 2026 18:44:36 +0100 (CET)
Date: Sun, 25 Oct 2026 18:44:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thijs Vermeir <thijsvermeir@gmail.com>
Message-ID: <at4_x-qSmchPMRN9@windsurf>
References: <20261025104643.3703370-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025104643.3703370-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/x265: bump version to 4.3
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bernd,

Thanks for this bump, one question below.

On Sun, Oct 25, 2026 at 11:46:43AM +0100, Bernd Kuhls wrote:

> Fix build error on i386:
> 
> [ 86%] Linking CXX shared library libx265.so
> /home/bernd/buildroot/buildroot/output/per-package/x265/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  common/CMakeFiles/common.dir/x86/pixel-a.asm.o:
>  warning: relocation in read-only section `.text'
> 
> [ 86%] Built target x265-static
> /home/bernd/buildroot/buildroot/output/per-package/x265/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
>  read-only segment has dynamic relocations
> collect2: error: ld returned 1 exit status
> 
> by adding "-Wl,-z,notext" to LDFLAGS as suggested by
> https://bugzilla.redhat.com/show_bug.cgi?id=2428281#c5

Hum, what tells you this is specific to i386? Yes, your testing, but I
don't immediately see the relationship between i386 and needing
-Wl,-z,notext.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
