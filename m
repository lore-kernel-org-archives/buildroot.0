Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A17C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 14:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C82A8402C3;
	Thu, 28 Jul 2022 14:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C82A8402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xiYHNpmIe8xu; Thu, 28 Jul 2022 14:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FD7400F6;
	Thu, 28 Jul 2022 14:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FD7400F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5365E1BF3BD
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E33F60F53
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 14:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E33F60F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_jJ28On1GWF for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 14:51:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F7460F4D
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74F7460F4D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 14:51:45 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bp15so3572839ejb.6
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01cvetKZxcYi08ef5qNmX6twKTT+8TkP+8Bvzlzsk2E=;
 b=4FkMc8qRKKg1AiTjS+RTx24MvPUiQc4mVehaiO8XKNakPAYb433kBPtYAJqJ8OE5TY
 Hc+mGxsKQV++WCbHOcK+ZYvnWzzx1X4wT6q5K3aq/2LjOJJ0boBOpuKomoZoIqIO0iNv
 P2vSlgNOK9rD88IyJ3SaFYLOmWx5RRxWdtktSjn63TMewzqg4vg2YrirvujuHQ6gfjrB
 wBBHjm7nbbp0I21FERRbB/rH82gaNngJFupSiJHpDzG2knHhO7rPvPoca1UFhyVoR0PO
 /AX6Ff2yiOAVBOmkFfrlZ2oSsua5cp6ihKj2sSZe/kNc0qkjT0ny/uUOhXDeezppGov5
 j1og==
X-Gm-Message-State: AJIora96qlN6nhUXeuxvhuVqgbAIkmAZLFZzX4McpBEPEkzwnt8Aen2E
 7I4paOZnzY6cb+gfF8qpKKPBPT3bR1J0maaTCLq3mAEOOgx4zA==
X-Google-Smtp-Source: AGRyM1uGtubFN2yzXlYrJgWQWFSaMg/idXuyRvOHteqHg1k9fBCsHL3UvKo+XylMA+RWDJf1xEnu6dVlrRZ+H/puhrw=
X-Received: by 2002:a17:906:5a6c:b0:72b:561a:3458 with SMTP id
 my44-20020a1709065a6c00b0072b561a3458mr21725005ejc.114.1659019903622; Thu, 28
 Jul 2022 07:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220727083753.935654-1-romain.naour@smile.fr>
In-Reply-To: <20220727083753.935654-1-romain.naour@smile.fr>
From: Nicolas TRAN <nicolas.tran@smile.fr>
Date: Thu, 28 Jul 2022 16:51:27 +0200
Message-ID: <CAJdGGv5DAHVRjDdLhwvQDCh1mX4ZWo7zs8BQLqSEHXw2EWz4ZQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=01cvetKZxcYi08ef5qNmX6twKTT+8TkP+8Bvzlzsk2E=;
 b=VY/DDFd6MPAYUND3nMhGRw9FfbgL+J3TfKh1Z6bjsEOCxj/FtSbbDbEH0oKeKrFoJP
 UHaNwldrIdpCiNeLRAM6y28hVQYdONRiK6DT8/5U8HQRvv3G+LAANgstIqRSb73V1Tny
 FOZuo2Y5pT978qojKI3Wa1Vz5ledZp5qvFOJG4KMhWL40nL6MLKzYp+Gg9B3rGpgj2QK
 lhsrPgjd3CSZ1UBqps1naUJgH7sorott7i4WRhpAu1IADm284E80wo8VEBcIlAQVgsXq
 2lLWF0ELoTyytiTuKmWGBVBDm7XmJSkG2ZgtnvNxUYjPIDQzRoqL4DS1rEcPWL8Ugr/U
 MFtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VY/DDFd6
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Content-Type: multipart/mixed; boundary="===============7219979003354449512=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7219979003354449512==
Content-Type: multipart/alternative; boundary="00000000000007f91405e4deac87"

--00000000000007f91405e4deac87
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Nicolas Tran <nicolas.tran@smile.fr <romain.naour@smile.fr>>

On Wed, Jul 27, 2022 at 10:38 AM Romain Naour <romain.naour@smile.fr> wrote:

