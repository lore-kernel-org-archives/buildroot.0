Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8DC0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1BC81A73;
	Sat, 22 Jul 2023 22:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1BC81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6ZqdPMzjvBK; Sat, 22 Jul 2023 22:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FBA81ABA;
	Sat, 22 Jul 2023 22:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94FBA81ABA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA68D1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8340081ABA
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 22:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8340081ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5ajy080mC6g for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 22:01:23 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6240D81A73
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 22:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6240D81A73
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-991f956fb5aso459297766b.0
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 15:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690063281; x=1690668081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4HzUr/k4kle77rnqHDop5SoEg1eKk5bSS6JLCFMMEM=;
 b=A5CGpUDXlkblv7GWwJnURs0m1bjUeYC52hZwEaqmCkI+/wb/ZiLY5oNXk5RN+h+bDF
 Q5PETqQfybRHyShZcFDKFnZh3HpxICfL1R6DmsMOP8YR/qezCX4opkcgO+50b1Py7NCd
 XExUaChSDNOWsjnKEUHUQP/falaMzeqjJ2++LIUtLeWiSLP4JySc9/mwOLGQsrITxZkm
 wPqE9VY/PEVvUiCIcYBJaCOxqdeo9W39yxEgOAIVQTaFtnS/ZrT04hiyMDC01FO7gYtN
 ZpCRKGeZPuBtNxQHADqFpbRaEwmq5cnTQN4GfbW0prHBrSW2FFJU90WzfrSI+KMIundN
 Chnw==
X-Gm-Message-State: ABy/qLa/6l6wMg9gr6lGfdKhlMkkraXAE5uiCA1X+9181k2VQtWFXbi3
 +70Tt/MptuoHSIGQ4RTagY2s+F8vrc0TCS8Hpf8=
X-Google-Smtp-Source: APBJJlHLZcJFUdF1ufF13CNQ1Ew3dKbQxErR9xXzaBVl1PJx+JsTELbMDAqYT+tY1kXvQ5XQVt3QPA==
X-Received: by 2002:a17:906:10db:b0:970:71c:df58 with SMTP id
 v27-20020a17090610db00b00970071cdf58mr5549024ejv.42.1690063280951; 
 Sat, 22 Jul 2023 15:01:20 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 kg13-20020a17090776ed00b009929ab17be0sm4045310ejc.162.2023.07.22.15.01.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jul 2023 15:01:20 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51e6113437cso4261668a12.2
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 15:01:20 -0700 (PDT)
X-Received: by 2002:aa7:dcd0:0:b0:516:9fef:f8e7 with SMTP id
 w16-20020aa7dcd0000000b005169feff8e7mr5095350edu.3.1690063279531; Sat, 22 Jul
 2023 15:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-4-christian@aperture.us>
 <20230722231336.760d74ea@windsurf>
In-Reply-To: <20230722231336.760d74ea@windsurf>
Date: Sat, 22 Jul 2023 15:01:05 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
Message-ID: <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690063281; x=1690668081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u4HzUr/k4kle77rnqHDop5SoEg1eKk5bSS6JLCFMMEM=;
 b=YAgUBulCyqj/MxzLlpXb2LIMyNUIX6UZNdY2WSeANfuq4VA7uqFwzH5PUCS4WBRsgO
 x+2vNlCVA5aaWvgbvIe45z4xAk8C7lR3jCTtggRJOQZ5xo4ea0sK5tXAqxGv9htT/9OI
 mVUsZgnhMnYVPsY8MkdCe8WBedIPohZjsbjoOQ8VqyVQiRbbMdtNPwXrQSUxDBjPxX0K
 poyRlRNrRWxNP7udDpNtgLw9PHFJARpsfdhz5U4XY2RJ9j7fcnAclXd7vPtrX4/eBCS2
 8y4zn6MMWu9YlbzOICw3VCpPglWzVBvFCNHzm+ItDbYbZTgvs3dXC3I/6pVG74EDkiOQ
 xZFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=YAgUBulC
