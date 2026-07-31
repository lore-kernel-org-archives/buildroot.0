Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34394C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 09:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9B5607C0;
	Fri, 31 Jul 2026 09:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMYHNvtOJOz1; Fri, 31 Jul 2026 09:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A211C60811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785488759;
	bh=nFB5nI6zA8JDh8H5SWfFHg+opaulMNYGpWtKzvH6UB4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GrCy8rq3WnlgW6bmQgLpQkG1rQi0U8k3MwKYBVJEQg7kViAx9Q/elx4RciyZ8Hqxw
	 kSF0eBNFHbjvlF2aDxLbisrhABfPs0dN2vE1lzNNg7jsZF3OznOBtnbtkbokyzhZpa
	 GuvXOChsfS2Tm2J5gAnC1rtxsIxtganPwNI30H6GI8IvIaVpzeKs/7uFard4cceU8w
	 qVXsbZv0Ulf1RNlSpeE0ZL1Y4A79736jkYtjr9xAQSveUgUDT5cfIv5PsoIydmLJhB
	 U36bmOoM8aPII8tgumf9dRaGjQu/q3aMoz4osZmqS9IWqXp5kYAjK3eoe54odwYViN
	 csxrn9XMlCLvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A211C60811;
	Fri, 31 Jul 2026 09:05:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A6D2E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D486D40149
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk1LfJ7N_f09 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 09:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.151;
 helo=fout-a8-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B93D440072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93D440072
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B93D440072
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:05:56 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 8AD97EC00D7;
 Fri, 31 Jul 2026 05:05:55 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 05:05:55 -0400
X-ME-Sender: <xms:c2VsarMebQVOQkD7zegNqpd6CI8mhcpCGy_MG9LBu1WMQS9hpQk1dg>
 <xme:c2Vsagy4nbsMUhyF4Ve3hpO85PNKZN_72WyHpa72nGwM-t4hFPLqHVY4DY2VNuk1I
 2oyQDLe96GxbvOaLMEJw_MmM3YxhtAAiDfNIqDIsW5xLYaEuXdw7sw>
X-ME-Proxy-Cause: dmFkZTFruIFErUmQOY3iGdjI0h2sPkgwdFk44lhKHvU+Oa6bWhJ8V4htGMem5Gx4Mz/QwJ
 DU5d400NyzOx2yeRLucuiTXjc7iD22pSkv55NZVjAcc9XIODt5j4eLXgpttsaTQNXA+GMo
 cp5dDF3TfDLfVoag7TS68635+89qHs1Seu2cQr/X84U/I042SBfoFbLy+YRpOZ1U5pW93+
 jIdbxMOxRMZY7PVceGtfPp7Jha7evmIbLScd+rtNEibGyEI62ezmfJb1Uv2s8TQaoIPkE8
 vU5V9vePg3d+US5yv4gS7ImDCeRefsyDvjfgignwTK+QeZscWyaCLLArNsb2TvCQ2m0eJL
 CvBnWKmGKdgY3BhFkURouQkA2tqs2wIZtBKHhc3Eb4T2HzhvsvPd0UqyuCECO5tZ7HVzZL
 nqJahILV/453Kr233GCrofCpOi1znwMOzzQ4xW/0xoxh2eSsirZSMFYIUoRYuhZT9sdrGR
 EUYyl3Ca049wLf1SZd3Gid/XWgHzNavrUAcIoykWEsQnirKYfZRpq+cu5LPNK2EEYMTmoV
 8omKXr2QytnuDU42fbDzqsy0nfPmWYFrHJR65XC4HNGRmPYdsfxlxQ/2jy9OsEwvwtAc4R
 xFlNx1IimXknUriBESSW0eeQ6q+yEoarvy5sigTRwOXlfKTWnotjIeuoq5vw
X-ME-Proxy: <xmx:c2VsaoTAchOPhVdQf2B5z31Vt_CruAc1Td1FOrp4CFm8jsEr0Dqclg>
 <xmx:c2VsasxQsbWI9NZ3j2I6mrfQxVgRpGf97K31BAdjb1QN-PQBfpvf4g>
 <xmx:c2Vsaq28EH2Sb9ICXfOhU8Ak2X7uIwOU-NMdsv4RCIjQPY3l5zCkbA>
 <xmx:c2Vsaq7RPxgGWNN38fEQr7kR63Ld1stZwOFIETz76gS8egzKBVV_sg>
 <xmx:c2VsagN8Xf5ieQGHqLS0iK767RXzrbSr2uvZbjFXL3K5GC1QKponaJL7>
Feedback-ID: i0df9467b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 257362CE03C2; Fri, 31 Jul 2026 05:05:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AaEHlUXjUfGB
Date: Fri, 31 Jul 2026 11:05:17 +0200
From: "Michele Comignano" <mcdev@playlinux.net>
To: "Michael Nosthoff" <buildroot@heine.tech>
Cc: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>,
 "Boerge Struempfel" <boerge.struempfel@gmail.com>, buildroot@buildroot.org
