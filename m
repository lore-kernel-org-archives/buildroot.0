Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41F4EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 23:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CA8581584;
	Sun, 30 Jul 2023 23:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA8581584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdZpgwPK-Hvu; Sun, 30 Jul 2023 23:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA98A81919;
	Sun, 30 Jul 2023 23:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA98A81919
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1B671BF27A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 23:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D46781919
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 23:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D46781919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cY6z0OUx4SIR for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 23:38:22 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 152C981584
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 23:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152C981584
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-522ab557632so2567261a12.0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 16:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690760300; x=1691365100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O5Dfml5I942PVDscf1XsCYVf+1sCPe3UEM3HfUOqvtc=;
 b=lrk3RtRVySilBat14eYYxQ52/HOutYf4RlJeo2tDZpgdy3wv1hOeYoTi4KzFqnhpWP
 QmoumBxFc442+X9pkdmuLIUMXa4CUvYxQKC9eus0Cik7PjjqxnArOIpbGo2GXr5/i4dC
 yF/hwKht8htEOxS5RW0aKZyycO5ueIjjSB46bwpPWghIzohlWDormpV27x7HAqtXM2UV
 YXONYzHQaY6oOg4OkizuMRWeCGQF6qvlDcHHcnLqZK2lN5LAZgkrhZlW2m0CK8cuqyuN
 PxtQka8rcm/DdZFFOPL0kazUQJSREqS/1vvQNVGUhx5EBcY7IqW/Id/wemwHHqb5Ynet
 n0bQ==
X-Gm-Message-State: ABy/qLbHCqonNvIqA28SiguX9tB3MvrZyI57Jhn0vAo4sQHBOShDJHEa
 STPcfrnCZU3HGlkSU16NMWqSy34m4ObcxIeLjrM97SR5fSg=
X-Google-Smtp-Source: APBJJlE+5g6evl07A+iPAsNh7lFVx4qgpedsS7LFauWyGuLSoE6s4Jtm106Bc0QY/9UnxPowa/tGfcQQAqKz0G5vIlY=
X-Received: by 2002:a05:6402:32e:b0:522:3ef1:b1d with SMTP id
 q14-20020a056402032e00b005223ef10b1dmr6115892edw.6.1690760299692; Sun, 30 Jul
 2023 16:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230730173242.6669-1-vfazio@gmail.com>
 <20230730230151.5a1de6c2@windsurf>
In-Reply-To: <20230730230151.5a1de6c2@windsurf>
From: Vincent Fazio <vfazio@gmail.com>
Date: Sun, 30 Jul 2023 18:38:08 -0500
Message-ID: <CAOrEah4PvQRxS+_865dgvOtGfdUgw0QL-MrjZOxim3eAvA3-xA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690760300; x=1691365100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O5Dfml5I942PVDscf1XsCYVf+1sCPe3UEM3HfUOqvtc=;
 b=k7VcQwKEKRXTspLm1uw6A6WorRn4YJ3P6lyB0JY0JXsG8Zdk7JG8n+9e8yAb0xb/N/
 XlvAuN4ShTHS6Isvk2MrpKHh5iQ2FZBWazDzsrFdYZbw0NwI4ksSJ+0+rBCca4fGsXKd
 O/CNlVO2o6n/xaugjnBJjDwQcH/lcGT4ospWs1kzjD3l+RcnpowIylw9t0ZPpIpFdqzL
 H3gq0e+t3sKtKRcMxlCH5bx1WrpDTS3Seri4Y8IMhiJffmroUTgzmTNsBitc5+0lP3/o
 MaCC0NpWnQwVlST0C+pmeZDfbFJpPHID7H1WlQSWsIKOxCpJNfTbGdS5PFuNZ/sVrPIR
 fqPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k7VcQwKE
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add Intel and AMD
 GCC targets
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
Content-Type: multipart/mixed; boundary="===============8419464668710807092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8419464668710807092==
Content-Type: multipart/alternative; boundary="0000000000001046c70601bccff1"

--0000000000001046c70601bccff1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

Replying with gmail so formatting may be thrown off:

On Sun, Jul 30, 2023 at 4:01=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Vincent,
>
> On Sun, 30 Jul 2023 12:32:42 -0500
> Vincent Fazio <vfazio@gmail.com> wrote:
>
> > Sync the CPU target list with what's available up to GCC 13.
> >
> > Multiple references used for flags and synonyms [0] [1] [2] [3].
> >
> > [0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
> > [1]:
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=3Dgcc/config/i386/i=
386.h;hb=3Drefs/tags/releases/gcc-13.2.0
> > [2]:
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=3Dgcc/common/config=
/i386/i386-common.cc;hb=3Drefs/tags/releases/gcc-13.2.0
> > [3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>
> It generally looks good (even though I definitely didn't check all the
> CPUs and their capabilities, I trust you). However, I have one comment.
>
> > +# BR2_X86_CPU_HAS_AVX512 is used to enable the x86_64-v4 toolchain(s).
>
> I think this wording is not good. BR2_X86_CPU_HAS_AVX512 is not *used*
> to enable the x86-86-v4 toolchain. This option is not there for that.
> This hidden option is here to allow the CPU variants that support
> AVX512 to indicate that they do offer this support. It has nothing to
> with the x86-86-v4 toolchain per-se.
>
>

I'm open to rewording this. I meant this as "this flag is used as a
dependency
to enable the Bootlin -v4 toolchains" because this is currently true and
implies
with it that this flag now reflects a minimum subset of AVX512 extensions.

Note that qt6base.mk acknowledges this flag but does not use it for fear of
interpreting what extensions are implied. Because Bootlin -v4 toolchains us=
e
depends on it, we can currently assume at least the following extensions:
AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL



> > +# Some CPUs have a _subset_ of AVX512, but do not meet the minimum
> requirements
> > +# for x86_64-v4 (AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL).
> > +# Reference: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
>
> I think a better wording is:
>
> # CPU variants should only select this option if they support for the
> # full set of AVX512 instructions: AVX512F, AVX512BW, AVX512CD, AVX512DQ,
> # AVX512VL
>
>
I'm hesitant to use the wording "full set of AVX512 instructions" as the
list
is a subset of what's encompassed in the AVX512 repertoire.


> Please note that if this is not a good choice, we can also revisit how
> the AVX512 support is handled.
>
>
It looks like other tools may similarly group F, BW, CD, DQ, and VL behind =
a
single flag so maybe doing this is ok?
http://ffmpeg.org/pipermail/ffmpeg-devel/2017-November/219472.html

To allow applications to hyper-optimize (qt6) we may want to split these up
as
supported extensions vary by CPU, but for now there seems to be some
agreement
around this common subset that was initially monikered AVX 3.2 by Intel for
their Xeon (not Xeon PHI) series and the x86-64-v4 psABI. Splitting these u=
p
could get messy.

The original discussion for the psABI extensions happened here:
https://sourceware.org/pipermail/libc-alpha/2020-July/116135.html


> >  config BR2_X86_CPU_HAS_AVX512
> >       bool
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000001046c70601bccff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thomas,</div><div><br></div><div>Replying with gmail =
so formatting may be thrown off:<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 30, 2023 at 4:01=E2=80=AFPM=
 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hello Vincent,<br>
<br>
On Sun, 30 Jul 2023 12:32:42 -0500<br>
Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" target=3D"_blank">vfa=
zio@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Sync the CPU target list with what&#39;s available up to GCC 13.<br>
&gt; <br>
&gt; Multiple references used for flags and synonyms [0] [1] [2] [3].<br>
&gt; <br>
&gt; [0]: <a href=3D"https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Opti=
ons.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlinedo=
cs/gcc-13.2.0/gcc/x86-Options.html</a><br>
&gt; [1]: <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=
=3Dgcc/config/i386/i386.h;hb=3Drefs/tags/releases/gcc-13.2.0" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain=
;f=3Dgcc/config/i386/i386.h;hb=3Drefs/tags/releases/gcc-13.2.0</a><br>
&gt; [2]: <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=
=3Dgcc/common/config/i386/i386-common.cc;hb=3Drefs/tags/releases/gcc-13.2.0=
" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git=
;a=3Dblob_plain;f=3Dgcc/common/config/i386/i386-common.cc;hb=3Drefs/tags/re=
leases/gcc-13.2.0</a><br>
&gt; [3]: <a href=3D"https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-51=
2" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/AVX-5=
12#CPUs_with_AVX-512</a><br>
&gt; <br>
&gt; Signed-off-by: Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" t=
arget=3D"_blank">vfazio@gmail.com</a>&gt;<br>
<br>
It generally looks good (even though I definitely didn&#39;t check all the<=
br>
CPUs and their capabilities, I trust you). However, I have one comment.<br>
<br>
&gt; +# BR2_X86_CPU_HAS_AVX512 is used to enable the x86_64-v4 toolchain(s)=
.<br>
<br>
I think this wording is not good. BR2_X86_CPU_HAS_AVX512 is not *used*<br>
to enable the x86-86-v4 toolchain. This option is not there for that.<br>
This hidden option is here to allow the CPU variants that support<br>
AVX512 to indicate that they do offer this support. It has nothing to<br>
with the x86-86-v4 toolchain per-se.<br>
<br></blockquote><div><br></div><div><br></div><div>I&#39;m open to rewordi=
ng this. I meant this as &quot;this flag is used as a dependency<br>to enab=
le the Bootlin -v4 toolchains&quot; because this is currently true and impl=
ies<br>with it that this flag now reflects a minimum subset of AVX512 exten=
sions.<br><br>Note that <a href=3D"http://qt6base.mk">qt6base.mk</a> acknow=
ledges this flag but does not use it for fear of<br>interpreting what exten=
sions are implied. Because Bootlin -v4 toolchains use<br>depends on it, we =
can currently assume at least the following extensions:<br>AVX512F, AVX512B=
W, AVX512CD, AVX512DQ, AVX512VL<br><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; +# Some CPUs have a _subset_ of AVX512, but do not meet the minimum re=
quirements<br>
&gt; +# for x86_64-v4 (AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL).<br=
>
&gt; +# Reference: <a href=3D"https://en.wikipedia.org/wiki/AVX-512#CPUs_wi=
th_AVX-512" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/w=
iki/AVX-512#CPUs_with_AVX-512</a><br>
<br>
I think a better wording is:<br>
<br>
# CPU variants should only select this option if they support for the<br>
# full set of AVX512 instructions: AVX512F, AVX512BW, AVX512CD, AVX512DQ,<b=
r>
# AVX512VL<br>
<br></blockquote><div><br></div><div>I&#39;m hesitant to use the wording &q=
uot;full set of AVX512 instructions&quot; as the list<br>is a subset of wha=
t&#39;s encompassed in the AVX512 repertoire.<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Please note that if this is not a good choice, we can also revisit how<br>
the AVX512 support is handled.<br>
<br></blockquote><div><br></div><div>
<div>It looks like other tools may similarly group F, BW, CD, DQ, and VL be=
hind a<br>single flag so maybe doing this is ok?</div><div><a href=3D"http:=
//ffmpeg.org/pipermail/ffmpeg-devel/2017-November/219472.html">http://ffmpe=
g.org/pipermail/ffmpeg-devel/2017-November/219472.html</a><br><br>To allow =
applications to hyper-optimize (qt6) we may want to split these up as<br>su=
pported extensions vary by CPU, but for now there seems to be some agreemen=
t<br>around this common subset that was initially monikered AVX 3.2 by Inte=
l for<br>their Xeon (not Xeon PHI) series and the x86-64-v4 psABI. Splittin=
g these up</div><div>could get messy.</div><div><br></div><div>The original=
 discussion for the psABI extensions happened here:<br><a href=3D"https://s=
ourceware.org/pipermail/libc-alpha/2020-July/116135.html">https://sourcewar=
e.org/pipermail/libc-alpha/2020-July/116135.html</a></div>

</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 config BR2_X86_CPU_HAS_AVX512<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
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

--0000000000001046c70601bccff1--

--===============8419464668710807092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8419464668710807092==--