Subject: Re: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
 go-bootstrap unsupported
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============9045716889301657986=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9045716889301657986==
Content-Type: multipart/alternative; boundary="0000000000006caddc06011a85a0"

--0000000000006caddc06011a85a0
Content-Type: text/plain; charset="UTF-8"

Thomas,



On Sat, Jul 22, 2023, 2:13 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Christian,
>
> On Tue, 11 Jul 2023 15:08:49 -0700
> Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
>
> > All Go compiler versions > 1.4.x (old) are written in Go, and require a
> existing
> > compiled Go version to use to build from source.
> >
> > https://golang.org/doc/install/source#bootstrapFromSource
> >
> > The process for "bootstrapping" the Go compiler in Buildroot is:
> >
> > 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.
> > 2. Build go-bootstrap-stage1 (which is Go 1.4.x and written in C)
> > 3. Build go-bootstrap-stage2 (which is Go 1.19.x and written in Go)
> > 3. Build go 1.20 (written in Go) using go-bootstrap-stage2.
> >
> > go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstrap
> compiler
> > is compatible with x86, x86_64, and arm (32 bit) only.
> >
> > This patch adds a fallback to require a host Go compiler to build
> host-go when
> > BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS is not set.
> >
> > Signed-off-by: Christian Stewart <christian@aperture.us>
>
> I understand the need, but I'd like to explore other options, namely
> using pre-compiled Go compilers, which we would also like to support in
> order to have the ability to run "make legal-info", or build Go
> packages without necessarily having to build a Go compiler from
> scratch. Like what we do for Rust, where you can chose to either use a
> pre-built Rust compiler, or build your own with Buildroot.
>

The main difference is the Go compiler takes only a minute or so of build
time. Bootstrapping it is fast and produces reproducible results across any
of the architectures Buildroot supports, including those for which there
currently are not any binary Go releases.

Therefore I submit that it is always worth the extra build time to
bootstrap the Go compiler from source as part of the build as opposed to
using a precompiled binary. Also it is less maintenance overhead (updating
hashes for all the platforms) and as the one maintaining this process I
appreciate that.

Today we download an external toolchain but still depend on a gcc package
to be installed on the host as well. Depending on the host Go to be
installed or otherwise provided for the bootstrap process is a decent
approach for architectures that we can't bootstrap with the C compiler
alone.

I can see a way we could add an option to do the binary downloads but would
prefer to keep the logic to depend on the host compiler as a fallback to
use for bootstrapping as well.

This is fine for legal-info as the bootstrap process builds the compiler
with itself several times to ensure that only the version built from source
is used.

What do you think?

Thanks,
Christian


> For Go, I think we could imagine two options:
>
> (a) You use a pre-built Go compiler as a replacement for package/go.
>     This would work for architectures/configurations for which
>     pre-built Go compilers are available. We would then move package/go
>     as a virtual package, with package/go-src being the provider that
>     builds the Go compiler from source, and package/go-bin being the
>     provider that downloads/installs a pre-built Go compiler.
>
> (b) You use a pre-built Go compiler as a replacement for
>     package/go-bootstrap-stage2, i.e you still build the final Go
>     compiler from source, but all the bootstrapping is skipped by using
>     a pre-built Go compiler for the host. Would this option also
>     resolve your use-case of building on ARM64? In other words, is
>     there a Go compiler available pre-built for ARM64?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000006caddc06011a85a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thomas,<div dir=3D"auto"><br></div><br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 22, 202=
3, 2:13 PM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.=
com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello Christian,<br>
<br>
On Tue, 11 Jul 2023 15:08:49 -0700<br>
Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wr=
ote:<br>
<br>
&gt; All Go compiler versions &gt; 1.4.x (old) are written in Go, and requi=
re a existing<br>
&gt; compiled Go version to use to build from source.<br>
&gt; <br>
&gt; <a href=3D"https://golang.org/doc/install/source#bootstrapFromSource" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://golang.org/doc/inst=
all/source#bootstrapFromSource</a><br>
&gt; <br>
&gt; The process for &quot;bootstrapping&quot; the Go compiler in Buildroot=
 is:<br>
