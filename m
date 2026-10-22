Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF5606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bOj9gwQZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=n5VajHhM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C49774072B;
	Thu, 22 Oct 2026 05:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vz1tKPjUO60d; Thu, 22 Oct 2026 05:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 662ED4081C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792645869;
	b=aVx00bk1n3JPOShg1pF28krBhqkiU0sI1emKRrtk7pQ21cIe/SyyAxdzOPdDB9Oi/Sqm
	 EVdnAlkgHfBt+to/kxnQB+jnCQnawWOKrNG1oxHvw8gLJVGEDVvEvGcBKqoujRMLxn1JE
	 Qko0ooR5VxlKPct2jnOvFKcOgcohoR0qQE5Rh+/BlUrerO7Z7U5TnLLJPxdB0vWEAdbIQ
	 yOpy5OChU7W2OH+cFKpVzOOymE3a5nR9SC6CEHjTAaV493WasTVKfZS7r62zkpekpzoFb
	 OQoSqFOITco5wf+uW77V0EKQtVvwrMRZ31OxQ3qGLSJSK48RgHbZhrydHJ8UXJX0/pg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792645869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9UgDO8+aDtSwUmeb9F3nECkeyoCgp82Xs1IMHQN8hHU=;
	b=EDPTP0ycKwoTyq9nohs865I4vQfj7oHgZenBz9BzS9bS/t+XMnAs2IRkE3hebnsmTjv7
	 0wxwyu8e5SHTzzx+lOKR3R7VA3Cmbe/Hpu28/JnTrx40YQgGTw0oWWOMAPuMOrknCUBlM
	 tL8VyYaAmjzUQ6OKLtYcrGt6VNPZd6ctgV3GALnOQvp/lCqEpRgF7w9eIfLKFNtVaXtbk
	 3lCFzMCHNURmckwiPTcC+pOnLP0q38E99B412a0um0bGGf3E2995MhICL/xl+2ExtOAXj
	 HInCcsHIGtkFcIc5Ft4sILy6oMTssu/teMvVdxFeh+bkCDq4PtzH/aCmCnAkfQP5WQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792645869;
	bh=9UgDO8+aDtSwUmeb9F3nECkeyoCgp82Xs1IMHQN8hHU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOj9gwQZSGxa8dZXXWtuVdHKmoX9Hc/2thZTYs77Xa40B/B4Gcy5FafC+kwbTynQ3
	 uFT9w0X5NNDH0t3D3YksanUkizzY+nX/zzpN46dYXc7hpT1XttCnIivxcKKZed+cfR
	 HKMHrP8cQQCAvHdsGZuingjmghPYN5CAurIklBoLUlWMUxUgeddo+I2rKPYsSDs+wF
	 N/g91encwKx57cRS5q9lHMWc+pza2l2Eww5Nl/8kMKirs/0JfJ+8aaaC2PUKhgpnta
	 VwpBWl4092bgEwcd+dqO7NBaKq0QvsG0DhzgLQjkEwYaoMhuWCOHy3usgTQbeCq30D
	 +0o2w2frDp57w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662ED4081C;
	Thu, 22 Oct 2026 05:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB483A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3119660816
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xptDJFyn_037 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 05:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1F5FA607F6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792645866;
 b=jTNUUq5T8L/wnBUZgN9YueZgfeRmKiL8ZaS7SnFcZgeSA2pLmX9haEa/vo7zCMXbzX/L
 8xnC8ZM1+IJdoo5Eje7Oh4uEj0hrzaXz3Amfs43+h9Nc4jT5B2IdFLQsovVONj8Nq5vUx
 CoF7/b4TpIdQNXCiEsxbU9OthBXPpJSTX6xtheXL3Q+kGH18ndjw8QHupnZYhkD7Xg4vW
 gwZN9qz+Hax1A3T8qILgqT2eXZxrmDliZ1weAFQGQK0qXKNevxPaWAXxY806qv8QM972F
 8ae1L5CyOL40Crf+PD+Vx5nDG42fhuYmAzJRcQTDBebsjXBd5XLde10RdOITk1xIWKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792645866;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DQgbINLNh5d10WoSSX7xT7Dut6oAMR6MmneRua365vk=;
 b=qN2VFdbMtBL9kAGhJIkNVz3+mulEw1Sp+HVuU8/2UshiXTCpkYo8dXuOPMP0wWuNuKFO
 kExM/QlQ/fN2Gpu2SeM7+fKdcnY1pNwcyhya1LS2llotyNfBKkxO3pdMg2U2WNjg/0+XE
 1+Cx3lvDLxcLCUknufZk04XgACVB7U2+G81BbHBXSqTSkotkEPphfNHCxOcbPX5FH6NVJ
 00984d4sABl3PYXiTp59R9HEj3gKl2iZl/3ZLIDcFf6GV3xhG3kuJH21imOwcPMdaBKKs
 BLiej7tG/Ww5xb1ehzxFGYSUUpoyplHC8MhuYkK5aAvA0rZPvoo8xaSglJdreXTwNig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n5VajHhM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n5VajHhM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F5FA607F6
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 05:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792645835;
 bh=DQgbINLNh5d10WoSSX7xT7Dut6oAMR6MmneRua365vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n5VajHhMyZdyp3OnBbceRgU3uXhYX1gUbhXXlQrehusy8RNa44zF3MQwHE5D7h//G
 kHNKXZndKa/9euytyKf6JWCFLT4Fg8aoyP9/0yBBnuA7Y2LKHMNcHzrOIWh855d2v0
 /FxOQZP/lPwYyP0vCAWKm8rCn9zqy6/mu5x/UO4kk8EdJ2PpoN/4e27Ee+xEzuvUGO
 o18fC3UuYdUMsoKEVBMfnoIy7FXhKwQVsjYuXFTLpYYcdql71kYQoptRTBh0ZBb8ef
 wy5JX1nYmw6v9IvSlWRbJnsIrW9jHEZqNWUyt9AGqHm7cBWSEGl9Af4kcFCoD7k0cv
 QRoTmZ1XU/aDA==
