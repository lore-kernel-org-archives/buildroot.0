Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E59BC43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 23:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BCA141061;
	Sun,  3 Jul 2022 23:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCA141061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-48H129fP2x; Sun,  3 Jul 2022 23:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A154E409BE;
	Sun,  3 Jul 2022 23:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A154E409BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1112E1BF215
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 23:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6A63409BE
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 23:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A63409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8R9x3DRBuxE for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 23:25:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 560664099F
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 560664099F
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 23:25:27 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id e80so6783873ybb.4
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 16:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=16Z7sgQ+nAEo1KBZ5xC4Ic7pP00+dep6g5lwSBnBHKQ=;
 b=yviYLAXybJyvdSFKJ1kw3J9dlZP51Y8tAG1Yl0S4q1zbkZl+BHOgw/+CS6Wk1q1RTJ
 JWiP+7j+JcLoJStDqltcrlBwreG/FCb5nGMp5x89jNoRxZhlfVQewtVukCsIu3MJz+tX
 GqN5anmSVUY/kBOebW7/u9sJxnwUsNITNMuaiXpEG9p7N/MZEfaCfHUGOGnTgEJMnWm3
 d8WZF6fDUW37uXOLKuEgiiYjaPIVkvNuqhzB8pc9727+ks0mIIGJIK6BMiIoGTZ4iLUy
 rk1FsHxHDwT1anvNJ7wC3hF7Efil5oxkwQqZVDFOPNkH5zQOO1uBq35rzd8tNcBuYQc4
 9WQg==
X-Gm-Message-State: AJIora9561mCFCxfBrEFxMwaGlX5nzJqyTYK/Vc6Np95O1P1QZJoYhmT
 OIF6zJ2jPQC9Bj4LtB160tm4eWJgGRkoq4Nu6KZKk+G/WBYN0w==
X-Google-Smtp-Source: AGRyM1vvuair1ATzNkiwdX5Xsw2gN1F7xv9teBJOJPTcYb5YCZ1mGGktqalW/9GP1B3w8Yf83NWIW2rKuHqZg6GunKs=
X-Received: by 2002:a05:6902:70d:b0:66d:5d26:6502 with SMTP id
 k13-20020a056902070d00b0066d5d266502mr29495351ybt.556.1656890725961; Sun, 03
 Jul 2022 16:25:25 -0700 (PDT)
MIME-Version: 1.0
From: Abel Bernabeu <abel@x-silicon.com>
Date: Mon, 4 Jul 2022 01:25:15 +0200
Message-ID: <CAF2ART8VPT7JNXMOOPsDVrKD89JGhjkfrAGZs-eyxo-aQb=7NQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=16Z7sgQ+nAEo1KBZ5xC4Ic7pP00+dep6g5lwSBnBHKQ=;
 b=ISVfen0XOKMCrm9rae71suD19T64kmC6kA0wxauy1kqrK0RQ2jUnWIPYLDSgmarjbJ
 H4ETe9Zs1N0zXt/I6HLQ9mYn/+27qhRjN9Rvsi4Snh25mhIDZCl9htIGx2MBaJPM7Sq6
 pPFODtHqWKrETrMbnIYcuP7T41NGkvyMQNCecAX3LwG94PPXQZijcS+Gn4Gzvoudro55
 LTXMopmRqhmtLgG30sfIueFFAQTLbRehOrcipUWPUDZELVMQGsigZO4Flv1iSS0YIZ3g
 YPifq45R3aIfIquPJCa9pmHP6Ps5xwG+g6R/Na6ftM5w/AmbS+a61caSZvAGwiGVmT6F
 QI6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=x-silicon-com.20210112.gappssmtp.com
 header.i=@x-silicon-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ISVfen0X
Subject: [Buildroot] [PATCH 1/2] package/llvm: Support for RISC-V on the
 LLVM package
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
Content-Type: multipart/mixed; boundary="===============0675485163675043468=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0675485163675043468==
Content-Type: multipart/alternative; boundary="000000000000272a7505e2eeefa8"

--000000000000272a7505e2eeefa8
Content-Type: text/plain; charset="UTF-8"

From 254bc67341f9180a1068551a5beeeaab0be06301 Mon Sep 17 00:00:00 2001
From: Abel Bernabeu <abel@x-silicon.com>
Date: Mon, 4 Jul 2022 00:32:47 +0200
Subject: [PATCH 1/2] package/llvm: Support for RISC-V on the LLVM package

The initial support for the LLVM package did not include RISC-V, and
needed to be added.

There is a new configuration parameter added
(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD) for dealing with the fact that
the LLVM target and the architecture have different naming for RISC-V.
While the target for RISC-V is "RISCV" irrespective of the ISA being
32 or 64 bits, the architecture does contain the number of bits
leading to "riscv32" and "riscv64".

For previously supported architectures the naming for target and
architecture matched and thus this parameter had not been needed, but
it is now needed for RISC-V.
---
 package/llvm/Config.in | 10 ++++++++++
 package/llvm/llvm.mk   |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index c1887e36dd..5f2864b802 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -4,12 +4,22 @@ config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
        default y if BR2_x86_64
        default y if BR2_aarch64
        default y if BR2_arm || BR2_armeb
+       default y if BR2_riscv

 config BR2_PACKAGE_LLVM_TARGET_ARCH
        string
        default "AArch64" if BR2_aarch64
        default "ARM" if BR2_arm || BR2_armeb
        default "X86" if BR2_i386 || BR2_x86_64
