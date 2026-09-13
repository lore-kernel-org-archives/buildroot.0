Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DF9C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E4C60621;
	Sun, 13 Sep 2026 09:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZGjOJpJO9io; Sun, 13 Sep 2026 09:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F1D8060614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789292591;
	b=jUsXNfSYtlc0lBlT6XSKJfbxBtXtb77/t4QgM9t90NKow1A8ERfbHUUVxWBWe1rX/rJY
	 qI659Q7q/4tkaqapFwctxbQzUEanc6o6avtsxMe+YVjTTXI9iPBRd3hPQWXmfrrmx3nvL
	 QZUkvZ8eU1wDaDnKXiidZqMBL5JZZxgWMFqUset1wn4yF1v1QXzbd8syyrMQH3aV6kql7
	 O+CaGcbg1p7umnfQheD3gQreiPNnaGGi/x8w9fHkEEALPAZeLwJxlQf0EwhpFy0UHJQLt
	 OmshvLyeXXMd1SkGDOPWsQD+9iAYhALz+A7MlbMgkxhwVB/sPuUxf+zPfF0PSlhBEHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789292591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7oI8Xx+c/ZWSW5dGFs8G9vN38LLI7MNpeYVH7ACf8Mo=;
	b=tah/B2+2/UmMuxOlinoEgTqxJYzSlOsvvKTJAWglO61UAOrYkmKFZh7V2gvBRvMx7rea
	 CapAtxUZS4TY/1CxgAER3hxnUJuelZkjp+5EQvhfQI37+nZdYL7qkkU6/wWuFp5v7+BDn
	 q9zkWux30oVD71ciy0KiruCQy+uEqv2nAMgWomSuZSS8dduTOQHA6ahReGrrS/5qJQCsw
	 Er3+sGH65rUv8aUXHqStNw68OuwbyC3BfJCjZS6I9wAP6dYIkIBjfJ4rcwYoJU/mVSxN7
	 p768nCDxukCGgFpkpUNl+PwNe9Pkfyb4hu4OF7nH438BiwfeZ4BpiCpw6pz9WmhcEaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789292591;
	bh=7oI8Xx+c/ZWSW5dGFs8G9vN38LLI7MNpeYVH7ACf8Mo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N/PQlZlPbNWeV09H7AdJVBjlNepQi51f9m1wf7AvY5+OrjiwmkdFuiYeC46gBjHSI
	 TfOixdfjjRDnIVBaeVeVFoYXc5IGLoBb3SLmVAWZzDEAgoK0+yUHwVMTXPHC4mKWQ+
	 Zh3QNekDuPQ9yaK6IQI/q/eu25tzj8owU38tMsHx1QA5nCOhcoSclji1oRI7FxQHL2
	 7dzGH0Gk/OyIBDK355XvWOaLH1d3JDsVJN6d+poTg+x4ihcc8ePb1djt7+QAzhSK4V
	 sxqs4GeVcUG/ZfVOParHr/5C3hRC9WiZiC6pnBvH5GyU1JJ+QsrGKtqqCz2NDIEqRx
	 DP5eOt+TwWpJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D8060614;
	Sun, 13 Sep 2026 09:43:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4324B224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D2BC80C95
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7aCecY_YRje for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC20C80C88
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789292588;
 b=DuZCe2o27v+ky6Dm9MHv1z2h4MphY9hSXo4RBPwt2pkF0XASDImj5riEA4iGZVbZB6Kv
 +nPlMxWlQ6G/2KL9aD6fkLAsrj0mTb+alGlUjVj5mjd+nyrLrfo2TYPiAtrRM4E6/+Ybr
 h2p1sJupmMNnNAycZRXOiJseFrYOvo8thIeOS9woMvkNrmQjPO5gHHK5b5EOKdlJP/Tgz
 +qlxjdsgq4gttNPUIXVCSBpk2S68oHW5rKsdXN0gRrNkfsnBP10sSvWQ2i9hoPZuD9XiS
 Q/FyEW9VI09Bo9kqkCudMJwlJmc4Qq3CpEEbE99wq0rWCwT23agGKtYI2uPNUMUtY4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789292588;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=ZwmYE5lYnNYqoPVbQSWCmNc9WEJX+4hift/GXGJjxjY=;
 b=ocOno/JPkhX6HOAhFlH10XVWumL6WkrMhBEYB4SmGGFWJvXUdIvTxDLZEBNArUBzr5bx
 aAWwIymm0D3z/z+Q35z5XCi/JNeVACgH391MBEGP5GsJUn05WykyN/LPLgG9Bb2SdyMjM
 YEvYF0fhuh222s/yinY2fUxByvWQMp7POgUXFp6L+xszNGgE+T4CSn8lsKnUE6NCCmO7+
 V47MkaA9dqmZAAu3lDq3rI1Ikzj10Eg+3uwJJqO7tX1ApPvA0QPcawLS5+JDTomR8G7Mo
 faDzXk+hXK8DsftAndPmBW4w4YVpKHlTEgAOEGurI8E02S391AzxirpT7FKI6uwM3FA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=s1OKnjjt; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC20C80C88
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 09:43:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0FFAB1A04E4
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 09:43:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B115A60435;
 Sun, 13 Sep 2026 09:43:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 82D5611C7AF95; 
 Sun, 13 Sep 2026 11:43:01 +0200 (CEST)
Date: Sun, 13 Sep 2026 11:43:00 +0200
To: =?utf-8?B?RnJhbsOnb2lz?= PERRAD <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <aqZvcahE2rYBiBL6@windsurf>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-3-francois.perrad.86@gmail.com>
 <aqZSBEd2SO0aHS6V@windsurf>
 <CAMTop881hu=pLy=3N+rPNtorZFawAC54-xfvWbfAaPz7UrE+Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMTop881hu=pLy=3N+rPNtorZFawAC54-xfvWbfAaPz7UrE+Bg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 13, 2026 at 11:30:45AM +0200, Fran=E7ois PERRAD wrote:

> the version (=3D date) of this package is quite old : 20220331
> on autobuild, there are failures, only since 2026 (see [4]https://
> autobuild.buildroot.org/?reason=3Dlua-lunix-20220331-1&step=3D100)
> so, I think that the issue is appeared with gcc 15.

Thanks, but we need more than "I think". Test the build with gcc 14,
then gcc 15, and verify if that is really the thing that causes the
build failure. Otherwise it's basically us maintainers who have to do
this, and we have 700+ pending patches that need review, which is why
we are asking contributors to do this investigation effort.

Thanks for your contribution!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
