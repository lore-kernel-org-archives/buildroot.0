Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1311BC83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 08:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0E760F22;
	Fri, 18 Jul 2025 08:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bwxIwOrtJSP; Fri, 18 Jul 2025 08:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D0B60F27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D0B60F27;
	Fri, 18 Jul 2025 08:56:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59DC01A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4017760F21
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47xr2mfVmtWm for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 08:56:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.44;
 helo=mail-ed1-f44.google.com; envelope-from=fede.evol@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0871E60F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0871E60F29
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0871E60F29
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:56:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6070293103cso2871178a12.0
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 01:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752828974; x=1753433774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GpeoIiaFjppsYpCrwHmxoYxNGfL7K90XtGQ91DYM5kk=;
 b=HSSm96UQJZSbKsKbESoFsgP49uJvr/5qWtEoAlwCd4P6ALzvq5faM98MZEIRpUcvgs
 vM3czuPC0t+ZrYCVysqv2kanBRZE55bJzV3A2CCYHE0tjWnh6nTBHv+JetUAXOu8/YKF
 K2CD9Ff2WBjgiWveSzi252MbyfeD/MWe9k6QP4wwFUkaDsL+7fWpQWSfP/5sTUJ6ZN+1
 neAyrd//Z5bTPC2nvFPmI3epIDSGqJWlkfCJrXFPyL5Kn+ewVuVIORpX/U8U/YUkWr3p
 sArST/eBfITob5i8pRQXXp7uM7SP+lLb9z3H1MSWHL8YwEGWba6Hh2cbWdt1QXbjDzyC
 wYcw==
X-Gm-Message-State: AOJu0YwAahCOh3C66r/nPPUYvRTcPgaVDyMFEsNPOFb8hRXJA+PsUCRF
 CEV9JE0ggHGfZMYKNYa7eVE8VMDu/B5AFicRkCpyczpHPVDgCaxwSlQ/ViWqZqC1I5UfvQ6PSNi
 jjuQLwrXZk5HLpLiJsoo7vOOUMQhSJmGsGw==
X-Gm-Gg: ASbGncuuxojKwF+8fM0Y4B0FfXJVkys0/BcbxJhVJkvjtRCDI2XumN30keB2Q4T7oRj
 0vzaj2LlYwYn4DS+1Gx3j8FGwwwmb/g+P0jJsRPG/y/3BMw9LUL6BklCIvipR5VnEjrvYs5z51k
 eFcN1WcAVKxQ9Df2BaXNTKm6kp8c14iRAv4pe211H2NTIRtb9v/QeQn+LO3Nh490Glofw7/GaYp
 e/tFX2DyDbXDak/5AECQWzs2S4ZhpG8yIkb3WG24GDruqQDQlrY
X-Google-Smtp-Source: AGHT+IGNYqAukf3Aago0b8wXFkHd9F+uGsbGEKCLS0P6KRR4KeBTqR5j1NcWhmG7pAvraSa2WxwAQ2Ju+JT5mjG+Z18=
X-Received: by 2002:a05:6402:270b:b0:612:c928:ead0 with SMTP id
 4fb4d7f45d1cf-612c9292d12mr1384969a12.19.1752828973317; Fri, 18 Jul 2025
 01:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250718050954.18325-1-fede@evolware.org>
 <87fretlw8e.fsf@tarshish>
In-Reply-To: <87fretlw8e.fsf@tarshish>
From: Federico Pellegrin <fede@evolware.org>
Date: Fri, 18 Jul 2025 10:56:01 +0200
X-Gm-Features: Ac12FXyHpQkHgzllswbOzknZlpbMA24DHtU5099oK5PQmoGBQ9XRHeA2yTKdLlo
Message-ID: <CAM6O0ZjXPFih9pLoyQ9cq-B-H8GBeOuYR_-9mpy=MSCOW-pD+A@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, joris.lijssens@gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: bump to 0.6.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3567406357579891314=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3567406357579891314==
Content-Type: multipart/alternative; boundary="0000000000004e8144063a304cad"