X-KAS-Sym: v3:f51bdf72230551df:dvRQnSoirjFrkl+6nf2Ex4c+FN4SYVpYJefIsKxdAZm1C
 zyVaeMi5uXC8hYhH4FDu30JiWluh1m8ugqQ1a7hVHHjHvqD2JHo1IgVT7wIFRZfy1Rk6fRTRFqc
 XNij8e7YGl+LIzPLLupgQBygGOqTY0iJ17+Ng3amiV95FbIvqj9ZkeeTJdv8q4/SMmYskvKPjYE
 mPkqt7+BJG7z3tkp4VJCDxAN1TWAd1khSE2JSJiZH70kQMeUcdtMNCSWC2+Oni2nKmEX4jOtoy5
 UE0wVosLDTkG5nMET6eKAuVDHPL3/QgFwi7QePq4i8NKF0NZPCBgo5q5/7M1PYMwirtKFRXQ==:
 nEm2nxQtwrEYlbUoRjoyslk0RtujDxjKV9dz0IckYNmh/CkrYn27x58wCULnizxDCLGeIl6EqFz
 XNPNJ1TllB76a8YQ3EV+z+LeqqRXXhuPOaImqyXMLImNcP2w0xf0I/gBkMKgi/JNY2i5RSkN6le
 H2ev3rxGy0cZwD1BYKG8VvLQJoLkQm1Fmtg838a2GfWdLoKaAIBZ3QrBzxDT0clk8aUv41FQuML
 Vm3ctPU6JwUGlZBQemS550Vo+tgYV0pu+EQj0oWA1gglUmroY+sqRd+cJ9RYeRImMCqtZ5Yz1S+
 KacUP5Ee/3fmvnqDSNwCw98NW4xMK9smpUTdhi+UnvSZyN6A4bZUARIKRPEI8I6ZWvKLK8gA8SS
 yH6gt1yq1Zo+YF6DlukF7QiprVuMytW9DYvpUo/Y5PbWFm4ilIt3dv6HInqIeIp67hjtk9my7mk
 W0JCB5FdlGondLsO5Wzrl6R2MebUszqDxMopeLhubEz65mhBurJCsDI5sRr2DnOklBnBBD04Jvv
 XWTJu5YkwAYyaB67VOhbPVHetPkAdVPZ27cj+b70mNJTI4ZptDNik54+RrkopRSEVQk5tLX2UZ6
 zZtIIJ0JnWmvAccx7ltKlyCgXES1W30oKS3L7H3Rlc7i1LWcuynWDMTcoJZlhhltO2q4EtEHhwY
 b6SJAbMKgxwQ6
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0648CA4C621A;
 Thu, 22 Oct 2026 07:10:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60196)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJl4U-0000000043G-0Up2;
 Thu, 22 Oct 2026 05:10:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Thu, 22 Oct 2026 07:10:33 +0200
