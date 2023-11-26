Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC2FC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 20:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 385B240346;
	Sun, 26 Nov 2023 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 385B240346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prfROcnFJyAJ; Sun, 26 Nov 2023 20:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3868440347;
	Sun, 26 Nov 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3868440347
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBF141BF42D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D20DA40347
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D20DA40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UwOSO6MCdfx for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 20:28:58 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CE3840346
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 20:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE3840346
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50baa7cdf6dso1592800e87.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 12:28:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701030536; x=1701635336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GaPIn5wq0AVTttuYuXaqhf8Akz+xnf+P6FmjWecsbzM=;
 b=mgMwpT012UdopKH9qg1P4lAUpEc0PpQD6c0Z1On1vitlNET0fD237NCl9BRG1UFZxc
 IHyfOpptb+NPMpubLU/B4eAtk80+w9ug4kMB0XFfun86MoGAtrGuwasPzivLFiHjaadn
 gTnopPvh6zyn3FFfoygqi+jevZFKLjmp843y2DduJJZgowcYLSsGNez4+2kYnNrTf5i6
 UZuwDANmUHdRldaf3lTC6jUxXPc0pKRZBQ0dK6Pe6Mgcv5gxsPwTzURleEGscjSp0Ny0
 O5KBkmDKCFBQQyfCKCuM9d3yTypndYCB5fj5ofyjel9YowC1wCnLP3KfNHKHLD70Mxzd
 cggQ==
X-Gm-Message-State: AOJu0YyFo5pOBGih7FFwKbcqlV6lkfnESRP1mglXrXgFACVvrl5Yog3T
 aXuvA5dHKqGXYPQX3l5p8X9oNkn3BdTJ8v75j2Q=
X-Google-Smtp-Source: AGHT+IGcLadZIGoPQ6zdvJYxcgHVc2o5YajgmzOrFdQhXKhcmMxiqn13ll4Gwae6e62CKn1FKJFAI9WmH+PSkCGc5zc=
X-Received: by 2002:a05:6512:68:b0:50b:ad95:7a44 with SMTP id
 i8-20020a056512006800b0050bad957a44mr1576836lfo.46.1701030535925; Sun, 26 Nov
 2023 12:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20211030083753.192-1-irgstg@gmail.com>
 <20211031185236.25e4b639@windsurf>
In-Reply-To: <20211031185236.25e4b639@windsurf>
From: R <irgstg@gmail.com>
Date: Sun, 26 Nov 2023 22:28:42 +0200
Message-ID: <CAGKnWQeMCt+8FZ0pPNc=F8LPhGnkt+WVL4MTujqQSUyDHTb5Tg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701030536; x=1701635336; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GaPIn5wq0AVTttuYuXaqhf8Akz+xnf+P6FmjWecsbzM=;
 b=MJJ0+0t5ezWmj19xnrFCmYRG13mglXkZd/KIn+9qt7gsv8jirE8jc4+SpTC++C6peY
 pTFCk7d9af8i0LpS6iwAadwj804cayd0AowMRH5PF0FGsMD4+r3IOAsVEGVcIEMy8M1f
 8nqJqP3T3dutS3SgPgLXuk+iePekDn0JvsbsCOX6Bo3YtwrHxv1LnkfkreNU2PJSvO0q
 alHG/A2hwF1FMsnlsvrhvGNZDPjfzqYGWxRbIF9s/05ILEu45TVmL0PLnk4GpkwcQIAW
 kBrMC6AgN2uJofK/UP8ZjC73YHKLnYZ08c1RKgEq7mrDCkasCWwOlAbr3cRNZxgcewA9
 ua2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MJJ0+0t5
Subject: Re: [Buildroot] [PATCH] package/glibc: optional MTE support in glibc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8533567019436092037=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8533567019436092037==
Content-Type: multipart/alternative; boundary="000000000000d89336060b140898"

--000000000000d89336060b140898
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
It has been a while... and I'm really sorry for that.
But I do think this can be useful - I took a look at the code a-bit
and haven't seen it supports compiling glibc with MTE.
May I continue to resolve your comments?
should it be in this thread or a new one is preferred?

Thanks :)