Message-Id: <a05c4dab-691c-43d9-8e03-49b1ca31f853@app.fastmail.com>
In-Reply-To: <6fa3550b-1f68-0505-524c-22e7c71bcd12@heine.tech>
References: <20260730143130.18903-1-mcdev@playlinux.net>
 <6fa3550b-1f68-0505-524c-22e7c71bcd12@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1785488755; x=
 1785575155; bh=JkOcbat1C+AIDk792MdiU2luaaeWvvbTbVWN7ry7c6k=; b=f
 1PtRc5YoPAQZxzqTGry5WaLgKZAgcQiOoxV0EPaA1Ej4IDHPGjoAaEwlxW8grwxt
 sTnqG61yUoE1as9SQNhGTYN79XsVA/5q7aCVwPOXkdkOwdDXUVUeXw2GNJdN8UJq
 y2hP3q48cb60MnBbMqYllryvTn6DBhI20q3ZP18bI7h1yjOft9mDzc7i1s8++sy0
 n+zLkfQHCLn1x1I6SD9qzpGzrJFLMikw03WvAL/g7Fxp7doXzFR8xzEwxUSrUF7s
 2/z5UTa333bgd4FJzJG05CbhktcF22Jxs3oCjh7d3NeeSSnnxRqi8PNlbSsZcuKB
 77dPKf/M0zrKKo1Vyp8zQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785488755; x=1785575155; bh=JkOcbat1C+AIDk792MdiU2luaaeWvvbTbVW
 N7ry7c6k=; b=PEJUMwCpsPm0HCihlxX+g2oir94q9HGOqJd8L/8ILLkv7qFEq6K
 87U+F5SAC1pyzrjOhxrJlZ65dxkOCZEbrZaMLGx+Zh/UeE/9LY8jRNo5DNzWXt4n
 3i8YlT4Ahebvl1fFbJZEDMrioKNAzSFmDh5Z2a3OKBlNb66hAeyWmJgUamEFRZow
 /ceYANDlJcTycouzu/MAkh7cA91TlFHLjBg6YbuyA6mEnnc9yWAbvKmogTHX9R30
 4cnTxM1Abfbs8SeHpb0cCv0EKXRVIa68QrQ9wWx7xsqtHieZOvVCc862Br+HeQKL
 eEGmACSxL7rV2sC1wDGQs/2aqwFyfhErwhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=f1PtRc5Y; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PEJUMwCp
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpiod2: bump version to 2.3.1
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
Content-Type: multipart/mixed; boundary="===============1937014434602047781=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1937014434602047781==
Content-Type: multipart/alternative;
 boundary=f0e214874f7afd76771298a3e3753fad237a21b8

--f0e214874f7afd76771298a3e3753fad237a21b8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Michael,

I fear I missed that!
It makes sense to ignore mine and move yours forward.

Regards,
Michele

Il Ven, 31 Lug 2026, alle ore 10:50, Michael Nosthoff via buildroot ha scritto:
> Hi Michele,
> 
> I already submitted a patch for the version bump.
> See https://patchwork.ozlabs.org/project/buildroot/patch/20260722094344.153516-1-buildroot@heine.tech/
> 
> Would be great if you could review!
> 
> Regards,
> Michael
> 
> On Thursday, July 30, 2026 16:31 CEST, Michele Comignano <mcdev@playlinux.net> wrote:
> 
> > changing build system from autotools to meson+ninja as for upstream
> > no breaking changes, still depends on kernel 5.1.
> > 
> > Signed-off-by: Michele Comignano <mcdev@playlinux.net>
> > ---
> >  package/libgpiod2/libgpiod2.hash |  2 +-
> >  package/libgpiod2/libgpiod2.mk   | 23 ++++++++++++-----------
> >  2 files changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> > index a12752261a..48f7c77855 100644
> > --- a/package/libgpiod2/libgpiod2.hash
> > +++ b/package/libgpiod2/libgpiod2.hash
> > @@ -1,4 +1,4 @@
> >  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> > -sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
> > +sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
> >  # Hash for license file
> >  sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
> > diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> > index d83fdbd94a..6c851e6dd3 100644
> > --- a/package/libgpiod2/libgpiod2.mk
> > +++ b/package/libgpiod2/libgpiod2.mk
> > @@ -6,35 +6,36 @@
> >  
> >  # Be careful when bumping versions.
> >  # Dependency on kernel header versions may change.
> > -LIBGPIOD2_VERSION = 2.2.4
> > +LIBGPIOD2_VERSION = 2.3.1
> >  LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
> >  LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> >  LIBGPIOD2_LICENSE = LGPL-2.1+
> >  LIBGPIOD2_LICENSE_FILES = COPYING
> >  LIBGPIOD2_INSTALL_STAGING = YES
> >  LIBGPIOD2_DEPENDENCIES = host-pkgconf
> > +# v2.3.x switched from autotools to meson
> >  LIBGPIOD2_CONF_OPTS = \
> > - --disable-bindings-python \
> > - --disable-examples \
> > - --disable-tests
> > + -Dbindings-python=disabled \
> > + -Dexamples=disabled \
> > + -Dtests=disabled
> >  
> >  ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> > -LIBGPIOD2_CONF_OPTS += --enable-tools
> > +LIBGPIOD2_CONF_OPTS += -Dtools=enabled
> >  else
> > -LIBGPIOD2_CONF_OPTS += --disable-tools
> > +LIBGPIOD2_CONF_OPTS += -Dtools=disabled
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> >  LIBGPIOD2_DEPENDENCIES += libedit
> > -LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
> > +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
> >  else
> > -LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
> > +LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
> >  endif
> >  
> >  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> > -LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
> > +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
> >  else
> > -LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
> > +LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
> >  endif
> >  
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))
> > -- 
> > 2.55.0
> >
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

