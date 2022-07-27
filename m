Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0162EC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867F9409A7;
	Wed, 27 Jul 2022 07:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867F9409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQ2BCtBy4vOc; Wed, 27 Jul 2022 07:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CED14099F;
	Wed, 27 Jul 2022 07:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CED14099F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AEB01BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B1881959
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B1881959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHa1ArTTvxbl for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:27:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41D68177C
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F41D68177C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:27:18 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 v40-20020a056830092800b0061d0ac9ebb2so4110846ott.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 00:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4mj2uSKphlOjqIyqYrYwFXT5haw9ANiLqZWruFPY+s=;
 b=ICM0Cf4JvlOCz459Zs/90gU+3s5XKCG930Q9NYBCGg5sz9n8M/yue5sPvEgjleRzQj
 ioMWj1amC1DbQwVBK3WLIza9Inpd/9jZ5KbEwM9rGbOjNifntc7IinXgGpUtH03vMkq4
 D3SlzOZRDeNdSASYHRQzPQvSWohoa1qxn7bmzsP4wipTQ/17hj3Vyt0shQRwn6g+UpAN
 U0tQuGrYzdFKd+7v5CC0ps4zlYU+Uw21Nu0UDhIT4Dm67U7tOAmYDH93XX5xHc9fVr3d
 wpSV1QA0VcB0TOXzhhEAXXTd5ZbEEB8HFJA2d7Dd0t7Q7Sx6dv+JpEAbE0QNZ8+06q5q
 Gj9Q==
X-Gm-Message-State: AJIora+7iKymAMGK8IgG1TleayhDrYnw0/FCjI54ni39olmfaKRG6aIK
 7YZLYPpXIZ7+5ROT/+ruTNjIfLU6eMC5BFQkkQMDe/Qk
X-Google-Smtp-Source: AGRyM1vXsGn12vfkMUd/nlhItE0jQbCOWA3QA8NyU9Jvq5panX3THytQAtgD2SavBstTqvpPwvgg2m82Z4d0Ww2zcVs=
X-Received: by 2002:a05:6830:290a:b0:618:b519:53f5 with SMTP id
 z10-20020a056830290a00b00618b51953f5mr7873224otu.237.1658906837995; Wed, 27
 Jul 2022 00:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064006.218610-1-fontaine.fabrice@gmail.com>
 <20220727092348.3b247fae@windsurf>
In-Reply-To: <20220727092348.3b247fae@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jul 2022 09:27:06 +0200
Message-ID: <CAPi7W81N=-X1-ySrcZF-Bf5bk5JwC+j9=jJiqL4-kUr921Wh7g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/4mj2uSKphlOjqIyqYrYwFXT5haw9ANiLqZWruFPY+s=;
 b=Zzjdnm62X+ZDoNpkfd7qzUrerqRRhfYMw8II3PMrTp7/X7nXh3XUvv3wpSfUFTBzfp
 yawc2zTKrqga1dYYc6B73ZCvUSvA1Bs+xFLpr/p/I5Pfc+ngNXeOVJVKQJQDWFMyGfSc
 j2WyXjSLhZwrNO2pwQqVKOurzcNVlPWWsyUHjkTPkIC/7HHoII2FIKnr9P8sSS16IsT1
 1VPl8we2I6y+rhTzBAgYO+Te2f0w3zDaAKU4mOhoWIgsmMXYPDB+HmSlD5/hWtaMuwDO
 OpLUZmOuaGWWVVoCxmirqsFr88AyHXIYuxIiml+tMl0sQewqmTxnDffAg0Aw7L4YHZDy
 E2hQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Zzjdnm62
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix static
 build
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7791340895642888515=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7791340895642888515==
Content-Type: multipart/alternative; boundary="000000000000cb551005e4c45844"

--000000000000cb551005e4c45844
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mer. 27 juil. 2022 =C3=A0 09:23, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello,
>
> On Wed, 27 Jul 2022 08:40:06 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following static build failure raised since the addition of the
> > package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:
> >
> >
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/=
../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux=
-musl/bin/ld:
> /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-m=
usl/sysroot/usr/lib/libreadline.a(display.o):
> in function `_rl_move_cursor_relative':
> > display.c:(.text+0xbb5): undefined reference to `tputs'
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1=
edc73d
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I am confused, I have already applied
> c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903, which already fixes this
> issue.
>
> Could you double check?
>

My bad, indeed this patch is already applied. I'll set it as not applicable=
.


>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000cb551005e4c45844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 juil. 2022 =C3=A0=C2=
=A009:23, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.c=
om">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Wed, 27 Jul 2022 08:40:06 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following static build failure raised since the addition of th=
e<br>
&gt; package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:<br>
&gt; <br>
&gt; /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-li=
nux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-bu=
ildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_=
rl_move_cursor_relative&#39;:<br>
&gt; display.c:(.text+0xbb5): undefined reference to `tputs&#39;<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/77c10947ddc7=
49c54c7c233e3143f5cdf1edc73d" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
I am confused, I have already applied<br>
c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903, which already fixes this<br>
issue.<br>
<br>
Could you double check?<br></blockquote><div><br></div><div>My bad, indeed =
this patch is already applied. I&#39;ll set it as not applicable.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice<br></div></div></div>

--000000000000cb551005e4c45844--

--===============7791340895642888515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7791340895642888515==--
