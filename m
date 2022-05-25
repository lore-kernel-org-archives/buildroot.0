Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091B4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 21:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F608444A;
	Wed, 25 May 2022 21:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAemF7uZJl3h; Wed, 25 May 2022 21:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B41842C5;
	Wed, 25 May 2022 21:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA0A11BF356
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B194B400CE
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8dcvC1tYr1V for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 21:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E3F40022
 for <buildroot@buildroot.org>; Wed, 25 May 2022 21:07:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i27so44025042ejd.9
 for <buildroot@buildroot.org>; Wed, 25 May 2022 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vycLW0rHXk6tMeeQ+6G/WRgz4JAxdNjcnVZQp5Bbz7c=;
 b=M/NXiCzkXCy780+v/YBL/uB+ArnjQ7gintSsY8rl2HsSZTgjnWQlgUoCuEpOQrtrbt
 59UnGdjE88I2KM4GnMfvfzS3EhAERZ8kTthiudI4lBHsoku+dujHLFjNtaIH2lj1qzZN
 Rk9jciCXEM0eFX4lqt+C5bZb/7A5lJ8qgV3OJIte7vBUu74gNwoCYSkMVF8C/Zf5QLLd
 fncswESyRGo6GhRW78/WdYORYRQer1d4o3UYFanLMsXwim2bUWJFaziKC6OQFcCjNK82
 zzCjCQeq1rYTQ8RhVX4e+Jy0YoesqFYwoXqDfGMogA0U27rGXF8GtbFnkBl7PNHG1zPG
 CH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vycLW0rHXk6tMeeQ+6G/WRgz4JAxdNjcnVZQp5Bbz7c=;
 b=vQy7ZyV30xGIjQlz6P8JK7pj0VK3ZJR3IckdiRSxioeBHHubF7u506mgCS8ROkA19w
 F85/6RyAEmtxCdLxIWMzamwUZv7GODsidEwfAq0kTcv4clbI3uFYx1Od5J5uwbn/Qy5Q
 2IhcbZFGHBS4VeklIkKTO0r6Yb1RkDofrmVtkJ9aiF1A7DWv23IQrXoL6QeoINR03dgS
 rndGcQbXiwSvQ1jHzYEav0Hc5gHfKR15z/N9YVmkxdPc2uaD2r+5+94ilX0O915g1cvo
 Eyu6EIj4AQGtWyNHG7WmrnI/dqfFfky9kzbe0V25oHjCtNZjl+lQ4S3i3z6aL7zGjprA
 CrAw==
X-Gm-Message-State: AOAM533nybAu815zTmFmcq2Ck9rZ0Ofie6eMkEwcNHCw9YCeyF3z9dda
 CxBcN9r4JoX1JU0rubf8nseiOLAjvXwSAcBV
X-Google-Smtp-Source: ABdhPJzXknYm4x0c2Bwvg1endc9bf4aLU0ED4Qrf65ZQfspAGYPVoZ0yrCQ8fXrizg879wAdgEfDEw==
X-Received: by 2002:a17:907:8a1a:b0:6fe:b42f:749a with SMTP id
 sc26-20020a1709078a1a00b006feb42f749amr24638618ejc.451.1653512873644; 
 Wed, 25 May 2022 14:07:53 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 23-20020a17090600d700b006f4b2aab627sm8448940eji.222.2022.05.25.14.07.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 14:07:51 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id t5so5176182edc.2
 for <buildroot@buildroot.org>; Wed, 25 May 2022 14:07:49 -0700 (PDT)
X-Received: by 2002:a05:6402:1cc1:b0:413:2cfb:b6ca with SMTP id
 ds1-20020a0564021cc100b004132cfbb6camr36597512edb.265.1653512869381; Wed, 25
 May 2022 14:07:49 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 May 2022 14:07:38 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
Message-ID: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Joel Stanley <joel@jms.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============5024069159755440523=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5024069159755440523==
Content-Type: multipart/alternative; boundary="00000000000036102705dfdc7734"

--00000000000036102705dfdc7734
Content-Type: text/plain; charset="UTF-8"

Hi all,

Go will soon require Go >= 1.16 to bootstrap.

See: https://github.com/golang/go/issues/44505

Go1.4 was the last version written in C.

Today, in Buildroot, we:

 - build gcc and/or use external toolchain
 - build go-bootstrap (go 1.4) with gcc
 - use go-bootstrap to build host-go

I propose that we switch to using Gccgo:

 - build gcc and/or use external toolchain
    - add flags to enable the "go" language in Gcc
    - GCC 11 or later
 - depend on the "go" language in Gcc to build host-go
 - use the gccgo compiler to bootstrap "host-go"

See: https://go.dev/doc/install/source#bootstrapFromGccgo

This will be more future proof, and also solve the issue of the upcoming
switch to requiring Go 1.11 or newer to compile the Go compiler.

If this looks good to everyone, I'll send a patch series.

Thanks & best,
Christian Stewart

https://github.com/skiffos/skiffos

--00000000000036102705dfdc7734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Go =
will soon require Go &gt;=3D 1.16 to bootstrap.<br></div><div><br></div><di=
v>See: <a href=3D"https://github.com/golang/go/issues/44505">https://github=
.com/golang/go/issues/44505</a></div><div><br></div><div>Go1.4 was the last=
 version written in C.</div><div><br></div><div>Today, in Buildroot, we:</d=
iv><div><br></div><div>=C2=A0- build gcc and/or use external toolchain</div=
><div>=C2=A0- build go-bootstrap (go 1.4) with gcc</div><div>=C2=A0- use go=
-bootstrap to build host-go</div><div><br></div><div>I propose that we swit=
ch to using Gccgo:</div><div><br></div><div>=C2=A0- build gcc and/or use ex=
ternal toolchain</div><div>=C2=A0=C2=A0=C2=A0 - add flags to enable the &qu=
ot;go&quot; language in Gcc</div><div>=C2=A0=C2=A0=C2=A0 - GCC 11 or later<=
/div><div>=C2=A0- depend on the &quot;go&quot; language in Gcc to build hos=
t-go</div><div>=C2=A0- use the gccgo compiler to bootstrap &quot;host-go&qu=
ot;</div><div><br></div><div>See: <a href=3D"https://go.dev/doc/install/sou=
rce#bootstrapFromGccgo">https://go.dev/doc/install/source#bootstrapFromGccg=
o</a></div><div><br></div><div>This will be more future proof, and also sol=
ve the issue of the upcoming switch to requiring Go 1.11 or newer to compil=
e the Go compiler.<br></div><div><br></div><div>If this looks good to every=
one, I&#39;ll send a patch series.</div><div><br></div><div>Thanks &amp; be=
st,</div><div>Christian Stewart</div><div><br></div><div><a href=3D"https:/=
/github.com/skiffos/skiffos">https://github.com/skiffos/skiffos</a><br></di=
v></div></div>

--00000000000036102705dfdc7734--

--===============5024069159755440523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5024069159755440523==--
