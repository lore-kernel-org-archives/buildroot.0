Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CABC77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 12:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD54561320;
	Fri, 12 May 2023 12:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD54561320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4j03Ak8AMju; Fri, 12 May 2023 12:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 538B360C07;
	Fri, 12 May 2023 12:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 538B360C07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6127B1BF396
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 12:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3916242014
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 12:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3916242014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTWe7V_7TsL2 for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 12:27:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F9E4200F
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40F9E4200F
 for <buildroot@buildroot.org>; Fri, 12 May 2023 12:27:22 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so57106613fac.1
 for <buildroot@buildroot.org>; Fri, 12 May 2023 05:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683894441; x=1686486441;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=USUpcZGALDAqtAWSA23JP+0W8p9Q7+JqONW7b8M5XrI=;
 b=fWn6EKhz4kfYMiCH30/XqXV4P+ZodLfGkuFR91N2/uhAt1JAaJWm440Es/B4CCBI3N
 UD8/FWnekfCPJqWix7p0j4JkoKh1YMcof1CbHvKtehw5jDcWilqh3lpF+kIJEqHNKBkx
 0mETmO6K0ERyKYYNhnQEKS0rjat4gP2616Nh0CG6OyiyeNuBHE745SSzYNKBiel6J5Yl
 ezrUx9NnpVT9zmj2411KFUofdN7FgcLpAIFIInWgTg9tO4D+JKmUsr/OLaoxQ+WhCeXl
 U3CHdcUJUMrpgq+0hRWSEltWF0XjVAazj8PVml0jAXQ4W4J4lGHeXKZRyPBqUH7emwZH
 3FKg==
X-Gm-Message-State: AC+VfDy/rjwKrgvexRwOXzW/Vg5wk8D766bljyJAtTTGQ9okvu+NJfd+
 rqtEP87VB9+ksfF81TY6FG34F2tKw9LJSeUeKwvQEaCCSJg=
X-Google-Smtp-Source: ACHHUZ7KHjgzKO8GSTDkfQuJEBU2Mg0GtqNywLIWxVC70KWB6MDa56rV1tToHwCW50TcpP9V0GOoZvMYKMcg9b2lj6U=
X-Received: by 2002:aca:bc82:0:b0:392:6341:2bed with SMTP id
 m124-20020acabc82000000b0039263412bedmr6095297oif.24.1683894440344; Fri, 12
 May 2023 05:27:20 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 12 May 2023 14:27:09 +0200
Message-ID: <CADYjeSuD1_iZ8qpTwmAyTmbJT6Ah9gFENtge+inogwmcg=i1Ng@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683894441; x=1686486441;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=USUpcZGALDAqtAWSA23JP+0W8p9Q7+JqONW7b8M5XrI=;
 b=Xa94/YpqLZrPMZWddkZyHDWtl0Iauscpwf+GSECHI75NF7guMx8uybsV5+C0EHjO2c
 UCPneLRd9f3iOjmpIZdYPdCriSB4f/oO91QFgDCNFLX3LdQlqVEdgES9+eF3rFJYmtP1
 UtqUuRJMwjRsDo7EEyDEAoB1oRMW3oHj8C2XA9/bTQ6LA8TluwGvnlrYdG+ezKKhlcfz
 Rui+/EEiUjUB7rxIzVQcXRxIfHq6DVZ91p3KIyvoZ6uh4yqxuItK65rtw6yFPzwZcMZk
 /cKnSReh5mPvZIqOKDUnkNH8OJ5POQB2JFCjsAHu9vhwuopauOILdWhUB6tJaOlc0itT
 4LJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Xa94/Ypq
Subject: [Buildroot] Compiling issue while adding tpm2-tss-engine as
 Buildroot package
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
Content-Type: multipart/mixed; boundary="===============0169984800959533765=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0169984800959533765==
Content-Type: multipart/alternative; boundary="000000000000f4c11805fb7e39b0"

