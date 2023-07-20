Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD2CEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4618982BA7;
	Thu, 20 Jul 2023 17:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4618982BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNi2TZlD_qot; Thu, 20 Jul 2023 17:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1346282B1B;
	Thu, 20 Jul 2023 17:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1346282B1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED9521BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7C55416FA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C55416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQI43jvkfx_5 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:32:11 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95B99416C4
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B99416C4
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b70404a5a0so16020331fa.2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874329; x=1690479129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wEweKGdEoEFKK1RoE7cQQHaSk6CtjiSVNrM8C6SNAY=;
 b=jh3Wb1Lgjk/NVAGs/y+nAgJYx7Zj9NCxvLjdmd5MNNtoAUI5rdXBRbQYJO/26WbiDF
 S+tb+Lq7P25IQqM4rWnWj9huZqXUa0j7HOsCeyrg6HdKmvE5fgKsMKWZOGq0WxJqD17Z
 oVMcbbFCcuPywJsaTjyTRWK2M9mEvQDAvI2CeFlxhsZcz1XsEnu/a10myFcSuMYNmCj/
 i024u3kGT95nH+iFR2mDpTcFP/dLRH1aAI2ONzOw2z5Ir0kWGS/v20g4no77Dq+Q9rpJ
 4S+FkYHnzcjIBarrbZ06zIHr9QF6oZLEuLZ2r5sjHqtNPM7M4iK7PiOlay9OF1g+ncK4
 DEag==
X-Gm-Message-State: ABy/qLZgf1MMwup4ZQwJX8iDsh0nOHQZgXeP/pPWILdDY8MxZ6wJQxuA
 Ucv1b5/UJgft7gzLukRIsFjsnz/PJ/TMmcmffvk=
X-Google-Smtp-Source: APBJJlGRsW2UCks6P1/CyzRf7fRUmzklPa/KNmNposAhMO6dCpR/+0xgDyZ5ESOHvar0l3Y0mtxqRuT6iq+Bqu3A04k=
X-Received: by 2002:a2e:8ec5:0:b0:2b9:35ae:c9ac with SMTP id
 e5-20020a2e8ec5000000b002b935aec9acmr3107377ljl.2.1689874329388; Thu, 20 Jul
 2023 10:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-8-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-8-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:58 -0700
Message-ID: <CAFSsvmqWzSwsuCWk=AbU=t_ss7n3EH45c24VmUHvTs+SZgYJxA@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874329; x=1690479129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0wEweKGdEoEFKK1RoE7cQQHaSk6CtjiSVNrM8C6SNAY=;
 b=GmsAxTUTbvYF7Yah9XDWzFZ4X1g+yZCngFuIo7N6CstkN2Pih1JIEQcl8F1RJuIvlE
 0rOb6x2vFNdekRpY46v/YTGBI303lJT+gUUaDYA0T3n4ry5+iBWA0yoz+O7NWte8yDHs
 OS+E3OY7ftdzVlo0NSMj2AlFTTWOl93txIm7zQgNogYXCHyi5qUHs0Z465lyBOUlHnG3
 3/eAUdbH9OjulcHubCuBuT1mBvV1YBxkULOFmHrotxmWlzlzRbS2X7psbLdN09LbqIrb
 +Z3TY2bB8yd1MWxFdD2YP3+52HhpC+XSwhiS3gwGyY504tpMT3Me9IfpV45K2e9T+SXC
 8lUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GmsAxTUT
Subject: Re: [Buildroot] [PATCH v4 07/10] package/llvm-project/llvm-cmake:
 new package
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6945425953126921881=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6945425953126921881==
Content-Type: multipart/alternative; boundary="0000000000001e4d170600ee870d"

