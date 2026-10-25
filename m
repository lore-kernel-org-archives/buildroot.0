Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC2606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kJOwwkxr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C9E405F8;
	Sun, 25 Oct 2026 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qxeBJsGR215; Sun, 25 Oct 2026 20:59:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E6C68405F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961994;
	b=C0+YeiFC89yQfgJZBm4E35+6Kt/zSWMqoiMKZRXq+TDaVpDdKOFHkZ1183M+qpS/pgBY
	 L+TSxxUDkrNz6vE1Y7ZLXZdsiLs1XyA1HhPeM+li1yyYe83mEYARey4rPPw58famqg9fx
	 xowjN8Ih+7BkfvHvTN3y9NbK3DjPn/EPUeKKFOH7gsDfSfxAMPDaSZqlEnXLzQOejjgUc
	 /U3bVLRY+PFdvCzHI3M03dJck3MmQBcgPbwQwEj8KYFRDKNNiahOkpvrJjJYte2O9HwqY
	 o2tSgje7iC4gOlVGC0SNjj1a8vD414cPAjhqrM/H8T1/3gHQlz1weJNEfWzpX2rpe4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6AZ0xrYMIt3rlckV7UlA3RuhvFOleBiqD01jAur+3fk=;
	b=L9tbhprzKp3G5RD0/aWDJZf5lei57BYu0NlhbwwjDLZW+UOtMR+0CvGeYAfcm56AHJBZ
	 FfIbg8meDPIkaah58yPLE/5wR4MHhOlg9eMFXOvwRx/SMu70KLLR/A4S9WjhSjYDx9v4T
	 IvScoLXtejo/XRJsjgQv2NQDzTj3ASFaBzDXF7cdOvhpjONk/fjkl3r/bO6Ij6tM62HK+
	 zmZlL5bbiyI0z5VgJBDvjRj4CMR2AJbvv6bZuIMQMakKnY1Mrnyg+2JcEMNB4L+MM781X
	 PGYLLLGvkMDIxhtEA4qKMe64abV71qaDLwGwAguY20bi6xpwosUuPieUX5MyEGhl2SA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961994;
	bh=6AZ0xrYMIt3rlckV7UlA3RuhvFOleBiqD01jAur+3fk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kJOwwkxrSp0doTAnE4aU8UzZcU1I/a9RvY0sCqvbiBbKon0C35CCHZdJ5qNoBOMqD
	 PMzN+9lQvYIwLG3nZDG1KbxVvihYvYbnAWre7QAvBB6jLEly6ZqA+nK7EIuFt1LlKo
	 ab1Qt3H7BtihxCwUBX/hF9HrP3+KLLsk6eRr0OTgglmeKriDucuVTSJHSOc+/U6rza
	 YJ9vczCnZGuEvTQlQFBYY+Sm2ifxkJCxw8DJ6w2Y7OmVKLJn68jK1ZWTpkR0K5hnI9
	 Bs1D+WFHqZFjqFKQk5L9n/0UgC0AO5YZbBjNjgk2dbXV5LZvUgpN2RuklZiCzya9UF
	 e+R1R6CRQp8rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C68405F4;
	Sun, 25 Oct 2026 20:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09B0C4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFD9240070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2dwlA_5IEEq for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:59:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6E54B40057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961991;
 b=kaRJeBG8iW0mE7Pc8DWdx/Cn0gEqTRRX3t7pwid/9h/sdAUdyw/QvDIh8aepu8Z9WDGS
 OpnXJqZAOHHpCX/96yDfZptDy3G+WljTy+9EjNJYveJ18FkJSvgE2uOszBydMyOeuXujd
 zr7cro9M31EQKcvuhgXNCwrIQ9R02o1AYrDXQvxL5bUZ+O1tqYXiePLW0D615TTL6ifdp
 dl/vZpaWSsQI0YeItHjmYKKBGkGOEGH/glPnMyo09TS2zYY0vpHs0gIaCuaQaZSAAtwAm
 RBl79rTO2vxHN0goYmtqoTQGoOs52vE9k4N+kZ9LAnMd5t70uyVi2x3ANTjJZW8wj8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961991;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=G2c4rTz2VNmBQ5cjinksvwcu7EunMC7ePmW3YO8MA30=;
 b=fEv8RI+8LaRvvAVR2yTlofr59qXsylc6qvnzg1gih7ErarpfMFdSRKo6pJfKMUxgTVCj
 ZZJdvnpYi4VLCpN3gcOvtVGyMoMLvKKOFONr8ALu6l5jvWXHXixBVrCj0P0AWBI12Z6bd
 hptAy+vxHCoIFM1beyHq/ZWSKKMuc3Bo3UYvNkmIUpIO82WF8uyhz20LqL5FaIWZEDJY2
 v6k9HKrFTQl00K4dZaS7AkDbriQ6QQ4nt7zdRNC1wj2FAMlIJGUKXgAjElml+X/uoTbxG
 Cw2r3wpuvjneLqaWk9cMEX5JcqIvTSlNJ3JYpLriwAn7knnrQUKwODOVzdgEyikfmkQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1VJvNhlK; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E54B40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:59:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0177AC51477
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:00:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D34560740;
 Sun, 25 Oct 2026 20:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F4A010328E76; Sun, 25 Oct 2026 21:59:47 +0100 (CET)
Date: Sun, 25 Oct 2026 21:59:46 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <at5tukQ3Uf3ksK4N@windsurf>
References: <atszOGixD1EGrTxG@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atszOGixD1EGrTxG@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/chawan: add arch mapping for
 BR2_i386
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

On Fri, Oct 23, 2026 at 12:13:12PM +0200, Waldemar Brodkorb wrote:
> chawan architectures are different to Buildroot ones, so
> add another mapping for f.e. i686 toolchain.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Series applied to master, thanks!

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