On Sun, Oct 31, 2021 at 7:52=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Thanks a lot for your contribution! See below some comments.
>
> On Sat, 30 Oct 2021 11:37:50 +0300
> "irgstg@gmail.com" <irgstg@gmail.com> wrote:
>
> > Adding option BR2_PACKAGE_GLIBC_MTE to configure glibc with MTE support=
.
> > When enabled, glibcs configuration process runs with
> `--enable-memory-tagging` [1].
> >
> > MTE (Memory Tagging Extension) is an ISA extension which aims to improv=
e
> security on ARMv8.5-A [2].
> > The linux kernel supports this feature via CONFIG_ARM64_MTE.
> > In order for glibc's MTE support to work properly, the running kernel
> has to support that.
>
> Could you wrap the lines of your commit log to 72 columns?
>
> > dependencies:
> >  - supported on aarch64 only (BR2_aarch64)
> >  - requires binutils version 2.33.1 or newer
> (!B2_BINUTILS_VERSION_2_32_X)
> >  - requires at least linux 5.4 headers
> (BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4)
> >
> > [1]
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3DINSTALL;h=3D02dcf6=
b1ca3a4c43a17fdcae5e7dae8189c1c50b;hb=3DHEAD#l145
> > [2]
> https://community.arm.com/developer/ip-products/processors/b/processors-i=
p-blog/posts/enhancing-memory-safety
> >
> > Signed-off-by: irgstg@gmail.com <irgstg@gmail.com>
>
> Could you resend with a real name ? We cannot accept anonymous
> contributions.
>
> > +config BR2_PACKAGE_GLIBC_MTE
> > +     bool "Install glibc support for MTE"
>
> Repeating that it's glibc related is not necessary, and making "MTE"
> explicit seems useful. So perhaps:
>
>         bool "enable Memory Tagging Extension (MTE) support"
>
> > +     depends on BR2_aarch64
> > +     depends on !BR2_BINUTILS_VERSION_2_32_X
> > +     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> > +     help
> > +       Enabling this option will configure, compile
> > +       and install glibc support for MTE (Memory Tagging Extension).
> > +       Please be aware, in order for that to work properly,
> > +       kernel support for MTE (CONFIG_ARM64_MTE), and a
> > +       supported CPU are needed.
>
> Instead of just saying so, you could do this in glibc.mk:
>
> ifeq ($(BR2_PACKAGE_GLIBC_MTE),y)
> GLIBC_CONF_OPTS +=3D --enable-memory-tagging
> define GLIBC_LINUX_CONFIG_FIXUPS
>         $(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_MTE)
> endef
> endif
>
> Of course, you need to add $(GLIBC_CONF_OPTS) inside
> GLIBC_CONFIGURE_CMDS.
>
> Other than that, it looks good to me.
>
> Do we need special compiler options to make use of MTE ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000d89336060b140898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div>It has been a while... and I&#39;=
m really sorry for that.</div><div>But I do think this can be useful - I to=
ok a look at the code a-bit</div><div>and haven&#39;t seen it supports comp=
iling glibc with MTE.</div><div>May I continue to resolve your comments?<br=
></div><div>should it be in this thread or a new one is preferred?</div><di=
v><br></div><div>Thanks :)</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 31, 2021 at 7:52=E2=80=AFPM Tho=
mas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pe=
tazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hello,<br>
<br>
Thanks a lot for your contribution! See below some comments.<br>
<br>
On Sat, 30 Oct 2021 11:37:50 +0300<br>
&quot;<a href=3D"mailto:irgstg@gmail.com" target=3D"_blank">irgstg@gmail.co=
m</a>&quot; &lt;<a href=3D"mailto:irgstg@gmail.com" target=3D"_blank">irgst=
g@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Adding option BR2_PACKAGE_GLIBC_MTE to configure glibc with MTE suppor=
t.<br>
&gt; When enabled, glibcs configuration process runs with `--enable-memory-=
tagging` [1].<br>
&gt; <br>
&gt; MTE (Memory Tagging Extension) is an ISA extension which aims to impro=
ve security on ARMv8.5-A [2].<br>
&gt; The linux kernel supports this feature via CONFIG_ARM64_MTE.<br>
&gt; In order for glibc&#39;s MTE support to work properly, the running ker=
nel has to support that.<br>
<br>
Could you wrap the lines of your commit log to 72 columns?<br>
<br>
&gt; dependencies:<br>
&gt;=C2=A0 - supported on aarch64 only (BR2_aarch64)<br>
&gt;=C2=A0 - requires binutils version 2.33.1 or newer (!B2_BINUTILS_VERSIO=
N_2_32_X)<br>
&gt;=C2=A0 - requires at least linux 5.4 headers (BR2_TOOLCHAIN_HEADERS_AT_=
LEAST_5_4)<br>
&gt; <br>
&gt; [1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3D=
INSTALL;h=3D02dcf6b1ca3a4c43a17fdcae5e7dae8189c1c50b;hb=3DHEAD#l145" rel=3D=
"noreferrer" target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dblob;f=3DINSTALL;h=3D02dcf6b1ca3a4c43a17fdcae5e7dae8189c1c50b;hb=3DHEAD#=
l145</a><br>
&gt; [2] <a href=3D"https://community.arm.com/developer/ip-products/process=
ors/b/processors-ip-blog/posts/enhancing-memory-safety" rel=3D"noreferrer" =
target=3D"_blank">https://community.arm.com/developer/ip-products/processor=
s/b/processors-ip-blog/posts/enhancing-memory-safety</a><br>
&gt; <br>
&gt; Signed-off-by: <a href=3D"mailto:irgstg@gmail.com" target=3D"_blank">i=
rgstg@gmail.com</a> &lt;<a href=3D"mailto:irgstg@gmail.com" target=3D"_blan=
k">irgstg@gmail.com</a>&gt;<br>
<br>
Could you resend with a real name ? We cannot accept anonymous<br>
contributions.<br>
<br>
&gt; +config BR2_PACKAGE_GLIBC_MTE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Install glibc support for MTE&quot;<br=
>
<br>
Repeating that it&#39;s glibc related is not necessary, and making &quot;MT=
E&quot;<br>
explicit seems useful. So perhaps:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;enable Memory Tagging Extension (MTE=
) support&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_aarch64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_BINUTILS_VERSION_2_32_X<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enabling this option will configure, compi=
le<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0and install glibc support for MTE (Memory =
Tagging Extension).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Please be aware, in order for that to work=
 properly,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel support for MTE (CONFIG_ARM64_MTE),=
 and a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0supported CPU are needed.<br>
<br>
Instead of just saying so, you could do this in <a href=3D"http://glibc.mk"=
 rel=3D"noreferrer" target=3D"_blank">glibc.mk</a>:<br>
<br>
ifeq ($(BR2_PACKAGE_GLIBC_MTE),y)<br>
GLIBC_CONF_OPTS +=3D --enable-memory-tagging<br>
define GLIBC_LINUX_CONFIG_FIXUPS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_MTE)<br>
endef<br>
endif<br>
<br>
Of course, you need to add $(GLIBC_CONF_OPTS) inside<br>
GLIBC_CONFIGURE_CMDS.<br>
<br>
Other than that, it looks good to me.<br>
<br>
Do we need special compiler options to make use of MTE ?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000d89336060b140898--

--===============8533567019436092037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8533567019436092037==--
