Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30014606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fb5JF2rq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=EeB8IwqK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0429E40A92;
	Fri, 23 Oct 2026 21:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3igguRXcksxV; Fri, 23 Oct 2026 21:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D543140A93
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792790204;
	b=KqdNxivx/qXHLl//THEFG0zk+0J3XURBgAM3gBTSeGT9HkfRDXVKiK7DYB9da5NtVdeX
	 VVS9/An14ELhkFTR/kGHvlcfji4NHLu/8y4pWB3VN+Nu0iuGZbA8Ji7yh7qcv2k3Sm94Q
	 O8w5SGt8bAihJRDFd5Fe5LJqYKBvWg2Ej2NdNpESnqWAkIq71MXrwM62PntzhyAP0eeRX
	 fB0g50XSyDjnu+O4f4PIDPky/Q4Ejx7F8lHNL5U07gZ+ie/tPC/8dIe/2ewOcikkJmKd1
	 pB2adWtFWErL2jlUuta7fABLhhZc6Cuwkyg0/6DJnqCMvyYoJ30OFyTLx1Bteq7OLAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792790204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gw1+ALzYH2+RaM5cRltBmyozSkE6tpLHYECkrLLovuc=;
	b=J9p2K5FdMSsFhkMay2Hlv/LKJqGK8wy7vawqevXWI3xwWY4kKUiXhvk5eGuTVRT0L0Wg
	 StA1ZTMqcfqpkBjXIe+EX42RdCmtbfrSYhdKTmrHm4W/mne1DDoJIIuvJ7iDEM+VI6OwJ
	 wQ0FXpmuH5e0nuXTAYDKRtZaRCKVTRfeDaZptUXDb21P3Qhhbx+Q4/6/u5LPLHsWuNtSU
	 Elr9oOuTkJtA0pnuIifOfDA5SiERVHOp8XQCPSukF8CcHZoI01D0p7IajkjIvbix2SNc/
	 8w0n8eL0bERJyW/eUeNaMmBIiWJxlb0FDR+mIzzwzF7sTpvwj/sss2f+7HKJroCynAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792790203;
	bh=Gw1+ALzYH2+RaM5cRltBmyozSkE6tpLHYECkrLLovuc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fb5JF2rqtcgYol0ciEViImxLmsqoPpWiKTZCOFl6WjK3eKq1ZiZhrImgXnKkwUYDG
	 furAz+yw1+AqPnlWHNQh0+UJOhWw9Kq26y6Ghfg8WqWu9cuBPam29Bz0iCoJ0aux16
	 21a3l+dxXsLb76a5R1MFDrPEDefLN2yI9j9DCP+af75UmOKX/OxokALmYhEJuT4dP+
	 GYmxro3Udox0UBoXaoQ0k5+h+pUDYyvwViji298O9IjF1dGSf9WDOwZG8CbqPyEups
	 /EafygSr3UYWgcgCMwo0KwwZLgkzn22TTcuhVVsEgQB4eGV7O7clXpCTuiipp+k4OX
	 jBGAd0MWfYn6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D543140A93;
	Fri, 23 Oct 2026 21:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D523C4
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21AC40490
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpFa8B5BsDLd for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:16:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9B06940474
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792790201;
 b=S5RGdKIydhznIAKJ0l0qv/8ffdSVPWnd71XQuTtlbB26yiCJiV8klRKbZmaP0VjAaIwE
 nUc3V9QbNmxPTLQAKFScvToY38fKZU4CSC0JDcIp9HZ+SNXRuaB3KoGdX0bf2Aw5VY9CS
 SR+QgaycITOHHsO3eGXsGrYgORtAE5utAW3pHG7LJvKesDR2Tzfmq0HFz0HVHK6oBfkeE
 Q6FBiRh2EPrsg4A+9oUWGpUBwsvZOe8b1ujRMx5UE8IYbJGhBF8P+QJcEQm9ytuQyNV0s
 B2yWP2mkSYZpP9eZFy5Glp/axJ2Wg1ucIoWF/HbRi5ZZ9DJ/k54l987iQl+8AHnWzUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792790201;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/eVfcsljOBJCxogKXZFwNp1gAvSVwSbJbNzyPsJo6o0=;
 b=I6GM48IdoMJ8pzCUHUIWFpKa3NocetOp9VUynoM9KwLQTRS7YROhZVDAmyfZZFT6Mq0I
 6YZ7up5Yd+IIlkWOTzYMVBO2+6nUq3J0vvu0CZIJZcPE54AlWtOKk/wMQxf14+OcunvhS
 jEu7+7o5Ebu2LbVJagO/H6NC5LiyMLI7iqPl338tCLa8n1MvqXsPNADoC1GgVbRWCEzRA
 pvMZ98UdIw9hyFEIbGjUnSqQdy//f4WBlu9E0FVtQT6OgLPrmHu9eAY0EF0lQ4KUOxOQj
 uOYtqYlSvCDZ14UjgBIb7YAc+klGLKwn+ZKtoyXyAIhhR4E2XsEq2o79rmSAVY40liQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EeB8IwqK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EeB8IwqK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B06940474
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792790182;
 bh=/eVfcsljOBJCxogKXZFwNp1gAvSVwSbJbNzyPsJo6o0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EeB8IwqK26eEA7wyMwl16smwQf0lGylXnKWGgbSNNMyf6J9nC8AM7SYPGS52LUJOc
 CHQPp3RtBkDcfAx+2VM/itGVoBk6Eg7prCQJLDSgg3fpLGf8glZenT+8gq7mj3PU6J
 7Cal2hsM357Q0QKbobVqAz0q7i7aAIjH5hXYZhwkY1HgISnGAftG63Oqclpk11OqDX
 Qtk0z9MyKkqWpLUK9ExtkamdMKhdTzJHZijjZ5f4U925ohymx7XO8Pa0rH92JsRZl9
 qcwNBuSjjC22ZeJtrd5m/dDFsNWi3uac1uN2/5Lme8Orjgz58n1sjhJvkBUJOryI1d
 ALUJ5uTzpoJiQ==