--000000000000f4c11805fb7e39b0
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to add tpm2-tss-engine (OpenSSL Engine for TPM2 devices) (
https://github.com/tpm2-software/tpm2-tss-engine) as a Buildroot package
and below is the tpm2-tss-engine.mk file

################################################################################
#
# tpm2-tss-engine
#
################################################################################

TPM2_TSS_ENGINE_VERSION = 1.2.0
TPM2_TSS_ENGINE_SITE =
https://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(TPM2_TSS_ENGINE_VERSION)
TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
TPM2_TSS_ENGINE_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
host-autoconf-archive
TPM2_TSS_ENGINE_AUTORECONF = YES
TPM2_TSS_ENGINE_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
TPM2_TSS_ENGINE_CONF_OPTS = \
        --disable-defaultflags \
        --disable-doxygen-doc \
        --disable-plymouth \
        --without-initramfstoolsdir \
        --without-mkinitcpiodir

# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is
used
TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"

# do not build man pages
TPM2_TSS_ENGINE_CONF_ENV += ac_cv_path_PANDOC=''

$(eval $(autotools-package))

Source code is being downloaded from Git and building. But in the next step
I am getting below error:

>>> tpm2-tss-engine 1.2.0 Building
PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 /usr/bin/make -j17  -C
/home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
make[2]: Nothing to be done for 'all'.
>>> tpm2-tss-engine 1.2.0 Installing to target
PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 /usr/bin/make -j17
DESTDIR=/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target
install -C /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
([ -e
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
] || \
         /usr/bin/mkdir -p
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1)
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
 /usr/bin/mkdir -p
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
 /bin/bash ./libtool   --mode=install /usr/bin/install -c   libtpm2tss.la
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
  /bin/bash ./libtool   --mode=install /usr/bin/install -c tpm2tss-genkey
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
 /usr/bin/install -c -m 644 bash-completion/tpm2tss-genkey
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
 /usr/bin/install -c -m 644 include/tpm2-tss-engine.h
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
 /usr/bin/install -c -m 644 man/man1/tpm2tss-genkey.1
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
 /usr/bin/install -c -m 644 man/man3/tpm2tss_tpm2data_write.3
man/man3/tpm2tss_rsa_makekey.3 man/man3/tpm2tss_rsa_genkey.3
man/man3/tpm2tss_ecc_makekey.3 man/man3/tpm2tss_ecc_genkey.3
man/man3/tpm2tss_ecc_getappdata.3 man/man3/tpm2tss_tpm2data_read.3
man/man3/tpm2tss_ecc_setappdata.3
'/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
libtool: install: /usr/bin/install -c .libs/libtpm2tss.so
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/libtpm2tss.so
libtool: install: /usr/bin/install -c tpm2tss-genkey
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin/tpm2tss-genkey
libtool: install: /usr/bin/install -c .libs/libtpm2tss.lai
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/
libtpm2tss.la
/usr/bin/make  install-exec-hook
(cd
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
&& \
         ln -s -f libtpm2tss.so tpm2tss.so)
libtool: warning: remember to run 'libtool --finish
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
tpm2-tss-engine: installs files in
/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target//home/[...]/tmp/br.test.standard
make[1]: *** [package/pkg-generic.mk:390:
/home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/.stamp_target_installed]
Error 1
make: *** [Makefile:23: _all] Error 2


I have also added `libtool` (`BR2_PACKAGE_LIBTOOL`) in the `make
menuconfig`.
I am not sure what the actual error is.

Can anyone please let me know how to resolve the above issue?

Thank you,
Sourabh

--000000000000f4c11805fb7e39b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am trying to add tpm2-tss-engine (OpenSSL =
Engine for TPM2 devices) (<a href=3D"https://github.com/tpm2-software/tpm2-=
tss-engine">https://github.com/tpm2-software/tpm2-tss-engine</a>) as a Buil=
droot package and below is the <a href=3D"http://tpm2-tss-engine.mk">tpm2-t=
ss-engine.mk</a> file<br><br>##############################################=
##################################<br>#<br># tpm2-tss-engine<br>#<br>######=
##########################################################################<=
br><br>TPM2_TSS_ENGINE_VERSION =3D 1.2.0<br>TPM2_TSS_ENGINE_SITE =3D <a hre=
f=3D"https://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(T=
PM2_TSS_ENGINE_VERSION)">https://github.com/tpm2-software/tpm2-tss-engine/r=
eleases/download/$(TPM2_TSS_ENGINE_VERSION)</a><br>TPM2_TSS_ENGINE_LICENSE =
=3D BSD-3-Clause<br>TPM2_TSS_ENGINE_LICENSE_FILES =3D LICENSE<br>TPM2_TSS_E=
NGINE_DEPENDENCIES =3D libqrencode tpm2-tss host-pkgconf host-autoconf-arch=
ive<br>TPM2_TSS_ENGINE_AUTORECONF =3D YES<br>TPM2_TSS_ENGINE_AUTORECONF_OPT=
S =3D -I $(HOST_DIR)/share/autoconf-archive<br>TPM2_TSS_ENGINE_CONF_OPTS =
=3D \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-defaultflags \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --disable-doxygen-doc \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=
disable-plymouth \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-initramfstoolsd=
ir \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-mkinitcpiodir<br><br># uses C=
99 code but forgets to pass -std=3Dc99 when --disable-defaultflags is used<=
br>TPM2_TSS_ENGINE_CONF_ENV +=3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -std=3Dc99=
&quot;<br><br># do not build man pages<br>TPM2_TSS_ENGINE_CONF_ENV +=3D ac_=
cv_path_PANDOC=3D&#39;&#39;<br><br>$(eval $(autotools-package))<br><br>Sour=
ce code is being downloaded from Git and building. But in the next step I a=
m getting below error:<br><br>&gt;&gt;&gt; tpm2-tss-engine 1.2.0 Building<b=
r>PATH=3D&quot;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine=
/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host=
/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot; =
=C2=A0/usr/bin/make -j17 =C2=A0-C /home/[...]/tmp/br.test.standard/build/tp=
m2-tss-engine-1.2.0/<br>make[2]: Nothing to be done for &#39;all&#39;.<br>&=
gt;&gt;&gt; tpm2-tss-engine 1.2.0 Installing to target<br>PATH=3D&quot;/hom=
e/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[..=
.]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sb=
in:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot; =C2=A0/usr/bin/make -=
j17 DESTDIR=3D/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/=
target install -C /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.=
2.0/<br>([ -e /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/=
target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin=
/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1 ] || \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/bin/mkdir -p /home/[...]/tmp/br.test.st=
andard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/p=
er-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/=
usr/lib/engines-1.1)<br>=C2=A0/usr/bin/mkdir -p &#39;/home/[...]/tmp/br.tes=
t.standard/per-package/tpm2-tss-engine/target/usr/bin&#39;<br>=C2=A0/usr/bi=
n/mkdir -p &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engin=
e/target/usr/share/bash-completion/completions&#39;<br>=C2=A0/usr/bin/mkdir=
 -p &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targe=
t/usr/include&#39;<br>=C2=A0/usr/bin/mkdir -p &#39;/home/[...]/tmp/br.test.=
standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard=
/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroo=
t/usr/lib/engines-1.1&#39;<br>=C2=A0/usr/bin/mkdir -p &#39;/home/[...]/tmp/=
br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1&#39;=
<br>=C2=A0/usr/bin/mkdir -p &#39;/home/[...]/tmp/br.test.standard/per-packa=
ge/tpm2-tss-engine/target/usr/share/man/man3&#39;<br>=C2=A0/bin/bash ./libt=
ool =C2=A0 --mode=3Dinstall /usr/bin/install -c =C2=A0 <a href=3D"http://li=
btpm2tss.la">libtpm2tss.la</a> &#39;/home/[...]/tmp/br.test.standard/per-pa=
ckage/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tp=
m2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engin=
es-1.1&#39;<br>=C2=A0 /bin/bash ./libtool =C2=A0 --mode=3Dinstall /usr/bin/=
install -c tpm2tss-genkey &#39;/home/[...]/tmp/br.test.standard/per-package=
/tpm2-tss-engine/target/usr/bin&#39;<br>=C2=A0/usr/bin/install -c -m 644 ba=
sh-completion/tpm2tss-genkey &#39;/home/[...]/tmp/br.test.standard/per-pack=
age/tpm2-tss-engine/target/usr/share/bash-completion/completions&#39;<br>=
=C2=A0/usr/bin/install -c -m 644 include/tpm2-tss-engine.h &#39;/home/[...]=
/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include&#39;<b=
r>=C2=A0/usr/bin/install -c -m 644 man/man1/tpm2tss-genkey.1 &#39;/home/[..=
.]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/ma=
n1&#39;<br>=C2=A0/usr/bin/install -c -m 644 man/man3/tpm2tss_tpm2data_write=
.3 man/man3/tpm2tss_rsa_makekey.3 man/man3/tpm2tss_rsa_genkey.3 man/man3/tp=
m2tss_ecc_makekey.3 man/man3/tpm2tss_ecc_genkey.3 man/man3/tpm2tss_ecc_geta=
ppdata.3 man/man3/tpm2tss_tpm2data_read.3 man/man3/tpm2tss_ecc_setappdata.3=
 &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/u=
