Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AVBxnHXk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=c5HD8ixw
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2558040AA0;
	Fri, 23 Oct 2026 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3abm7d-5jrCJ; Fri, 23 Oct 2026 21:16:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A93FA40A92
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792790190;
	b=eSPjQ3GJu6r/YslfnUzGfJYirz/IhKQXiR1ARMaqc5Saxvcu/HI/7rx23k71Iif1ywag
	 NC4ECU0pzZTLBXisVyw2najxT07MR1ZdRy2qq5tawEWMrxHWkDgTwRGNxf42hciAJM64U
	 ENCC3HapLLTtBYfQLW2YXsE9f8RmPoHoHN/c6DHXRl74XlYHubgj1WCyApftY9gRvHTQk
	 n9faoblBM7vLzrDpTKrPRvIqk4zhFUwA6ZOM84yT+HskI8uTBWBIt8J8tFuYKwmslzEzP
	 UaOTdbS3thRvtlkApU6ugByALAfAFOkQUDaoGJokrJLYD3JBjiJhXX8kiZKMPxQAovw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792790190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2bTrzCUtFocosFBHGFUPR++bK5FFHO8SvAc45eIyA7s=;
	b=cRYXLcstjXKb9iNVU06qFjMWxrhhUpqkGTc3qhmODgmD6siC/4kmm0A9NlvrZ5D0uazq
	 hJSE+q7YlxntCzSfDhzAAkEemZrmQiFo2yk3WBPU9TFjfIv3XjWM2HR2EHVUCXPBc5znN
	 0WdDfN5P2nOhvsuVjzURGEEQ5b14l0zhooV6SXyVb7vaBsazTStbfgEhIxGi9I9epP33Y
	 oJGumymGAVIu+n+mEAvelyPnwdmdiWhqHNXIViUQLzBQQ+Eu9VKp4abIhikVIr9jebwX4
	 Zmg6W2e9xoaAKE2CpFX06/0CXj0gjq07smr7/2HBXmcnMy0nMJ7HwM+LhiX6zbSz60A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=c5HD8ixw;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792790190;
	bh=2bTrzCUtFocosFBHGFUPR++bK5FFHO8SvAc45eIyA7s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AVBxnHXky7oNPD53jtNgeaylantEoIU7IjvOflsuvnqmSAXao9mDmfm+X9abpHbik
	 YPkX7Ifa6ffZ1ibg12n2hyv5VXZpBWxqxghVE4ATc01xPL9BQxNeIRCDT5ZzivP/t/
	 TQsD6vygb8S9pkTfYO+IZO2QgdA4SzLuQibhwqXpj9AniKiGvYvM3Ejx4JmYS4b+l9
	 ZVT8XfCLYiPJwW5AI5Xw9yA6yfYoRSTDeZbhGQJbDrkBOXqtSB1G1Vmy8DrvKiTlG1
	 59wWUttymUKY5NbTyrLUj5QDtXRWMVR04YlugEL+/NAXof3zndrIV7bGQsXOfJEEFl
	 3RrT0GOi1H79A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93FA40A92;
	Fri, 23 Oct 2026 21:16:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A71B4371
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D96840A92
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHpnlTypqvQB for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 305C740A90
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792790188;
 b=PWn6nX01pogwfsmssMrBiFCAiPlvxCZYmwERZ6fGq+gWzddRqFKANqqfKjeaT51l++PR
 OG5hMVR9BEvmpPmT2zUJXAS6UOWh7MRSgTS0TdqoC5W9oBqiw3cmXu2IplI5TXMgg6vUL
 yqm2YtflxKZlmeN6yPFeDp3SA2oPYpPh2Bwrhj2mewYcDvajZOh1UETtbYovvnejEwreD
 iuT6SXUB2s7nkkNAdx/1s/rE3Y+H8kcPdhg1Q6OrOsatiAGHptTLAYBJV7fwX9Ee6mnRP
 YTArJcBxyNebmT4uBm3TP2kjp0B/bC+4S2/e3ZvmiQTOcloNpmkZBHL+XJfgUwOdjmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792790188;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Zbi3ZOBf+mM6iY4WIXC+SmMfHkdpR05cW7Ny9ry6OA4=;
 b=dia3xv8wDfVDCWC84LPjtMeh+p+svdxyHLTrlKcIHAQSrDu9Hom3a3PWQEEtJafU76ke
 JDWBxkNc6SgYTF93ueZFzfPm89lmfXHl7w8wCN5XPLxJyXuys2aiyqVrfSY687svaDRtI
 VgPAIlX63ea8C8j56D3zFWGLIQI5WdLs+W8x2Y2mrAa6DxOYjl7ErmbRGWbs5vJZ5O7ke
 H5qz1V1QfOngWPtKK9rj1wF/1PSK29h0JCUVHmPy0oadsO/1mkiXQiGORmMc9MxLCd02w
 Da40/wcBER5EMTab04mawBNgExD7EMbwoZoLqs6/lmhX3jdJlJH6D+RqTyuM5b9DtoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=c5HD8ixw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=c5HD8ixw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 305C740A90
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792790182;
 bh=Zbi3ZOBf+mM6iY4WIXC+SmMfHkdpR05cW7Ny9ry6OA4=;
 h=From:To:Cc:Subject:Date:From;
 b=c5HD8ixwQr9cywJAOC8VcPOGyp/L2w9ncS/r61fG26UEIzf/u2txKuAtsY2LOuh5r
 1M09UiWy7YEb7k65iiiCon9/bqLXTWtD9fyOMvZz25xhGhLn8P9x3ohz6tggkmia6T
 y3DZic76CcJQAYX4ENKnqZIhCfIihqSR1FlP96eK8OZQZ9RNWsomuROxc7Neqa1UGT
 RMq7KFqN7m6WgJI9n7nOkFfLDy/5gWdvhndKpRrYLT2gBmgSw5F6MO9CBgw0quENEF
 gjPBGv7MA4Ip3+0uOnryvobhJJUmHj2rIHe0yscQtlKBr3o8M6IPlDPlHdoT2DJtSM
 4q7uTIznpBccA==