Message-ID: <20261022051033.5024-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022051033.5024-1-bernd@kuhls.net>
References: <20261022051033.5024-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/3] package/mesa3d: fix rusticl runtime error
 with llvm-23
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

mesa3d searches a wrong path for libclc files caused by the bump of llvm
to 23.1.0 with buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac

This patch adds three upstream commits backported from the 26.3 branch,
for details see upstream PR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624

Fixes tests.package.test_mesa3d.TestMesa3DRusticl.test_run:

Libclc failed to load. Please make sure it is installed and provides
                spirv-mesa3d-.spv and/or spirv64-mesa3d-.spv

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:

check-*:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2974000376

tests.package.test_mesa3d:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2974000282

 ...do-not-compare-sys_path-against-NULL.patch | 133 ++++++++++++++++++
 ...d_libclc-turn-sys_path-into-an-array.patch | 113 +++++++++++++++
 ...load_libclc-add-llvm-23-libclc-paths.patch |  46 ++++++
 3 files changed, 292 insertions(+)
 create mode 100644 package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
 create mode 100644 package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
 create mode 100644 package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch

diff --git a/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch b/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
new file mode 100644
index 0000000000..21cfe54e80
--- /dev/null
+++ b/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
@@ -0,0 +1,133 @@
+From f5011f50a7e9c3f8dc208e16a4bd3aadbd6fdae8 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Tue, 22 Sep 2026 13:53:43 +0200
+Subject: [PATCH] nir/load_libclc: do not compare sys_path against NULL
+
+sys_path will become an array and the NULL checks were all a bit awkward
+because all the code was already guarded with DYNAMIC_LIBCLC_PATH anyway
+and most likely constant folded away.
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f
+
+[Bernd: backported to 26.1.8]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/compiler/clc/nir_load_libclc.c | 84 ++++++++++++++----------------
+ 1 file changed, 39 insertions(+), 45 deletions(-)
+
+diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
+index 4cb92bdb257..46beaf51cdf 100644
+--- a/src/compiler/clc/nir_load_libclc.c
++++ b/src/compiler/clc/nir_load_libclc.c
+@@ -145,20 +145,18 @@ map_clc_data(struct clc_data *clc)
+    }
+ 
+ #ifdef DYNAMIC_LIBCLC_PATH
+-   if (clc->file->sys_path != NULL) {
+-      if (clc->size % SPIRV_WORD_SIZE != 0) {
+-         fprintf(stderr, "File length isn't a multiple of the word size\n");
+-         return false;
+-      }
+-
+-      clc->data = mmap(NULL, clc->size, PROT_READ, MAP_PRIVATE, clc->fd, 0);
+-      if (clc->data == MAP_FAILED) {
+-         fprintf(stderr, "Failed to mmap libclc SPIR-V: %m\n");
+-         return false;
+-      }
++   if (clc->size % SPIRV_WORD_SIZE != 0) {
++      fprintf(stderr, "File length isn't a multiple of the word size\n");
++      return false;
++   }
+ 
+-      return true;
++   clc->data = mmap(NULL, clc->size, PROT_READ, MAP_PRIVATE, clc->fd, 0);
++   if (clc->data == MAP_FAILED) {
++      fprintf(stderr, "Failed to mmap libclc SPIR-V: %m\n");
++      return false;
+    }
++
++   return true;
+ #endif
+ 
+    return true;
+@@ -175,12 +173,10 @@ close_clc_data(struct clc_data *clc)
+    }
+ 
+ #ifdef DYNAMIC_LIBCLC_PATH
+-   if (clc->file->sys_path != NULL) {
+-      if (clc->data)
+-         munmap((void *)clc->data, clc->size);
+-      clc->data = NULL;
+-      close(clc->fd);
+-   }
++   if (clc->data)
++      munmap((void *)clc->data, clc->size);
++   clc->data = NULL;
++   close(clc->fd);
+ #endif
+ }
+ 
+@@ -198,33 +194,31 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+    }
+ 
+ #ifdef DYNAMIC_LIBCLC_PATH
+-   if (clc->file->sys_path != NULL) {
+-      int fd = open(clc->file->sys_path, O_RDONLY);
+-      if (fd < 0)
+-         return false;
+-
+-      struct stat stat;
+-      int ret = fstat(fd, &stat);
+-      if (ret < 0) {
+-         fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
+-         close(fd);
+-         return false;
+-      }
+-
+-      clc->fd = fd;
+-      clc->size = stat.st_size;
+-
+-      if (!map_clc_data(clc)) {
+-         return false;
+-      }
+-
+-      blake3_hasher ctx;
+-      _mesa_blake3_init(&ctx);
+-      _mesa_blake3_update(&ctx, clc->data, clc->size);
+-      _mesa_blake3_final(&ctx, clc->cache_key);
+-
+-      return true;
+-   }
++  int fd = open(clc->file->sys_path, O_RDONLY);
++  if (fd < 0)
++     return false;
++
++  struct stat stat;
++  int ret = fstat(fd, &stat);
++  if (ret < 0) {
++     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
++     close(fd);
++     return false;
++  }
++
++  clc->fd = fd;
++  clc->size = stat.st_size;
++
++  if (!map_clc_data(clc)) {
++     return false;
++  }
++
++  blake3_hasher ctx;
++  _mesa_blake3_init(&ctx);
++  _mesa_blake3_update(&ctx, clc->data, clc->size);
++  _mesa_blake3_final(&ctx, clc->cache_key);
++
++  return true;
+ #endif
+ 
+    return false;
+-- 
+2.47.3
+
diff --git a/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch b/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
new file mode 100644
index 0000000000..ff53b68f19
--- /dev/null
+++ b/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
@@ -0,0 +1,113 @@
+From 9d4685ec168e28bec7c25859f8d9162865c14284 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Tue, 22 Sep 2026 14:11:09 +0200
+Subject: [PATCH] nir/load_libclc: turn sys_path into an array
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/62ee563fd398169005906245831db680f813b19f
+
+[Bernd: backported to 26.1.8]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/compiler/clc/nir_load_libclc.c | 63 +++++++++++++++++-------------
+ 1 file changed, 35 insertions(+), 28 deletions(-)
+
+diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
+index 46beaf51cdf..54b45ad7808 100644
+--- a/src/compiler/clc/nir_load_libclc.c
++++ b/src/compiler/clc/nir_load_libclc.c
+@@ -52,7 +52,7 @@ struct clc_file {
+    unsigned bit_size;
+    const char *static_data;
+    size_t static_data_size;
+-   const char *sys_path;
++   const char *sys_paths[1];
+ };
+ 
+ static const struct clc_file libclc_files[] = {
+@@ -63,7 +63,9 @@ static const struct clc_file libclc_files[] = {
+       .static_data_size = sizeof(libclc_spirv_mesa3d_spv),
+ #endif
+ #ifdef DYNAMIC_LIBCLC_PATH
+-      .sys_path = DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
++      .sys_paths = {
++         DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
++      },
+ #endif
+    },
+    {
+@@ -73,7 +75,9 @@ static const struct clc_file libclc_files[] = {
+       .static_data_size = sizeof(libclc_spirv64_mesa3d_spv),
+ #endif
+ #ifdef DYNAMIC_LIBCLC_PATH
+-      .sys_path = DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
++      .sys_paths = {
++         DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
++      },
+ #endif
+    },
+ };
+@@ -194,31 +198,34 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+    }
+ 
+ #ifdef DYNAMIC_LIBCLC_PATH
+-  int fd = open(clc->file->sys_path, O_RDONLY);
+-  if (fd < 0)
+-     return false;
+-
+-  struct stat stat;
+-  int ret = fstat(fd, &stat);
+-  if (ret < 0) {
+-     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
+-     close(fd);
+-     return false;
+-  }
+-
+-  clc->fd = fd;
+-  clc->size = stat.st_size;
+-
+-  if (!map_clc_data(clc)) {
+-     return false;
+-  }
+-
+-  blake3_hasher ctx;
+-  _mesa_blake3_init(&ctx);
+-  _mesa_blake3_update(&ctx, clc->data, clc->size);
+-  _mesa_blake3_final(&ctx, clc->cache_key);
+-
+-  return true;
++   for (unsigned i = 0; i < ARRAY_SIZE(clc->file->sys_paths); i++) {
++      const char *sys_path = clc->file->sys_paths[i];
++      int fd = open(sys_path, O_RDONLY);
++      if (fd < 0)
++         continue;
++
++      struct stat stat;
++      int ret = fstat(fd, &stat);
++      if (ret < 0) {
++         fprintf(stderr, "fstat failed on %s: %m\n", sys_path);
++         close(fd);
++         continue;
++      }
++
++      clc->fd = fd;
++      clc->size = stat.st_size;
++
++      if (!map_clc_data(clc)) {
++         continue;
++      }
++
++      blake3_hasher ctx;
++      _mesa_blake3_init(&ctx);
++      _mesa_blake3_update(&ctx, clc->data, clc->size);
++      _mesa_blake3_final(&ctx, clc->cache_key);
++
++      return true;
++   }
+ #endif
+ 
+    return false;
+-- 
+2.47.3
+
diff --git a/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch b/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
new file mode 100644
index 0000000000..bfef0c50ba
--- /dev/null
+++ b/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
@@ -0,0 +1,46 @@
+From c86bf6e6b9fbc9cfb02eeed3d798ffbdd3dc0252 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Tue, 22 Sep 2026 14:13:28 +0200
+Subject: [PATCH] nir/load_libclc: add llvm-23 libclc paths
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/6b9cd5ab9cc3bfd0c79d9500a07a5e74351c72d1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/compiler/clc/nir_load_libclc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
+index 54b45ad7808..bb1efd0ce57 100644
+--- a/src/compiler/clc/nir_load_libclc.c
++++ b/src/compiler/clc/nir_load_libclc.c
+@@ -52,7 +52,7 @@ struct clc_file {
+    unsigned bit_size;
+    const char *static_data;
+    size_t static_data_size;
+-   const char *sys_paths[1];
++   const char *sys_paths[2];
+ };
+ 
+ static const struct clc_file libclc_files[] = {
+@@ -65,6 +65,7 @@ static const struct clc_file libclc_files[] = {
+ #ifdef DYNAMIC_LIBCLC_PATH
+       .sys_paths = {
+          DYNAMIC_LIBCLC_PATH "spirv-mesa3d-.spv",
++         DYNAMIC_LIBCLC_PATH "spirv32-unknown-unknown/libclc.spv",
+       },
+ #endif
+    },
+@@ -77,6 +78,7 @@ static const struct clc_file libclc_files[] = {
+ #ifdef DYNAMIC_LIBCLC_PATH
+       .sys_paths = {
+          DYNAMIC_LIBCLC_PATH "spirv64-mesa3d-.spv",
++         DYNAMIC_LIBCLC_PATH "spirv64-unknown-unknown/libclc.spv",
+       },
+ #endif
+    },
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