> While building host-rust with a musl based toolchain without C++ compiler,
> the build fail since libunwind bundled in rust sources needs a C++
> compiler.
>
> cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error:
> [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++
> compiler not installed on this system
>
> Note: the issues can't be reproduced with a glibc based toolchain
> without C++ probaly due to extra steps required to support musl libc.
>
> We could add the C++ dependency direclty to host-rustc but it would
> requires adding the C++ reverse dependencies to all rust packages.
>
> Instread, we add the C++ dependency to
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> only when a musl toolchain is used. So we can still install a prebuilt
> rust compiler but without the rust standard library (rust-std).
>
> Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS
> option but
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some
> BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.
>
> Fixes:
>
> http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82
>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v3: add a global C++ dependency to
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS (Yann)
>     update comment to use "C++ cross compiler"
> v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>     after James's review and discussion with Thomas and Arnout
> ---
>  package/rustc/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
> index fec8726aee..822de68dbb 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -110,11 +110,15 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
>         default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
>
>  # All target rust packages should depend on this option
> +# Note: With musl based toolchain, we need a C++ cross compiler to
> +# build host-rust some target libraries (libunwind) from llvm source
> +# code bundled in rust sources.
>  config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>         bool
>         default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
>         default y if
> BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
>         default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
> +       depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
> --
> 2.34.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000007f91405e4deac87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-il">Reviewed</span>-<span class=3D"gm=
ail-il">by</span>: Nicolas Tran &lt;<a href=3D"mailto:romain.naour@smile.fr=
" target=3D"_blank">nicolas.tran@smile.fr</a>&gt;</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 10=
:38 AM Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.nao=
ur@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">While building host-rust with a musl based toolchain without C++=
 compiler,<br>
the build fail since libunwind bundled in rust sources needs a C++ compiler=
.<br>
<br>
cargo:warning=3Di686-buildroot-linux-musl-gcc.br_real: error: [...]/host-ru=
st-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not=
 installed on this system<br>
<br>
Note: the issues can&#39;t be reproduced with a glibc based toolchain<br>
without C++ probaly due to extra steps required to support musl libc.<br>
<br>
We could add the C++ dependency direclty to host-rustc but it would<br>
requires adding the C++ reverse dependencies to all rust packages.<br>
<br>
Instread, we add the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_S=
UPPORTS<br>
only when a musl toolchain is used. So we can still install a prebuilt<br>
rust compiler but without the rust standard library (rust-std).<br>
<br>
Usually we should not add toolchain dependencies in a _ARCH_SUPPORTS option=
 but<br>
BR2_PACKAGE_HOST_RUSTC_TARGET_TIER... options contains already some<br>
BR2_TOOLCHAIN_USES_GLIBC or BR2_TOOLCHAIN_USES_MUSL.<br>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.org/results/636/636fb39c8f1b8c05e4ca4=
51ac506cd63c7166d82" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.org/results/636/636fb39c8f1b8c05e4ca451ac506cd63c7166d82</a><br>
<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
---<br>
v3: add a global C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPO=
RTS (Yann)<br>
=C2=A0 =C2=A0 update comment to use &quot;C++ cross compiler&quot;<br>
v2: move the C++ dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS<=
br>
=C2=A0 =C2=A0 after James&#39;s review and discussion with Thomas and Arnou=
t<br>
---<br>
=C2=A0package/rustc/Config.in.host | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host<br=
>
index fec8726aee..822de68dbb 100644<br>
--- a/package/rustc/Config.in.host<br>
+++ b/package/rustc/Config.in.host<br>
@@ -110,11 +110,15 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_sparc64 &amp;&amp; BR2_TOOLCHA=
IN_USES_GLIBC<br>
<br>
=C2=A0# All target rust packages should depend on this option<br>
+# Note: With musl based toolchain, we need a C++ cross compiler to<br>
+# build host-rust some target libraries (libunwind) from llvm source<br>
+# code bundled in rust sources.<br>
=C2=A0config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER=
1_PLATFORMS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER=
2_HOST_TOOLS_PLATFORMS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_PACKAGE_HOST_RUSTC_TARGET_TIER=
2_PLATFORMS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCH=
AIN_USES_MUSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS=
<br>
<br>
=C2=A0config BR2_PACKAGE_HOST_RUSTC_ARCH<br>
-- <br>
2.34.3<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--00000000000007f91405e4deac87--

--===============7219979003354449512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7219979003354449512==--