&gt; <br>
&gt; 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.<br>
&gt; 2. Build go-bootstrap-stage1 (which is Go 1.4.x and written in C)<br>
&gt; 3. Build go-bootstrap-stage2 (which is Go 1.19.x and written in Go)<br=
>
&gt; 3. Build go 1.20 (written in Go) using go-bootstrap-stage2.<br>
&gt; <br>
&gt; go-bootstrap-stage1 does not work on 64-bit arm. The Go 1.4.x bootstra=
p compiler<br>
&gt; is compatible with x86, x86_64, and arm (32 bit) only.<br>
&gt; <br>
&gt; This patch adds a fallback to require a host Go compiler to build host=
-go when<br>
&gt; BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS is not set.<br>
&gt; <br>
&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@apert=
ure.us" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt;<=
br>
<br>
I understand the need, but I&#39;d like to explore other options, namely<br=
>
using pre-compiled Go compilers, which we would also like to support in<br>
order to have the ability to run &quot;make legal-info&quot;, or build Go<b=
r>
packages without necessarily having to build a Go compiler from<br>
scratch. Like what we do for Rust, where you can chose to either use a<br>
pre-built Rust compiler, or build your own with Buildroot.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The main differen=
ce is the Go compiler takes only a minute or so of build time. Bootstrappin=
g it is fast and produces reproducible results across any of the architectu=
res Buildroot supports, including those for which there currently are not a=
ny binary Go releases.</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
herefore I submit that it is always worth the extra build time to bootstrap=
 the Go compiler from source as part of the build as opposed to using a pre=
compiled binary. Also it is less maintenance overhead (updating hashes for =
all the platforms) and as the one maintaining this process I appreciate tha=
t.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Today we download an =
external toolchain but still depend on a gcc package to be installed on the=
 host as well. Depending on the host Go to be installed or otherwise provid=
ed for the bootstrap process is a decent approach for architectures that we=
 can&#39;t bootstrap with the C compiler alone.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I can see a way we could add an option to do the bi=
nary downloads but would prefer to keep the logic to depend on the host com=
piler as a fallback to use for bootstrapping as well.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">This is fine for legal-info as the bootstrap =
process builds the compiler with itself several times to ensure that only t=
he version built from source is used.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">What do you think?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto">Christian</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
For Go, I think we could imagine two options:<br>
<br>
(a) You use a pre-built Go compiler as a replacement for package/go.<br>
=C2=A0 =C2=A0 This would work for architectures/configurations for which<br=
>
=C2=A0 =C2=A0 pre-built Go compilers are available. We would then move pack=
age/go<br>
=C2=A0 =C2=A0 as a virtual package, with package/go-src being the provider =
that<br>
=C2=A0 =C2=A0 builds the Go compiler from source, and package/go-bin being =
the<br>
=C2=A0 =C2=A0 provider that downloads/installs a pre-built Go compiler.<br>
<br>
(b) You use a pre-built Go compiler as a replacement for<br>
=C2=A0 =C2=A0 package/go-bootstrap-stage2, i.e you still build the final Go=
<br>
=C2=A0 =C2=A0 compiler from source, but all the bootstrapping is skipped by=
 using<br>
=C2=A0 =C2=A0 a pre-built Go compiler for the host. Would this option also<=
br>
=C2=A0 =C2=A0 resolve your use-case of building on ARM64? In other words, i=
s<br>
=C2=A0 =C2=A0 there a Go compiler available pre-built for ARM64?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--0000000000006caddc06011a85a0--

--===============9045716889301657986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9045716889301657986==--
