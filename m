Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFA2C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2150140607;
	Wed, 10 Aug 2022 19:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2150140607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnERC6AnuiDO; Wed, 10 Aug 2022 19:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B03A40580;
	Wed, 10 Aug 2022 19:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B03A40580
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 704D31BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 495FD40580
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 19:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 495FD40580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 446HI38RYsjT for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 19:45:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E3E40012
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13E3E40012
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 19:44:59 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10e615a36b0so19048910fac.1
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 12:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8ObQ8M9f7LRfqtLIu41krJ7S0USRfSjXMiXBUq75Ogo=;
 b=d+SSxuC8xGdXhLwI9uMGNqAZFDLg6Q8/tcXASfP10OSNyQ4SSud7wjzldo/+RivoS2
 9CsmZTHfWVYsbl37I08tp5uoAPe6N4BPBxxvUlNy4gv5YJhE/86rlXnEEGkagBe2KB54
 HCYf8S/lwCgrk8gQiH/9yDR2cqApaEjiAYf1Uy4qSUa5bgQCHe7ECFTDPmsMdTZOFsAn
 LGyqXBl1R8rF/Yikk+TCJvOhLq6ZYlThApvpOAafvwkI6c5HyeXHp5f+Gyec+LXtvsJ7
 dQ5mwuM11sqF4O9fbTdh9xMNLUQkmWUSKMZBXqwOmdQISkF1h6zKXtXpPb1LHCNAoPJX
 2bvg==
X-Gm-Message-State: ACgBeo3fMleygmp5OKO3PjhF1qG4/jxZK8k/roh1PRkAcA9/EAvG8bMz
 1zSbwptIl58P1z4i8vuRaPtBPsLhJ1zhbYxXEoHcmgaGW2Y=
X-Google-Smtp-Source: AA6agR6HewPkDcYBiUn+3j5Kg7cyxLo6hiiwFaLFqDR/FmtJBP2Ehh3d2Vh51EogfgqNp++jdsx5XHWYxSOCYHjNgJY=
X-Received: by 2002:a05:6870:b28a:b0:10f:72f:6c with SMTP id
 c10-20020a056870b28a00b0010f072f006cmr2078191oao.148.1660160699056; Wed, 10
 Aug 2022 12:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220810190652.2185416-1-f.fainelli@gmail.com>
In-Reply-To: <20220810190652.2185416-1-f.fainelli@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Aug 2022 21:44:48 +0200
Message-ID: <CAPi7W80J=R6vaU2BQ297K9-_93O9hUYB3tyCcJeLw+9jVVrV5Q@mail.gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8ObQ8M9f7LRfqtLIu41krJ7S0USRfSjXMiXBUq75Ogo=;
 b=o0nPV1TgkvWCTqkUAEez5HUdeWNPlUurN/ANus3VQdnY5/Lg/4RXNiRM2gdRSRejmC
 gfGyXZQx2ub9ndYgkB23bLReVL68Rpn1ntV/2q+dieBrTkXHAkWjpC6b4h6GNSZ1rrwa
 XIsUXgSM5fZxjAZM1BINRuZfa4Lnf1kFKshwdQW5RlZECjoRX5AK+hfd1wKL2BWIGR4p
 +kwAL+kKUdvSTkl9XliewqNELlKGJoFVSy7R+UWwy7OYHwYbipeCVvvN376o7zpDNMin
 JQAPVNnkbUfT8WRQ6dsaHeiGxfbD62atJkzQr/QSP2zuUxbaN/ag9EzlvCOQo7QFL0Ly
 lg+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o0nPV1Tg
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Allow installation of
 perf scripts
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, yann.morin.1998@free.fr
Content-Type: multipart/mixed; boundary="===============4458928276525726650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4458928276525726650==
Content-Type: multipart/alternative; boundary="000000000000bcc9a905e5e848e6"

--000000000000bcc9a905e5e848e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mer. 10 ao=C3=BBt 2022 =C3=A0 21:07, Florian Fainelli <f.fainelli@gmail.=
com> a
=C3=A9crit :

> In order to run the full gamut of "perf tests" installing the perf
> scripts is required, otherwise we run into errors similar to those:
>
>         failed to open shell test directory:
> /usr/libexec/perf-core/tests/shell
>
> Make this possible by introducing a new option allowing us to install
> perf scripts.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  package/linux-tools/Config.in             | 6 ++++++
>  package/linux-tools/linux-tool-perf.mk.in | 6 ++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.i=
n
> index 732ac65a2565..c0c097d888a9 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -76,6 +76,12 @@ comment "perf needs a toolchain w/ dynamic library"
>
>  if BR2_PACKAGE_LINUX_TOOLS_PERF
>
> +config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS
> +       bool "Enable installation of perf scripts"
> +       help
> +         Enable the installation of the perf scripts under
> +         /usr/libexec/perf-core/ which is necessary for running "perf
> tests"
> +
>  config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
>         bool "enable perf TUI"
>         depends on BR2_USE_MMU # slang
> diff --git a/package/linux-tools/linux-tool-perf.mk.in
> b/package/linux-tools/linux-tool-perf.mk.in
> index 8ac4ebbc42f5..171aa06fed6b 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -163,8 +163,10 @@ endef
>  define PERF_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
>                 -C $(LINUX_DIR)/tools/perf O=3D$(LINUX_DIR)/tools/perf/
> install
> -       $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
> -       $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
> +       $(Q)if test "$(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS)" =3D ""; the=
n \
> +               $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/ ; =
\
> +               $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/ ; \
> +       fi
>