X-KAS-Sym: v3:f51bdf72230551df:YQnrCVOyQTYqHcX7/s5yotzTnrVz65+Dzp6MAZJ+SVYAZ
 FfXy6c8x4QD3oOA/6VMQJlxhP+bhQ6ku5NDC2l/n9r11qYAKdcXLuotMdBF85g3NTWv2f+tNs3Z
 +ScI2dQYrWUxgEnjKZpNXqu9rp4TuG1CgE+CGfSmRzU0CB4w4X6f1vObzjTrX0gZ9twAGRuIYWE
 pP3EUkO4N1q0JVwHe6KVzeYwyIUF9JsZJ5P+kVciIGvKs9ETulcxrjtgfZaatakimoOKpkbqCfw
 sWNp6hwY6fyz1Udjb4VJK9FcXAMv/mS8QbDtTBhSdADn3xBP3Pt0ssbLdetdlSR1h/soPpAQ==:
 Lf/2YMoMS1E2k67N9VKD/e4TIplzxMgaRjf5+T+SXYIE6Cjn6rT3x86/WnH31yP38caZ5fOlBBw
 tHVQTxx7jcE1p6VlaVYvCCJhVMSOATBfSYuLvAX/JC0Zi0rCeJRFFQF3tIogYxtAyXBW47E19Aa
 msjKr1JnTd/qoFPWgecW27SxqJCMd9lz448iINPmbTXPm3Um9S5pEL1npAB4H+4V/iDprITpbAQ
 1j6f++yBJas5TdmsTEfzpgT6nloS4USZhAjrnI5E/lHMBGOGcbyB654A/eLnAdQrRiD8OpvxPnI
 dqNnLp367zPtaUpCCGYsYPeHemtmS+LZ1z+wgwnY9s//LBnb6QJp+/FIdczkOAUdgePIUXuw9y4
 XaTozwwXNxukYoSyxa/hXbh+A/mE8AKc1WrrvRqaUgoT4gsZISXRtF4cSbhua07vchjvlMmZedG
 oZ+I3fJEL3bvEx0VbiFrKDDTsMxInj5ujecOXIKZZbXQjem8jpGq6/KkYv3BN4uYMUR3MhrEkjd
 GUAdj+SzmIMKHoNjTi+mAlNjUP/ViqITi8EjZLEHZgv+LsPxOq55MXXs//nvjfRpOUaNWkPvo8B
 VwggORXBjxsbqYvEFYGwWBOjzSSJr4HsJ/6hI7CN7QTo/AIobQVfeEXhO5zICNONDPWsyuUFs10
 0UTsZj0fULgiAWAkR
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC52CA4C6931;
 Fri, 23 Oct 2026 23:16:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50400)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKMcf-0000000069z-3ub4;
 Fri, 23 Oct 2026 21:16:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Oct 2026 23:16:18 +0200
