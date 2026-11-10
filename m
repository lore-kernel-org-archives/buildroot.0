Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EDE60A2615
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ALKEtsOw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fcYp87FV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0115D408F8;
	Tue, 10 Nov 2026 20:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1DNs9FbVzlq; Tue, 10 Nov 2026 20:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A8AA740885
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794342272;
	b=nhzrJK70R/FSXQ9/syBTcZpvUeQBmM5mK/dXwh8gP/qDwfGe7tKHGSTLkM/YIUjvsyh9
	 S46YhopgBO453TVtOBwZKaR+ew1jocJK7pQEwqVwJf2yKW49AgCGMI7j+Z1zs4HI403la
	 FrhKay4YvB4yv6ncWb6vcn74g5KqiZk1cJH93myj8LtxaoZRmqOcwNA0CrqklmjgwvSrM
	 BhRxatfkxhPeaNJARoQ1bXGF2DGV9EUEXq+sUeKL6FR2jfIu8toyFT0WKtfxkNgTI7K8y
	 p5ZPhXEBdV0ST8bYzeJj4N9BUZ/3RGeR5RSNMcqJij4N7Q1hFfk4WiKkRFodkJx5n+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794342272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RSTW4gBfkwTNKIbhFTKDzSX7JrBMje1Ca3PgwKeHzJE=;
	b=N6vMWhYuDS18DoXhUjVXM6KDjfHIAFjf0GWTbQsAUy1tlO+DEzwhuxrICV7VmymPqwXT
	 E4mSNbxhtT/N5yvAkv/T0lw6WN960xStPR2ppDqa/qI8dcPSwA6fBpdXDg/j5czCFL1v/
	 Yi3qOxiWWopjT2tP/0tMvSxxu/egz65SUQwcuXUQVs7eKodIYkYHCIlyCW+/PYZSr8AAM
	 2rQQ/XuY/dNyVZlRt907JSB3XkK87CfQztQM9e0oPbF/J0htlApAyVyUKGcIcW1meU93b
	 1cEcoIXfPl2oxhvofGBhp48B7+kHdIZncvS94ie3DBmKVr4tbNxeVccW9VhX0yOJzGw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794342272;
	bh=RSTW4gBfkwTNKIbhFTKDzSX7JrBMje1Ca3PgwKeHzJE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ALKEtsOwaK0KgCR8JfTBIQJa4BvUuVXq0xO8D50HovDaXFs3RP/lT/ob1rojDXeM+
	 cu1Qh9CwHIK6SltNzQxqZujqrSLxu/2V7v94xS6xPn14OmEF9YAG+gDSMoj+WNnZDf
	 RR3vmhae25x6obmP3dFSusmb7iwEx5CVz//Wc3lTnqTdN4EXZexFd308AtjmMrQzQ7
	 9zAiUpvtk3cNb+29JHKMKHeUUXBHH+UTs1lPr5iONZh/xrQ6OcaAW99DtiaFXHR3xX
	 VQYC9e909LyUXrvHB/KRHKlJSB1Qo14cH4wMgrXqA2yiOXPri/eFK4fX0O/IM0OgUs
	 sGBa2haQ90wig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8AA740885;
	Tue, 10 Nov 2026 20:24:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD1F29D1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D7160808
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feRpl6UQgcLx for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 20:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3D3360889
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fcYp87FV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D3360889
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794342263;
 bh=VqW3K1KFGsERe/IRQ/HJEgFU4yRhwJLLQADg0ArBFIY=;
 h=From:To:Cc:Subject:Date:From;
 b=fcYp87FVXZAX16MNUErXWozv0hEoygA4TnvcVyrjB9xgAzFU4zYx82OKFwh210Pkf
 8PomzIVsIy9TUhgbd6tHwRB8vA4Fa+vvTQKkuWniLm1R5xWMaBg7r0a6J+udJYKSdA
 hZnqmeRHd9XjN/ytJZXLWQ7ym+0sAvIcA2VpgIUYrfTbWmBsJQLIMtnMrP+8v+7ZZy
 l2Nxp3gdJqdh4zsOG6p1OhGZGEM/1goHaFqYo67yhz1GW5Db2+mY58Hv8R/h5vmN6G
 +R1A2Zb/5GEiBCAdMXpO8PiOe93qoKjwdfbw/WNzNpebkMprlHCsJ9bSb5wi/sCLj1
 OVlZ7Fwf0bGWg==
