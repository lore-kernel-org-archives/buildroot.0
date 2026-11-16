Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23B606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wmjs69Cg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BAE60614;
	Mon, 16 Nov 2026 10:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ese5jHw0_t32; Mon, 16 Nov 2026 10:49:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 96DD3606AE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794826172;
	b=XDCo9GRsc9WX+D0ZLpbqo8GphcBD/Vp98niKIl/NhrtaYl/l2eHb9aNw3QYKuCIGbOyJ
	 5VnVfVJZ7pAeQPg2/i42HOT2LNjoM/mZ/vLHQu0+ieBaY3YRb8B8BbYJXkhNFIef80typ
	 hXQTyj9420WnckyPoNUpa3Tykt84GhtMxXOXAD9P9YGqqg2rmddrnPz5WheECZnQg9pLY
	 lJKDCEwt0xcML5V3YmzVjXMNooSEnMdg3smo7bgv1fe9c7mDCL/nJXQ9/J5vJYXfCHM3P
	 zrGWc/0PdAZY9C3rJxXvutI7zx5HnhL3Ohg8n7L/0NuEnHgUmHsabESYaAiZKuv4R6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794826172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aAdk8uHFaDxPENTJBG3ddRn539o/s6ocEOyzDlieMqA=;
	b=TPGB/riJi4DGPDFmcodWFgQT5AEDOF4SR1dlUpOlgIs+sNzYekGMtXzEjAmEBiKm9zq9
	 hhZ+CsriAkMbWiqSlnXgP3bbqzqsBYPTIRAKC99qnVjAyeyptWXid/CBY/P2IHfCOT+x6
	 DXAILJ2ao17qKBr+GrA0b+3DF2lfAp+1QPDZw4GMX1qALcLt6kqKMI/hTQ8pKzzFNEmas
	 FNB4Xst1CkIDMipBnfJrcFhvQPVJnpcMNr3w2gkWSq3qtVE8B5uGOtt60tFnLaGstoi3W
	 3P5sRKK2QqDlWRF5cSQEKZdvHGvMWkwQCwlwXpHYrXgq9UnUqvQYuI9hKhy5kRHjNTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794826172;
	bh=aAdk8uHFaDxPENTJBG3ddRn539o/s6ocEOyzDlieMqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Wmjs69Cgo35wCxoO+D1vQLSqQ50laFUtcdJ822+dZv9v2RqWsUkjCTqnPGi2VYJI5
	 8DndApKlIzK3QfPF2kGiP0LmyjXC1337YQ1O7r5w5c1IXEGOXtfJi24ne+CZx7fegF
	 U1JUX6m5XmImhrki4azj56af+gG0+veaQqC5iGKlSeAmkAQ8pyxEh3kGXcKfw+2byk
	 90mZjQ8fIp/nrTo78+rDiuT77/ELa8rxjnw7vb/IawsE1aurvmnGhx7fM3Dj4fLJGB
	 DtXAUn3zsD59C2fUtEzYN+KYTPqMZ3HcNR329f0mdIREDe3PZa7ggbbhfTtEwkQMgt
	 JFOuvX/C/I/eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96DD3606AE;
	Mon, 16 Nov 2026 10:49:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09ABD1A6
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFABC80D82
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48Whqee87AE7 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 10:49:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B6CA80D15
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B6CA80D15
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:49:27 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b70192ebceso5929252a12.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 02:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794826165; x=1795430965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IJYtuDmXXjnW0jUISNzKNkDKOiOpzUHqljHJ8v2XAPk=;
 b=BNb8S+S9mHBgAiNSEisxmr23GsexdqcB+AeVirANVk1+F4zjlkT9lcP8qKFRURU0UA
 d5dgY0oD2oJAlHXQpTj48QnhwremKHRuWsCDtB6rWdNZoxy1BLyy+gy79yRRZjGGOh8s
 RTAhOqbvuHGL7B3+pDJ5ometIuPVmXctNLtQyFAyi2PjPBrX72VKE5Eg1UgOCtDW98zk
 Ch+AIJeKcNtWqawvMmdEm8ZYAkt489nFg3scD8qMoGnBhSeBaEyHePE+wZ915eYZNbxi
 aWfEIQesLCwoNsuC3l4k/YngU9x+9c0Tv+K0diq0TXoRBdwiNY6qJY6v67/Ups9bLnHD
 OdIA==