--f0e214874f7afd76771298a3e3753fad237a21b8
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div>Hi Michael,<=
/div><div><br></div><div>I fear I missed that!</div><div>It makes sense =
to ignore mine and move yours forward.</div><div><br></div><div>Regards,=
</div><div>Michele</div><div><br></div><div>Il Ven, 31 Lug 2026, alle or=
e 10:50, Michael Nosthoff via buildroot ha scritto:</div><blockquote typ=
e=3D"cite" id=3D"qt" style=3D""><div>Hi Michele,</div><div><br></div><di=
v>I already submitted a patch for the version bump.</div><div>See&nbsp;<=
a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202607220=
94344.153516-1-buildroot@heine.tech/">https://patchwork.ozlabs.org/proje=
ct/buildroot/patch/20260722094344.153516-1-buildroot@heine.tech/</a></di=
v><div><br></div><div>Would be great if you could review!</div><div><br>=
</div><div>Regards,</div><div>Michael</div><div><br></div><div>On Thursd=
ay, July 30, 2026 16:31 CEST, Michele Comignano &lt;<a href=3D"mailto:mc=
dev@playlinux.net">mcdev@playlinux.net</a>&gt; wrote:</div><div><br></di=
v><div>&gt; changing build system from autotools to meson+ninja as for u=
pstream</div><div>&gt; no breaking changes, still depends on kernel 5.1.=
</div><div>&gt;&nbsp;</div><div>&gt; Signed-off-by: Michele Comignano &l=
t;<a href=3D"mailto:mcdev@playlinux.net">mcdev@playlinux.net</a>&gt;</di=
v><div>&gt; ---</div><div>&gt;&nbsp; package/libgpiod2/libgpiod2.hash |&=
nbsp; 2 +-</div><div>&gt;&nbsp; package/libgpiod2/libgpiod2.mk&nbsp;&nbs=
p; | 23 ++++++++++++-----------</div><div>&gt;&nbsp; 2 files changed, 13=
 insertions(+), 12 deletions(-)</div><div>&gt;&nbsp;</div><div>&gt; diff=
 --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.=