X-KAS-Sym: v3:f51bdf72230551df:aKWeteE3IRdcgKCAoyv6QFIHfEKXkwRvL6YE+2oArVT5i
 v3alxRW+Tum21SWntuEBa1H0NBKC6PNbEPfLg1pU+3ujR9yiZmcNOz/VzWBO6Dl2AZZMSW/zrjB
 qg0kot5BeYErkCFj5U057THvwP7w1BZfCYMMyQ/pIuyoeUhPvQgxJpACPVPO07xoTOlSGtaqIBv
 +SV8m0RLh78h9rfoRvvdeaLoGFsAPrVMiq1h/9PnGHZY5UXkuMmvBF11Gwhke9RT/Udyb/lZHzS
 RuXGSS5RjXoWxjH6gnAzF74xOA5+35edYYl4wEng//nSAHDDPsLT5tNDmAO/7zPgNFZEl2PQ==:
 vRv2hBNd3sukW8J8E/Oh/NCtbGDeFR4u1L+suCCTMAcE499vVKhRfxUZyu07LFj0qDYkNRvj/gl
 aht0RAAollv6J/XtDJ+kQQtxDCwrsy4c1BpdOv3uur4NCMonG7fW4OgZ1zI5iMuMDupD2TiB6d4
 wisIf+8TH1UMy8RJvpO37ohkG64yS+zM6dSO43btA2e9oFes2VRx3vMH8rigpLLsvEcqeOkOXLL
 S/wN0d9F9ap34Z/CdKZ6XrSB4tBun2ue7ndjf1tRGVEc5A6vx+4IvxAp41gpAVhrcfv346ret/5
 VF1R1qE+KgCNSKo/EEsvwFxN/zVDzSWcOqCJ5xxQy+3bZbQ3/6feAddtRJKHpHzq/ndzXGD4liY
 ajwBr2Jg7sDU4V7kprsLoL4hP5drZb9FAkebRYUzSwE/rGr05Nk7YwLilxiEwVpI9hRyGEN75wF
 es1n1La/p7J06I6YNNmzf+FuV28qUs2zywh99vHS+zUTI+5dMdfpmDguJrZuzcXWBkHx6Q868dQ
 tKTC09kcEHIZvoBQ5SVkTDHWKpqgEDZzXeDdB1btcnQOfTSmkQAV1JAWRHbmYaU71KtAF30OlTN
 svUAx8SXKlfKSlQ9UVG73klI/fo+nIExR4TGGgwbCYYCFfe/ssMI6qECoGsOApM=
