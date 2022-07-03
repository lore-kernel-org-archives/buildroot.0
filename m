Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C7C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 23:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F7B9410C2;
	Sun,  3 Jul 2022 23:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7B9410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yT0-23eaA57w; Sun,  3 Jul 2022 23:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 080C7409BE;
	Sun,  3 Jul 2022 23:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080C7409BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AAFE1BF215
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 23:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B47409FC
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 23:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B47409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uueUCm2DLJt for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 23:26:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11435409BE
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11435409BE
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 23:26:19 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id r3so14023659ybr.6
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 16:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FpTpM5cg+LppQin8G4TEGwveQN0cqVRDwiEygV/Mo0g=;
 b=FKGtGfZjAIQ+FsK3yCmkYhsObOdRyghjb6za5p+oiTZl2oz7H+495VIJWSLr/hBk2O
 RAycwNLkayr3VQJ/AmjC/6jJ8ofktuS7V5LRT5EnU7rPPbHMRTn4c6EcVy//e8ouTjl9
 Q4cNZPZ8+kGaz6GUyW2h7bt+inU6Mib8piJIq97vsk5Cogx6G6vX8wEf5lqLF/GKLGIM
 SCg49FoJgFUU8b7qZQ+IIkgXXtFuAehGd/dZ6z7TjmbkuwbUFXivrdbLjmVm1L+/Yc7s
 JsMwd0W73R8l5ntZrIUYiKp3WlaRjOrS6RGkyzvgtZnu9j2kqoUGX+6jMI88pDy4khAH
 hDHA==
X-Gm-Message-State: AJIora+OXIEhfbY78n2oPG+ddndVzEShJ8ybagBMRxaYajxxu6ys5NFs
 DZNNxB8OEI6dLvmDCBog/AHdbrUsupnvxrUroULG0ezhMsC9Wg==
X-Google-Smtp-Source: AGRyM1vQjXe02ijsbxORuDeb+TK4H8IKsMP0n+0xi6cPfkXlyppuw7ULWBwncRFI1GBPQAbm9sAkBfnHUwW9Jkd4ruE=
X-Received: by 2002:a25:b90b:0:b0:664:a584:faf5 with SMTP id
 x11-20020a25b90b000000b00664a584faf5mr27210319ybj.144.1656890777950; Sun, 03
 Jul 2022 16:26:17 -0700 (PDT)
MIME-Version: 1.0
From: Abel Bernabeu <abel@x-silicon.com>
Date: Mon, 4 Jul 2022 01:26:07 +0200
Message-ID: <CAF2ART_=XUWL8bgtdV7vUgz5SQJXVyBAAS0ixcYLVbaaA++_4w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=x-silicon-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=FpTpM5cg+LppQin8G4TEGwveQN0cqVRDwiEygV/Mo0g=;
 b=cuNxWAm254jclCqvNUZV23k6/lcLndEYpnf9krO78oDtW+zR9Vvi4Yd9evQHIQ49Ff
 Fp9YrHIKHPs7R1YtbijI5o62gS6db6msu79j9DFjmAda+PwBFiYqHw5FlPReubeap3uM
 NnSNZ/5+7AyqbRf62OEXYI3KEQgYvpY1I151EnDu6RIUlVF73Gmhw1Ssnk2QZCnUmPbn
 yWSGMEeh5ZyZVpVDfQET2XOkRgX6HiQd/nmgyOQMdNgqf/TSnp90+dj5PhWhp0xM592i
 s/wGKMzmHcFND+L5DhPeJavr3QsMR4DCAm8j3IFgayHlrytLzwAH31NYgQvpDHE6s1+G
 Qk4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=x-silicon-com.20210112.gappssmtp.com
 header.i=@x-silicon-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cuNxWAm2
Subject: [Buildroot] [PATCH 2/2] arch/riscv: Added support for RISC-V vector
 extension on the architecture menu.
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
Content-Type: multipart/mixed; boundary="===============7296368764346417844=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7296368764346417844==
Content-Type: multipart/alternative; boundary="00000000000040703e05e2eef2a1"

--00000000000040703e05e2eef2a1
Content-Type: text/plain; charset="UTF-8"

