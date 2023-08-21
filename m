Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF6EEE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 23:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13AC0605D5;
	Mon, 21 Aug 2023 23:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13AC0605D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0gcwW-0MejK; Mon, 21 Aug 2023 23:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B40961145;
	Mon, 21 Aug 2023 23:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B40961145
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83D531BF33A
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A81B40169
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 23:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A81B40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgT_td2BzPei for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 23:45:37 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E4F5400DA
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 23:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4F5400DA
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31969580797so3520896f8f.3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 16:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692661535; x=1693266335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgE1djxyTvENpO7eYHeVkQYdk4oLlsewke2hLtGPLbc=;
 b=bE1WvKh4LV5hzJqntbwTwYUpp3qwf6Lu/8vroMh/2np4YUBbk0HhygPMfiNtSfwOSc
 hAWVtAITU9E3H1J621JOwnau3+d8nvparGKmGfiBfExeZvvtOIg2T11GBCUVhQSbN+Qe
 OIZH2LBmvOIjr19r03zqkSsw/jGlD/WYu2skNrNFDxL3LQMZud167aBKF2ZsAILAyUJC
 SDhSEpStESYUw6K7qr0IIITelHF191cfut8hu2+2NH/nn/DvNJelUIBS71dJKSpQg5uX
 S0iKKS3mIo1UGq/Kzo+8wbZvp7spAQIWjYc3H0hAg4PZOtW51ChG6qwua9zZUzlfDem0
 PT5Q==
X-Gm-Message-State: AOJu0YxbIIEOcP3IcdXRo/PL5hbZWc5Y6vhB0IU4G4jJm8x6aK0x5rhl
 WXEUsfS132d6NXAN15EgbzyM9Jnm2IN6B+iqeB4=
X-Google-Smtp-Source: AGHT+IFBO6DTdUJUablUBmw1e9x2Va8bHQXN0fNCwa6/nTRvJ2VLmIq53itWCLOjxkVmhi4E6l+rCXn1zMSiZbTlXKs=
X-Received: by 2002:adf:e608:0:b0:316:f3cf:6f12 with SMTP id
 p8-20020adfe608000000b00316f3cf6f12mr5721266wrm.48.1692661534832; Mon, 21 Aug
 2023 16:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230821175828.42827-1-ckhardin@gmail.com>
 <20230822001341.7256e67d@windsurf>
In-Reply-To: <20230822001341.7256e67d@windsurf>
From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 21 Aug 2023 16:45:23 -0700
Message-ID: <CAN=fXj29fRXvHHZVG03LfTfPQeBrzroV5VN3nwavTw3gejS90Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692661535; x=1693266335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LgE1djxyTvENpO7eYHeVkQYdk4oLlsewke2hLtGPLbc=;
 b=ruVyo7bflR0gdlE7I5l6fg/h9RMW31GO0HdE6awJV6SmS3ONRWATEQOACG4D6m7C+T
 2sA6zbttsLfKORUtz8g1nVx1n3Txt/wnRbmcNiuH8ef6NyvvKRF9xZgzInBV51L1cUve
 VIhmpEEaLy5JkrqlwUTIbJ55yGRxluE/4SvcEz1/l/V4nO2/4AJIFlhYewhWh0j5Ag5L
 Zaz1nZDSBDVwFnuXcCuDuZ2AnlFARTvnhKNKpwjiX+7dbeWP+XuTZfwY2+si5WtSH+8W
 iSioHZRDfJtDoNIZHs2P1FC4Es/yF9xo8IFzOY8N4Yz26Qbvv7WKHkkvvz+LM+FD1zzd
 g7fA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ruVyo7bf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pykwalify: add required
 package for zephyr cmake
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2865186615367279234=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2865186615367279234==
Content-Type: multipart/alternative; boundary="000000000000823fb9060377798e"

--000000000000823fb9060377798e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

inline

On Mon, Aug 21, 2023 at 3:13=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Charles,
>
> On Mon, 21 Aug 2023 10:58:28 -0700
> Charles Hardin <ckhardin@gmail.com> wrote:
>
> > When building zephyr based firmware, the cmake integrates with
> > python scripts that can be run using the buildroot host-python
> > dependencies. This is useful for the sdk setups and associated
> > build steps for the firmware. In this use-case, a buildroot
> > external project can be setup with recipes to build firmware
> > images using eabi toolchains and the linux controller software
> > to talk to those firmware images using one SDK. This might not
> > be overtly obvious from the patches.
>
> Could you clarify a bit what you call "zephyr cmake" and the use case
> for this?
>

https://github.com/zephyrproject-rtos

The build is cmake derived but relies on calling into some python scripts t=
o
generate some build dependencies

https://github.com/zephyrproject-rtos/zephyr/blob/main/scripts/requirements=
-base.txt


>
> > Add the required host packages and additional pykwalify
>
> This needs to be split into multiple patches, one per package affected.
> But I think we also need to understand the bigger picture of what this
> is useful for.
>

So, we have various RTOS MCUs that are hooked up into linux controllers,
and this is just a simple hook so that the same SDK can be handled to build
both firmware for something like an STM32 and a Raspberry-pi

