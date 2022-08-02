Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F40C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92A4817F2;
	Tue,  2 Aug 2022 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92A4817F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuHFKh96E9cx; Tue,  2 Aug 2022 20:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C938A817D3;
	Tue,  2 Aug 2022 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C938A817D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA4921BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5134817D3
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5134817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA4J792egdhP for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5738E817B5
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5738E817B5
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:27:35 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 123so25338587ybv.7
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQMN09IHmuF9vyEcx5kaQV0QJSuj0KVKlekSCtv0nOs=;
 b=DqMRg06/EgXYzdrbmseQKt9SmQV78qk8ZLuH6UWkW3/N3R4fHqLhx29CD5AQ8Pb91j
 TqOQfrtzY/KDZaFZi25aWHIj1kmPJfsYMrc5Rn1wEAoIyDIgrC4U09au61TKzNnYxuvW
 gyxl6cKYvDtuWwHDH6lU+v4EH6MwBpfBnqNZntrGMvs9ZoZhCky3hDsQ9V0qprkpCMxg
 V1QkCEt54MQ5iKYOWrp4J4s160er1r+pJvxjf9y5PRnfZ72mVVT3w6GuFeefrSRdZGm1
 7KZGIi+i8Rv6pvLn2t2HR6TJoeVVAKTmtfUvxRYaB7mwyipZPCng6rEP/74lGM9xdSHL
 ED6Q==
X-Gm-Message-State: ACgBeo2SFBugT4H1+PCNVe1VBvvEk6rC7hQXzpBWGJ7E0dMVGJUrDhyq
 jytGe6mJ3NHIXeNSEaJPVqQyjKuH4jT3/4CQkBRYUiWp
X-Google-Smtp-Source: AA6agR6CEwTHH2fcC6YOtiDPAfguIVLIGzqiyKCY81b5bZHhKUofc8yO4hV6NMoV52i6BH0TvnKe7BcalEEo0BEJPuU=
X-Received: by 2002:a25:b90b:0:b0:664:a584:faf5 with SMTP id
 x11-20020a25b90b000000b00664a584faf5mr16321191ybj.144.1659472054038; Tue, 02
 Aug 2022 13:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220723215448.2532160-1-abel@x-silicon.com>
 <20220802000918.00ea20f2@windsurf>
In-Reply-To: <20220802000918.00ea20f2@windsurf>
From: Abel Bernabeu <abel@x-silicon.com>
Date: Tue, 2 Aug 2022 22:27:22 +0200
Message-ID: <CAF2ART_ZWKpm+MWg8SVUaQtzardXTNG4mkg_=XUz+b8JGLn-qg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YQMN09IHmuF9vyEcx5kaQV0QJSuj0KVKlekSCtv0nOs=;
 b=DUE2LwPluwuIE3va+qyq/EK8tOKWpG1sMR8bPSrChdITlRdvmN7QO6FO4HeHSGr9Ac
 /OCe0u8rBErY+qSPQMIEmeJADZjTrgw3efA2okNGF5Pg48+nv+ErlEIzOc9yerWXmfpl
 ViOLqEg72bPQX4+JAg3qSljSrh9mybcjq6GB8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=x-silicon.com header.i=@x-silicon.com
 header.a=rsa-sha256 header.s=google header.b=DUE2LwPl
Subject: Re: [Buildroot] [PATCH 1/2] package/llvm: Support for RISC-V on the
 LLVM package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 Mark Corbin <mark@dibsco.co.uk>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2404290761688638399=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2404290761688638399==
Content-Type: multipart/alternative; boundary="0000000000004bcab305e547f2e2"

--0000000000004bcab305e547f2e2
Content-Type: text/plain; charset="UTF-8"

Thanks Thomas!

On Tue, Aug 2, 2022 at 12:09 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sat, 23 Jul 2022 23:54:47 +0200
> Abel Bernabeu <abel@x-silicon.com> wrote:
>
> > The initial support for the LLVM package did not include RISC-V, and
> > needed to be added.
> >
> > There is a new configuration parameter added
> > (BR2_PACKAGE_LLVM_TARGETS_TO_BUILD) for dealing with the fact that
> > the LLVM target and the architecture have different naming for RISC-V.
> > While the target for RISC-V is "RISCV" irrespective of the ISA being
> > 32 or 64 bits, the architecture does contain the number of bits
> > leading to "riscv32" and "riscv64".
> >
> > For previously supported architectures the naming for target and
> > architecture matched and thus this parameter had not been needed, but
> > it is now needed for RISC-V.
> >
> > Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
> > ---
> >  package/llvm/Config.in | 10 ++++++++++
> >  package/llvm/llvm.mk   |  2 +-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
>
> I have simplified the RISCV quirk by moving it to the llvm.mk file:
>
> # Build backend for target architecture. This include backends like
> # AMDGPU. We need to special case RISCV.
> ifneq ($(filter riscv%,$(LLVM_TARGET_ARCH)),)
> LLVM_TARGETS_TO_BUILD = RISCV
> else
> LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
> endif
>
> Applied with this change, thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000004bcab305e547f2e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Thomas!</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Aug 2, 2022 at 12:09 AM Thomas Petaz=
zoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@b=
ootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, 23 Jul 2022 23:54:47 +0200<br>
Abel Bernabeu &lt;<a href=3D"mailto:abel@x-silicon.com" target=3D"_blank">a=
bel@x-silicon.com</a>&gt; wrote:<br>
<br>
&gt; The initial support for the LLVM package did not include RISC-V, and<b=
r>
&gt; needed to be added.<br>
&gt; <br>
&gt; There is a new configuration parameter added<br>
&gt; (BR2_PACKAGE_LLVM_TARGETS_TO_BUILD) for dealing with the fact that<br>
&gt; the LLVM target and the architecture have different naming for RISC-V.=
<br>
&gt; While the target for RISC-V is &quot;RISCV&quot; irrespective of the I=
SA being<br>
&gt; 32 or 64 bits, the architecture does contain the number of bits<br>
&gt; leading to &quot;riscv32&quot; and &quot;riscv64&quot;.<br>
&gt; <br>
&gt; For previously supported architectures the naming for target and<br>
&gt; architecture matched and thus this parameter had not been needed, but<=
br>
&gt; it is now needed for RISC-V.<br>
&gt; <br>
&gt; Signed-off-by: Abel Bernabeu &lt;<a href=3D"mailto:abel@x-silicon.com"=
 target=3D"_blank">abel@x-silicon.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/llvm/Config.in | 10 ++++++++++<br>
&gt;=C2=A0 package/llvm/<a href=3D"http://llvm.mk" rel=3D"noreferrer" targe=
t=3D"_blank">llvm.mk</a>=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)<br>
<br>
I have simplified the RISCV quirk by moving it to the <a href=3D"http://llv=
m.mk" rel=3D"noreferrer" target=3D"_blank">llvm.mk</a> file:<br>
<br>
# Build backend for target architecture. This include backends like<br>
# AMDGPU. We need to special case RISCV.<br>
ifneq ($(filter riscv%,$(LLVM_TARGET_ARCH)),)<br>
LLVM_TARGETS_TO_BUILD =3D RISCV<br>
else<br>
LLVM_TARGETS_TO_BUILD =3D $(LLVM_TARGET_ARCH)<br>
endif<br>
<br>
Applied with this change, thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000004bcab305e547f2e2--

--===============2404290761688638399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2404290761688638399==--
