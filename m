Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92A606A321
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aL0X0Ln+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25784081E;
	Sat, 24 Oct 2026 17:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVqA2dv_WOrt; Sat, 24 Oct 2026 17:54:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3D7EB4077C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864461;
	b=i8bu2/H/h89EihytQph122PZ2sODxWAJWYHWQuWvHUpU48FxcPLwSSr0P6ZieRgOVsd8
	 fvnAw4IZYkWOt1jaCsGV31hAvjU4a3ALgmYZ0EsC6XbI8e38TclTFMbTix7/R5r0yr6DW
	 HfjRI09Jcsfekq+KiL8joU7yNa+5MgDpcTEPVdAggk3V0vtvLZhP5X0ltRFcbNREC5zzM
	 zfh25GhnMXkBl5zJXUWhm4n1Ooj6WjJFG1zqz7xHtsvQVJNJdUHopSEMpnOEKZwj3dCdc
	 DeRx9Nw43P7SHVeC7K0+MX8Wb7GyU5IeoOwDJ0SOXsUH+WzkWos21jjYaKKjdy08eZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PVP2ipEraxPpZZBQVDkyjPHDsFeyy8AA1Plh8YHcLbc=;
	b=XJ0Y26o9POaxIki/vrWmQSQopG0ngwEnLF5ehcrbUV32JUsk44eAOraW/uVKiaehCt8X
	 CgFEIqVcqsvqDxH9fSvVQU1WAWAzrMWU46ifsl0xFKQWX9WY1gndQj8h6SOc54JR96IHZ
	 uNVfhk12yTfA6q/7NqqzJXqu2EqAdLga3IWs14cVbHb2MlF4Hc5MupRum8VRqsS1GLUXR
	 blTNzGRYrIiFa+RqyuuVG+8XOBok8IF23YCcbK6GRDWwPAmCI5efehzK7ZVjfvvEVVPB9
	 3mevdrFGMIwqp3V5b73bXRiwWJJHa0EmG7ILbdsvzb6zc9wn8cpYAYb98gcCdFr6Txw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864461;
	bh=PVP2ipEraxPpZZBQVDkyjPHDsFeyy8AA1Plh8YHcLbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aL0X0Ln+QrXgn2s8uoynLBfp6pthHDt02qUbuEK8P18Kiw7CRIgA6kiZUhD0nOFqh
	 hZsL6qsbzfKwOZqQqQzmAspLgs1roGgAnYZJ0ofUQq0wM+CMY9nzEwazXyoT1qd6jp
	 BwaDGG0LvIbonkIyIFT68KUP2fa6n9XAgV0U5/aNNzde178iKgNoPLPPaO3fTg+GBT
	 0hR4zQaRJuGvs4Rnr0Hmg7gm+7d9JXI+91xZrhtd7cSfC8UkE6O966Oo8fD7b+PJYW
	 8FgmqSz581aGu2jJYrsrF0YtH4heLLgK1L6eoD7P9il7ojSMQsItof/kCEAOjHtG+M
	 qK9vo5imy7big==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7EB4077C;
	Sat, 24 Oct 2026 17:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C81653D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE26A811B1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0Jsmlp9FjFt for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FC438125F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864453;
 b=LWmBu/aSd+VoGU4BE0sxbl36S3NqJrXLzokYGCZavUfpnc117FsAr4IWJJfF4ijaYEjF
 350xSAgv6aEebZ5axCb6q7SiKlf7zlSyq/1VBc6aR1hyoHblAAJegMouzgFbJxZlp8/Hc
 Yfm/PcsW+9JqSkSAeKh4lIj9PDqsJAn7LCkXcI9TT9DH8TNUocqUkjJeY3o3rjEJe59pE
 3TeY6Kh5+UNKtag0fl4YzCBJvhmtUfpBfoFLYuM16dchWSy8u4podK8mOXbEmuyR7txXJ
 nZe0T7VfARX8h7a6QIXBo5ODgGhtoW/Joo2eeIsxNYl09RuLV/R4ZpXjKPPOBQeloQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864453;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m8oLOf5+whzQoJ2gKjWJdHQShVuHyCyIUUARC/GGlOI=;
 b=WJBARc/cIflo/71IgUy8HBQpZleKfhO9zGFUIzlVAakUGRRtQOsfc3gjtiGe5tanNogk
 rYJ3lGyrDZGkaUmB+H95eyT4gDQJwl2o/gPPyfIMgzhkMefw2uE9H9Vp251g4JK5ARvbz
 zWqC8ft0yfoH5emy5oMx3e9dNYkQRlIWUIdyDzX0MO8kAVYp8qtOsSpvfb8hokL6leKlA
 bZQ6GHzGAHUWPxB235S8RdWOSygudJg3ieRt2NJzziUZmhU8jBPa7ffeF9vpIz2rFDqDE
 I2ggmiDdxHaRJ63KZ9CR4s/5CEo2NQfsj3DIcK+lSsiX7juktwKam640G3NY65kyBxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FC438125F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A4389C7BD; Sat, 24 Oct 2026 17:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ae9f49b215178784f36b486611248e217fc153