--0000000000001e4d170600ee870d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> This is a small host package containing shared cmake modules
> that are needed by various projects during configuration.
> For example llvm 15 needs it.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v3: - force llvm-cmake version to 15.0.3 since LLVM_PROJECT_VERSION is
>       still at 11.1.0
>     - Keep cp as install command since there is no CMakefiles.txt
>     - Add License information sinec it come from llvm-project
> ---
>  package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
>  package/llvm-project/llvm-cmake/llvm-cmake.mk   | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
>  create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk
>
> diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash
> b/package/llvm-project/llvm-cmake/llvm-cmake.hash
> new file mode 100644
> index 0000000000..862c5d92e8
> --- /dev/null
> +++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
> @@ -0,0 +1,2 @@
> +# locally calculated
> +sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d
> cmake-15.0.3.src.tar.xz
> diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk
> b/package/llvm-project/llvm-cmake/llvm-cmake.mk
> new file mode 100644
> index 0000000000..b305797891
> --- /dev/null
> +++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
> @@ -0,0 +1,17 @@
>
> +########################################################################=
########
> +#
> +# llvm-cmake
> +#
>
> +########################################################################=
########
> +
> +LLVM_CMAKE_VERSION =3D 15.0.3
> +LLVM_CMAKE_SITE =3D $(LLVM_PROJECT_SITE)
> +LLVM_CMAKE_SOURCE =3D cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
> +LLVM_CMAKE_LICENSE =3D Apache-2.0 with exceptions
> +
> +define HOST_LLVM_CMAKE_INSTALL_CMDS
> +       mkdir -p $(HOST_DIR)/lib/cmake/llvm
> +       cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001e4d170600ee870d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:46=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
This is a small host package containing shared cmake modules<br>
that are needed by various projects during configuration.<br>
For example llvm 15 needs it.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v3: - force llvm-cmake version to 15.0.3 since LLVM_PROJECT_VERSION is<br>
=C2=A0 =C2=A0 =C2=A0 still at 11.1.0<br>
=C2=A0 =C2=A0 - Keep cp as install command since there is no CMakefiles.txt=
<br>
=C2=A0 =C2=A0 - Add License information sinec it come from llvm-project<br>
---<br>
=C2=A0package/llvm-project/llvm-cmake/llvm-cmake.hash |=C2=A0 2 ++<br>
=C2=A0package/llvm-project/llvm-cmake/<a href=3D"http://llvm-cmake.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a>=C2=A0 =C2=A0| 17 ++++++=
+++++++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
=C2=A0create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash<br=
>
=C2=A0create mode 100644 package/llvm-project/llvm-cmake/<a href=3D"http://=
llvm-cmake.mk" rel=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a><br>
<br>
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm=
-project/llvm-cmake/llvm-cmake.hash<br>
new file mode 100644<br>
index 0000000000..862c5d92e8<br>
--- /dev/null<br>
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash<br>
@@ -0,0 +1,2 @@<br>
+# locally calculated<br>
+sha256=C2=A0 21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed0=
90d=C2=A0 cmake-15.0.3.src.tar.xz<br>
diff --git a/package/llvm-project/llvm-cmake/<a href=3D"http://llvm-cmake.m=
k" rel=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a> b/package/llvm-pr=
oject/llvm-cmake/<a href=3D"http://llvm-cmake.mk" rel=3D"noreferrer" target=
=3D"_blank">llvm-cmake.mk</a><br>
new file mode 100644<br>
index 0000000000..b305797891<br>
--- /dev/null<br>
+++ b/package/llvm-project/llvm-cmake/<a href=3D"http://llvm-cmake.mk" rel=
=3D"noreferrer" target=3D"_blank">llvm-cmake.mk</a><br>
@@ -0,0 +1,17 @@<br>
+##########################################################################=
######<br>
+#<br>
+# llvm-cmake<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+LLVM_CMAKE_VERSION =3D 15.0.3<br>
+LLVM_CMAKE_SITE =3D $(LLVM_PROJECT_SITE)<br>
+LLVM_CMAKE_SOURCE =3D cmake-$(LLVM_CMAKE_VERSION).src.tar.xz<br>
+LLVM_CMAKE_LICENSE =3D Apache-2.0 with exceptions<br>
+<br>
+define HOST_LLVM_CMAKE_INSTALL_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(HOST_DIR)/lib/cmake/llvm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/ll=
vm<br>
+endef<br>
+<br>
+$(eval $(host-generic-package))<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000001e4d170600ee870d--

--===============6945425953126921881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6945425953126921881==--