For consistency with other packages, I would replace the above lines by
something like:

+
+ifeq ((BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
+define BR2_PACKAGE_LINUX_TOOLS_PERF_REMOVE_PERF_SCRIPTS
+               $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+               $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+endef
+endif

-       $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-       $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+      $(BR2_PACKAGE_LINUX_TOOLS_PERF_REMOVE_PERF_SCRIPTS)
endef


>  define PERF_LINUX_CONFIG_FIXUPS
> --
> 2.25.1
>
> Best Regards,

Fabrice

--000000000000bcc9a905e5e848e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 10 ao=C3=BBt 2022 =C3=
=A0=C2=A021:07, Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com=
" target=3D"_blank">f.fainelli@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">In order to run the fu=
ll gamut of &quot;perf tests&quot; installing the perf<br>
scripts is required, otherwise we run into errors similar to those:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed to open shell test directory: /usr/libex=
ec/perf-core/tests/shell<br>
<br>
Make this possible by introducing a new option allowing us to install<br>
perf scripts.<br>
<br>
Signed-off-by: Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com"=
 target=3D"_blank">f.fainelli@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/linux-tools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 6 ++++++<br>
=C2=A0package/linux-tools/<a href=3D"http://linux-tool-perf.mk.in" rel=3D"n=
oreferrer" target=3D"_blank">linux-tool-perf.mk.in</a> | 6 ++++--<br>
=C2=A02 files changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in<=
br>
index 732ac65a2565..c0c097d888a9 100644<br>
--- a/package/linux-tools/Config.in<br>
+++ b/package/linux-tools/Config.in<br>
@@ -76,6 +76,12 @@ comment &quot;perf needs a toolchain w/ dynamic library&=
quot;<br>
<br>
=C2=A0if BR2_PACKAGE_LINUX_TOOLS_PERF<br>
<br>
+config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable installation of perf scripts&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the installation of the perf scri=
pts under<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/libexec/perf-core/ which is necessa=
ry for running &quot;perf tests&quot;<br>
+<br>
=C2=A0config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;enable perf TUI&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU # slang<br>
diff --git a/package/linux-tools/<a href=3D"http://linux-tool-perf.mk.in" r=
el=3D"noreferrer" target=3D"_blank">linux-tool-perf.mk.in</a> b/package/lin=
ux-tools/<a href=3D"http://linux-tool-perf.mk.in" rel=3D"noreferrer" target=
=3D"_blank">linux-tool-perf.mk.in</a><br>
index 8ac4ebbc42f5..171aa06fed6b 100644<br>
--- a/package/linux-tools/<a href=3D"http://linux-tool-perf.mk.in" rel=3D"n=
oreferrer" target=3D"_blank">linux-tool-perf.mk.in</a><br>
+++ b/package/linux-tools/<a href=3D"http://linux-tool-perf.mk.in" rel=3D"n=
oreferrer" target=3D"_blank">linux-tool-perf.mk.in</a><br>
@@ -163,8 +163,10 @@ endef<br>
=C2=A0define PERF_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C $(LINUX_DIR)/too=
ls/perf O=3D$(LINUX_DIR)/tools/perf/ install<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/s=
cripts/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/t=
ests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)if test &quot;$(BR2_PACKAGE_LINUX_TOOLS_PER=
F_SCRIPTS)&quot; =3D &quot;&quot;; then \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -rf $(TARGET_=
DIR)/usr/libexec/perf-core/scripts/ ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -rf $(TARGET_=
DIR)/usr/libexec/perf-core/tests/ ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br></blockquote><div><br></div><div><br></di=
v><div>For consistency with other packages, I would replace the above lines=
 by something like:</div><div><br></div><div><div><a class=3D"gmail_plusrep=
ly" id=3D"gmail-m_962642925832699399m_-7677346634444368468plusReplyChip-0">=
+</a><br></div><div>+ifeq ((BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)</div><d=
iv>+define BR2_PACKAGE_LINUX_TOOLS_PERF_REMOVE_PERF_SCRIPTS</div><div><a cl=
ass=3D"gmail_plusreply" id=3D"gmail-m_962642925832699399m_-7677346634444368=
468plusReplyChip-1">+</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/<br>
<a class=3D"gmail_plusreply" id=3D"gmail-m_962642925832699399m_-76773466344=
44368468plusReplyChip-2">+</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0 $(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/<br></div><di=
v>
+endef<br></div><div>+endif</div></div><div><br></div><div>-=C2=A0 =C2=A0 =
=C2=A0 =C2=A0$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/t=
ests/</div><div>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(BR2_PACKAGE_LINUX_TOOLS_P=
ERF_REMOVE_PERF_SCRIPTS)</div><div>endef<br></div><br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
=C2=A0define PERF_LINUX_CONFIG_FIXUPS<br>
-- <br>
2.25.1<br>
<br></blockquote><div>Best Regards,</div><div><br></div><div>Fabrice<br></d=
iv></div></div>

--000000000000bcc9a905e5e848e6--

--===============4458928276525726650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4458928276525726650==--
