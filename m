Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1729606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rZASWUSe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4DE81205;
	Fri, 23 Oct 2026 11:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSswVdG-rPtZ; Fri, 23 Oct 2026 11:05:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AED080F5E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792753527;
	b=XTz79nYsRiynvSn2XAUu0pEgQOcvk/zNe2PgydjP8eyORaS74FY4uKUa4Wyuf2Bs7j72
	 J+z/lSaPTm+7zaAryfv8ZavA9c0j7x8wSY34Ju3e2hfRk6a0sHXjkDjQiYOuYxcF9GzDy
	 IPsS0ZuTzaEawyJ1ciDYAyZf7R6suidtWYRR8tqM5PUmEnoZcdbELXSsiysQOg7BxULRW
	 gh6eJcBF4TohXh/1cG3Oh7fgGXs8NXrPfwzDsVqoBDoJLPl4uuQulcGImxVnl4mSs8ELq
	 vhI/8tMJxT8wT8H+iKwfiAURXFD7n/tVwRAUVFmFiDNJF+KlHxRmiISlIVMYXy07Dvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792753527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bj4tqMR/LvYR8qedasilhzkcV9RRIplQHQWZUOB9MF0=;
	b=MDL96cIyN4xDgWGXAWsypRAaNrTxAdEb5L1x3gPnSMuw4NZeODFgo0BpgV8e1MxDnFuB
	 CvNsxU34wo66svpM2yfy0Qk+kHYmq/C/CUApOe8NXlckuEdRUzE96ZlB+EkFI5QPtfIHg
	 PaV9y+hbnT2d8dpIMrRPesKn+x6RwQqwwPx2T0nJJYoOd3kHOKLUS7nRs/dSbmZzF42Na
	 nvLFeDc3mD1hKMjlEH54qBLi3RJr6ulcK/sK1GXSK2n5JE1gYHvkf33uyui1cVRwyNnEe
	 T4rO6d21JICwa0YkDYsSGsL7avWCSyUajlLn2Y+CpDeLxNodHreb3Eu+QliGizXXHUA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792753527;
	bh=Bj4tqMR/LvYR8qedasilhzkcV9RRIplQHQWZUOB9MF0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rZASWUSenZiFX/Tvxq9MdeGxzxzNLchAZuxEx7/31AlTG1nrkzojNd/8e32YdUZlH
	 u+Elno69Wm53SbHFN7ElyTI6ar0oRQuXnKsA/qaSYyqgddPa0qY7NBlEVohQhkIVwB
	 X45dpSIAmI6/d09Bah6qGgiKjVqCChFUlUj4wjOq4nsfNp3rjxXjw6/0xWcEyojLgZ
	 SHFleGmzdz+2frrPgqGdtOL7taO4vKQZ9Cwen0Hau8wPrfN6WMbimQXjZPUcvHPRAB
	 uGOmdH20hiRfDFujoTVMSMs24mTSJKTWGIAAsNmuxzSDSrvN/U5Ti4V5iWkr1jNvt7
	 JHn+/lC586a9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AED080F5E;
	Fri, 23 Oct 2026 11:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A50235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 112C36064B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T72CK-LOoNka for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EE4560666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792753522;
 b=NgqvJ0hGqyZHcm+38irrGSSTM+6qP228Ese2yjwbkOsFXHlxAcecJqzno5cIAIEHv1pi
 Vz6GdRmwjkSM2HEAhXMV64Lbs2vIIk3GYYVYq0lKCelJGOhA1Zz3y8FzFMtkXi6deT05K
 b5LivwVRtdZHXiugurj6p8DDahnDNLgd5UYiF5YR+Y15Q+Gj2PXr8A5xAY36NKPG69X4u
 EjZ2b6fPTwtH/HQm89t8X/Czbi7QfQbIWqqs7kBx9mO7LQg9FmqZ/aBYrnmWf04FlbxOL
 lotJojiNqYhxYsibeBcV2rZ0IQtWfAltVptLNHJcaqeMcBSbnE/qh2XNwwbfbM0/axw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792753522;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W3b+yxtl2CqlJi2dJY7+zCXAaPC1/lt9HohlZxnBq90=;
 b=QZimUW4ciB/49yWuSKsOnX9DEt2kf/onPQ/HhubCnFitK0dyGCgG8FrILRuhu11Jd/HO
 ltbYPfCC4tJ76YlaQD3JD6HSc5pJJU5hoveIKz6J7jlVgnfvw/y6D+drIGHF3bZnfWiXu
 miR6NiCarVVglFhfsIds16K3ZK0Y0XzrPfjSBmDycHF4R5qdvEz9NDZ3DjJLAkbB29z8g
 +SE9F+pen6JBT9AHOYEsKUwkrVEEP5mLhTHIndn7wfcAqbSvksr5ePIgYBKIT87TBSuFV
 MOy4oyPj51BKxOlk2zkihvUfBopdLBNcdcgpUN35tmeaEO9LXsh9ynNYmF79EBEVTaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EE4560666
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13B989C65B; Fri, 23 Oct 2026 11:03:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:04:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 992677eaa201d8d577ad5c7648dd90dd45baf31a
X-Git-Newrev: 079767988ce2a9c62ff782d31cdc0f5ceeb4c650
X-Patchwork-Hint: ignore
Message-Id: <20261023110358.13B989C65B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix rusticl runtime error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/079767988ce2a9c62ff782d31cdc0f5ceeb4c650
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

mesa3d searches a wrong path for libclc files caused by the bump of llvm
to 23.1.0 with buildroot commit 5f79161e4a8756acdb25c8500de9b2dee663f2ac

This patch adds three upstream commits backported from the 26.3 branch,
for details see upstream PR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624

Fixes tests.package.test_mesa3d.TestMesa3DRusticl.test_run:

Libclc failed to load. Please make sure it is installed and provides
                spirv-mesa3d-.spv and/or spirv64-mesa3d-.spv

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...bclc-do-not-compare-sys_path-against-NULL.patch | 133 +++++++++++++++++++++
 ...r-load_libclc-turn-sys_path-into-an-array.patch | 113 +++++++++++++++++
 ...-nir-load_libclc-add-llvm-23-libclc-paths.patch |  46 +++++++
 3 files changed, 292 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