X-Git-Newrev: 10b94e17f394a2d82c1748c1a6232a225970a1b5
X-Patchwork-Hint: ignore
Message-Id: <20261024175248.3A4389C7BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.5
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10b94e17f394a2d82c1748c1a6232a225970a1b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
https://lists.freedesktop.org/archives/mesa-announce/2026-October/000870.html
https://lists.freedesktop.org/archives/mesa-announce/2026-September/000869.html
https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000867.html
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html

Removed patch which was applied to fix a build error with gcc < 13 seen
with mesa 26.1.x.

Renumbered remaining patches.

Rebased patches 0005-0007 by replacing them with non-rebased versions
of the upstream commits. The rebase was only needed for the mesa's
26.1.x branch.

Added patch 0008 to fix a build error which would be introduced by this
bump due to upstream commit:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/6351df29e2d99a982dbfed931b23a76defca0132

Upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/3f9451b54c42a37b41246de3ceea991111389c37
added rusticl to the variable with_driver_using_cl which creates a new
dependency to the precomp-compiler:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.2.5/meson.build?ref_type=tags#L973

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...clc-do-not-compare-sys_path-against-NULL.patch} | 68 +++++++++---------
 ...ompiler-jay-jay_ir.h-do-not-used-typed-en.patch | 41 -----------
 ...-load_libclc-turn-sys_path-into-an-array.patch} | 68 +++++++++---------
 ...nir-load_libclc-add-llvm-23-libclc-paths.patch} |  4 +-
 ...ld-of-floating-point-exception-flags-with.patch | 84 ++++++++++++++++++++++
 package/mesa3d/Config.in                           |  1 +
 package/mesa3d/mesa3d.hash                         |  6 +-
 package/mesa3d/mesa3d.mk                           |  2 +-
 9 files changed, 156 insertions(+), 120 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fd715b5f84..d42e7c7a0a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.8
+MESA3D_HEADERS_VERSION = 26.2.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch b/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
similarity index 75%
rename from package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
rename to package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
index 21cfe54e80..6883031951 100644
--- a/package/mesa3d/0006-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
+++ b/package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
@@ -1,4 +1,4 @@
-From f5011f50a7e9c3f8dc208e16a4bd3aadbd6fdae8 Mon Sep 17 00:00:00 2001
+From 1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 13:53:43 +0200
 Subject: [PATCH] nir/load_libclc: do not compare sys_path against NULL
@@ -11,14 +11,13 @@ Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/1219dc3f7fe83b1f7f200190bf02a86ab57b3d4f
 
-[Bernd: backported to 26.1.8]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/compiler/clc/nir_load_libclc.c | 84 ++++++++++++++----------------
- 1 file changed, 39 insertions(+), 45 deletions(-)
+ src/compiler/clc/nir_load_libclc.c | 76 ++++++++++++++----------------
+ 1 file changed, 35 insertions(+), 41 deletions(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 4cb92bdb257..46beaf51cdf 100644
+index edcd13b3b26..913dd8ff7a7 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -145,20 +145,18 @@ map_clc_data(struct clc_data *clc)
@@ -69,7 +68,7 @@ index 4cb92bdb257..46beaf51cdf 100644
  #endif
  }
  
-@@ -198,33 +194,31 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+@@ -198,34 +194,32 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
     }
  
  #ifdef DYNAMIC_LIBCLC_PATH