Received: from fli4l.lan.fli4l (p54a1b984.dip0.t-ipconnect.de [84.161.185.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74449A4C4507;
 Tue, 10 Nov 2026 21:24:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xQsOE-000000002WO-0s8R;
 Tue, 10 Nov 2026 20:24:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Tue, 10 Nov 2026 21:24:22 +0100
Message-ID: <20261110202422.3570743-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.3.0
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

https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.3.0/docs/relnotes/26.3.0.rst

Removed patches which are included in this release.

Renumbered patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commit/96f9fb20fd9605711bb9ddac4590ea7b89c2cd42

 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...floating-point-exception-flags-with.patch} |   0
 ...c-do-not-use-arm-fpu-instructions-if.patch |  55 --------
 ...do-not-compare-sys_path-against-NULL.patch | 129 ------------------
 ...d_libclc-turn-sys_path-into-an-array.patch | 109 ---------------
 ...load_libclc-add-llvm-23-libclc-paths.patch |  46 -------
 package/mesa3d/mesa3d.hash                    |   6 +-
 package/mesa3d/mesa3d.mk                      |   2 +-
 8 files changed, 5 insertions(+), 344 deletions(-)
 rename package/mesa3d/{0008-nir-fix-build-of-floating-point-exception-flags-with.patch => 0004-nir-fix-build-of-floating-point-exception-flags-with.patch} (100%)
 delete mode 100644 package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
 delete mode 100644 package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
 delete mode 100644 package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
 delete mode 100644 package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d42e7c7a0a..8e7d3dfd6f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.2.5
+MESA3D_HEADERS_VERSION = 26.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch b/package/mesa3d/0004-nir-fix-build-of-floating-point-exception-flags-with.patch
similarity index 100%
rename from package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
rename to package/mesa3d/0004-nir-fix-build-of-floating-point-exception-flags-with.patch
diff --git a/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
deleted file mode 100644
index 96d1902061..0000000000
--- a/package/mesa3d/0004-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 345b14a820a557b72f218637cb37ef39947b1f50 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 1 Jul 2026 22:48:15 +0200
-Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
- not available
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682>
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/42682
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/util/u_math.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/util/u_math.c b/src/util/u_math.c
-index 722eac7f733..5683766a417 100644
---- a/src/util/u_math.c
-+++ b/src/util/u_math.c
-@@ -87,6 +87,7 @@ util_fpstate_get(void)
-    }
- #endif
- #if DETECT_ARCH_ARM
-+#if !defined(__SOFTFP__)
-    if (util_get_cpu_caps()->has_neon) {
- #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
-       fpstate = __builtin_arm_get_fpscr();
-@@ -94,6 +95,7 @@ util_fpstate_get(void)
-       __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
- #endif
-    }
-+#endif
- #elif DETECT_ARCH_AARCH64
-    {
- #ifdef HAVE___BUILTIN_AARCH64_GET_FPCR
-@@ -154,6 +156,7 @@ util_fpstate_set(unsigned fpstate)
-    }
- #endif
- #if DETECT_ARCH_ARM
-+#if !defined(__SOFTFP__)
-    if (util_get_cpu_caps()->has_neon) {
- #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
-       __builtin_arm_set_fpscr(fpstate);
-@@ -161,6 +164,7 @@ util_fpstate_set(unsigned fpstate)
-       __asm__ volatile("vmsr fpscr, %0" :: "r"(fpstate));
- #endif
-    }
-+#endif
- #elif DETECT_ARCH_AARCH64
-    {
- #ifdef HAVE___BUILTIN_AARCH64_SET_FPCR
--- 
-2.47.3
-
diff --git a/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch b/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
deleted file mode 100644
index 6883031951..0000000000
--- a/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f Mon Sep 17 00:00:00 2001
-From: Karol Herbst <kherbst@redhat.com>
-Date: Tue, 22 Sep 2026 13:53:43 +0200
-Subject: [PATCH] nir/load_libclc: do not compare sys_path against NULL
-
-sys_path will become an array and the NULL checks were all a bit awkward
-because all the code was already guarded with DYNAMIC_LIBCLC_PATH anyway
-and most likely constant folded away.
-
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/compiler/clc/nir_load_libclc.c | 76 ++++++++++++++----------------
- 1 file changed, 35 insertions(+), 41 deletions(-)
-
-diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index edcd13b3b26..913dd8ff7a7 100644
---- a/src/compiler/clc/nir_load_libclc.c
-+++ b/src/compiler/clc/nir_load_libclc.c
-@@ -145,20 +145,18 @@ map_clc_data(struct clc_data *clc)
-    }
- 
- #ifdef DYNAMIC_LIBCLC_PATH
--   if (clc->file->sys_path != NULL) {
--      if (clc->size % SPIRV_WORD_SIZE != 0) {
--         fprintf(stderr, "File length isn't a multiple of the word size\n");
--         return false;
--      }
--
--      clc->data = mmap(NULL, clc->size, PROT_READ, MAP_PRIVATE, clc->fd, 0);
--      if (clc->data == MAP_FAILED) {
--         fprintf(stderr, "Failed to mmap libclc SPIR-V: %m\n");
--         return false;
--      }
-+   if (clc->size % SPIRV_WORD_SIZE != 0) {
-+      fprintf(stderr, "File length isn't a multiple of the word size\n");
-+      return false;
-+   }
- 
--      return true;
-+   clc->data = mmap(NULL, clc->size, PROT_READ, MAP_PRIVATE, clc->fd, 0);
-+   if (clc->data == MAP_FAILED) {
-+      fprintf(stderr, "Failed to mmap libclc SPIR-V: %m\n");
-+      return false;
-    }
-+
-+   return true;
- #endif
- 
-    return true;
-@@ -175,12 +173,10 @@ close_clc_data(struct clc_data *clc)
-    }
- 
- #ifdef DYNAMIC_LIBCLC_PATH
--   if (clc->file->sys_path != NULL) {
--      if (clc->data)
--         munmap((void *)clc->data, clc->size);
--      clc->data = NULL;
--      close(clc->fd);
--   }
-+   if (clc->data)
-+      munmap((void *)clc->data, clc->size);
-+   clc->data = NULL;
-+   close(clc->fd);
- #endif
- }
- 
-@@ -198,34 +194,32 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
-    }
- 
- #ifdef DYNAMIC_LIBCLC_PATH
--   if (clc->file->sys_path != NULL) {
--      int fd = open(clc->file->sys_path, O_RDONLY);
--      if (fd < 0)
--         return false;
-+   int fd = open(clc->file->sys_path, O_RDONLY);
-+   if (fd < 0)
-+      return false;
- 
--      struct stat stat;
--      int ret = fstat(fd, &stat);
--      if (ret < 0) {
--         fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
--         close(fd);
--         return false;
--      }
-+   struct stat stat;
-+   int ret = fstat(fd, &stat);
-+   if (ret < 0) {
-+      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
-+      close(fd);
-+      return false;
-+   }
- 
--      clc->fd = fd;
--      clc->size = stat.st_size;
-+   clc->fd = fd;
-+   clc->size = stat.st_size;
- 
--      if (!map_clc_data(clc)) {
--         close_clc_data(clc);
--         return false;
--      }
-+   if (!map_clc_data(clc)) {
-+      close_clc_data(clc);
-+      return false;
-+   }
- 
--      blake3_hasher ctx;
--      _mesa_blake3_init(&ctx);
--      _mesa_blake3_update(&ctx, clc->data, clc->size);
--      _mesa_blake3_final(&ctx, clc->cache_key);
-+   blake3_hasher ctx;
-+   _mesa_blake3_init(&ctx);
-+   _mesa_blake3_update(&ctx, clc->data, clc->size);
-+   _mesa_blake3_final(&ctx, clc->cache_key);
- 
--      return true;
--   }
-+   return true;
- #endif
- 
-    return false;
--- 
-2.47.3
-
diff --git a/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch b/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
deleted file mode 100644
index 916af6547d..0000000000
--- a/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 62ee563fd398169005906245831db680f813b19f Mon Sep 17 00:00:00 2001
-From: Karol Herbst <kherbst@redhat.com>
-Date: Tue, 22 Sep 2026 14:11:09 +0200
-Subject: [PATCH] nir/load_libclc: turn sys_path into an array
-
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/62ee563fd398169005906245831db680f813b19f
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/compiler/clc/nir_load_libclc.c | 55 +++++++++++++++++-------------
- 1 file changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 913dd8ff7a7..17b901db47c 100644
---- a/src/compiler/clc/nir_load_libclc.c
-+++ b/src/compiler/clc/nir_load_libclc.c
-@@ -52,7 +52,7 @@ struct clc_file {
-    unsigned bit_size;
-    const char *static_data;
-    size_t static_data_size;
--   const char *sys_path;
-+   const char *sys_paths[1];
- };
- 
- static const struct clc_file libclc_files[] = {
-@@ -63,7 +63,9 @@ static const struct clc_file libclc_files[] = {
-       .static_data_size = sizeof(libclc_spirv_mesa3d_spv),
- #endif
- #ifdef DYNAMIC_LIBCLC_PATH
--      .sys_path = DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
-+      .sys_paths = {
-+         DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
-+      },
- #endif
-    },
-    {
-@@ -73,7 +75,9 @@ static const struct clc_file libclc_files[] = {
-       .static_data_size = sizeof(libclc_spirv64_mesa3d_spv),
- #endif
- #ifdef DYNAMIC_LIBCLC_PATH
--      .sys_path = DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
-+      .sys_paths = {
-+         DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
-+      },
- #endif
-    },
- };
-@@ -194,32 +198,35 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
-    }
- 
- #ifdef DYNAMIC_LIBCLC_PATH
--   int fd = open(clc->file->sys_path, O_RDONLY);
--   if (fd < 0)
--      return false;
-+   for (unsigned i = 0; i < ARRAY_SIZE(clc->file->sys_paths); i++) {
-+      const char *sys_path = clc->file->sys_paths[i];
-+      int fd = open(sys_path, O_RDONLY);
-+      if (fd < 0)
-+         continue;
- 
--   struct stat stat;
--   int ret = fstat(fd, &stat);
--   if (ret < 0) {
--      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
--      close(fd);
--      return false;
--   }
-+      struct stat stat;
-+      int ret = fstat(fd, &stat);
-+      if (ret < 0) {
-+         fprintf(stderr, "fstat failed on %s: %m\n", sys_path);
-+         close(fd);
-+         continue;
-+      }
- 
--   clc->fd = fd;
--   clc->size = stat.st_size;
-+      clc->fd = fd;
-+      clc->size = stat.st_size;
- 
--   if (!map_clc_data(clc)) {
--      close_clc_data(clc);
--      return false;
--   }
-+      if (!map_clc_data(clc)) {
-+         close_clc_data(clc);
-+         continue;
-+      }
- 
--   blake3_hasher ctx;
--   _mesa_blake3_init(&ctx);
--   _mesa_blake3_update(&ctx, clc->data, clc->size);
--   _mesa_blake3_final(&ctx, clc->cache_key);
-+      blake3_hasher ctx;
-+      _mesa_blake3_init(&ctx);
-+      _mesa_blake3_update(&ctx, clc->data, clc->size);
-+      _mesa_blake3_final(&ctx, clc->cache_key);
- 
--   return true;
-+      return true;
-+   }
- #endif
- 
-    return false;
--- 
-2.47.3
-
diff --git a/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch b/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
deleted file mode 100644
index f43b7b7260..0000000000
--- a/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6b9cd5ab9cc3bfd0c79d9500a07a5e74351c72d1 Mon Sep 17 00:00:00 2001
-From: Karol Herbst <kherbst@redhat.com>
-Date: Tue, 22 Sep 2026 14:13:28 +0200
-Subject: [PATCH] nir/load_libclc: add llvm-23 libclc paths
-
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
-
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/6b9cd5ab9cc3bfd0c79d9500a07a5e74351c72d1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/compiler/clc/nir_load_libclc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 17b901db47c..889bde610a3 100644
---- a/src/compiler/clc/nir_load_libclc.c
-+++ b/src/compiler/clc/nir_load_libclc.c
-@@ -52,7 +52,7 @@ struct clc_file {
-    unsigned bit_size;
-    const char *static_data;
-    size_t static_data_size;
--   const char *sys_paths[1];
-+   const char *sys_paths[2];
- };
- 
- static const struct clc_file libclc_files[] = {
-@@ -65,6 +65,7 @@ static const struct clc_file libclc_files[] = {
- #ifdef DYNAMIC_LIBCLC_PATH
-       .sys_paths = {
-          DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
-+         DYNAMIC_LIBCLC_PATH "spirv32-unknown-unknown/libclc.spv",
-       },
- #endif
-    },
-@@ -77,6 +78,7 @@ static const struct clc_file libclc_files[] = {
- #ifdef DYNAMIC_LIBCLC_PATH
-       .sys_paths = {
-          DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
-+         DYNAMIC_LIBCLC_PATH "spirv64-unknown-unknown/libclc.spv",
-       },
- #endif
-    },
--- 
-2.47.3
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fdcc345896..d37781f3f2 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
-sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
-sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
+# From https://gitlab.freedesktop.org/mesa/mesa/-/commit/34bfd3a61a2876eb8d35bc6cd2a7364258c795c2
+sha256  91d729aa68bb89e4ec857841300bbe922bcb3e52b1f97566ca83930d3b28343a  mesa-26.3.0.tar.xz
+sha512  b4abd266ecaf813ef078a0461bcdf7c03d2ecddeb5b6e1c51054fb0afe0d830c0f27fc78f0effe68df5ea7b48f76f4e6ca36ed9afe98513f0e4bf8e0bbbe96dd  mesa-26.3.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20f02190a..fe62de1446 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.2.5
+MESA3D_VERSION = 26.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