X-Gm-Message-State: APuU4Z/z2DzrXd75rGcoARjJPZqNcXTgEdl77EM4j2R+05f676Xp97vT
 aDUogu+AaN5AMcQLt+xdz5injdweOtvtxu3PtPinZ90EPKIk+VVkcivrHhQPxg==
X-Gm-Gg: AYBFou0r86LaFXDkQUS1b9GAgPtVqdg2w1sOMa3psaV2KbtvAvbwngepz/qKW24oxqJ
 ldACYuz/xcRAj0mhfnoYh3wkUxl2fIzbzKUSb2s/zzDuDomSz2ERH2e+Qi9+hEQG2woM49TfKAu
 2Sba0WF8Oc/LF8L+/EXEUKxGgQPDJNX7xmAL4H2fAI9sGa1dqEsl8tAOHDKSMt6ByxCVVnZWUWt
 rMuxPbK2b8/UMKkkT9rXSb7gq/XNpCydnHVW9FhPMI6HWZTrfGukTZ41WDND4lFaeAkqba0Qd9o
 NhpZBYPP9Ilj0wFPZoofeNtC65scpxvqypixpwoRnvzlybS0Sl4WoAMpKumQxlM8YsDI9TzIzei
 812CX3Zng3UKQUwNdpeZ7uNHL0qHNXTlOLLs8c119rL5cBtm1JB7LnI3IygktNhjifucxwzBSAK
 E4GK2x8cbBhSEHTQU8Qu5q85CGlC7B9iHrnRfW38LyxHNbOBX+DLOot7/MPPQbHZ466borGK+Av
 ej0ES4XWGdnclgP9Jz2AGy7wnmhpoG/90WJE2Ir5frogcdU+4q/3QJ0g4pCDnY2fY/aYPn8kALr
 k5b/7Vfb2FzCqR3OVTAkqnTgiE6PUZyN2S2PLm5NVtnIrX95OpvvOdyG6lNrpbmx/rsAChkOgpH
 GWDeN8k1g
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr4169909a12.1.1794826164992; 
 Mon, 16 Nov 2026 02:49:24 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23611bdsm4393484a12.8.2026.11.16.02.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 02:49:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 11:49:24 +0100
Message-Id: <20261116104924.2536496-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mfgtools: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mfgtools packages version 0.02 from 2017, the old Linux port of the
NXP manufacturing tool. Upstream has replaced it with uuu (Universal
Update Utility), which now lives on the master branch of the same
repository and is already packaged in Buildroot as host-uuu. The old
code is only left in the linux branch, last changed in 2018.

It now fails to build with CMake 4, as it requires CMake 2.6:

  CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
    Compatibility with CMake < 3.5 has been removed from CMake.

Rather than patching dead code, remove the package and point users to
host-uuu.

Fixes:
https://autobuild.buildroot.org/results/852dda9b63d1a1bda489844159654551a641dee4

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  8 +++
 DEVELOPERS                                    |  1 -
 package/Config.in.host                        |  1 -
 ...onflicting-declaration-of-__time64_t.patch | 27 --------
 package/mfgtools/Config.in.host               | 15 ----
 package/mfgtools/mfgtools.hash                |  4 --
 package/mfgtools/mfgtools.mk                  | 34 ---------
 package/mfgtools/readme.txt                   | 69 -------------------
 9 files changed, 8 insertions(+), 152 deletions(-)
 delete mode 100644 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
 delete mode 100644 package/mfgtools/Config.in.host
 delete mode 100644 package/mfgtools/mfgtools.hash
 delete mode 100644 package/mfgtools/mfgtools.mk
 delete mode 100644 package/mfgtools/readme.txt

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db54..f8775ab045 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -585,7 +585,6 @@ package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch lib_pat
 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch lib_patch.Upstream
 package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch lib_patch.Upstream
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch lib_patch.Upstream
-package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch lib_patch.Upstream
 package/mii-diag/0001-strchr.patch lib_patch.Sob lib_patch.Upstream
 package/minidlna/S60minidlnad Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/minissdpd/S50minissdpd Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..091d658b0b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_HOST_MFGTOOLS
