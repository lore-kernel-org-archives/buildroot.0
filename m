Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0160A3811
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LRPCRgpG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WVxsUYmX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D60D80BF5;
	Tue, 24 Nov 2026 14:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riZyb-VJImqC; Tue, 24 Nov 2026 14:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3185480892
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795529208;
	b=IAbvzvG6+TaTwYKViXCRMGLfA00RiMgX9mkcWBdX/EfXGkcwbSy8k0jJmklypesZjGpb
	 wTVfJOA31BhdwdqMj/M4336ciar1oSeruw+XTpalcAONfRpwogiABkzAOU1zVhXBRNR9M
	 P7DGjxl+sCMYIea3qRSVUTSCEIMfIplhEzXhfV/WAEuXhIQeCQu6BLtA8dDqz9oQ4iEdX
	 ata6dUq795SQtK7i4RuASmKXat9pWM8GJ8a4gUGqOJJwUhryf8jI2T7GBVjfzi33BVBWD
	 Gd0d4ghkySD+iPG7714YSTF0qyEIX1VVwZqCOYEySWmQqyz0/rsNl5c10u3gwzSTqjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795529208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=8lIxsKiJLytlDraY8363NMGBC4kThBGvpZ/B1otrSAE=;
	b=eHnfQXDWWipUKi9cynGDSDfZYp2qAyVT2f20BkXShzszPWe3gW2Z25y2inMFZT5bWHYE
	 AFXuX2LGJSvYA85pnYq0qaCzZD9SQvbvG9SmdkcxU6evVFoZ4FE07XQ1uPYBMjvPtUbPW
	 NFBy3KCfDIeIxvDEptIB3VAsy6GGKbOd9kglJeeB/RM4IKcdMjSo6zu16h9TXvc1lRLbC
	 DbSW4OxMceRCJ90JdAKzBmkXoR94sioKMnuaFQ9TjaYaMSMlQUlFRNM8G5xK4VxtnyJiA
	 VklRdOiDq1ICag8ite972ir2yoQpWl7Qwgv/lOQh9Qv7w5WT2Bhkzzg7h2KVjzQRqqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795529208;
	bh=8lIxsKiJLytlDraY8363NMGBC4kThBGvpZ/B1otrSAE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRPCRgpGf3NMM1gbV56p3P0/JNB953sb19IE5sm/ycCMRf+ca+D9Lq4vgQMJboofr
	 6vXQkqejP9MHcMLB1QGqXzwvDhcigFFc9ZULptat8+dgRjt9kmhx8aIoJD5d/LQvbH
	 L0kdt+ITVoEpIKDvgjOm50u2cTE9zfwgFF6ErkXlrVm6kTh7clWYJgNNTFOYHgiNRv
	 HOYUsr+7yeqqWDSb+pe4vubGGQt86nbvNhtAAfWXQSAQUYbs1B6856JXoOqJ2duGG0
	 vswSTNq+fEYDOHzQtV49FSq62cuXZofoogzTad2FI7UW8smCS98Fur8r1axWkAp7+u
	 LGDSM2A7NwbEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3185480892;
	Tue, 24 Nov 2026 14:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F8E371
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E992F407DA
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFXiUSgSSHAK for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 14:06:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 69844405AD
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=WVxsUYmX
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69844405AD
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 14:06:43 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b88aab58fdso439460a12.3
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 06:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795529201; x=1796134001;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pqq4vfW/+sP5Cr6XwCmbLDoFdU5S4ZuQqYbBOqFkrYc=;
 b=WVxsUYmXk+kCfceiWZS2+bA6sbPAmzpHDKa4QfNxH8UVZL3X+Trwy8xP3aPtGcBu7n
 w5MgHb7pv8LbwwAV2B9VlDnr5lz3FVp3DsNx+k7b3IJ/4FhCNHp8ODZgYvqW1DByik4M
 Z9qPm3Miuac/OmHtv7TerfkgWpU3Mx+s/YPMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795529201; x=1796134001;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pqq4vfW/+sP5Cr6XwCmbLDoFdU5S4ZuQqYbBOqFkrYc=;
 b=DqHIqbn6r3xB3c3zRV2AphhkeBL7cIevYJPylDED76sDjTPIl1n03RnsijEeoxSMZm
 ZeBvKBF7tNa+Nn7zISf9TtSkgCg+b5Plb2bADpTc8P4X/P4yP8z9/7jqrtHvEhmM4bbd
 5KE0BzdSHm3Q+PDnqWJda0OXNA4zsUfsO0gsxnbWBRE+oBZxIw80mRiCptrCW+2M/KEx
 lusMJHGiOpYtzBDQD3BOZ+D071V5cznbrzQ/rzFTDuQ+dtdbrS+UVL1K4auOb2BtRI/m
 g6sRIzvPdhkSKsl2EqBHRT9CJS8xg1TrQhmkCKjV/PCJjhFVAcszZyVZCIbT0n3B6G+d
 yKjQ==
X-Gm-Message-State: APuU4Z8DJNkcqwJjzAfhODCpv83R9XC7l1Wf3BsNziaFgu7Hq5ndjEAV
 TqaRNSnma6LJ2nENJUereDSwZNdT+5frP4UpthID2N3Cx8NeuEfE1UK/a2VQQdxiABWwKnaoLld
 IeFAEc3A2/Z2/M3At+432Epa/4EqMlHDe3YzNMkbIg/GOgKUKvtl6y1g=
