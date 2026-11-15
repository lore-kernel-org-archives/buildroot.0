Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF85606A327
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kUa+W2CB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZvG5FgKW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9048380DFA;
	Sun, 15 Nov 2026 08:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw4qcKyIM3vS; Sun, 15 Nov 2026 08:23:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C99CF80E21
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794730994;
	b=GPzSRhc35iXGJozSemZ1BRhVhBTxt9MVMvfdFtMix1xsfCEItv5NgUHLQl5yqu4TK8Yy
	 /6PcjWjoZR7zhcqmyY2CardfqfMelfZnbMqWqj29QqowN8j79ASkfL4TFP8o46aaxPpSr
	 TipBecIkEU33lVfbB2l1LTdQC8S0FBlwmtSH5j6bqumHKwHT7i38N96Dim547xZrjn2z1
	 4qhLO4xcKiGD+/k1oEOQqZszkRq5136WenqLP2fcXv5WUNc//fm7xUjwZHzNjs7nS+ywF
	 NtnR8eaGmU4BX6QEVrFpWaM/UoamhAUqGqJCjKpKTlyM8LCb2FPXK93PBHQYeSgqIUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794730994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oSrq0QrGVlOGqULyDbh5yMvzDpA1KPMRK72NEaOixFo=;
	b=sIMP3U0bFxxLHyHoPJaNz/mOM9+bsSmuoCW63yPjSiBosjAgAWcFBlaZqp1twKUBp6/k
	 V1H0Zn+uMIDQS4EHcm0D4xHUXVLJhaI0iEhaAimogYtO+VBVj6eH8/9k1Vh/I9VgOVn89
	 VcXXRtneq/oqojZI/WRnnZfXzaHJc8YnSNHNoa6Wr1kOYLpZ7AU/0wBEt7Yg7FOGiQMuD
	 G0iUhpf45cyBYb6xuRSN2xYwlME6zAY/yau79v+j1cGiJ5oeZMAVvEB4smvmnLyAcyDmc
	 KFHqPKNiJtlq5/RED03h6CAcYtX9qsl5dSRTBfmXXOi5KL2RfMl3jBRg03zJsIDEh9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794730994;
	bh=oSrq0QrGVlOGqULyDbh5yMvzDpA1KPMRK72NEaOixFo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kUa+W2CBggotrOdKYB/DYor/2yGz4E71S3a77+lEzIbD3joFglXkWI7e3KxtAp4Wh
	 Qv9RhYYZyJsTp6+sKRNOEoTUPQ3UQqAdeIZ0z/lJ2sTUm9ufXrm5iKQWYgNNPltWAD
	 tAsrb8tqlfniSNGOsRYRUBL68GsLPdeJ6uQdZbe2nFldnJrM0fOaVRwrj084mDKDjX
	 NeC2Q0ecrIL1YwHuA7YWixCVgdQS/GIn8BzS8WUqCV9UqCKF5fVlJe9xjgnHJPoPfj
	 Hzkb6FQE3x7xn+AjP77b7j/JyTdMllUcUzKiRui3I2ZFVNYu9Tncj8HEoV/rp+QQzu
	 RMd+urSGlMvHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C99CF80E21;
	Sun, 15 Nov 2026 08:23:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88C2370B
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AEE340079
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSci1BifvxsE for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 08:23:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C16FB40061
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZvG5FgKW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C16FB40061
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794730976;
 bh=+lYokvxlWVhOEY577+Vb18j9ZGNxtOawLR8ly+sMiuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZvG5FgKWXEafP0f1X3LnD+aV+G5/aZu1FgDYbH34Ye3w7gfpBm4NMbZyHUko81cMN
 KYJ14hUMrh0ljc/ProNQREiv+KrJW88PF53i1myqf7Jeyo3m6bX2cfbXHj06R5vi+6
 x8o44rocfJQIJwRjRQnAoL/YB0H8sXA6wS2tDCdOqYC7UqjmRqRNF6XVjT2hraQEvJ
 lkSiP6APmbtR/HebgcEb0E9kj8OTfCjstRnluzFb2UY5vNBITsgGydupKtsTxlU2cf
 mnbsvWpYxCncT5HU5lMeya4/CtOLUl0KKVZ+cTK162nLA6vIGhcz1FlpW7CXlmc8/m
 1akC813uE3QVQ==