+	bool "host mfgtools has been removed"
+	select BR2_LEGACY
+	help
+	  The old Linux port of the NXP manufacturing tool is no
+	  longer maintained upstream and has been removed. Use its
+	  successor, host-uuu (BR2_PACKAGE_HOST_UUU), instead.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..dbd8709cbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1272,7 +1272,6 @@ F:	package/freescale-imx/
 F:	package/freescale-imx/imx-vpu-hantro-daemon/
 F:	package/gstreamer1/gst1-imx/
 F:	package/libimxvpuapi/
-F:	package/mfgtools/
 F:	package/sshpass/
 
 N:	Geoff Levand <geoff@infradead.org>
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..79a4ed7a2c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -68,7 +68,6 @@ menu "Host utilities"
 	source "package/lzma-alone/Config.in.host"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
-	source "package/mfgtools/Config.in.host"
 	source "package/microchip-hss-payload-generator/Config.in.host"
 	source "package/minisign/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
diff --git a/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch b/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
deleted file mode 100644
index 7d0d3974a2..0000000000
--- a/package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1af7bc09451e0b779f7bfb0dcc58ffb3abe9c584 Mon Sep 17 00:00:00 2001
-From: Gary Bisson <bisson.gary@gmail.com>
-Date: Tue, 11 Feb 2020 15:30:12 +0100
-Subject: [PATCH] lnx_def.h: fix conflicting declaration of __time64_t
-
-Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
----
- MfgToolLib/lnx_def.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/MfgToolLib/lnx_def.h b/MfgToolLib/lnx_def.h
-index c6869dd..a38bb99 100644
---- a/MfgToolLib/lnx_def.h
-+++ b/MfgToolLib/lnx_def.h
-@@ -124,7 +124,9 @@ typedef unsigned long * ULONG_PTR;
- typedef char * LPOLESTR;
- typedef void * HDEVINFO;
- typedef unsigned long long ULONGLONG;
-+#ifndef __time64_t
- typedef long long __time64_t;
-+#endif
- typedef long long __int64;
- typedef unsigned long DWORD_PTR;
- typedef unsigned int UINT;
--- 
-2.25.0
-
diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
deleted file mode 100644
index f1e7ab58e3..0000000000
--- a/package/mfgtools/Config.in.host
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_HOST_MFGTOOLS
-	bool "host mfgtools"
-	depends on BR2_arm
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
-	help
-	  This package contains the Freescale manufacturing tool.
-	  It is designed to program firmware to i.MX boards during
-	  production. The communication is done over USB using the
-	  Freescale UTP protocol.
-
-	  https://github.com/NXPmicro/mfgtools
-
-comment "host mfgtools needs a toolchain w/ host gcc >= 4.9"
-	depends on BR2_arm
-	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
deleted file mode 100644
index 0b215f5295..0000000000
--- a/package/mfgtools/mfgtools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# locally computed
-sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-0.02.tar.gz
-sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
-sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
deleted file mode 100644
index 3de93936b8..0000000000
--- a/package/mfgtools/mfgtools.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# mfgtools
-#
-################################################################################
-
-MFGTOOLS_VERSION = 0.02
-MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,v$(MFGTOOLS_VERSION))
-MFGTOOLS_SUBDIR = MfgToolLib
-MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
-MFGTOOLS_LICENSE_FILES = LICENSE README.txt
-HOST_MFGTOOLS_DEPENDENCIES = host-libusb
-
-HOST_MFGTOOLS_CFLAGS = \
-	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
-	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
-	-lusb-1.0 -I$(HOST_DIR)/include/libusb-1.0 \
-	-fpermissive -Wno-write-strings
-
-define HOST_MFGTOOLS_CLI_BUILD
-	$(HOST_CONFIGURE_OPTS) $(MAKE) CC="$(HOSTCXX)" \
-		CFLAGS="$(HOST_MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
-endef
-
-HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
-
-define HOST_MFGTOOLS_INSTALL_CMDS
-	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
-		$(HOST_DIR)/lib/libMfgToolLib.so
-	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
-		$(HOST_DIR)/bin/mfgtoolcli
-endef
-
-$(eval $(host-cmake-package))
diff --git a/package/mfgtools/readme.txt b/package/mfgtools/readme.txt
deleted file mode 100644
index 320e6ec493..0000000000
--- a/package/mfgtools/readme.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-MfgTools Howto
-==============
-
-1. Build your mfgtool image
-
-Make sure to enable the following Buildroot options:
-
-BR2_PACKAGE_FREESCALE_IMX=y
-BR2_PACKAGE_IMX_UUC=y
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
-
-Also modify your kernel configuration to have:
-
-CONFIG_USB_GADGET=y
-CONFIG_USB_MASS_STORAGE=y
-CONFIG_FSL_UTP=y
-CONFIG_MMC_BLOCK_MINORS=16
-
-2. Go into the output and create the necessary folders
-
-$ cd output
-$ mkdir -p "Profiles/Linux/OS Firmware/firmware"
-
-3. Create your XML update script named ucl2.xml
-
-You can find a sample XML at:
-
-$ wget https://storage.googleapis.com/boundarydevices.com/ucl2.xml \
-  -O Profiles/Linux/OS\ Firmware/ucl2.xml
-
-4. Copy the U-Boot, Kernel and initramfs images to the appropriate
-folder
-
-$ cp images/u-boot.imx images/zImage images/imx6q-sabrelite.dtb \
-  images/rootfs.cpio.uboot Profiles/Linux/OS\ Firmware/firmware/
-
-5. Copy the prebuilt binaries to be flashed
-
-Depending on your ucl2.xml file, the sample doesn't flash anything.
-
-6. Run the MfgTools client:
-
-$ ./host/bin/mfgtoolcli -l mmc -s uboot_defconfig=imx \
-  -s dtbname=imx6q-sabrelite.dtb -s initramfs=rootfs.cpio.uboot \
-  -s mmc=1 -p 1
-
-For more information about the tools options, please read the
-"Manufacturing Tool V2 Quick Start Guide.docx" documentation contained
-in every mfgtools package from NXP website[1].
-
-Note: All the above commands require your Linux host user to have
-permissions to access the USB devices. Please make sure to have udev
-rules that allow the user to communicate with the BootROM IDs
-(Freescale USB recovery) as well as the one used for the UTP Linux
-image (0x066F:0x37FF).  Using 'sudo' in front of the mfgtoolcli
-command would also grant you the necessary permission but it is *not*
-recommended.
-
-Also, if your U-Boot environment doesn't include mfgtools bootargs,
-make sure to set the following:
-
-setenv bootargs "console=${console},${baudrate} g_mass_storage.stall=0 \
-	g_mass_storage.removable=1 g_mass_storage.idVendor=0x066F \
-	g_mass_storage.idProduct=0x37FF g_mass_storage.iSerialNumber=\"\" \
-	g_mass_storage.file=/fat"
-
-[1] http://www.nxp.com/products/software-and-tools/software-development-tools/i.mx-software-and-tools/i.mx-6-series-software-and-development-tool-resources:IMX6_SW
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
