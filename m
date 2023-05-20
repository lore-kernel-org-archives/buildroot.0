Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF052C77B7C
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 21:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529D860BE6;
	Sat, 20 May 2023 21:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529D860BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7cC2H-EKHZj; Sat, 20 May 2023 21:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED8460BD1;
	Sat, 20 May 2023 21:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED8460BD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3950E1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 124F960BD1
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 21:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 124F960BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTQH1BLkYmqo for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 21:34:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E063460BB6
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E063460BB6
 for <buildroot@buildroot.org>; Sat, 20 May 2023 21:34:57 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-54fd1a3b821so2179198eaf.2
 for <buildroot@buildroot.org>; Sat, 20 May 2023 14:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684618497; x=1687210497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfM/iCnBbpJ4RmcUfqEddq46KRhcHmqeVwix+8DcQQ8=;
 b=GXFlUnl88gDBtgB8fMfAorTglRKWqoHmpPl9js5ro/RhJHdNTxIE/EsHPrJVFaOIjE
 EUe7Fw5sxYyv4Dn7wLOde1Ks3XTDwbpX6DI2akz4mMYkbtYO25GdTeK9yIJXrG0P3tS3
 Ppe0w2sZ+9PZ6wgkX2dIG1la3YvgMQ2BjtzhYUIj9NBp33ElmouJ4xKGkh9WVrFPl6+f
 a7sIosTmxfKR6sgOFVSOHN90UhUyj1YE13g7WJjwSzmJMDZLdue35ihHKy4p2nFT+Aur
 Gapp9g1Q/tAclX7/QB70OBnabnD/Nx8Nxt0WCDvsUFneddwilJQjQvxvGfcAQdPVqVZk
 spdA==
X-Gm-Message-State: AC+VfDwQDHlQnbj/1Do8MnhzFjUvA8Agj+6f0gpQ1czgA78S/xABSmRS
 +b96dakchYOKzN6zR5DG732XQRRf1m5rj6P7ZUGipqYgSdE=
X-Google-Smtp-Source: ACHHUZ5RUlqEB7vf8Otlv8PDnRVWNe4WwGGBvK9ii2VUH3IrsoS5iYh2zqimjoWnoY2zL9lNNnZhWzbPpdrOqBRFsFc=
X-Received: by 2002:a4a:3003:0:b0:54f:49ad:1c91 with SMTP id
 q3-20020a4a3003000000b0054f49ad1c91mr3128573oof.9.1684618496885; Sat, 20 May
 2023 14:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
 <20230520212437.2125e68b@windsurf>
In-Reply-To: <20230520212437.2125e68b@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 20 May 2023 23:34:48 +0200
Message-ID: <CADYjeSs9N0nKpwFYp9YioQfBUGnbRim5PQNVqSZLFjnXZPMDLQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684618497; x=1687210497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UfM/iCnBbpJ4RmcUfqEddq46KRhcHmqeVwix+8DcQQ8=;
 b=IoOcW74VDo1UqxMVtofKBVbFScbxTuORkzOLk7LjxbNmkDZdRPIIzjrX+Jrhuy+RBI
 ZqE1y2LiU4c6PXFCePCCmDxwxmbxx7pvIdqORvsoYeHtI1tFg9lRuRGpTWDdbtaaGxIo
 bScrXYifsMA5nmQe9XWfRwRIn0nsLuzqbkL/DDfLX+CMziQyRaTHUPaoSzCHi2gMMBmj
 tuYvKSy7y182ejrp/1GRQ6DQYC3ZEtVLUNzMwxtmkbAMj1ZYVD9A/kr3CMKoFsdm8O6H
 IYdzWLqzLJoKAvdSUb/5QMWpXqUgmNOvBcp7aakI3MDtiJfT8+ZiBytLJIzJVdWduda9
 fw6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IoOcW74V
Subject: Re: [Buildroot] Error while building tpm2-tools package with fapi
 support
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
Content-Type: multipart/mixed; boundary="===============5684054439693965369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5684054439693965369==
Content-Type: multipart/alternative; boundary="00000000000016c86305fc26cf47"

--00000000000016c86305fc26cf47
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

So my guess is that you are doing a partial rebuild. You did a first
> build without BR2_PACKAGE_TPM2_TOOLS_FAPI enabled, and then enabled it.
> Thing is that tpm2-tss was already built as part of a previous build,
> but without FAPI support.
>

Yes, you are right.
But, I did make "tpm2-tools-dirclean && make tpm2-tools-rebuild" and this
didn't help.
Also, I tried "make tpm2-tools-dirclean all" and "make tpm2-tools-dircclean
&& make tpm2-tools-reconfigure". This also resulted in the same error.

 Could you please let me know what is the correct make command to rebuild
the package again from scratch?

Thank you,
Sourabh

