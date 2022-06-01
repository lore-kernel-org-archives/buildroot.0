Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09984C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B58BC409B0;
	Wed,  1 Jun 2022 19:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJ0tzA9WoMbP; Wed,  1 Jun 2022 19:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 935484098F;
	Wed,  1 Jun 2022 19:18:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7399F1BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 701E960C1A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NtsZW-ASAFH for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68280605A1
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:18:03 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id l204so4592395ybf.10
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Ur5BKeefvCiIRY4GFhnJTQJq9ZFYugNaiN2N/roL7A=;
 b=W2v2JgQEOe6UJRoRDcmOZ3Pua1CnySXUyJjxCjIOKXijGj0IPTNp7jN6Uxkfk2bUso
 QjgyCmWkZiWixw8CY246r20jVrlFnEpd7VugJ36Py/lQ4o/BAEXfr3WB6fDzmvYjlLMM
 SUqVm4+snlhHMjyDi3yqAqJLuV1OLBsJQQLSqWEeGTy2aJ+cMraeFA8izrzh177IAzQm
 NM2l0yIIclSLa0C5gsvENqq/SsKys24NoP7FlZ2QrJQIo+B8PokpATBtInJzr1CJQ3In
 MkDYwNN4eFjKPH+ow6CsGGrT523JxnN+vCklm9XcJaMXDSC7GZ/t6bbDWNcSr+ocOAJL
 +i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Ur5BKeefvCiIRY4GFhnJTQJq9ZFYugNaiN2N/roL7A=;
 b=riU5iLnDJ2RNCQPL3FN/s7GR55BxyVbdLQY+eoI82sHjAfvctDwvq4e/R5bHuOQZEl
 7Cf2hWec72u/hISsCs9gw8/gCW4n7PoWGcqLPv1PYVDDJcKInw8qjxUTn8rpPstMNw8/
 cENEVAfHB469+0eoP7kPjv2PSwPvt5S0GO56bsQ7G1RN3fkpks426o2AZiXTIKAK4AhC
 STtTkJaG8ayHH/46etzu/GQMv4xkedGJxvRldi+BAW4w8keZc0qkNs6nsdMXPJXwi6zE
 kMRu9dwtcmw25n6U1r1p/CfZbfbEkxqyE/LG2RdS+N5tYr3L10o/QkLiXsjihKPTzE+B
 8bkw==
X-Gm-Message-State: AOAM532H6r7P1hMpWOezyVUkoFRx6MlSbGgJdilsdL1WxKhF7wBiTQdR
 SYjyC9hpD5mcg5YwCdKeeVz6H84Tj4URAwAf3E0=
X-Google-Smtp-Source: ABdhPJyJP4Yu6PLgk9R+7+Qx5zdJEmGjOXvqJdohckfofrx35peMiqTKkr104VyFVi2n3VdIt/043mitLQx0kZuSE2E=
X-Received: by 2002:a25:5645:0:b0:660:225b:7c67 with SMTP id
 k66-20020a255645000000b00660225b7c67mr1364386ybb.247.1654111082291; Wed, 01
 Jun 2022 12:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR02MB6914D9F3E09E2720D4DEDC41C9DF9@BY5PR02MB6914.namprd02.prod.outlook.com>
 <20220601142611.4de82268@windsurf>
In-Reply-To: <20220601142611.4de82268@windsurf>
Date: Wed, 1 Jun 2022 20:17:51 +0100
Message-ID: <CACOFwan228kYeS8xrECeKMEJJ0Era_=yoQx+6A-U2jDKH8_zQg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Error msg while using toolchain compiler
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
From: Richard Ash via buildroot <buildroot@buildroot.org>
Reply-To: Richard Ash <richardashaudacity@googlemail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Reinoud Koornstra <sockstat@hotmail.com>
Content-Type: multipart/mixed; boundary="===============4780887862336362266=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4780887862336362266==
Content-Type: multipart/alternative; boundary="0000000000007aa57105e067bff2"

--0000000000007aa57105e067bff2
Content-Type: text/plain; charset="UTF-8"

I would think that the machine on which the error occurs is running a
different Linux distribution / version, and has Glibc 2.13 or older, where
as the building machine has Glibc 2.14 or newer.

As I understand it this error is an error trying to load the shared
libraries needed to execute the x86_64-buildroot-linux-gnu-gcc binary - the
fact that the binary is a compiler has not yet become important, because
it's not possible to load the dynamically linked executable. To confirm
this the OP could run `ldd` on the x86_64-buildroot-linux-gnu-gcc executable
and get a similar "not found" error for the same symbol.
The contents of
x86_64-buildroot-linux-gnu_sdk-buildroot/x86_64-buildroot-linux-gnu/sysroot/lib
is not used at all for this - that is the target sysroot, i.e. the library
set which will be used when the output of this compiler is run on the
target - no help at all to the host, and may be completely incompatible
(e.g. ARM target libraries). The fact that target and host are (maybe?) the
same in this instance is not exploited, they are still treated as separate.

