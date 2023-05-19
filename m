Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D7C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 10:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 407D94248A;
	Fri, 19 May 2023 10:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 407D94248A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzB519g0iBuy; Fri, 19 May 2023 10:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FF54248C;
	Fri, 19 May 2023 10:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3FF54248C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2B351BF215
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 10:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA3894248C
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 10:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA3894248C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvKeovaFnDgx for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 10:59:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE4C4248A
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FE4C4248A
 for <buildroot@buildroot.org>; Fri, 19 May 2023 10:59:43 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-18b1c643219so1249258fac.2
 for <buildroot@buildroot.org>; Fri, 19 May 2023 03:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684493982; x=1687085982;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=koqzZ/t49hOuZjZx6I3tY45pBZs3L/sNu4J8R/aVRm4=;
 b=jU7hfs9yPmeoXbJlYc5KI6ZHFUeS2fo60uZJIJ/RZJAHqjCbmOQNDZCxLrBfYXXCfa
 FhXbOHqzoiM8DFtVoGlE0MGU/jxuSVc2JuVp9eTIZYNzzIM19FNwBLkWXbLEI0ZC2Nb2
 kbaff3Wb5cbEv2hTtF6SgHn8GHDBcc+q+bENKGfsYYL4XFSQHCh+xrnpq+Q77cbgBdVK
 e9muEb6o7rcoVS8i4gN86H9uhFt+gbiFNgjUrP2jJBAdgj1LFyIENH6FKjjjQUnl+LgX
 McNbvmeSG1RQjgwqJ/XEqwh0H6ipHEtZAFmxICigmm9seNZFKvBWIARJ3JTqgx2yusNN
 27fw==
X-Gm-Message-State: AC+VfDwpxdeUlXhrCxL53EJGaxVd9slSvSFNLkLg9wdY+bAJnxwdW/hS
 3TrAn9bXeuBoxOI9qWeZEbmx2q+8kftCKweVM+drBcWjcqg=
X-Google-Smtp-Source: ACHHUZ62jCZQlzpXzJ4M0n7LeHjEMxIbbW+nXI8OXFyg8Mn47YI4p5fCsLXQnr8mrSUxtI0fRKlozJh3cUYluo1U6mM=
X-Received: by 2002:aca:907:0:b0:396:26bf:d66c with SMTP id
 7-20020aca0907000000b0039626bfd66cmr786563oij.45.1684493982038; Fri, 19 May
 2023 03:59:42 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 19 May 2023 12:59:30 +0200
Message-ID: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684493982; x=1687085982;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=koqzZ/t49hOuZjZx6I3tY45pBZs3L/sNu4J8R/aVRm4=;
 b=cKA9CjDYU6uJ6KCzHhBjztgFMlstFChnx3w7XdF9S8xyD0f1Mhkf+62Xb3NulZFJNm
 pplZLBg0Q2h9l+cJHb8LCS6l/hhNfRpUIqLnSoKrfKh2ScJd/84W+qukz1rSL0PtGkpj
 T1UvaPGWbnplMyCnG6y0ev2Mnva3rVVW5F+/3rJcAPDF6vYLQxoYkOPiQNvpB8K9i3LK
 WF3tZ41Jf+GLiRWikUfe+Urz46VuNVcdSvJUo4GkqNUyDzJHHBbx8Ry4RPAkP0wfU8wl
 VTQKqsu5ZaXIW6eKcMRzrHCimJEmRwLGVxVO0MNkrdgj9iCafRlaiuWhyOyaHHXqQoP2
 3iXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cKA9CjDY
Subject: [Buildroot] Error while building tpm2-tools package with fapi
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
Content-Type: multipart/mixed; boundary="===============9156978566804544409=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9156978566804544409==
Content-Type: multipart/alternative; boundary="0000000000006cfe8f05fc09d125"

--0000000000006cfe8f05fc09d125
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to build the package tpm2-tools
https://github.com/buildroot/buildroot/tree/master/package/tpm2-tools with
"fapi tools" option enabled
https://github.com/buildroot/buildroot/blob/603df32a0cd416caa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26
 (BR2_PACKAGE_TPM2_TOOLS_FAPI=y, BR2_PACKAGE_TPM2_TSS_FAPI=y).
But this results in below error

checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for aarch64-buildroot-linux-gnu-strip... (cached)
/home/build/per-package/tpm2-tools/host/bin/aarch64-linux-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking whether make sets $(MAKE)... yes
checking whether make supports the include directive... yes (GNU style)
checking whether make supports nested variables... yes
checking dependency style of
/home/build/per-package/tpm2-tools/host/bin/aarch64-linux-gcc... none
checking whether make supports nested variables... (cached) yes
checking whether to build with code coverage support... no
checking for pandoc... (cached) no
configure: WARNING: Required executable pandoc not found, man pages will
not be built
checking pkg-config is at least version 0.9.0... yes
checking for TSS2_FAPI... no
configure: error: Required module tss2-fapi not found

However it builds successfully without BR2_PACKAGE_TPM2_TOOLS_FAPI selected.

Below is the tpm2-tools.mk file

################################################################################
#
# tpm2-tools
#
################################################################################

TPM2_TOOLS_VERSION = 5.2
TPM2_TOOLS_SITE =
https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
TPM2_TOOLS_LICENSE = BSD-3-Clause
TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
TPM2_TOOLS_SELINUX_MODULES = tpm2
TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf

# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
# in the toolchain wrapper and CFLAGS are used instead
TPM2_TOOLS_CONF_OPTS = --disable-hardening

# do not build man pages
TPM2_TOOLS_CONF_ENV += ac_cv_prog_PANDOC=''

ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)
TPM2_TOOLS_CONF_OPTS += --enable-fapi
else
TPM2_TOOLS_CONF_OPTS += --disable-fapi
endif

$(eval $(autotools-package))

Can any one please let me know what the issue is?

Thanks,
Sourabh

--0000000000006cfe8f05fc09d125
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><div><br></div><div>I am trying to build the=
 package tpm2-tools=C2=A0<a href=3D"https://github.com/buildroot/buildroot/=
tree/master/package/tpm2-tools">https://github.com/buildroot/buildroot/tree=
/master/package/tpm2-tools</a>=C2=A0with &quot;fapi tools&quot; option enab=
led=C2=A0<a href=3D"https://github.com/buildroot/buildroot/blob/603df32a0cd=
416caa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26">https://git=
hub.com/buildroot/buildroot/blob/603df32a0cd416caa2d2688008cb87f14ad68ef3/p=
ackage/tpm2-tools/Config.in#L26</a>=C2=A0(BR2_PACKAGE_TPM2_TOOLS_FAPI=3Dy,=
=C2=A0BR2_PACKAGE_TPM2_TSS_FAPI=3Dy).</div><div>But this results in below e=
rror<br><br></div><div>checking whether -lc should be explicitly linked in.=
.. no<br>checking dynamic linker characteristics... GNU/Linux ld.so<br>chec=
king how to hardcode library paths into programs... immediate<br>checking w=
hether stripping libraries is possible... yes<br>checking if libtool suppor=
ts shared libraries... yes<br>checking whether to build shared libraries...=
 yes<br>checking whether to build static libraries... no<br>checking for a =
BSD-compatible install... /usr/bin/install -c<br>checking whether build env=
ironment is sane... yes<br>checking for aarch64-buildroot-linux-gnu-strip..=
. (cached) /home/build/per-package/tpm2-tools/host/bin/aarch64-linux-strip<=
br>checking for a thread-safe mkdir -p... /usr/bin/mkdir -p<br>checking whe=
ther make sets $(MAKE)... yes<br>checking whether make supports the include=
 directive... yes (GNU style)<br>checking whether make supports nested vari=
ables... yes<br>checking dependency style of /home/build/per-package/tpm2-t=
ools/host/bin/aarch64-linux-gcc... none<br>checking whether make supports n=
ested variables... (cached) yes<br>checking whether to build with code cove=
rage support... no<br>checking for pandoc... (cached) no<br>configure: WARN=
ING: Required executable pandoc not found, man pages will not be built<br>c=
hecking pkg-config is at least version 0.9.0... yes<br>checking for TSS2_FA=
PI... no<br>configure: error: Required module tss2-fapi not found<br></div>=
<div><br></div><div>However=C2=A0it builds successfully without=C2=A0BR2_PA=
CKAGE_TPM2_TOOLS_FAPI selected.</div><div><br></div><div>Below is the <a hr=
ef=3D"http://tpm2-tools.mk">tpm2-tools.mk</a> file</div><div><br></div><div=
>##########################################################################=
######<br>#<br># tpm2-tools<br>#<br>#######################################=
#########################################<br><br>TPM2_TOOLS_VERSION =3D 5.2=
<br>TPM2_TOOLS_SITE =3D <a href=3D"https://github.com/tpm2-software/tpm2-to=
ols/releases/download/$(TPM2_TOOLS_VERSION)">https://github.com/tpm2-softwa=
re/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)</a><br>TPM2_TOOLS_LIC=
ENSE =3D BSD-3-Clause<br>TPM2_TOOLS_LICENSE_FILES =3D doc/LICENSE<br>TPM2_T=
OOLS_CPE_ID_VENDOR =3D tpm2-tools_project<br>TPM2_TOOLS_SELINUX_MODULES =3D=
 tpm2<br>TPM2_TOOLS_DEPENDENCIES =3D libcurl openssl tpm2-tss host-pkgconf<=
br><br># -fstack-protector-all and FORTIFY_SOURCE=3D2 is used by<br># defau=
lt. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options<br># in th=
e toolchain wrapper and CFLAGS are used instead<br>TPM2_TOOLS_CONF_OPTS =3D=
 --disable-hardening<br><br># do not build man pages<br>TPM2_TOOLS_CONF_ENV=
 +=3D ac_cv_prog_PANDOC=3D&#39;&#39;<br><br>ifeq ($(BR2_PACKAGE_TPM2_TOOLS_=
FAPI),y)<br>TPM2_TOOLS_CONF_OPTS +=3D --enable-fapi<br>else<br>TPM2_TOOLS_C=
ONF_OPTS +=3D --disable-fapi<br>endif<br><br>$(eval $(autotools-package))<b=
r></div><div><br></div><div>Can any one please let me know what the issue i=
s?</div><div><br></div><div>Thanks,</div><div>Sourabh</div><div><br></div><=
div><br></div></div>

--0000000000006cfe8f05fc09d125--

--===============9156978566804544409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9156978566804544409==--