@@ -77,7 +76,10 @@ index 4cb92bdb257..46beaf51cdf 100644
 -      int fd = open(clc->file->sys_path, O_RDONLY);
 -      if (fd < 0)
 -         return false;
--
++   int fd = open(clc->file->sys_path, O_RDONLY);
++   if (fd < 0)
++      return false;
+ 
 -      struct stat stat;
 -      int ret = fstat(fd, &stat);
 -      if (ret < 0) {
@@ -85,46 +87,40 @@ index 4cb92bdb257..46beaf51cdf 100644
 -         close(fd);
 -         return false;
 -      }
--
++   struct stat stat;
++   int ret = fstat(fd, &stat);
++   if (ret < 0) {
++      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
++      close(fd);
++      return false;
++   }
+ 
 -      clc->fd = fd;
 -      clc->size = stat.st_size;
--
++   clc->fd = fd;
++   clc->size = stat.st_size;
+ 
 -      if (!map_clc_data(clc)) {
+-         close_clc_data(clc);
 -         return false;
 -      }
--
++   if (!map_clc_data(clc)) {
++      close_clc_data(clc);
++      return false;
++   }
+ 
 -      blake3_hasher ctx;
 -      _mesa_blake3_init(&ctx);
 -      _mesa_blake3_update(&ctx, clc->data, clc->size);
 -      _mesa_blake3_final(&ctx, clc->cache_key);
--
++   blake3_hasher ctx;
++   _mesa_blake3_init(&ctx);
++   _mesa_blake3_update(&ctx, clc->data, clc->size);
++   _mesa_blake3_final(&ctx, clc->cache_key);
+ 
 -      return true;
 -   }
-+  int fd = open(clc->file->sys_path, O_RDONLY);
-+  if (fd < 0)
-+     return false;
-+
-+  struct stat stat;
-+  int ret = fstat(fd, &stat);
-+  if (ret < 0) {
-+     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
-+     close(fd);
-+     return false;
-+  }
-+
-+  clc->fd = fd;
-+  clc->size = stat.st_size;
-+
-+  if (!map_clc_data(clc)) {
-+     return false;
-+  }
-+
-+  blake3_hasher ctx;
-+  _mesa_blake3_init(&ctx);
-+  _mesa_blake3_update(&ctx, clc->data, clc->size);
-+  _mesa_blake3_final(&ctx, clc->cache_key);
-+
-+  return true;
++   return true;
  #endif
  
     return false;