sr/share/man/man3&#39;<br>libtool: install: /usr/bin/install -c .libs/libtp=
m2tss.so /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targe=
t/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../a=
arch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/libtpm2tss.so<br>lib=
tool: install: /usr/bin/install -c tpm2tss-genkey /home/[...]/tmp/br.test.s=
tandard/per-package/tpm2-tss-engine/target/usr/bin/tpm2tss-genkey<br>libtoo=
l: install: /usr/bin/install -c .libs/libtpm2tss.lai /home/[...]/tmp/br.tes=
t.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standa=
rd/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/engines-1.1/<a href=3D"http://libtpm2tss.la">libtpm2tss.la</a><=
br>/usr/bin/make =C2=A0install-exec-hook<br>(cd /home/[...]/tmp/br.test.sta=
ndard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/pe=
r-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/u=
sr/lib/engines-1.1 &amp;&amp; \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s =
-f libtpm2tss.so tpm2tss.so)<br>libtool: warning: remember to run &#39;libt=
ool --finish /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/h=
ost/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1&#39;<br>=
tpm2-tss-engine: installs files in /home/[...]/tmp/br.test.standard/per-pac=
kage/tpm2-tss-engine/target//home/[...]/tmp/br.test.standard<br>make[1]: **=
* [package/<a href=3D"http://pkg-generic.mk:390">pkg-generic.mk:390</a>: /h=
ome/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/.stamp_target_in=
stalled] Error 1<br>make: *** [Makefile:23: _all] Error 2<br><br><br>I have=
 also added `libtool` (`BR2_PACKAGE_LIBTOOL`) in the `make menuconfig`. <br=
>I am not sure what the actual error is.<br><br>Can anyone please let me kn=
ow how to resolve the above issue?<br><br>Thank you,<br>Sourabh<br></div>

--000000000000f4c11805fb7e39b0--

--===============0169984800959533765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0169984800959533765==--