+       default "riscv32" if BR2_riscv && !BR2_ARCH_IS_64
+        default "riscv64" if BR2_riscv && BR2_ARCH_IS_64
+
+config BR2_PACKAGE_LLVM_TARGETS_TO_BUILD
+       string
+       default "AArch64" if BR2_aarch64
+       default "ARM" if BR2_arm || BR2_armeb
+       default "X86" if BR2_i386 || BR2_x86_64
+       default "RISCV" if BR2_riscv

 config BR2_PACKAGE_LLVM
        bool "llvm"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4670773ca3..dbf1f7b813 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -42,7 +42,7 @@ HOST_LLVM_CONF_OPTS +=
-DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))

 # Build backend for target architecture. This include backends like AMDGPU.
-LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
+LLVM_TARGETS_TO_BUILD = $(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD)
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst
$(space),;,$(LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst
$(space),;,$(LLVM_TARGETS_TO_BUILD))"

-- 
2.25.1

--000000000000272a7505e2eeefa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 254bc67341f9180a1068551a5beeeaab0be06301 Mon Sep 17 0=
0:00:00 2001<br>From: Abel Bernabeu &lt;<a href=3D"mailto:abel@x-silicon.co=
m">abel@x-silicon.com</a>&gt;<br>Date: Mon, 4 Jul 2022 00:32:47 +0200<br>Su=
bject: [PATCH 1/2] package/llvm: Support for RISC-V on the LLVM package<br>=
<br>The initial support for the LLVM package did not include RISC-V, and<br=
>needed to be added.<br><br>There is a new configuration parameter added<br=
>(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD) for dealing with the fact that<br>the =
LLVM target and the architecture have different naming for RISC-V.<br>While=
 the target for RISC-V is &quot;RISCV&quot; irrespective of the ISA being<b=
r>32 or 64 bits, the architecture does contain the number of bits<br>leadin=
g to &quot;riscv32&quot; and &quot;riscv64&quot;.<br><br>For previously sup=
ported architectures the naming for target and<br>architecture matched and =
thus this parameter had not been needed, but<br>it is now needed for RISC-V=
.<br>---<br>=C2=A0package/llvm/Config.in | 10 ++++++++++<br>=C2=A0package/l=
lvm/<a href=3D"http://llvm.mk">llvm.mk</a> =C2=A0 | =C2=A02 +-<br>=C2=A02 f=
iles changed, 11 insertions(+), 1 deletion(-)<br><br>diff --git a/package/l=
lvm/Config.in b/package/llvm/Config.in<br>index c1887e36dd..5f2864b802 1006=
44<br>--- a/package/llvm/Config.in<br>+++ b/package/llvm/Config.in<br>@@ -4=
,12 +4,22 @@ config BR2_PACKAGE_LLVM_ARCH_SUPPORTS<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 default y if BR2_x86_64<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if =
BR2_aarch64<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_arm || BR2_arme=
b<br>+ =C2=A0 =C2=A0 =C2=A0 default y if BR2_riscv<br>=C2=A0<br>=C2=A0confi=
g BR2_PACKAGE_LLVM_TARGET_ARCH<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;AArch64&quot; if BR2_aarch64<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;ARM&quot; if BR2_arm || BR2_armeb<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;X86&quot; if BR2_i386 || BR2_x86=
_64<br>+ =C2=A0 =C2=A0 =C2=A0 default &quot;riscv32&quot; if BR2_riscv &amp=
;&amp; !BR2_ARCH_IS_64<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;riscv6=
4&quot; if BR2_riscv &amp;&amp; BR2_ARCH_IS_64<br>+<br>+config BR2_PACKAGE_=
LLVM_TARGETS_TO_BUILD<br>+ =C2=A0 =C2=A0 =C2=A0 string<br>+ =C2=A0 =C2=A0 =
=C2=A0 default &quot;AArch64&quot; if BR2_aarch64<br>+ =C2=A0 =C2=A0 =C2=A0=
 default &quot;ARM&quot; if BR2_arm || BR2_armeb<br>+ =C2=A0 =C2=A0 =C2=A0 =
default &quot;X86&quot; if BR2_i386 || BR2_x86_64<br>+ =C2=A0 =C2=A0 =C2=A0=
 default &quot;RISCV&quot; if BR2_riscv<br>=C2=A0<br>=C2=A0config BR2_PACKA=
GE_LLVM<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;llvm&quot;<br>diff --git =
a/package/llvm/<a href=3D"http://llvm.mk">llvm.mk</a> b/package/llvm/<a hre=
f=3D"http://llvm.mk">llvm.mk</a><br>index 4670773ca3..dbf1f7b813 100644<br>=
--- a/package/llvm/<a href=3D"http://llvm.mk">llvm.mk</a><br>+++ b/package/=
llvm/<a href=3D"http://llvm.mk">llvm.mk</a><br>@@ -42,7 +42,7 @@ HOST_LLVM_=
CONF_OPTS +=3D -DCMAKE_INSTALL_RPATH=3D&quot;$(HOST_DIR)/lib&quot;<br>=C2=
=A0LLVM_TARGET_ARCH =3D $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))<br>=
=C2=A0<br>=C2=A0# Build backend for target architecture. This include backe=
nds like AMDGPU.<br>-LLVM_TARGETS_TO_BUILD =3D $(LLVM_TARGET_ARCH)<br>+LLVM=
_TARGETS_TO_BUILD =3D $(BR2_PACKAGE_LLVM_TARGETS_TO_BUILD)<br>=C2=A0HOST_LL=
VM_CONF_OPTS +=3D -DLLVM_TARGETS_TO_BUILD=3D&quot;$(subst $(space),;,$(LLVM=
_TARGETS_TO_BUILD))&quot;<br>=C2=A0LLVM_CONF_OPTS +=3D -DLLVM_TARGETS_TO_BU=
ILD=3D&quot;$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))&quot;<br>=C2=A0<br=
>-- <br>2.25.1<br></div>

--000000000000272a7505e2eeefa8--

--===============0675485163675043468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0675485163675043468==--
