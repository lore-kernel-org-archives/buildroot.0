Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1887CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 05:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6936A81469;
	Tue, 22 Feb 2022 05:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XBzzz8beXgz; Tue, 22 Feb 2022 05:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDFA8145A;
	Tue, 22 Feb 2022 05:21:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37071BF37F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 05:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE728145A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 05:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyZX8-5cejDj for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 05:21:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D0C48144C
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 05:21:30 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id u10so19838585vsu.13
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 21:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DKyNuoHPLk5NG7ADnK6CQ05S4Rt3+uDfEFPMWbIxaN4=;
 b=g3boT88UfM5zg4GpAm+A+E6+MhmeN+nHxk+oDJgd1b18cJN96b8s8QNsIJTri0HwEA
 a/wGN4S1jalcf7rIgtLj4PoD3AeBWoHVyKon2CloZNi+DazbisOAV5lImdQYAaug4n2R
 abrwYH9SmFUglVVNxmR/GB3Eg2x5Pa5HI7r89GLmYQltNTwQPXoCvTCaeXzXxi0dKtNB
 eDc9UaX4wtGNYCOf6flqgZLNPYG3UYFpweyEGcvKWDU10yGqfV8qn4R1681ZlHB0fHJx
 8zzKqXWbGo3wMVTFk2KBRcX9VnOFYkJYZC2UmSIZG4lLzMowk95QY7+M9wSgOAzQV9oQ
 C07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DKyNuoHPLk5NG7ADnK6CQ05S4Rt3+uDfEFPMWbIxaN4=;
 b=AsPQ8wh+wAcseBI9jlCHvycuG+EIpE/tF0LYEz6Q218TcW4+7WkDm3BWnT+HnuUbLq
 8hJOl0ToLUa2j8r8ou0LThgkMILRIrY0GHwyKKSoEFi70RZas50PBGGqL04uSNdJuTEc
 OzD9afGaNgjzJIwJlg80CKkfbM5O3v4mi74y/wPVt/7VRlxPz1Ig/gNcHNi5QHSvoffG
 xyJDfOJSrA7hDny56dlCavAkog8irJhLvXw80nJQjdBDeaTtGcrMk3WPITkxQMp5PNLa
 TonQjc2xqyx3tOWKwY8ChwJJBPYNn+ztjwkP2dqgUaDOtHig4pgkwRza35QESV8OYc+x
 V6jw==
X-Gm-Message-State: AOAM532aAUsQ79cGkXiWlQnjyp+FgSjv1pHtwpUykjasNppochX2vHmV
 lBG8e0K2XP8KuAhhdCL0eXn8Qumfiq+hzw==
X-Google-Smtp-Source: ABdhPJyXu3zOFWPtpYjm08AArAEOIHxPDdEZ0P61fpFmhSE0AiLx2i6ATymHPDSuBAHUy3CTOK6u2w==
X-Received: by 2002:a67:c18b:0:b0:31b:b068:b575 with SMTP id
 h11-20020a67c18b000000b0031bb068b575mr10252967vsj.70.1645507289327; 
 Mon, 21 Feb 2022 21:21:29 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id t3sm3640173vkl.53.2022.02.21.21.21.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 21:21:28 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id g21so19893245vsp.6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 21:21:28 -0800 (PST)
X-Received: by 2002:a67:e005:0:b0:303:b07f:9735 with SMTP id
 c5-20020a67e005000000b00303b07f9735mr9815404vsl.6.1645507288179; Mon, 21 Feb
 2022 21:21:28 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 21 Feb 2022 21:21:16 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pwkhPn5SS-jPmXjS_gb07EsshRA5HMJewVRcY32RL6=g@mail.gmail.com>
Message-ID: <CA+h8R2pwkhPn5SS-jPmXjS_gb07EsshRA5HMJewVRcY32RL6=g@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] package/expat: please backport to 2021.11.x
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5404360881591120170=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5404360881591120170==
Content-Type: multipart/alternative; boundary="0000000000006328a505d8948507"

--0000000000006328a505d8948507
Content-Type: text/plain; charset="UTF-8"

Hi all,

Expat v2.4.4 (vulnerable) download has been removed from sourceforge.

So 2021.11.x build is broken with the older expat.

Please backport the expat security fixes to 2021.11.x.

Thanks & best,
Christian Stewart

--0000000000006328a505d8948507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Expat v2.4.4 (vulner=
able) download has been removed from sourceforge.</div><div><br></div><div>=
So 2021.11.x build is broken with the older expat.</div><div><br></div><div=
>Please backport the expat security fixes to 2021.11.x.</div><div><br></div=
><div>Thanks &amp; best,</div><div>Christian Stewart<br></div></div>

--0000000000006328a505d8948507--

--===============5404360881591120170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5404360881591120170==--