X-Gm-Gg: AZFdTZepLGD3OYmyd89ilLgWN1UhXOrFHi67OoKpeWJamNBS+OJLWYtKpMMlg23Ep4o
 ec+2fZQq8EVR+CLhmTrQj4gq6ssnGSQg2VUqPINCyy5NvEUui69qb4F9U/5z/v1EQ0m/PE8rfMB
 3Pr6KWgqL8BZ0Fa8TWCM04jPuk6MTtIi8g2QWN1aQ2Arjzc44o5/UwfbOTh/vmsgYkHCYjEAzX3
 uBo09Q3C+RY6e90k5QvA48KXlRGSzIlvjXnhCTh8uVxHuhzVgtZkqFH/MEnBx+xp+VKyu4hb6Fp
 oDjkQyu3E3dGCWhlfdCKearXpVxV3X7JTFDt1kosuPC/MyI1HfOG0QT34UtdenFoVr8c+MccCqu
 2MeB5PGflq8WJZLyFVvDLk1qkUjOvf+zGx+zWREkGIH4AOy7rXjd445hgMLM0G+jCOtndJQl+DP
 qOjZvfhOWQfQ9kLUmNrVyH/incoRJEBnRYPoYuoKbAkH5C9gfG5mYI1nu3D2fGlSA3CVmfCPKqL
 hHLlo00zp5Sy6uEOyr4PEaJD7e8MX5V4A==
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id
 4fb4d7f45d1cf-6ba37ac9214mr12369446a12.0.1795529201475; Tue, 24 Nov 2026
 06:06:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124120443.1909297-1-adam.duskett@amarulasolutions.com>
 <awWE1RgnB26pEf9I@windsurf>
In-Reply-To: <awWE1RgnB26pEf9I@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 24 Nov 2026 15:06:29 +0100
X-Gm-Features: Aa3M54ouL1XuCCYRKLXhvIw8Ft_9nGnL1ue5YRSkDDLGWwD8L2mKMWatqM9Uy90
Message-ID: <CAHDQB6O75Xt4bBnYn8SUjnuRHgGwi2YJ-7bbhfYo=KbrSFbwJA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/9] package/flutter-engine: never build the
 GLFW shell
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2803690711512720506=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2803690711512720506==
Content-Type: multipart/alternative; boundary="0000000000003d0096066106383b"

--0000000000003d0096066106383b
Content-Type: text/plain; charset="UTF-8"

Hey Thomas;

Sure. Sounds good to me!


On Tue, 24 Nov 2026 at 13:37, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Tue, Nov 24, 2026 at 01:04:35PM +0100, Adam Duskett wrote:
> > When BR2_PACKAGE_LIBGLFW is enabled, --build-glfw-shell is passed to
> > flutter/tools/gn. On Linux, the GLFW shell adds the
> > //flutter/shell/platform/linux/config:x11 config, which is removed by
> > 0002-remove-explicit-x11-dependency.patch. When the desktop embeddings
> > are also enabled (i.e. with libgtk3), gn then fails:
> >
> >   ERROR Unresolved dependencies.
> >
>  //flutter/shell/platform/glfw:flutter_glfw(//build/toolchain/custom:custom)
> >     needs
> //flutter/shell/platform/linux/config:x11(//build/toolchain/custom:custom)
> >
> > The GLFW shell is just an example desktop embedder which isn't installed
> > by the flutter package.
> >
> > Always pass --no-build-glfw-shell and drop the optional libglfw
> dependency.
> >
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> Should we assume this commit:
>
> Fixes: 827da2242cf6ad34941ea911e224738bc8633b20 ("package/flutter-engine:
> new package")
>
>  ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000003d0096066106383b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Thomas;</div><div><br></div><div>Sure. Sounds goo=
d to me!</div><br></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 24 Nov 2026 at 13:37, Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, Nov 24, 2026 at 01:04:35PM +0100, Adam Duskett wro=
te:<br>
&gt; When BR2_PACKAGE_LIBGLFW is enabled, --build-glfw-shell is passed to<b=
r>
&gt; flutter/tools/gn. On Linux, the GLFW shell adds the<br>
&gt; //flutter/shell/platform/linux/config:x11 config, which is removed by<=
br>
&gt; 0002-remove-explicit-x11-dependency.patch. When the desktop embeddings=
<br>
&gt; are also enabled (i.e. with libgtk3), gn then fails:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0ERROR Unresolved dependencies.<br>
&gt;=C2=A0 =C2=A0//flutter/shell/platform/glfw:flutter_glfw(//build/toolcha=
in/custom:custom)<br>
&gt;=C2=A0 =C2=A0 =C2=A0needs //flutter/shell/platform/linux/config:x11(//b=
uild/toolchain/custom:custom)<br>
&gt; <br>
&gt; The GLFW shell is just an example desktop embedder which isn&#39;t ins=
talled<br>
&gt; by the flutter package.<br>
&gt; <br>
&gt; Always pass --no-build-glfw-shell and drop the optional libglfw depend=
ency.<br>
&gt; <br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
<br>
Should we assume this commit:<br>
<br>
Fixes: 827da2242cf6ad34941ea911e224738bc8633b20 (&quot;package/flutter-engi=
ne: new package&quot;)<br>
<br>
=C2=A0?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000003d0096066106383b--

--===============2803690711512720506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2803690711512720506==--