The error is not unexpected - the cross-compiling toolchain is compiled to
run on the system which builds it (host), and makes no special efforts to
be (binary) portable between host environments. relocate-sdk.sh deals with
paths etc. but cannot change the binary linkage. I'm fairly certain that
copying any other binary compiled on the first machine and then copying it
to a second would give the same error, for the same reason.

Richard

On Wed, 1 Jun 2022 at 13:26, Thomas Petazzoni via buildroot <
buildroot@buildroot.org> wrote:

> Hello Reinoud,
>
> On Wed, 1 Jun 2022 02:09:21 +0000
> Reinoud Koornstra <sockstat@hotmail.com> wrote:
>
> > Hello Everyone,
> > I did configure a toolchain to be built (make sdk) and copied and
> extracted the tar ball to another machine.
> > On there I did run relocate-sdk.sh
> >
> > As this toolchain is another one compared to the default gcc installed
> on that machine I specific it by CC= and then make bla bla
> > The error is get is:
> > x86_64-buildroot-linux-gnu-gcc: /lib64/libc.so.6: version `GLIBC_2.14'
> not found (required by x86_64-buildroot-linux-gnu-gcc)
>
> Could you provide more details on how you're using the toolchain?
> Indeed, if incorrect flags are passed to the toolchain, it may cause it
> to look for libraries in /lib.
>
> But if you don't provide more details, we unfortunately can't really
> comment :-/
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000007aa57105e067bff2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would think that the machine on which the error occ=
urs is running a different Linux distribution / version, and has Glibc 2.13=
 or older, where as the building machine has Glibc 2.14 or newer.<br></div>=
<div><br></div><div>As I understand it this error is an error trying to loa=
d the shared libraries needed to execute the <span class=3D"gmail-im">x86_6=
4-buildroot-linux-gnu-gcc binary - the fact that the binary is a compiler h=
as not yet become important, because it&#39;s not possible to load the dyna=
mically linked executable. To confirm this the OP could run `ldd` on the <s=
pan class=3D"gmail-im">x86_64-buildroot-linux-gnu-gcc </span>executable and=
 get a similar &quot;not found&quot; error for the same symbol.</span></div=
><div><span class=3D"gmail-im"><span class=3D"gmail-im">The contents of x86=
_64-buildroot-linux-gnu_sdk-buildroot/x86_64-</span><span class=3D"gmail-im=
">buildroot-linux-gnu/sysroot/lib
 is not used at all for this - that is the target sysroot, i.e. the=20
library set which will be used when the output of this compiler is run=20
on the target - no help at all to the host, and may be completely=20
incompatible (e.g. ARM target libraries). The fact that target and host are=
 (maybe?) the same in this instance is not exploited, they are still treate=
d as separate.<br></span></span></div><div><span class=3D"gmail-im"><br></s=
pan></div><div><span class=3D"gmail-im">The error is not unexpected - the c=
ross-compiling toolchain is compiled to run on the system which builds it (=
host), and makes no special efforts to be (binary) portable between host en=
vironments. relocate-sdk.sh deals with paths etc. but cannot change the bin=
ary linkage. </span><span class=3D"gmail-im">I&#39;m fairly certain that co=
pying any other binary compiled on the first machine and then copying it to=
 a second would give the same error, for the same reason.<br></span></div><=
div><span class=3D"gmail-im"></span><br></div><div>Richard</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 J=
un 2022 at 13:26, Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buil=
droot@buildroot.org">buildroot@buildroot.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello Reinoud,<br>
<br>
On Wed, 1 Jun 2022 02:09:21 +0000<br>
Reinoud Koornstra &lt;<a href=3D"mailto:sockstat@hotmail.com" target=3D"_bl=
ank">sockstat@hotmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello Everyone,<br>
&gt; I did configure a toolchain to be built (make sdk) and copied and extr=
acted the tar ball to another machine.<br>
&gt; On there I did run relocate-sdk.sh<br>
&gt; <br>
&gt; As this toolchain is another one compared to the default gcc installed=
 on that machine I specific it by CC=3D and then make bla bla<br>
&gt; The error is get is:<br>
&gt; x86_64-buildroot-linux-gnu-gcc: /lib64/libc.so.6: version `GLIBC_2.14&=
#39; not found (required by x86_64-buildroot-linux-gnu-gcc)<br>
<br>
Could you provide more details on how you&#39;re using the toolchain?<br>
Indeed, if incorrect flags are passed to the toolchain, it may cause it<br>
to look for libraries in /lib.<br>
<br>
But if you don&#39;t provide more details, we unfortunately can&#39;t reall=
y<br>
comment :-/<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000007aa57105e067bff2--

--===============4780887862336362266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4780887862336362266==--