X-KAS-Sym: v3:f51bdf72230551df:HkQyKNzaFhy2OF6q4EdEPIwIse7Ff40dC+6yGu5vbE0Be
 nTzqvVEac6/BMcdYml2Rlq6j10wsjM87vTScU2ZjG6GeHWxSQTlVExr5qkDSXZKlk9JyPEibVV/
 0j5uZRZXUDWjA7m71008bimz5PHE/ZApbKah2OwdcV4oXTI10UJoAdgX4xxZU3mj/7lIJlUEscU
 OVIQEbZkUcHK0RkqpX1Dfyr/CsHK4+7VleURxIVT8Pq3mLTc1kLMV3sDz7hf/wPr65+Fk7QuPTW
 3CWsafe3fO/alHcrMhl9QvuJat+2QZ19o9sWuE49kqYyfPr5Q3SF6DO3jTrYQXM9Hn0yIzwQ==:
 Yi1Zhhj153CTMYKmoLlpoqRFSmrQF9hEKvF4BL/mRHmQVbC/8urzC14uWn9LeAP46JYsqSDIOGp
 3S0NTpI9SvKaSXeL5ACQBGplia3IpmqxDyx/kvQePFccOulHZRIAT0e4QigfssvcYrha7TO/JDr
 tepTUMWTJwnyF/2An6LVw45ZEe8VDQPkB/8xaPrdU6zU/O9M9woI3N8PqfBubUE3nTLT6LkfiMv
 wx5pcIoRrT1m07a3R/r/uF6K3w3W8W9AE1mMDNC8YkDe0Afi9i2md1wJKHNUyhVEuKn5wNu2jUt
 Yj3ueGhSSD0OxDeAMAOOFJmXxjTLfAqwq2y2J8N9Fg1Syq2Qh6pEQjfXs44Vb7XfBuFIXkIZ5xH
 Cx9JPMZ+Xp1NlbI0FWdS531oqFzrzGfcGB9CUM6V80GP7Rjuh0YCWsyrcve4+RdcdI4yVFoms58
 ZdS9wjqdhYONkQ0txDJZVxz/DtUjHQbiPGgeQ4g3i936tCY59ZA8ip0v/X/qGw0O0Fg9PnPI9qP
 0N2I3F7VVaXra0B38U49Um5mzNuH4OmFfjFb2Ta17WR4Ogax1DbL7G9kjv3vXp7Yuk02/9HDUHz
 MGFF0555VjnP1qV1OYEwtacujjUd8FL1quS2fkwkGalCDbYnlDJOahoQqa/S
Received: from fli4l.lan.fli4l (p54a1b069.dip0.t-ipconnect.de [84.161.176.105])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1858A4C438D;
 Sun, 15 Nov 2026 09:22:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34016)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xSVVn-000000003eo-1iXn;
 Sun, 15 Nov 2026 08:22:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Nov 2026 09:22:55 +0100
Message-ID: <20261115082255.32679-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261115082255.32679-1-bernd@kuhls.net>
References: <20261115082255.32679-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v3 2/2] package/{mesa3d,
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.3.0/docs/relnotes/26.3.0.rst
https://lists.freedesktop.org/archives/mesa-announce/2026-November/000875.html

Removed patches which are included in this release.

Renumbered patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: added wayland-protocols bump to series (Julien)

Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/ae2ab901f73c54e11085c20252502adb993ebdd8

Also the series passed the following tests:

test_weston: https://gitlab.com/bkuhls/buildroot/-/pipelines/3069971265

test_glslsandbox_player:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3069972266

test_virglrenderer:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3069972629

test_kmscube: https://gitlab.com/bkuhls/buildroot/-/pipelines/3069973028

test_python_pyqt5:
https://gitlab.com/bkuhls/buildroot/-/pipelines/3069973189

test_glxinfo: https://gitlab.com/bkuhls/buildroot/-/pipelines/3069983085
This tests needs
https://patchwork.buildroot.org/project/buildroot/patch/20261115081722.31558-1-bernd@kuhls.net/
to pass.

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
index fdcc345896..58e5817ef4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
-sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
-sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-November/000875.html
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