--0000000000004e8144063a304cad
Content-Type: text/plain; charset="UTF-8"

Hi Baruch,
Many thanks for the fast feedback and thanks for spotting that!

Sent a v2 with that removal, hope that looks better now!

Many thanks,
Federico


Il giorno ven 18 lug 2025 alle ore 10:49 Baruch Siach <baruch@tkos.co.il>
ha scritto:

> Hi Federico,
>
> On Fri, Jul 18 2025, Federico Pellegrin wrote:
> > Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9
> >
> > Remove now upstreamed patch
> 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
> > Fixes also:
> https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/
>
> With this patch removed, .checkpackageignore should also be updated.
>
> baruch
>
> > Signed-off-by: Federico Pellegrin <fede@evolware.org>
> > ---
> >  ...ibpcap-dependencies-using-pkg-config.patch | 51 -------------------
> >  package/netsniff-ng/netsniff-ng.hash          |  2 +-
> >  package/netsniff-ng/netsniff-ng.mk            |  2 +-
> >  3 files changed, 2 insertions(+), 53 deletions(-)
> >  delete mode 100644
> package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> >
> > diff --git
> >
> a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> >
> b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> > deleted file mode 100644
> > index bbcbd2bfc3..0000000000
> > ---
> a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
> > -From: Baruch Siach <baruch@tkos.co.il>
> > -Date: Thu, 2 Sep 2021 12:56:00 +0300
> > -Subject: [PATCH] Detect libpcap dependencies using pkg-config
> > -
> > -When building statically the link command line must include all
> > -dependencies of all libraries. libpcap can optionally depend on libnl.
> > -mausezahn can't build statically in this case.
> > -
> > -Use pkg-config in configure and in the link command to construct the
> > -library flags we need to link with libpcap.
> > -
> > -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > -Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ----
> > -Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
> > -
> > - configure          | 4 +++-
> > - mausezahn/Makefile | 2 +-
> > - 2 files changed, 4 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/configure b/configure
> > -index 510826a798f5..598ae2433a7a 100755
> > ---- a/configure
> > -+++ b/configure
> > -@@ -588,7 +588,9 @@ int main(void)
> > - }
> > - EOF
> > -
> > --    $CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log
> 2>&1
> > -+    $CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
> > -+            $($PKG_CONFIG --libs libpcap 2>> config.log) \
> > -+            >> config.log 2>&1
> > -     if [ ! -x $TMPDIR/pcaptest ] ; then
> > -             echo "[NO]"
> > -             echo "CONFIG_LIBPCAP=0" >> Config
> > -diff --git a/mausezahn/Makefile b/mausezahn/Makefile
> > -index ca16b6579583..9544565355cc 100644
> > ---- a/mausezahn/Makefile
> > -+++ b/mausezahn/Makefile
> > -@@ -1,6 +1,6 @@
> > - mausezahn-libs =    -lcli \
> > -                     -lnet \
> > --                    -lpcap \
> > -+                    $(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)
> $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
> > -                     -lrt \
> > -                     -lpthread \
> > -                     -lm
> > ---
> > -2.33.0
> > -
> > diff --git a/package/netsniff-ng/netsniff-ng.hash
> b/package/netsniff-ng/netsniff-ng.hash
> > index 40b015cb0d..e63963c6d7 100644
> > --- a/package/netsniff-ng/netsniff-ng.hash
> > +++ b/package/netsniff-ng/netsniff-ng.hash
> > @@ -1,5 +1,5 @@
> >  # Locally calculated after checking signature
> > -sha256
> 77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540e10894ba
> netsniff-ng-0.6.8.tar.xz
> > +sha256
> 027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea69325918
> netsniff-ng-0.6.9.tar.xz
> >  # Locally computed
> >  sha256
> b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
> >  sha256
> 8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
> > diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/
> netsniff-ng.mk
> > index 2b5b19b27f..5e779f1cfb 100644
> > --- a/package/netsniff-ng/netsniff-ng.mk
> > +++ b/package/netsniff-ng/netsniff-ng.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> ################################################################################
> >
> > -NETSNIFF_NG_VERSION = 0.6.8
> > +NETSNIFF_NG_VERSION = 0.6.9
> >  NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
> >  NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
> >  NETSNIFF_NG_LICENSE = GPL-2.0
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--0000000000004e8144063a304cad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi Baruch,</div><div>Many thanks for t=
he fast feedback and thanks for spotting that!</div><div><br></div><div>Sen=
t a v2 with that removal, hope that looks better now!</div><div><br></div><=
div>Many thanks,</div><div>Federico</div><div><br></div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">Il giorno ven 18 lug 2025 alle ore 10:49 Baruch Siach &lt;<a href=3D"mai=
lto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Federico,<br>
<br>
On Fri, Jul 18 2025, Federico Pellegrin wrote:<br>
&gt; Changes: <a href=3D"https://github.com/netsniff-ng/netsniff-ng/release=
s/tag/v0.6.9" rel=3D"noreferrer" target=3D"_blank">https://github.com/netsn=
iff-ng/netsniff-ng/releases/tag/v0.6.9</a><br>
&gt;<br>
&gt; Remove now upstreamed patch 0001-Detect-libpcap-dependencies-using-pkg=
-config.patch.<br>
&gt; Fixes also: <a href=3D"https://patchwork-proxy.ozlabs.org/project/buil=
droot/patch/20240829075015.39164-1-fede@evolware.org/" rel=3D"noreferrer" t=
arget=3D"_blank">https://patchwork-proxy.ozlabs.org/project/buildroot/patch=
/20240829075015.39164-1-fede@evolware.org/</a><br>
<br>
With this patch removed, .checkpackageignore should also be updated.<br>
<br>
baruch<br>
<br>
&gt; Signed-off-by: Federico Pellegrin &lt;<a href=3D"mailto:fede@evolware.=
org" target=3D"_blank">fede@evolware.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ibpcap-dependencies-using-pkg-config.patch | 51 -------------=
------<br>
&gt;=C2=A0 package/netsniff-ng/netsniff-ng.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 package/netsniff-ng/<a href=3D"http://netsniff-ng.mk" rel=3D"nor=
eferrer" target=3D"_blank">netsniff-ng.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 3 files changed, 2 insertions(+), 53 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/netsniff-ng/0001-Detect-libpcap-depen=
dencies-using-pkg-config.patch<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-confi=
g.patch<br>
&gt; b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-confi=
g.patch<br>
&gt; deleted file mode 100644<br>
&gt; index bbcbd2bfc3..0000000000<br>
&gt; --- a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-c=
onfig.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,51 +0,0 @@<br>
&gt; -From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il" target=3D=
"_blank">baruch@tkos.co.il</a>&gt;<br>
&gt; -Date: Thu, 2 Sep 2021 12:56:00 +0300<br>
&gt; -Subject: [PATCH] Detect libpcap dependencies using pkg-config<br>
&gt; -<br>
&gt; -When building statically the link command line must include all<br>
&gt; -dependencies of all libraries. libpcap can optionally depend on libnl=
.<br>
&gt; -mausezahn can&#39;t build statically in this case.<br>
&gt; -<br>
&gt; -Use pkg-config in configure and in the link command to construct the<=
br>
&gt; -library flags we need to link with libpcap.<br>
&gt; -<br>
&gt; -Signed-off-by: Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il" =
target=3D"_blank">baruch@tkos.co.il</a>&gt;<br>
&gt; -Signed-off-by: Tobias Klauser &lt;<a href=3D"mailto:tklauser@distanz.=
ch" target=3D"_blank">tklauser@distanz.ch</a>&gt;<br>
&gt; ----<br>
&gt; -Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d<br>
&gt; -<br>
&gt; - configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
&gt; - mausezahn/Makefile | 2 +-<br>
&gt; - 2 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/configure b/configure<br>
&gt; -index 510826a798f5..598ae2433a7a 100755<br>
&gt; ---- a/configure<br>
&gt; -+++ b/configure<br>
&gt; -@@ -588,7 +588,9 @@ int main(void)<br>
&gt; - }<br>
&gt; - EOF<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 $CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap &gt;=
&gt; config.log 2&gt;&amp;1<br>
&gt; -+=C2=A0 =C2=A0 $CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $($PKG_CONFIG --libs libpc=
ap 2&gt;&gt; config.log) \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; config.log 2&gt;&=
amp;1<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ! -x $TMPDIR/pcaptest ] ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;[NO]&quot;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_LIB=
PCAP=3D0&quot; &gt;&gt; Config<br>
&gt; -diff --git a/mausezahn/Makefile b/mausezahn/Makefile<br>
&gt; -index ca16b6579583..9544565355cc 100644<br>
&gt; ---- a/mausezahn/Makefile<br>
&gt; -+++ b/mausezahn/Makefile<br>
&gt; -@@ -1,6 +1,6 @@<br>
&gt; - mausezahn-libs =3D=C2=A0 =C2=A0 -lcli \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-lnet \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -lpcap \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $(shell PKG_CONFIG_PATH=3D$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpc=
ap 2&gt; /dev/null ) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-lrt \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-lpthread \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-lm<br>
&gt; --- <br>
&gt; -2.33.0<br>
&gt; -<br>
&gt; diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-n=
g/netsniff-ng.hash<br>
&gt; index 40b015cb0d..e63963c6d7 100644<br>
&gt; --- a/package/netsniff-ng/netsniff-ng.hash<br>
&gt; +++ b/package/netsniff-ng/netsniff-ng.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # Locally calculated after checking signature<br>
&gt; -sha256=C2=A0 77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540=
e10894ba=C2=A0 netsniff-ng-0.6.8.tar.xz<br>
&gt; +sha256=C2=A0 027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea=
69325918=C2=A0 netsniff-ng-0.6.9.tar.xz<br>
&gt;=C2=A0 # Locally computed<br>
&gt;=C2=A0 sha256=C2=A0 b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e=
0dc0282a4db2d=C2=A0 README<br>
&gt;=C2=A0 sha256=C2=A0 8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302ff=
f4262a235c387=C2=A0 COPYING<br>
&gt; diff --git a/package/netsniff-ng/<a href=3D"http://netsniff-ng.mk" rel=
=3D"noreferrer" target=3D"_blank">netsniff-ng.mk</a> b/package/netsniff-ng/=
<a href=3D"http://netsniff-ng.mk" rel=3D"noreferrer" target=3D"_blank">nets=
niff-ng.mk</a><br>
&gt; index 2b5b19b27f..5e779f1cfb 100644<br>
&gt; --- a/package/netsniff-ng/<a href=3D"http://netsniff-ng.mk" rel=3D"nor=
eferrer" target=3D"_blank">netsniff-ng.mk</a><br>
&gt; +++ b/package/netsniff-ng/<a href=3D"http://netsniff-ng.mk" rel=3D"nor=
eferrer" target=3D"_blank">netsniff-ng.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -NETSNIFF_NG_VERSION =3D 0.6.8<br>
&gt; +NETSNIFF_NG_VERSION =3D 0.6.9<br>
&gt;=C2=A0 NETSNIFF_NG_SITE =3D <a href=3D"http://pub.netsniff-ng.org/netsn=
iff-ng" rel=3D"noreferrer" target=3D"_blank">http://pub.netsniff-ng.org/net=
sniff-ng</a><br>
&gt;=C2=A0 NETSNIFF_NG_SOURCE =3D netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz=
<br>
&gt;=C2=A0 NETSNIFF_NG_LICENSE =3D GPL-2.0<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div>

--0000000000004e8144063a304cad--

--===============3567406357579891314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3567406357579891314==--