Assume a reference to
https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e33b3eee to add
the gcc eabi toolchain has been done in an external package, with the
patches above we can actually build both firmware and the drivers in
buildroot from one tree with external recipes like below

env PATH=3D/opt/sdk/aarch64-buildroot-linux-gnu_sdk-buildroot/bin:$PATH cma=
ke
\

    -DCMAKE_TOOLCHAIN_FILE=3D/opt/sdk/aarch64-buildroot-linux-gnu_sdk-build=
root/share/buildroot/toolchainfile.cmake
\


-DARMGNU_GCC_TOOLCHAIN_PREFIX=3D"/opt/sdk/aarch64-buildroot-linux-gnu_sdk-b=
uildroot/share/gcc-arm-none-eabi"
\

    -DCMAKE_BUILD_TYPE=3DDebug \

        ../buildroot-external

make VERBOSE=3D1 -j$(nproc)



>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000823fb9060377798e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">inline</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 21, 2023 at 3:13=E2=80=
=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">=
thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hello Charles,<br>
<br>
On Mon, 21 Aug 2023 10:58:28 -0700<br>
Charles Hardin &lt;<a href=3D"mailto:ckhardin@gmail.com" target=3D"_blank">=
ckhardin@gmail.com</a>&gt; wrote:<br>
<br>
&gt; When building zephyr based firmware, the cmake integrates with<br>
&gt; python scripts that can be run using the buildroot host-python<br>
&gt; dependencies. This is useful for the sdk setups and associated<br>
&gt; build steps for the firmware. In this use-case, a buildroot<br>
&gt; external project can be setup with recipes to build firmware<br>
&gt; images using eabi toolchains and the linux controller software<br>
&gt; to talk to those firmware images using one SDK. This might not<br>
&gt; be overtly obvious from the patches.<br>
<br>
Could you clarify a bit what you call &quot;zephyr cmake&quot; and the use =
case<br>
for this?<br></blockquote><div><br></div><div><a href=3D"https://github.com=
/zephyrproject-rtos">https://github.com/zephyrproject-rtos</a><br></div><di=
v><br></div><div>The build is cmake derived but relies on calling into some=
 python scripts to</div><div>generate some build dependencies</div><div><br=
></div><div><a href=3D"https://github.com/zephyrproject-rtos/zephyr/blob/ma=
in/scripts/requirements-base.txt">https://github.com/zephyrproject-rtos/zep=
hyr/blob/main/scripts/requirements-base.txt</a></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Add the required host packages and additional pykwalify<br>
<br>
This needs to be split into multiple patches, one per package affected.<br>
But I think we also need to understand the bigger picture of what this<br>
is useful for.<br></blockquote><div><br></div><div>So, we have various RTOS=
 MCUs that are hooked up into linux controllers, and this is just a simple =
hook so that the same SDK can be handled to build both firmware for somethi=
ng like an STM32 and a Raspberry-pi</div><div><br></div><div>Assume a refer=
ence to=C2=A0<a href=3D"https://gist.github.com/titouanc/ea0685d9cd8592deb1=
c49d48e33b3eee">https://gist.github.com/titouanc/ea0685d9cd8592deb1c49d48e3=
3b3eee</a> to add the gcc eabi toolchain has been done in an external packa=
ge, with the patches above we can actually build both firmware and the driv=
ers in buildroot from one tree with external recipes like below</div><div><=
br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><font color=3D"#000000">env PATH=3D/opt/sdk/a=
arch64-buildroot-linux-gnu_sdk-buildroot/bin:$PATH cmake=C2=A0</font></span=
><span style=3D"color:rgb(0,0,0);font-variant-ligatures:no-common-ligatures=
">\</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><font color=3D"#000000"><span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 </span>-DCMAKE_TOOLCHAIN_FILE=3D/opt/s=
dk/aarch64-buildroot-linux-gnu_sdk-buildroot/share/buildroot/toolchainfile.=
cmake \</font></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:=
normal;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;f=
ont-size:11px;line-height:normal;font-family:Menlo"><span class=3D"gmail-s1=
" style=3D"font-variant-ligatures:no-common-ligatures"><span style=3D"color=
:rgb(0,0,0)">=C2=A0 =C2=A0 -DARMGNU_GCC_TOOLCHAIN_PREFIX=3D&quot;/opt/sdk/a=
arch64-buildroot-linux-gnu_sdk-buildroot/share/gcc-arm-none-eabi&quot; \</s=
pan><font color=3D"#000000"><br></font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><font color=3D"#000000"><span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 </span>-DCMAKE_BUILD_TYPE=3DDebug \</f=
ont></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><font color=3D"#000000"><span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>../buildroot-exte=
rnal</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:Menlo"><span class=3D"gmail-s1" style=3D"font-variant-l=
igatures:no-common-ligatures"><font color=3D"#000000">make VERBOSE=3D1 </fo=
nt></span><span style=3D"color:rgb(0,0,0);font-variant-ligatures:no-common-=
ligatures">-j$(nproc)</span></p></div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000823fb9060377798e--

--===============2865186615367279234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2865186615367279234==--