From d8f288513e88cfb7f78f090ad0c02e6122a99097 Mon Sep 17 00:00:00 2001
From: Abel Bernabeu <abel@x-silicon.com>
Date: Mon, 4 Jul 2022 00:41:09 +0200
Subject: [PATCH 2/2] arch/riscv: Added support for RISC-V vector extension
on
 the architecture menu.

This new setting will allow to test new toolchains already available
that support the vector extension (more patches coming soon).
---
 arch/Config.in.riscv | 7 +++++++
 arch/arch.mk.riscv   | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 288ed833eb..e4dc936cf8 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
        bool

+config BR2_RISCV_ISA_RVV
+       bool
+
 choice
        prompt "Target Architecture Variant"
        default BR2_riscv_g
@@ -63,6 +66,10 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
        bool "Compressed Instructions (C)"
        select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+       bool "Vector Instructions (V)"
+       select BR2_RISCV_ISA_RVV
 endif

 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..07a94aa6a4 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,5 +26,9 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif
+

 endif
-- 
2.25.1

--00000000000040703e05e2eef2a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From d8f288513e88cfb7f78f090ad0c02e6122a99097 Mon Sep 17 0=
0:00:00 2001<br>From: Abel Bernabeu &lt;<a href=3D"mailto:abel@x-silicon.co=
m">abel@x-silicon.com</a>&gt;<br>Date: Mon, 4 Jul 2022 00:41:09 +0200<br>Su=
bject: [PATCH 2/2] arch/riscv: Added support for RISC-V vector extension on=
<br>=C2=A0the architecture menu.<br><br>This new setting will allow to test=
 new toolchains already available<br>that support the vector extension (mor=
e patches coming soon).<br>---<br>=C2=A0arch/Config.in.riscv | 7 +++++++<br=
>=C2=A0arch/arch.mk.riscv =C2=A0 | 4 ++++<br>=C2=A02 files changed, 11 inse=
rtions(+)<br><br>diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv<b=
r>index 288ed833eb..e4dc936cf8 100644<br>--- a/arch/Config.in.riscv<br>+++ =
b/arch/Config.in.riscv<br>@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD<br>=C2=
=A0config BR2_RISCV_ISA_RVC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>=C2=A0<b=
r>+config BR2_RISCV_ISA_RVV<br>+ =C2=A0 =C2=A0 =C2=A0 bool<br>+<br>=C2=A0ch=
oice<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 prompt &quot;Target Architecture Varian=
t&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 default BR2_riscv_g<br>@@ -63,6 +66,=
10 @@ config BR2_RISCV_ISA_CUSTOM_RVD<br>=C2=A0config BR2_RISCV_ISA_CUSTOM_=
RVC<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Compressed Instructions (C)&q=
uot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_RISCV_ISA_RVC<br>+<br>+confi=
g BR2_RISCV_ISA_CUSTOM_RVV<br>+ =C2=A0 =C2=A0 =C2=A0 bool &quot;Vector Inst=
ructions (V)&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 select BR2_RISCV_ISA_RVV<br>=
=C2=A0endif<br>=C2=A0<br>=C2=A0choice<br>diff --git a/arch/arch.mk.riscv b/=
arch/arch.mk.riscv<br>index f3bf2b3467..07a94aa6a4 100644<br>--- a/arch/arc=
h.mk.riscv<br>+++ b/arch/arch.mk.riscv<br>@@ -26,5 +26,9 @@ endif<br>=C2=A0=
ifeq ($(BR2_RISCV_ISA_RVC),y)<br>=C2=A0GCC_TARGET_ARCH :=3D $(GCC_TARGET_AR=
CH)c<br>=C2=A0endif<br>+ifeq ($(BR2_RISCV_ISA_RVV),y)<br>+GCC_TARGET_ARCH :=
=3D $(GCC_TARGET_ARCH)v<br>+endif<br>+<br>=C2=A0<br>=C2=A0endif<br>-- <br>2=
.25.1<br></div>

--00000000000040703e05e2eef2a1--

--===============7296368764346417844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7296368764346417844==--