On Sat, 20 May 2023 at 21:24, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Fri, 19 May 2023 12:59:30 +0200
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > Hello All,
> >
> > I am trying to build the package tpm2-tools
> > https://github.com/buildroot/buildroot/tree/master/package/tpm2-tools
> with
> > "fapi tools" option enabled
> >
> https://github.com/buildroot/buildroot/blob/603df32a0cd416caa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26
> >  (BR2_PACKAGE_TPM2_TOOLS_FAPI=y, BR2_PACKAGE_TPM2_TSS_FAPI=y).
> > But this results in below error
>
> I have just built the following configuration:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_TPM2_TOOLS=y
> BR2_PACKAGE_TPM2_TOOLS_FAPI=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> and it builds just fine here. Could you share your .config, or a
> minimal configuration that exhibits the problem?
>
> > checking for TSS2_FAPI... no
> > configure: error: Required module tss2-fapi not found
>
> It is simply using pkg-config to detect TSS2_FAPI. tpm2-tools correctly
> has a dependency on host-pkgconf and tpm2-tss properly installs
> tss2-fapi.pc.
>
> So my guess is that you are doing a partial rebuild. You did a first
> build without BR2_PACKAGE_TPM2_TOOLS_FAPI enabled, and then enabled it.
> Thing is that tpm2-tss was already built as part of a previous build,
> but without FAPI support.
>
> See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
> some details on this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000016c86305fc26cf47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Thomas,<div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">So my guess is that you are doing a partial rebuil=
d. You did a first<br>build without BR2_PACKAGE_TPM2_TOOLS_FAPI enabled, an=
d then enabled it.<br>Thing is that tpm2-tss was already built as part of a=
 previous build,<br>but without FAPI support.<br></blockquote><div><br></di=
v><div>Yes, you are right.</div><div>But, I did make &quot;tpm2-tools-dircl=
ean &amp;&amp; make tpm2-tools-rebuild&quot; and this didn&#39;t help.</div=
><div>Also, I tried &quot;make tpm2-tools-dirclean=C2=A0all&quot; and &quot=
;make tpm2-tools-dircclean &amp;&amp; make tpm2-tools-reconfigure&quot;. Th=
is also resulted in the same error.</div><div><br></div><div>=C2=A0Could yo=
u please=C2=A0let me know what is the correct make command to rebuild the p=
ackage again from scratch?=C2=A0<br></div><div><br></div><div>Thank you,</d=
iv><div>Sourabh</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, 20 May 2023 at 21:24, Thomas Petazzoni &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">He=
llo,<br>
<br>
On Fri, 19 May 2023 12:59:30 +0200<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hello All,<br>
&gt; <br>
&gt; I am trying to build the package tpm2-tools<br>
&gt; <a href=3D"https://github.com/buildroot/buildroot/tree/master/package/=
tpm2-tools" rel=3D"noreferrer" target=3D"_blank">https://github.com/buildro=
ot/buildroot/tree/master/package/tpm2-tools</a> with<br>
&gt; &quot;fapi tools&quot; option enabled<br>
&gt; <a href=3D"https://github.com/buildroot/buildroot/blob/603df32a0cd416c=
aa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/buildroot/buildroot/blob/603df32a0=
cd416caa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26</a><br>
&gt;=C2=A0 (BR2_PACKAGE_TPM2_TOOLS_FAPI=3Dy, BR2_PACKAGE_TPM2_TSS_FAPI=3Dy)=
.<br>
&gt; But this results in below error<br>
<br>
I have just built the following configuration:<br>
<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_INIT_NONE=3Dy<br>
BR2_SYSTEM_BIN_SH_NONE=3Dy<br>
# BR2_PACKAGE_BUSYBOX is not set<br>
BR2_PACKAGE_TPM2_TOOLS=3Dy<br>
BR2_PACKAGE_TPM2_TOOLS_FAPI=3Dy<br>
# BR2_TARGET_ROOTFS_TAR is not set<br>
<br>
and it builds just fine here. Could you share your .config, or a<br>
minimal configuration that exhibits the problem?<br>
<br>
&gt; checking for TSS2_FAPI... no<br>
&gt; configure: error: Required module tss2-fapi not found<br>
<br>
It is simply using pkg-config to detect TSS2_FAPI. tpm2-tools correctly<br>
has a dependency on host-pkgconf and tpm2-tss properly installs<br>
tss2-fapi.pc.<br>
<br>
So my guess is that you are doing a partial rebuild. You did a first<br>
build without BR2_PACKAGE_TPM2_TOOLS_FAPI enabled, and then enabled it.<br>
Thing is that tpm2-tss was already built as part of a previous build,<br>
but without FAPI support.<br>
<br>
See <a href=3D"https://buildroot.org/downloads/manual/manual.html#full-rebu=
ild" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/m=
anual/manual.html#full-rebuild</a> for<br>
some details on this.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000016c86305fc26cf47--

--===============5684054439693965369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5684054439693965369==--