Message-ID: <20261023211622.2096562-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v3 1/5] package/mesa3d: rework OpenCL handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mesa3D removed the old Clover OpenCL implementation in version 25.2.0
and kept only RustiCL:

https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
"[...] the Clover OpenCL implementation has been deleted. RustiCL is now
 the only OpenCL implementation available [...]"

Since then the option BR2_PACKAGE_MESA3D_OPENCL served no other purpose
than allowing access to the RustiCL sub-option. This commit merges both
options and their dependencies.

Fixes https://gitlab.com/buildroot.org/buildroot/-/work_items/180#note_3501740032

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: rebased
v2: removed code left-over (Romain)

 Config.in.legacy                             |  9 ++++++
 package/mesa3d/Config.in                     | 32 +++++---------------
 package/mesa3d/mesa3d.mk                     |  8 ++---
 support/testing/tests/package/test_mesa3d.py |  1 -
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d94041edd4..29c9b7f9e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "Mesa3D OpenCL support is now provided by RustiCL"
+	select BR2_LEGACY
+	help
+	  Mesa3D removed the old Clover OpenCL implementation and
+	  replaced it by RustiCL. This option served no other purpose
+	  than allowing access to the RustiCL sub-option which was moved
+	  to the main options section.
+
 config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	bool "EDK2 platform ARM SGI-575 has been removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..cb86e6a2a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_SPIRV_TOOLS
 
@@ -56,35 +55,20 @@ config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
 	help
 	  Legacy Wayland EGL_WL_bind_wayland_display support.
 
-menuconfig BR2_PACKAGE_MESA3D_OPENCL
-	bool "OpenCL support"
-	depends on BR2_PACKAGE_MESA3D_LLVM
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
-		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
-		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
-	select BR2_PACKAGE_LLVM_RTTI
-	select BR2_PACKAGE_CLANG
-	select BR2_PACKAGE_LIBCLC
-	select BR2_PACKAGE_HAS_LIBOPENCL
-if BR2_PACKAGE_MESA3D_OPENCL
-# libclc dependency is satisfied by
-# BR2_PACKAGE_MESA3D_LLVM
 config BR2_PACKAGE_MESA3D_RUSTICL
-	bool "RustiCL"
+	bool "RustiCL OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_LLVM_DUMP
+	select BR2_PACKAGE_LLVM_RTTI
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
+	select BR2_PACKAGE_HAS_LIBOPENCL
 	help
 	  RustiCL is an OpenCL implementation written in Rust.
 	  By default, devices are disabled in RustiCL. If you want
@@ -93,8 +77,6 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 
 	  https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE
 
-endif # BR2_PACKAGE_MESA3D_OPENCL
-
 config BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	bool
 
@@ -554,7 +536,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_RUSTICL
 
 endif # BR2_PACKAGE_MESA3D
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 87c7f427e4..c103345e86 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,13 +50,11 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
-MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += \
+	clang \
+	libclc \
 	host-rustc \
 	host-rust-bindgen \
 	spirv-tools \
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
index 24fc6df59e..193aa7a373 100644
--- a/support/testing/tests/package/test_mesa3d.py
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -17,7 +17,6 @@ class TestMesa3DRusticl(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_PACKAGE_MESA3D=y
         BR2_PACKAGE_MESA3D_LLVM=y
-        BR2_PACKAGE_MESA3D_OPENCL=y
         BR2_PACKAGE_MESA3D_RUSTICL=y
         BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
         BR2_PACKAGE_CLINFO=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