hash</div><div>&gt; index a12752261a..48f7c77855 100644</div><div>&gt; -=
-- a/package/libgpiod2/libgpiod2.hash</div><div>&gt; +++ b/package/libgp=
iod2/libgpiod2.hash</div><div>&gt; @@ -1,4 +1,4 @@</div><div>&gt;&nbsp; =
# From&nbsp;<a href=3D"https://www.kernel.org/pub/software/libs/libgpiod=
/sha256sums.asc">https://www.kernel.org/pub/software/libs/libgpiod/sha25=
6sums.asc</a></div><div>&gt; -sha256&nbsp; 13207176b0eb9b3e0f02552d5f49f=
5a6a449343ce47416158bb484d9d3019592&nbsp; libgpiod-2.2.4.tar.xz</div><di=
v>&gt; +sha256&nbsp; e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b=
3566484650a30&nbsp; libgpiod-2.3.1.tar.xz</div><div>&gt;&nbsp; # Hash fo=
r license file</div><div>&gt;&nbsp; sha256&nbsp; f646ad5159efb51c1130a4b=
43c31f0759750b1e254d2acf510f368ee2e2085c3&nbsp; COPYING</div><div>&gt; d=
iff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2=
.mk</div><div>&gt; index d83fdbd94a..6c851e6dd3 100644</div><div>&gt; --=
- a/package/libgpiod2/libgpiod2.mk</div><div>&gt; +++ b/package/libgpiod=
2/libgpiod2.mk</div><div>&gt; @@ -6,35 +6,36 @@</div><div>&gt;&nbsp;&nbs=
p;</div><div>&gt;&nbsp; # Be careful when bumping versions.</div><div>&g=
t;&nbsp; # Dependency on kernel header versions may change.</div><div>&g=
t; -LIBGPIOD2_VERSION =3D 2.2.4</div><div>&gt; +LIBGPIOD2_VERSION =3D 2.=
3.1</div><div>&gt;&nbsp; LIBGPIOD2_SOURCE =3D libgpiod-$(LIBGPIOD2_VERSI=
ON).tar.xz</div><div>&gt;&nbsp; LIBGPIOD2_SITE =3D&nbsp;<a href=3D"https=
://www.kernel.org/pub/software/libs/libgpiod">https://www.kernel.org/pub=
/software/libs/libgpiod</a></div><div>&gt;&nbsp; LIBGPIOD2_LICENSE =3D L=
GPL-2.1+</div><div>&gt;&nbsp; LIBGPIOD2_LICENSE_FILES =3D COPYING</div><=
div>&gt;&nbsp; LIBGPIOD2_INSTALL_STAGING =3D YES</div><div>&gt;&nbsp; LI=
BGPIOD2_DEPENDENCIES =3D host-pkgconf</div><div>&gt; +# v2.3.x switched =
from autotools to meson</div><div>&gt;&nbsp; LIBGPIOD2_CONF_OPTS =3D \</=
div><div>&gt; -	--disable-bindings-python \</div><div>&gt; -	--disable-e=
xamples \</div><div>&gt; -	--disable-tests</div><div>&gt; +	-Dbindings-p=
ython=3Ddisabled \</div><div>&gt; +	-Dexamples=3Ddisabled \</div><div>&g=
t; +	-Dtests=3Ddisabled</div><div>&gt;&nbsp;&nbsp;</div><div>&gt;&nbsp; =
ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)</div><div>&gt; -LIBGPIOD2_CONF_O=
PTS +=3D --enable-tools</div><div>&gt; +LIBGPIOD2_CONF_OPTS +=3D -Dtools=
=3Denabled</div><div>&gt;&nbsp; else</div><div>&gt; -LIBGPIOD2_CONF_OPTS=
 +=3D --disable-tools</div><div>&gt; +LIBGPIOD2_CONF_OPTS +=3D -Dtools=3D=
disabled</div><div>&gt;&nbsp; endif</div><div>&gt;&nbsp;&nbsp;</div><div=
>&gt;&nbsp; ifeq ($(BR2_PACKAGE_LIBEDIT),y)</div><div>&gt;&nbsp; LIBGPIO=
D2_DEPENDENCIES +=3D libedit</div><div>&gt; -LIBGPIOD2_CONF_OPTS +=3D --=
enable-gpioset-interactive</div><div>&gt; +LIBGPIOD2_CONF_OPTS +=3D -Dgp=
ioset-interactive=3Denabled</div><div>&gt;&nbsp; else</div><div>&gt; -LI=
BGPIOD2_CONF_OPTS +=3D --disable-gpioset-interactive</div><div>&gt; +LIB=
GPIOD2_CONF_OPTS +=3D -Dgpioset-interactive=3Ddisabled</div><div>&gt;&nb=
sp; endif</div><div>&gt;&nbsp;&nbsp;</div><div>&gt;&nbsp; ifeq ($(BR2_IN=
STALL_LIBSTDCPP),y)</div><div>&gt; -LIBGPIOD2_CONF_OPTS +=3D --enable-bi=
ndings-cxx</div><div>&gt; +LIBGPIOD2_CONF_OPTS +=3D -Dbindings-cxx=3Dena=
bled</div><div>&gt;&nbsp; else</div><div>&gt; -LIBGPIOD2_CONF_OPTS +=3D =
--disable-bindings-cxx</div><div>&gt; +LIBGPIOD2_CONF_OPTS +=3D -Dbindin=
gs-cxx=3Ddisabled</div><div>&gt;&nbsp; endif</div><div>&gt;&nbsp;&nbsp;<=
/div><div>&gt; -$(eval $(autotools-package))</div><div>&gt; +$(eval $(me=
son-package))</div><div>&gt; --&nbsp;</div><div>&gt; 2.55.0</div><div>&g=
t;</div><div><br></div><div>____________________________________________=
___</div><div>buildroot mailing list</div><div><a href=3D"mailto:buildro=
ot@buildroot.org">buildroot@buildroot.org</a></div><div><a href=3D"https=
://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildro=
ot.org/mailman/listinfo/buildroot</a></div><div><br></div></blockquote><=
div><br></div></body></html>
--f0e214874f7afd76771298a3e3753fad237a21b8--

--===============1937014434602047781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1937014434602047781==--
