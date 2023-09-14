Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A425EDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 10:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25705409E1;
	Thu, 14 Sep 2023 10:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25705409E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKT69aP5ZhR7; Thu, 14 Sep 2023 10:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 396A7405F6;
	Thu, 14 Sep 2023 10:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 396A7405F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD70A1BF377
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 10:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 884F8405F6
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 10:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 884F8405F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBvoEbff_eNC for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 10:15:39 +0000 (UTC)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F11040468
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 10:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F11040468
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-575f45e255dso431673eaf.2
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694686538; x=1695291338;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xQiOuhfazmW3B4CzlD/oYrMnC6azHJ5/Xbe22+2+lmg=;
 b=QKFSDBgXqcVNIKJbeqlIMvGe8hA6xoHyUuw46Nx8lfV7uC9oRUG/XITiwFwIZ/RZVO
 SSPBtfXgbPFivMKLKZsBzeLBAQJtZSJ2XBKvOKvzZL2DYfWlKRXWCvcb/vCJbYkLCHZ9
 UOcwh5Su/goL2l/PBp/R74pckvOWu/GTXXTFtMSp0LgoeQz3+HmeL8KGQ1JC1ieRkmEl
 haoc1J2I1cq3mhofR1mT07/PYmP5IHtF44vDRclLLFx7WiUPLfOVgFCiMKbOUomL6Kva
 YgsR4VQHPE8Uwd2P6RP6iRiIBfQd9gbQTuxyOpjBhon703qqfy1jiKXT98+bgEvgvaDC
 cuEA==
X-Gm-Message-State: AOJu0YzaD+hCdCsKcABFWnbBrwxeIleK1pROX2Yn6Ot9tUWHmGmxyTkO
 +IhHWEcnGEiDPzp2+xXPAM52TLxhBifOuuZuGXuIKQGp2kQ=
X-Google-Smtp-Source: AGHT+IHtR9wexfj0gzRFNfVvUSbPf9FezrVfud45I+XOWFB5pdXljL+EbNwU+cJ5v4bCfF4UgeIk+ezXsSvZnIoHGs4=
X-Received: by 2002:a05:6871:431a:b0:1d6:4641:8d8b with SMTP id
 lu26-20020a056871431a00b001d646418d8bmr322160oab.58.1694686537996; Thu, 14
 Sep 2023 03:15:37 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 14 Sep 2023 12:15:27 +0200
Message-ID: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694686538; x=1695291338; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xQiOuhfazmW3B4CzlD/oYrMnC6azHJ5/Xbe22+2+lmg=;
 b=GG0vXC4iZ7KpLxDVmsAxwKRKZoPTtCACWH/DjUC5HS2v3akTIU/D6MYkd/YxXwTn/3
 PuC9f019Y9IQOOizmA191fldIs2XNF8akmCgGE2WnVvC0aQkcRpeWb8LtqzAxgfXnPzE
 YcWIs9Ax8Yxhs8j+/cG5C6bT5n+dT4VX30fuP4Qr27flPglcwZyZZKI+AMvoprJGBEUM
 9d9W77foL7XUFBE3zT6/0sPLn+yiwHFm2wx3L89SO3IceLovP1UvPY6hy4rEC8v9uygA
 ilvZcbOe2mIJRmZdn7DAWsXf8B4FSZLqFWZpnZOzWflDYwedpkBV0088y2N1qalfDM3w
 MxBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GG0vXC4i
Subject: [Buildroot] Error linking against target architecture while
 building new package
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
Content-Type: multipart/mixed; boundary="===============5067199419232853447=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5067199419232853447==
Content-Type: multipart/alternative; boundary="0000000000001a5e6006054ef58b"

--0000000000001a5e6006054ef58b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to build a new Buildroot package for i.MX Neural Networks
Accelerator Plugin <https://github.com/nxp-imx/nn-imx/tree/imx_1.3.0> . The
imx-nn-accelerator.mk :
#############################################################
#
# i.MX Neural Networks Accelerator Plugin
#
#############################################################

IMX_NN_ACCELERATOR_VERSION = lf-5.15.71-2.2.1
IMX_NN_ACCELERATOR_SOURCE = $(IMX_NN_ACCELERATOR_VERSION).tar.gz
IMX_NN_ACCELERATOR_SITE =
https://github.com/nxp-imx/nn-imx/archive/refs/tags
IMX_NN_ACCELERATOR_LICENSE = MIT
IMX_NN_ACCELERATOR_LICENSE_FILES = LICENSE
IMX_NN_ACCELERATOR_DEPENDENCIES = imx-gpu-viv

PKG_NAME = imx-nn-accelerator
PKG_VERSION = lf-5.15.71-2.2.1

define IMX_NN_ACCELERATOR_BUILD_CMDS
    $(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) \
        SDKTARGETSYSROOT=$(STAGING_DIR) \
        AQROOT=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
endef

