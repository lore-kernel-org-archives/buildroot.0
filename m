Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4062BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2A4440A46;
	Sat,  4 Nov 2023 15:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2A4440A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLi4xkzOPMWZ; Sat,  4 Nov 2023 15:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BE1B40A68;
	Sat,  4 Nov 2023 15:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE1B40A68
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC3391BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8513C60F41
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8513C60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quA9fEpp_xVU for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:20:01 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15A6460E6A
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A6460E6A
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso19502695e9.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 08:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699111198; x=1699715998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNBkSzyDhelhK0giqF8d68oUtShn1Hn/Y7zsDXTtOCA=;
 b=CuBbk1dOiSv0A0OPbsFALTeYZs3nzaWxbQMuLkQVi9GoO6b2N9dNxLwNg+1rOOdIP8
 RfZv9TrtZjRd7a8yacl54sTdBOLJuhloTDuVw9mNmk7FJCAeMZIpd8rx2VSPXHCBVnO7
 SObx3j3p0uXDnJ5Jl1d9Qnarvx2QIZf/wdWWQgOC0/RXbPcT2B8lYwxcpC1FfkAeibyB
 7ZwbRWmaU8b/EuctP/HDIMgYLFezaRZoqR8V4/hXjMuDzomMKXY8Qulf83RUeCi+NWBX
 ECm2tP6Qz289mZO9DyNDlyaEbk/JpI8z0GbJbBRIp27Al2OdkuR/ZhDgE5ucBYgPcMGJ
 2wYQ==
X-Gm-Message-State: AOJu0YzK7biPETnpGcRvkg5NZX6JuUpdlCTLrkOGjzNK6D//YM103Us3
 QrFh9cyxi6rRuZtXQru7lBA4WXZnugI=
X-Google-Smtp-Source: AGHT+IFaJEr8nnqeZmQ2Ln2X0phzXARteSmilUIxGH0ZMNgffcLK+sdG0rWGAvIL3gVOpgWD9YpJ6w==
X-Received: by 2002:a05:600c:154a:b0:401:73b2:f043 with SMTP id
 f10-20020a05600c154a00b0040173b2f043mr22004706wmg.1.1699111197860; 
 Sat, 04 Nov 2023 08:19:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b0040770ec2c19sm6251805wmq.10.2023.11.04.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 08:19:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 16:19:43 +0100
Message-ID: <20231104151944.84393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699111198; x=1699715998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNBkSzyDhelhK0giqF8d68oUtShn1Hn/Y7zsDXTtOCA=;
 b=jNVelXQO/LbxL7fPmPs4xYh58ESw9reARFvdigdNhX31wCaHQAer6ejIjEZKjkcSiQ
 bic9z4l2uxEyTOKnSvsJtZpd5KhQ7ykx9RRdhp0J9snR7GxBNtJMr/CGhP1OuPaRUKJQ
 69TN8QRcW1rx8DElnkV8U8cG1+qambG/7aG5qQJJzy/4FgL8imZ2dlZAx/Zeficlns/4
 3LdbyI/iSPyQFStp2TZ8MziQGmGkTPDXEj1tyX7rnIvDn5jjZGfU/RxS2T8Q5Va5pF+Z
 1X/uSnNKCGwK8FDmMYR9D69b+wfYpptZjZhDQ/P67wSMrlJTmiEl/ZcCw6kE9aa0YKIw
 vUnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jNVelXQO
Subject: [Buildroot] [PATCH 1/2] package/nut: replace NUT_FIX_CONFIGURE
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace NUT_FIX_CONFIGURE by an upstreamable patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...iler_family.m4-fix-cross-compilation.patch | 55 +++++++++++++++++++
 package/nut/nut.mk                            |  9 +--
 2 files changed, 57 insertions(+), 7 deletions(-)
 create mode 100644 package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch

diff --git a/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch b/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
new file mode 100644
index 0000000000..6356990749
--- /dev/null
+++ b/package/nut/0001-m4-nut_compiler_family.m4-fix-cross-compilation.patch
@@ -0,0 +1,55 @@
+From a743617099ea50fcce333a8a074751434d25b7ac Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2023 18:29:29 +0100
+Subject: [PATCH] m4/nut_compiler_family.m4: fix cross-compilation
+
+Do not use isystem with host paths when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/networkupstools/nut/pull/2146
+---
+ m4/nut_compiler_family.m4 | 28 +++++++++++++++-------------
+ 1 file changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/m4/nut_compiler_family.m4 b/m4/nut_compiler_family.m4
+index f47b1ae9..99608bab 100644
+--- a/m4/nut_compiler_family.m4
++++ b/m4/nut_compiler_family.m4
+@@ -178,19 +178,21 @@ dnl # confuse the compiler assumptions - along with its provided headers)...
+ dnl # ideally; in practice however cppunit, net-snmp and some system include
+ dnl # files do cause grief to picky compiler settings (more so from third
+ dnl # party packages shipped via /usr/local/... namespace):
+-    AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
+-dnl #        CFLAGS="-isystem /usr/include $CFLAGS"
+-        AS_IF([test -d /usr/local/include],
+-            [CFLAGS="-isystem /usr/local/include $CFLAGS"])
+-        AS_IF([test -d /usr/pkg/include],
+-            [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
+-    ])
+-    AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
+-dnl #        CXXFLAGS="-isystem /usr/include $CXXFLAGS"
+-        AS_IF([test -d /usr/local/include],
+-            [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
+-        AS_IF([test -d /usr/pkg/include],
+-            [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
++    AS_IF([test "x$cross_compiling" != xyes], [
++        AS_IF([test "x$CLANGCC" = xyes -o "x$GCC" = xyes], [
++dnl #            CFLAGS="-isystem /usr/include $CFLAGS"
++            AS_IF([test -d /usr/local/include],
++                [CFLAGS="-isystem /usr/local/include $CFLAGS"])
++            AS_IF([test -d /usr/pkg/include],
++                [CFLAGS="-isystem /usr/pkg/include $CFLAGS"])
++        ])
++        AS_IF([test "x$CLANGXX" = xyes -o "x$GXX" = xyes], [
++dnl #           CXXFLAGS="-isystem /usr/include $CXXFLAGS"
++            AS_IF([test -d /usr/local/include],
++                [CXXFLAGS="-isystem /usr/local/include $CXXFLAGS"])
++            AS_IF([test -d /usr/pkg/include],
++                [CXXFLAGS="-isystem /usr/pkg/include $CXXFLAGS"])
++        ])
+     ])
+ 
+ dnl # Default to avoid noisy warnings on older compilers
+-- 
+2.42.0
+
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index c376ffb2e2..ba71319f90 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -11,13 +11,8 @@ NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
 NUT_SELINUX_MODULES = apache nut
 NUT_INSTALL_STAGING = YES
 NUT_DEPENDENCIES = host-pkgconf
-
-# prevent usage of unsafe paths
-define NUT_FIX_CONFIGURE
-	$(SED) 's%CFLAGS="-isystem /usr/local/include%_UNUSED_CFLAGS="-isystem /usr/local/include%' $(@D)/configure
-	$(SED) 's%CXXFLAGS="-isystem /usr/local/include%_UNUSED_CXXFLAGS="-isystem /usr/local/include%' $(@D)/configure
-endef
-NUT_POST_PATCH_HOOKS += NUT_FIX_CONFIGURE
+# We're patching m4/nut_compiler_family.m4
+NUT_AUTORECONF = YES
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