X-KAS-Sym: v3:f51bdf72230551df:YQnrCVOyQTYqHcX7/s5yotzTnrVz65+Dzp6MAZJ+SVYAZ
 FfXy6c8x4QD3oOA/6VMQJlxhP+bhQ6ku5NDC2l/n9r11qYAKdcXLuotMdBF85g3NTWv2f+tNs3Z
 +ScI2dQYrWUxgEnjKZpNXqu9rp4TuG1CgE+CGfSmRzU0CB4w4X6f1vObzjTrX0gZ9twAGRuIYWE
 pP3EUkO4N1q0JVwHe6KVzeYwyIUF9JsZJ5P+kVciIGvKs9ETulcxrjtgfZaatakimoOKpkbqCfw
 sWNp6hwY6fyz1Udjb4VJK9FcXAMv/mS8QbDtTBhSdADn3xBP3Pt0ssbLdetdlSR1h/soPpAQ==:
 pou3kb/5cJUY1aFCpgIYWSJFIDTQNkT+pW3BRfmZlpyIeydyLSJlPByTLauyXJlaHPsYRdpEkHA
 ZAaLYhqh7PakIg7eFfkIaQKvsXAaIJWdVPulxui+1v7BG4Da1H2VyC6NknMXeFnkB2CECUZVLi/
 kzb2bDZnVE3qSVeQ0lqK+eUulfqvVVvdCNTF7ESc43IKMJzZetqir+fo1TqFvHVaV87Jj7GUFGp
 EvxGWZD2vrAJnj2Lk0UkyGrYDdMxQbcJODs90/vL+mp1t7nR2op9agpueveu5DlCTIyoBGdDDVc
 bvec14zvshN7OlQAE7URVBcNiDrYuF0aStCVv451StUY4C0h3ZXErX/OxGcgS8PxzvIpMh7pmU7
 KLAF8invXk+pRTCitoaET//GWZA16qFpGZWdbwIPm4o5n2FNsw+ZpDuaBXDm+5HGpQ+RC1yc/nU
 9qz2J8WKhg4B4zPZokvSZVUA2wmqdMOXuUoxf2TsUMwQGyUl+i0/577iSJ5Azx50F1KgGuWyfji
 s9WUvTR7d+0E+he4HXtwZ6k6/Zr33Lh4vZGulZgpxEWbybR6MPofrICl6BGR8Lc7nxCppyLFnzb
 u0XGt1yAdsrymadqfxpzys8irIqy1StOhU9vCeNAyEjKVtv5ecNKLcN8KlsMXXzpHbDpmHH0mdd
 Fnjbo4lnGgnDM7Imvow==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAE57A4C6934;
 Fri, 23 Oct 2026 23:16:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50400)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKMcg-0000000069z-0FJN;
 Fri, 23 Oct 2026 21:16:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Oct 2026 23:16:19 +0200
Message-ID: <20261023211622.2096562-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023211622.2096562-1-bernd@kuhls.net>
References: <20261023211622.2096562-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 2/5] package/mesa3d: precomp-compiler does
 not need target llvm
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

Inspired by and fixes
https://gitlab.com/buildroot.org/buildroot/-/work_items/180

To build binaries provided by the host-mesa3d package we do not need to
build llvm packages for the target arch.

Added configure options for rtti support to fix build error when
BR2_PACKAGE_LLVM_RTTI is not enabled:

output/build/host-mesa3d-26.2.3/meson.build:2042:8: ERROR: Problem
 encountered: LLVM was built without RTTI, so Mesa must also disable
 RTTI. Use an LLVM built with LLVM_ENABLE_RTTI or add cpp_rtti=false.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: added note about new rtti configure options (Romain)

 package/mesa3d/Config.in | 46 +++++++++++++++++++++++-----------------
 package/mesa3d/mesa3d.mk |  8 ++++++-
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cb86e6a2a4..feed6b68fe 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,8 +23,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
-	select BR2_PACKAGE_SPIRV_TOOLS
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # host-llvm
 
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
@@ -147,15 +146,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
-comment "iris driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "iris driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
@@ -189,15 +190,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
-comment "panfrost driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
 	bool "Gallium Radeon R300 driver"
@@ -360,46 +363,49 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan imagination driver.
 
-comment "imagination vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "imagination vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
-comment "intel vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
-
-comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
+comment "intel vulkan driver needs a glibc toolchain w/ headers >= 3.17, host gcc >= 7"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
 	bool "Vulkan panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan panfrost driver.
 
-comment "panfrost vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	bool "Vulkan swrast driver"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c103345e86..04112eea8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -178,7 +178,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
 MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
-MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
+MESA3D_DEPENDENCIES += host-mesa3d
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
@@ -347,6 +347,12 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
+
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