define IMX_NN_ACCELERATOR_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0644 $(@D)/libneuralnetworks*.so*
$(TARGET_DIR)/usr/lib/
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/include/OVXLIB
    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/include/nnrt
    cp -r $(@D)/include/OVXLIB/* $(TARGET_DIR)/usr/include/OVXLIB/
    cp -r $(@D)/include/nnrt/* $(TARGET_DIR)/usr/include/nnrt/
endef

$(eval $(generic-package))

This is already integrated in Yocto nn-imx_1.3.0.bb
<https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/nn-imx/nn-imx_1.3.0.bb>
and I am trying to replicate the same in Buildroot. But while building this
is giving the error:

/usr/bin/make -j17 LDFLAGS="" -C
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
SDKTARGETSYSROOT=/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot
AQROOT=/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
  LINK    libovxlib.so.1.1.0
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
when searching for -lOpenVX
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
when searching for -lOpenVX
/usr/bin/ld: cannot find -lOpenVX
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
when searching for -lOpenVXU
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
when searching for -lOpenVXU
/usr/bin/ld: cannot find -lOpenVXU
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
when searching for -lCLC
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
when searching for -lCLC
/usr/bin/ld: cannot find -lCLC
/usr/bin/ld: skipping incompatible
/build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libVSC.so
when searching for -lVSC

It looks like it is failing to link against the target architecture..
(LDFLAGS variable is empty)

Can anyone please let me know what is missing in makefile and how to
resolve this?

Thanks in advance

--0000000000001a5e6006054ef58b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>I am trying to build a new B=
uildroot package for=C2=A0<a href=3D"https://github.com/nxp-imx/nn-imx/tree=
/imx_1.3.0">i.MX Neural Networks Accelerator Plugin</a>=C2=A0. The=C2=A0<a =
href=3D"http://imx-nn-accelerator.mk">imx-nn-accelerator.mk</a> :=C2=A0</di=
v><div>#############################################################<br>#<b=
r># i.MX Neural Networks Accelerator Plugin<br>#<br>#######################=
######################################<br><br>IMX_NN_ACCELERATOR_VERSION =
=3D lf-5.15.71-2.2.1<br>IMX_NN_ACCELERATOR_SOURCE =3D $(IMX_NN_ACCELERATOR_=
VERSION).tar.gz<br>IMX_NN_ACCELERATOR_SITE =3D <a href=3D"https://github.co=
m/nxp-imx/nn-imx/archive/refs/tags">https://github.com/nxp-imx/nn-imx/archi=
ve/refs/tags</a><br>IMX_NN_ACCELERATOR_LICENSE =3D MIT<br>IMX_NN_ACCELERATO=
R_LICENSE_FILES =3D LICENSE<br>IMX_NN_ACCELERATOR_DEPENDENCIES =3D imx-gpu-=
viv<br><br>PKG_NAME =3D imx-nn-accelerator<br>PKG_VERSION =3D lf-5.15.71-2.=
2.1<br><br>define IMX_NN_ACCELERATOR_BUILD_CMDS<br>=C2=A0 =C2=A0 $(MAKE) LD=
FLAGS=3D&quot;$(TARGET_LDFLAGS)&quot; -C $(@D) \<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SDKTARGETSYSROOT=3D$(STAGING_DIR) \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
QROOT=3D$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)<br>endef<br><br>define IMX_=
NN_ACCELERATOR_INSTALL_TARGET_CMDS<br>=C2=A0 =C2=A0 $(INSTALL) -D -m 0644 $=
(@D)/libneuralnetworks*.so* $(TARGET_DIR)/usr/lib/<br>=C2=A0 =C2=A0 $(INSTA=
LL) -d -m 0755 $(TARGET_DIR)/usr/include/OVXLIB<br>=C2=A0 =C2=A0 $(INSTALL)=
 -d -m 0755 $(TARGET_DIR)/usr/include/nnrt<br>=C2=A0 =C2=A0 cp -r $(@D)/inc=
lude/OVXLIB/* $(TARGET_DIR)/usr/include/OVXLIB/<br>=C2=A0 =C2=A0 cp -r $(@D=
)/include/nnrt/* $(TARGET_DIR)/usr/include/nnrt/<br>endef<br><br>$(eval $(g=
eneric-package))<br></div><div><br></div><div>This is already integrated in=
 Yocto=C2=A0<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77d=
e06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/nn-imx/nn-imx_1.3.0=
.bb">nn-imx_1.3.0.bb</a> and I am trying to replicate the same in Buildroot=
. But while building this is giving the error:</div><div><br></div><div>/us=
r/bin/make -j17 LDFLAGS=3D&quot;&quot; -C /.../build/imx-nn-accelerator-lf-=
5.15.71-2.2.1 SDKTARGETSYSROOT=3D/.../per-package/imx-nn-accelerator/host/a=
arch64-buildroot-linux-gnu/sysroot AQROOT=3D/.../build/imx-nn-accelerator-l=
f-5.15.71-2.2.1<br></div><div>=C2=A0 LINK =C2=A0 =C2=A0libovxlib.so.1.1.0<b=
r>/usr/bin/ld: skipping incompatible /build/per-package/imx-nn-accelerator/=
host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so when searchin=
g for -lOpenVX<br>/usr/bin/ld: skipping incompatible /build/per-package/imx=
-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.=
so when searching for -lOpenVX<br>/usr/bin/ld: cannot find -lOpenVX<br>/usr=
/bin/ld: skipping incompatible /build/per-package/imx-nn-accelerator/host/a=
arch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so when searching for=
 -lOpenVXU<br>/usr/bin/ld: skipping incompatible /build/per-package/imx-nn-=
accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so =
when searching for -lOpenVXU<br>/usr/bin/ld: cannot find -lOpenVXU<br>/usr/=
bin/ld: skipping incompatible /build/per-package/imx-nn-accelerator/host/aa=
rch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so when searching for -lCL=
C<br>/usr/bin/ld: skipping incompatible /build/per-package/imx-nn-accelerat=
or/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so when searchin=
g for -lCLC<br>/usr/bin/ld: cannot find -lCLC<br>/usr/bin/ld: skipping inco=
mpatible /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux=
-gnu/sysroot/usr/lib/libVSC.so when searching for -lVSC<br></div><div><br><=
/div><div>It looks like it is failing to link against the target architectu=
re.. (LDFLAGS variable is empty)</div><div><br></div><div>Can anyone please=
 let me know what is missing in makefile and how to resolve this?</div><div=
><br></div><div>Thanks in advance</div><div><br></div></div>

--0000000000001a5e6006054ef58b--

--===============5067199419232853447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5067199419232853447==--
