Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9867C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91DC1405BE;
	Mon, 10 Jan 2022 08:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PH4YerwOxSGr; Mon, 10 Jan 2022 08:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8015C40327;
	Mon, 10 Jan 2022 08:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB99C1BF29A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92DD5408D5
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXK9f_U22DCA for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:28:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1A644034A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:28:11 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g11so41539393lfu.2
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRfZQejAB0XESw6gWl6xEkSJKvS40JOU9wPZfojiuRk=;
 b=akU9y2zdLu+ZaHtyvGryAwC87++X9tYCah+UNnrtXGFJwka3ZciPL+NDFVGTAxC7Ay
 w/JEe4uQ9kx8YmnD/25R6gubKBTwJHeMxG3KOYXtfjG6KkFzyxl2UNThcxFkGl91Q3ni
 qo9xDX2xSv85VU6bsEk8FfD3lPkPFgsbUvangKBq5CpbSZ0BwE511KQVgey4YmOibXXg
 NZGGI1gljk1CxscxFYpDSFqzVUYGNGh5dIKG+Ka9gQXigCQKwIxcwVrhh7oLN3wuliRD
 MPLOOzCCuE5k1xhpSiH6YFBYQ/6dDmJsv8R8/9M9zeudnRdfR382vAw1KLweNfiCyDYA
 7bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRfZQejAB0XESw6gWl6xEkSJKvS40JOU9wPZfojiuRk=;
 b=bGv4jBrUVdpiyKJUXMDgnfJ0b1zfWS9uYpvML+554u/GFVtF+hgmhqAZLfFWdNYyLV
 0mmkc6lFvuybdjcWFC6m1+jaRAaSfBgk9lK8xmdv2B31M6v3QIeucSoHGqxQyxCFbMIY
 xI5am1RDJ38+5tHu62uSaqvYuJIuF5j+VDwXNiS6IYsp3txAjGwoUXKGi65l0J1rgdkO
 5aAcIwyn82TewZeo3j9I5wvI2xO1EKksG1QO+UGb+DEZouWU6mnyYTV3VAxDjNaABk84
 DOvO8WIOgrGnlmLATX8Z8cQVpt27rxnjGn2Isvykuch4wTc0fFl0YfrUTRekHxB3dAum
 /KnQ==
X-Gm-Message-State: AOAM533xoFkI4ad9S0bpXuvn7dc2x7XLvqUUztuBaiCG8rpwLMhUijFo
 86RM52dWpnjMF+Ri+UaFlCzuwXQ4E/1M/wyW5COykGgA
X-Google-Smtp-Source: ABdhPJylCpRaJLYN3Pm0gpfaf3jjw4xHt9Q+gRcmSfkmok8VY30mtf3Eve7yuyANMF/YdNoM8FO10vd1j525jado+uY=
X-Received: by 2002:a05:6512:282b:: with SMTP id
 cf43mr64917204lfb.331.1641803289735; 
 Mon, 10 Jan 2022 00:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
 <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
 <CADvTj4q4bR++z4YevSfa35Xxu7AUVMmS2o4mEtfP4WK3-cGx2A@mail.gmail.com>
 <CADYdroMDCcUYSj6XyrXUHi4hwDWjtTXNX7BOmLt-Eb3JK_3fQQ@mail.gmail.com>
 <7229983a-cbde-eb3f-83cb-984544f3b355@mind.be>
In-Reply-To: <7229983a-cbde-eb3f-83cb-984544f3b355@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 10 Jan 2022 09:28:00 +0100
Message-ID: <CADYdroOrCixubVPKe=Zs9CUbTucw4Zs-RykAyrhhwA1q+NbejQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: multipart/mixed; boundary="===============8992165305451913801=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8992165305451913801==
Content-Type: multipart/alternative; boundary="000000000000e0347905d5361d4f"

--000000000000e0347905d5361d4f
Content-Type: text/plain; charset="UTF-8"

Arnout Vandecappelle <arnout@mind.be> schrieb am Mo., 10. Jan. 2022, 08:26:

>
>
> On 09/01/2022 23:52, Norbert Lange wrote:
> > Not only missing, but I sometimes need a *different* config. For example
> i don't
> > want to link against lz4, since I use zstd instead.
>
>   Which is a great example of why the option doesn't work: it would affect
> dependencies as well.
>
>   However, specifically for this one, we have in the .mk file:
>
> ifeq ($(BR2_PACKAGE_ZSTD),y)
> SYSTEMD_DEPENDENCIES += zstd
> SYSTEMD_CONF_OPTS += -Dzstd=true
> else
> SYSTEMD_CONF_OPTS += -Dzstd=false
> endif
>
> ifeq ($(BR2_PACKAGE_LZ4),y)
> SYSTEMD_DEPENDENCIES += lz4
> SYSTEMD_CONF_OPTS += -Dlz4=true
> else
> SYSTEMD_CONF_OPTS += -Dlz4=false
> endif
>
> So it should already do what you need, no?
>

I want lz4 in the rootfs, i don't want systemd to be linked against it
(doesn't add anything for me, if zstd is available too)

Norbert

--000000000000e0347905d5361d4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind=
.be">arnout@mind.be</a>&gt; schrieb am Mo., 10. Jan. 2022, 08:26:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
On 09/01/2022 23:52, Norbert Lange wrote:<br>
&gt; Not only missing, but I sometimes need a *different* config. For examp=
le i don&#39;t <br>
&gt; want to link against lz4, since I use zstd instead.<br>
<br>
=C2=A0 Which is a great example of why the option doesn&#39;t work: it woul=
d affect <br>
dependencies as well.<br>
<br>
=C2=A0 However, specifically for this one, we have in the .mk file:<br>
<br>
ifeq ($(BR2_PACKAGE_ZSTD),y)<br>
SYSTEMD_DEPENDENCIES +=3D zstd<br>
SYSTEMD_CONF_OPTS +=3D -Dzstd=3Dtrue<br>
else<br>
SYSTEMD_CONF_OPTS +=3D -Dzstd=3Dfalse<br>
endif<br>
<br>
ifeq ($(BR2_PACKAGE_LZ4),y)<br>
SYSTEMD_DEPENDENCIES +=3D lz4<br>
SYSTEMD_CONF_OPTS +=3D -Dlz4=3Dtrue<br>
else<br>
SYSTEMD_CONF_OPTS +=3D -Dlz4=3Dfalse<br>
endif<br>
<br>
So it should already do what you need, no?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I want lz4 in the rootfs, i don&#=
39;t want systemd to be linked against it (doesn&#39;t add anything for me,=
 if zstd is available too)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Norbert=C2=A0</div></div>

--000000000000e0347905d5361d4f--

--===============8992165305451913801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8992165305451913801==--