diff --git a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
deleted file mode 100644
index af066287e2..0000000000
--- a/package/mesa3d/0005-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 345ccf93e9d00dfd0f71085832a7df0170b74f74 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 14 Jun 2026 17:42:19 +0200
-Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
-
-This is a C23 feature and not supported by gcc < 13, which
-many host distros still have (e.g. Debian 12).
-
-Upstream-Status: Inappropriate [yocto host distro requirements]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Upstream: N/A, code completely changed upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/intel/compiler/jay/jay_ir.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/intel/compiler/jay/jay_ir.h b/src/intel/compiler/jay/jay_ir.h
-index 8307044ef8a..abf175a71bf 100644
---- a/src/intel/compiler/jay/jay_ir.h
-+++ b/src/intel/compiler/jay/jay_ir.h
-@@ -579,7 +579,7 @@ jay_type_is_any_float(enum jay_type t)
-    return jay_base_type(t) == JAY_TYPE_F || jay_base_type(t) == JAY_TYPE_BF;
- }
- 
--enum jay_predication : uint8_t {
-+enum jay_predication {
-    /** No predication. */
-    JAY_NOT_PREDICATED = 0,
- 
-@@ -634,7 +634,7 @@ typedef struct jay_inst {
-    bool decrement_dep:1;
-    unsigned padding  :12;
- 
--   enum jay_predication predication;
-+   uint8_t predication;
-    enum jay_conditional_mod conditional_mod;
- 
-    jay_def cond_flag; /**< conditional flag */
--- 
-2.55.0
-
diff --git a/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch b/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
similarity index 71%
rename from package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
rename to package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
index ff53b68f19..916af6547d 100644
--- a/package/mesa3d/0007-nir-load_libclc-turn-sys_path-into-an-array.patch
+++ b/package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
@@ -1,4 +1,4 @@
-From 9d4685ec168e28bec7c25859f8d9162865c14284 Mon Sep 17 00:00:00 2001
+From 62ee563fd398169005906245831db680f813b19f Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 14:11:09 +0200
 Subject: [PATCH] nir/load_libclc: turn sys_path into an array
@@ -7,14 +7,13 @@ Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44624>
 
 Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/62ee563fd398169005906245831db680f813b19f
 
-[Bernd: backported to 26.1.8]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- src/compiler/clc/nir_load_libclc.c | 63 +++++++++++++++++-------------
- 1 file changed, 35 insertions(+), 28 deletions(-)
+ src/compiler/clc/nir_load_libclc.c | 55 +++++++++++++++++-------------
+ 1 file changed, 31 insertions(+), 24 deletions(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 46beaf51cdf..54b45ad7808 100644
+index 913dd8ff7a7..17b901db47c 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -52,7 +52,7 @@ struct clc_file {
@@ -48,41 +47,26 @@ index 46beaf51cdf..54b45ad7808 100644
  #endif
     },
  };
-@@ -194,31 +198,34 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
+@@ -194,32 +198,35 @@ open_clc_data(struct clc_data *clc, unsigned ptr_bit_size)
     }
  
  #ifdef DYNAMIC_LIBCLC_PATH
--  int fd = open(clc->file->sys_path, O_RDONLY);
--  if (fd < 0)
--     return false;
--
--  struct stat stat;
--  int ret = fstat(fd, &stat);
--  if (ret < 0) {
--     fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
--     close(fd);
--     return false;
--  }
--
--  clc->fd = fd;
--  clc->size = stat.st_size;
--
--  if (!map_clc_data(clc)) {
--     return false;
--  }
--
--  blake3_hasher ctx;
--  _mesa_blake3_init(&ctx);
--  _mesa_blake3_update(&ctx, clc->data, clc->size);
--  _mesa_blake3_final(&ctx, clc->cache_key);
--
--  return true;
+-   int fd = open(clc->file->sys_path, O_RDONLY);
+-   if (fd < 0)
+-      return false;
 +   for (unsigned i = 0; i < ARRAY_SIZE(clc->file->sys_paths); i++) {
 +      const char *sys_path = clc->file->sys_paths[i];
 +      int fd = open(sys_path, O_RDONLY);
 +      if (fd < 0)
 +         continue;
-+
+ 
+-   struct stat stat;
+-   int ret = fstat(fd, &stat);
+-   if (ret < 0) {
+-      fprintf(stderr, "fstat failed on %s: %m\n", clc->file->sys_path);
+-      close(fd);
+-      return false;
+-   }
 +      struct stat stat;
 +      int ret = fstat(fd, &stat);
 +      if (ret < 0) {
@@ -90,19 +74,31 @@ index 46beaf51cdf..54b45ad7808 100644
 +         close(fd);
 +         continue;
 +      }
-+
+ 
+-   clc->fd = fd;
+-   clc->size = stat.st_size;
 +      clc->fd = fd;
 +      clc->size = stat.st_size;
-+
+ 
+-   if (!map_clc_data(clc)) {
+-      close_clc_data(clc);
+-      return false;
+-   }
 +      if (!map_clc_data(clc)) {
++         close_clc_data(clc);
 +         continue;
 +      }
-+
+ 
+-   blake3_hasher ctx;
+-   _mesa_blake3_init(&ctx);
+-   _mesa_blake3_update(&ctx, clc->data, clc->size);
+-   _mesa_blake3_final(&ctx, clc->cache_key);
 +      blake3_hasher ctx;
 +      _mesa_blake3_init(&ctx);
 +      _mesa_blake3_update(&ctx, clc->data, clc->size);
 +      _mesa_blake3_final(&ctx, clc->cache_key);
-+
+ 
+-   return true;
 +      return true;
 +   }
  #endif
diff --git a/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch b/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
similarity index 93%
rename from package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
rename to package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
index bfef0c50ba..f43b7b7260 100644
--- a/package/mesa3d/0008-nir-load_libclc-add-llvm-23-libclc-paths.patch
+++ b/package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch
@@ -1,4 +1,4 @@
-From c86bf6e6b9fbc9cfb02eeed3d798ffbdd3dc0252 Mon Sep 17 00:00:00 2001
+From 6b9cd5ab9cc3bfd0c79d9500a07a5e74351c72d1 Mon Sep 17 00:00:00 2001
 From: Karol Herbst <kherbst@redhat.com>
 Date: Tue, 22 Sep 2026 14:13:28 +0200
 Subject: [PATCH] nir/load_libclc: add llvm-23 libclc paths
@@ -13,7 +13,7 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/compiler/clc/nir_load_libclc.c b/src/compiler/clc/nir_load_libclc.c
-index 54b45ad7808..bb1efd0ce57 100644
+index 17b901db47c..889bde610a3 100644
 --- a/src/compiler/clc/nir_load_libclc.c
 +++ b/src/compiler/clc/nir_load_libclc.c
 @@ -52,7 +52,7 @@ struct clc_file {
diff --git a/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch b/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
new file mode 100644
index 0000000000..7130588206
--- /dev/null
+++ b/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
@@ -0,0 +1,84 @@
+From 0c567be6b8782b1fe3ed6f1e7499856bf6af9f6a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 23 Oct 2026 21:33:52 +0200
+Subject: [PATCH] nir: fix build of floating point exception flags with
+ toolchains lacking fenv support
+
+uClibc-ng supports C99 Floating-point on a restricted set of platforms:
+https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/extra/Configs/Config.in.arch#L163
+
+causing build errors on the other supported platforms:
+
+src/compiler/nir/nir_constant_expressions.c:24:10: fatal error:
+ fenv.h: No such file or directory
+
+Check for fenv.h and guard the fenv code added by commit
+https://gitlab.freedesktop.org/mesa/mesa/-/commit/6351df29e2d99a982dbfed931b23a76defca0132
+with ifdef's.
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45569
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build                                  | 2 +-
+ src/compiler/nir/nir_constant_expressions.py | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5f19ef921a6..9c57445edb6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1613,7 +1613,7 @@ endif
+ 
+ foreach h : ['xlocale.h', 'linux/futex.h', 'endian.h', 'dlfcn.h', 'sys/shm.h',
+              'cet.h', 'pthread_np.h', 'poll.h', 'sys/inotify.h',
+-             'linux/udmabuf.h']
++             'linux/udmabuf.h', 'fenv.h']
+   if cc.check_header(h)
+     pre_args += '-DHAVE_@0@'.format(h.to_upper().underscorify())
+   endif
+diff --git a/src/compiler/nir/nir_constant_expressions.py b/src/compiler/nir/nir_constant_expressions.py
+index c4ae87db1a7..23f4aa6adbb 100644
+--- a/src/compiler/nir/nir_constant_expressions.py
++++ b/src/compiler/nir/nir_constant_expressions.py
+@@ -55,7 +55,9 @@ template = """\
+  * IN THE SOFTWARE.
+  */
+ 
++#ifdef HAVE_FENV_H
+ #include <fenv.h>
++#endif
+ #include <math.h>
+ #include "util/rounding.h" /* for _mesa_roundeven */
+ #include "util/half_float.h"
+@@ -660,6 +662,7 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+                       nir_const_value **src,
+                       unsigned float_controls_execution_mode)
+ {
++#ifdef HAVE_FENV_H
+    /* Temporarily disable floating point exception flags while we
+     * evaluate shader constants. This avoids games unexpectedly crashing while
+     * we evalute shader math on the cpu if they have the exeption flags turn
+@@ -673,6 +676,7 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+ #endif
+    if (unlikely(had_flags))
+       feholdexcept(&__nir_const_fenv);
++#endif
+ 
+    nir_component_mask_t poison;
+ 
+@@ -689,9 +693,11 @@ nir_eval_const_opcode(nir_op op, nir_const_value *dest, nir_component_mask_t *ou
+    if (out_poison)
+       *out_poison = poison;
+ 
++#ifdef HAVE_FENV_H
+    /* Restore floating point exception flags */
+    if (unlikely(had_flags))
+       fesetenv(&__nir_const_fenv);
++#endif
+ }"""
+ 
+ from mako.template import Template
+-- 
+2.47.3
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f45a675445..d1b6a38858 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -64,6 +64,7 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dc7776488a..fdcc345896 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
-sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
-sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
+sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
+sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 04112eea8e..f20f02190a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.8
+MESA3D_VERSION = 26.2.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
