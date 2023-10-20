Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659ECCDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 12:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0901460F48;
	Fri, 20 Oct 2023 12:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0901460F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKnIr3x5khby; Fri, 20 Oct 2023 12:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F87605AF;
	Fri, 20 Oct 2023 12:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F87605AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9FB61BF271
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3704847E9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3704847E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2PmRKyDt8_k for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 12:20:55 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D63EA847DF
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 12:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63EA847DF
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a82c2eb50cso8010217b3.2
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 05:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697804454; x=1698409254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I5bQZtDR6AHErGX7Z9TJ8Upq54c9wmyPuihh8z+xInA=;
 b=ezPJtELHfOrCBagar4QjUP+WYtEeik9hf2eHbIWBOkE6OS0lpz0it20tRcswPTftFs
 BlfDT1GdpmXHS1Jmr2a/iSfnR7BHUNO9zeCln9QkVcq8bIMfH30eJmktZv2JL9mQv29F
 esTB0M8AkNV98uCgNwvtoOS3FVzKf7chwXVARlJOKfimZ6gormoxIGK6D6j6ljuliyli
 GHl4RpDacEZYd4t3Ij4EyJg5H/OvCdqHGQ7sD3+iAY3vqCR6SxQLMDzWkHyrMcQrffEQ
 EXAH38s8LoDwyDttcph3NeswyPnR0Nz83BKAHWF1ybzh1MN7CFRy6bAhH7H5OrgeQh6n
 YV0w==
X-Gm-Message-State: AOJu0YwP5ArqxDv+fA1r5H67x1G4aQVXRzaoKkPH3TQ96nYfZmV7c3NR
 EklMJ0fI7OzgGEhanMgRxZ+ZZap6f7xUEZ4Rr6v4vXTJopKffQ==
X-Google-Smtp-Source: AGHT+IGbt1e+pR2P4QEqeMw3LESunvWOQlob6lFyo/g9E4w/KtUrocg6tFGMJs3ATvLRSDA3oA6l2jqQSTVT2ZEAd34=
X-Received: by 2002:a05:690c:ec8:b0:5a7:af9d:53fd with SMTP id
 cs8-20020a05690c0ec800b005a7af9d53fdmr2259719ywb.9.1697804453584; Fri, 20 Oct
 2023 05:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230809211401.3587177-1-bernd@kuhls.net>
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 20 Oct 2023 14:20:42 +0200
Message-ID: <CAFSsvmp9KKuPZex2jGiqa=YrUNV3K0+NFcgNsun8vA9WVQkCaw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697804454; x=1698409254; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I5bQZtDR6AHErGX7Z9TJ8Upq54c9wmyPuihh8z+xInA=;
 b=mV3E8lxgS4QEgQkGayND3lihoNmB8myJqFyuH0tQHWKkgW00NxxnYkOHznQ5H33pIA
 3+4/FLlvPdO2Yj6IL0FDwX6aaaDteYm582exMBVHw9uU0WrlQsKNnz3X9HbPhiSVzuNf
 O8CeLKJXK0BqTzHGTpnlcedp/4YE2T28+1IJwMWIIxIGcSrNFq8KXxSyTFkprU/1Z2OS
 PJzEwJ5NHDK1MtoBxdIJ0Emi6HbAngmYGeNDNFKUt9WpuBdfdHvUn23c8cq1TMhY7QZK
 0gYDG/uFXlD7UISEhMd9NsrvFAJbLY5zL0Gui3GLaNq5uTa9nDCAumDxypY3lIhXCJ36
 RaOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mV3E8lxg
Subject: Re: [Buildroot] [PATCH/next v3 00/14] package/python3: Update
 infrastructure to disable the build of certain extensions
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3768881070473561643=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3768881070473561643==
Content-Type: multipart/alternative; boundary="0000000000005aa1b1060824e7cb"

--0000000000005aa1b1060824e7cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bernd;

Thanks for your incredibly talented hard work on this! Removing patches is
always fantastic!

Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Wed, Aug 9, 2023 at 11:14=E2=80=AFPM Bernd Kuhls <bernd@kuhls.net> wrote=
:

> Hi,
>
> python 3.12, currently at rc1, will remove toplevel setup.py
>
> https://github.com/python/cpython/commit/81dca70d704d0834d8c30580e648a973=
250b2973
> so our patches using DISABLED_EXTENSIONS need to be adjusted.
>
> Fortunately the build system of python 3.11 already contains a mechanism
> to en-/disable most modules so we can update the current package which
> will make the bump to 3.12 easier. In order remove our own code we need
> to backport three new patches from the 3.12 branch.
>
> Regards, Bernd
>
> v3: fixed tk patch
> v2: fixed bug in pyexpat patch, patched .checkpackageignore as well
>
> Bernd Kuhls (14):
>   package/python3: use upstream build system to disable berkeleydb
>     module
>   package/python3: use upstream build system to disable uuid module
>   package/python3: use upstream build system to disable bzip2/zlib/xz
>     modules
>   package/python3: use upstream build system to disable curses/readline
>     modules
>   package/python3: use upstream build system to disable ssl module
>   package/python3: use upstream build system to disable ossaudiodev
>     module
>   package/python3: use upstream build system to disable unicodedata
>     module
>   package/python3: use upstream build system to disable nis module
>   package/python3: use upstream build system to disable decimal module
>   package/python3: use upstream build system to disable CJK codecs
>   package/python3: use upstream build system to disable pyexpat module
>   package/python3: use upstream build system to disable sqlite3 module
>   package/python3: update patch and partly use upstream build system to
>     disable tk module
>   package/python3: Remove infrastructure to disable the build of certain
>     extensions
>
>  .checkpackageignore                           |  14 -
>  ...re-to-disable-the-build-of-certain-e.patch | 108 ---
>  ...-header-paths-for-cross-compilation.patch} |   0
>  ...ok-in-usr-lib-termcap-for-libraries.patch} |   0
>  ...h =3D> 0005-Don-t-add-multiarch-paths.patch} |   0
>  ...> 0006-Abort-on-failed-module-build.patch} |   0
>  ...tch =3D> 0007-Serial-ioctl-workaround.patch} |   0
>  ...-shebang-of-Python-scripts-for-cros.patch} |   0
>  ...g.sh.in-ensure-sed-invocations-only.patch} |   0
>  ...0010-Add-an-option-to-disable-pydoc.patch} |   0
>  ...11-Add-an-option-to-disable-lib2to3.patch} |   0
>  ... 0012-Add-an-option-to-disable-IDLE.patch} |   0
>  ...option-to-disable-the-sqlite3-module.patch |  62 --
>  ...hon-config.sh-don-t-reassign-prefix.patch} |   0
>  ...d-an-option-to-disable-the-tk-module.patch |  33 +-
>  ...-option-to-disable-the-curses-module.patch |  61 --
>  ...fix-building-on-older-distributions.patch} |   0
>  .../0016-Add-an-option-to-disable-expat.patch |  82 --
>  ...p-CC-print-multiarch-output-for-mus.patch} |   0
>  ...-Add-an-option-to-disable-CJK-codecs.patch |  30 -
>  ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
>  .../0018-Add-an-option-to-disable-NIS.patch   |  33 -
>  ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++
>  ...Add-an-option-to-disable-unicodedata.patch |  30 -
>  .../0019-Port-_ctypes-to-PY_STDLIB_MOD.patch  | 441 +++++++++++
>  ...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 ++++++++++++++++++
>  ...021-Add-an-option-to-disable-decimal.patch |  54 --
>  ...on-to-disable-the-ossaudiodev-module.patch |  30 -
>  ...an-option-to-disable-openssl-support.patch |  30 -
>  ...ption-to-disable-the-readline-module.patch |  30 -
>  ...to-disable-zlib-bzip2-and-xz-modules.patch |  42 -
>  ...Add-an-option-to-disable-uuid-module.patch |  33 -
>  ...ion-to-disable-the-berkeleydb-module.patch |  30 -
>  package/python3/python3.mk                    |  77 +-
>  34 files changed, 1512 insertions(+), 719 deletions(-)
>  delete mode 100644
> package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e=
.patch
>  rename
> package/python3/{0004-Adjust-library-header-paths-for-cross-compilation.p=
atch
> =3D> 0003-Adjust-library-header-paths-for-cross-compilation.patch} (100%)
>  rename
> package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch =
=3D>
> 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (100%)
>  rename package/python3/{0006-Don-t-add-multiarch-paths.patch =3D>
> 0005-Don-t-add-multiarch-paths.patch} (100%)
>  rename package/python3/{0007-Abort-on-failed-module-build.patch =3D>
> 0006-Abort-on-failed-module-build.patch} (100%)
>  rename package/python3/{0008-Serial-ioctl-workaround.patch =3D>
> 0007-Serial-ioctl-workaround.patch} (100%)
>  rename
> package/python3/{0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cro=
s.patch
> =3D> 0008-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (10=
0%)
>  rename
> package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invocations-onl=
y.patch
> =3D> 0009-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (10=
0%)
>  rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch =3D>
> 0010-Add-an-option-to-disable-pydoc.patch} (100%)
>  rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch =3D>
> 0011-Add-an-option-to-disable-lib2to3.patch} (100%)
>  rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch =3D>
> 0012-Add-an-option-to-disable-IDLE.patch} (100%)
>  delete mode 100644
> package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
>  rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.patc=
h
> =3D> 0013-python-config.sh-don-t-reassign-prefix.patch} (100%)
>  delete mode 100644
> package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
>  rename package/python3/{0028-fix-building-on-older-distributions.patch =
=3D>
> 0015-fix-building-on-older-distributions.patch} (100%)
>  delete mode 100644
> package/python3/0016-Add-an-option-to-disable-expat.patch
>  rename
> package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> =3D> 0016-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (10=
0%)
>  delete mode 100644
> package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
>  rename
> package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> =3D> 0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (10=
0%)
>  delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.pat=
ch
>  create mode 100644
> package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
>  delete mode 100644
> package/python3/0019-Add-an-option-to-disable-unicodedata.patch
>  create mode 100644
> package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
>  create mode 100644
> package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
>  delete mode 100644
> package/python3/0021-Add-an-option-to-disable-decimal.patch
>  delete mode 100644
> package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patc=
h
>  delete mode 100644
> package/python3/0023-Add-an-option-to-disable-openssl-support.patch
>  delete mode 100644
> package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
>  delete mode 100644
> package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.pat=
ch
>  delete mode 100644
> package/python3/0027-Add-an-option-to-disable-uuid-module.patch
>  delete mode 100644
> package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
>
> --
> 2.39.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005aa1b1060824e7cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bernd;<div><br></div><div>Thanks for your incredibly talen=
ted hard work on this! Removing patches is always fantastic!</div><div><br>=
</div><div>Reviewed-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.c=
om">aduskett@gmail.com</a>&gt;</div><div>Tested-by: Adam Duskett &lt;<a hre=
f=3D"mailto:aduskett@gmail.com">aduskett@gmail.com</a>&gt;=C2=A0</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On We=
d, Aug 9, 2023 at 11:14=E2=80=AFPM Bernd Kuhls &lt;<a href=3D"mailto:bernd@=
kuhls.net">bernd@kuhls.net</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi,<br>
<br>
python 3.12, currently at rc1, will remove toplevel setup.py<br>
<a href=3D"https://github.com/python/cpython/commit/81dca70d704d0834d8c3058=
0e648a973250b2973" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
python/cpython/commit/81dca70d704d0834d8c30580e648a973250b2973</a><br>
so our patches using DISABLED_EXTENSIONS need to be adjusted.<br>
<br>
Fortunately the build system of python 3.11 already contains a mechanism<br=
>
to en-/disable most modules so we can update the current package which<br>
will make the bump to 3.12 easier. In order remove our own code we need<br>
to backport three new patches from the 3.12 branch.<br>
<br>
Regards, Bernd<br>
<br>
v3: fixed tk patch<br>
v2: fixed bug in pyexpat patch, patched .checkpackageignore as well<br>
<br>
Bernd Kuhls (14):<br>
=C2=A0 package/python3: use upstream build system to disable berkeleydb<br>
=C2=A0 =C2=A0 module<br>
=C2=A0 package/python3: use upstream build system to disable uuid module<br=
>
=C2=A0 package/python3: use upstream build system to disable bzip2/zlib/xz<=
br>
=C2=A0 =C2=A0 modules<br>
=C2=A0 package/python3: use upstream build system to disable curses/readlin=
e<br>
=C2=A0 =C2=A0 modules<br>
=C2=A0 package/python3: use upstream build system to disable ssl module<br>
=C2=A0 package/python3: use upstream build system to disable ossaudiodev<br=
>
=C2=A0 =C2=A0 module<br>
=C2=A0 package/python3: use upstream build system to disable unicodedata<br=
>
=C2=A0 =C2=A0 module<br>
=C2=A0 package/python3: use upstream build system to disable nis module<br>
=C2=A0 package/python3: use upstream build system to disable decimal module=
<br>
=C2=A0 package/python3: use upstream build system to disable CJK codecs<br>
=C2=A0 package/python3: use upstream build system to disable pyexpat module=
<br>
=C2=A0 package/python3: use upstream build system to disable sqlite3 module=
<br>
=C2=A0 package/python3: update patch and partly use upstream build system t=
o<br>
=C2=A0 =C2=A0 disable tk module<br>
=C2=A0 package/python3: Remove infrastructure to disable the build of certa=
in<br>
=C2=A0 =C2=A0 extensions<br>
<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 -<br>
=C2=A0...re-to-disable-the-build-of-certain-e.patch | 108 ---<br>
=C2=A0...-header-paths-for-cross-compilation.patch} |=C2=A0 =C2=A00<br>
=C2=A0...ok-in-usr-lib-termcap-for-libraries.patch} |=C2=A0 =C2=A00<br>
=C2=A0...h =3D&gt; 0005-Don-t-add-multiarch-paths.patch} |=C2=A0 =C2=A00<br=
>
=C2=A0...&gt; 0006-Abort-on-failed-module-build.patch} |=C2=A0 =C2=A00<br>
=C2=A0...tch =3D&gt; 0007-Serial-ioctl-workaround.patch} |=C2=A0 =C2=A00<br=
>
=C2=A0...-shebang-of-Python-scripts-for-cros.patch} |=C2=A0 =C2=A00<br>
=C2=A0...g.sh.in-ensure-sed-invocations-only.patch} |=C2=A0 =C2=A00<br>
=C2=A0...0010-Add-an-option-to-disable-pydoc.patch} |=C2=A0 =C2=A00<br>
=C2=A0...11-Add-an-option-to-disable-lib2to3.patch} |=C2=A0 =C2=A00<br>
=C2=A0... 0012-Add-an-option-to-disable-IDLE.patch} |=C2=A0 =C2=A00<br>
=C2=A0...option-to-disable-the-sqlite3-module.patch |=C2=A0 62 --<br>
=C2=A0...hon-config.sh-don-t-reassign-prefix.patch} |=C2=A0 =C2=A00<br>
=C2=A0...d-an-option-to-disable-the-tk-module.patch |=C2=A0 33 +-<br>
=C2=A0...-option-to-disable-the-curses-module.patch |=C2=A0 61 --<br>
=C2=A0...fix-building-on-older-distributions.patch} |=C2=A0 =C2=A00<br>
=C2=A0.../0016-Add-an-option-to-disable-expat.patch |=C2=A0 82 --<br>
=C2=A0...p-CC-print-multiarch-output-for-mus.patch} |=C2=A0 =C2=A00<br>
=C2=A0...-Add-an-option-to-disable-CJK-codecs.patch |=C2=A0 30 -<br>
=C2=A0...ng-doesn-t-set-errno-when-encryptio.patch} |=C2=A0 =C2=A00<br>
=C2=A0.../0018-Add-an-option-to-disable-NIS.patch=C2=A0 =C2=A0|=C2=A0 33 -<=
br>
=C2=A0...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++<br>
=C2=A0...Add-an-option-to-disable-unicodedata.patch |=C2=A0 30 -<br>
=C2=A0.../0019-Port-_ctypes-to-PY_STDLIB_MOD.patch=C2=A0 | 441 +++++++++++<=
br>
=C2=A0...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 +++++++++++++++++=
+<br>
=C2=A0...021-Add-an-option-to-disable-decimal.patch |=C2=A0 54 --<br>
=C2=A0...on-to-disable-the-ossaudiodev-module.patch |=C2=A0 30 -<br>
=C2=A0...an-option-to-disable-openssl-support.patch |=C2=A0 30 -<br>
=C2=A0...ption-to-disable-the-readline-module.patch |=C2=A0 30 -<br>
=C2=A0...to-disable-zlib-bzip2-and-xz-modules.patch |=C2=A0 42 -<br>
=C2=A0...Add-an-option-to-disable-uuid-module.patch |=C2=A0 33 -<br>
=C2=A0...ion-to-disable-the-berkeleydb-module.patch |=C2=A0 30 -<br>
=C2=A0package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">python3.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 77 +-<br>
=C2=A034 files changed, 1512 insertions(+), 719 deletions(-)<br>
=C2=A0delete mode 100644 package/python3/0003-Add-infrastructure-to-disable=
-the-build-of-certain-e.patch<br>
=C2=A0rename package/python3/{0004-Adjust-library-header-paths-for-cross-co=
mpilation.patch =3D&gt; 0003-Adjust-library-header-paths-for-cross-compilat=
ion.patch} (100%)<br>
=C2=A0rename package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-librar=
ies.patch =3D&gt; 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (=
100%)<br>
=C2=A0rename package/python3/{0006-Don-t-add-multiarch-paths.patch =3D&gt; =
0005-Don-t-add-multiarch-paths.patch} (100%)<br>
=C2=A0rename package/python3/{0007-Abort-on-failed-module-build.patch =3D&g=
t; 0006-Abort-on-failed-module-build.patch} (100%)<br>
=C2=A0rename package/python3/{0008-Serial-ioctl-workaround.patch =3D&gt; 00=
07-Serial-ioctl-workaround.patch} (100%)<br>
=C2=A0rename package/python3/{0009-Do-not-adjust-the-shebang-of-Python-scri=
pts-for-cros.patch =3D&gt; 0008-Do-not-adjust-the-shebang-of-Python-scripts=
-for-cros.patch} (100%)<br>
=C2=A0rename package/python3/{0010-Misc-python-config.sh.in-ensure-sed-invo=
cations-only.patch =3D&gt; 0009-Misc-python-config.sh.in-ensure-sed-invocat=
ions-only.patch} (100%)<br>
=C2=A0rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch =3D=
&gt; 0010-Add-an-option-to-disable-pydoc.patch} (100%)<br>
=C2=A0rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch =
=3D&gt; 0011-Add-an-option-to-disable-lib2to3.patch} (100%)<br>
=C2=A0rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch =3D&=
gt; 0012-Add-an-option-to-disable-IDLE.patch} (100%)<br>
=C2=A0delete mode 100644 package/python3/0013-Add-option-to-disable-the-sql=
ite3-module.patch<br>
=C2=A0rename package/python3/{0026-python-config.sh-don-t-reassign-prefix.p=
atch =3D&gt; 0013-python-config.sh-don-t-reassign-prefix.patch} (100%)<br>
=C2=A0delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-=
curses-module.patch<br>
=C2=A0rename package/python3/{0028-fix-building-on-older-distributions.patc=
h =3D&gt; 0015-fix-building-on-older-distributions.patch} (100%)<br>
=C2=A0delete mode 100644 package/python3/0016-Add-an-option-to-disable-expa=
t.patch<br>
=C2=A0rename package/python3/{0029-configure.ac-fixup-CC-print-multiarch-ou=
tput-for-mus.patch =3D&gt; 0016-configure.ac-fixup-CC-print-multiarch-outpu=
t-for-mus.patch} (100%)<br>
=C2=A0delete mode 100644 package/python3/0017-Add-an-option-to-disable-CJK-=
codecs.patch<br>
=C2=A0rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-wh=
en-encryptio.patch =3D&gt; 0017-lib-crypt-uClibc-ng-doesn-t-set-errno-when-=
encryptio.patch} (100%)<br>
=C2=A0delete mode 100644 package/python3/0018-Add-an-option-to-disable-NIS.=
patch<br>
=C2=A0create mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB=
_MOD.patch<br>
=C2=A0delete mode 100644 package/python3/0019-Add-an-option-to-disable-unic=
odedata.patch<br>
=C2=A0create mode 100644 package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD=
.patch<br>
=C2=A0create mode 100644 package/python3/0020-Port-readline-and-curses-to-P=
Y_STDLIB_MOD.patch<br>
=C2=A0delete mode 100644 package/python3/0021-Add-an-option-to-disable-deci=
mal.patch<br>
=C2=A0delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-=
ossaudiodev-module.patch<br>
=C2=A0delete mode 100644 package/python3/0023-Add-an-option-to-disable-open=
ssl-support.patch<br>
=C2=A0delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-=
readline-module.patch<br>
=C2=A0delete mode 100644 package/python3/0025-Add-options-to-disable-zlib-b=
zip2-and-xz-modules.patch<br>
=C2=A0delete mode 100644 package/python3/0027-Add-an-option-to-disable-uuid=
-module.patch<br>
=C2=A0delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-=
berkeleydb-module.patch<br>
<br>
-- <br>
2.39.2<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000005aa1b1060824e7cb--

--===============3768881070473561643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3768881070473561643==--
