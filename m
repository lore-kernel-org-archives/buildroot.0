Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2789606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rKt3bu22;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Mw23Boc4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953ED60AE2;
	Thu, 19 Nov 2026 06:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIxkMKAGWMCU; Thu, 19 Nov 2026 06:12:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2832360A94
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795068722;
	b=X8xf/MvvYFlUUQ60+tbA804t/LugNjJITLuAMpHqo4edOEGf5xOFZIjX9ZMzl8+6zo6M
	 ZhDNEo9YAx5lE02fto9F/QCCMOOO1ty8EP96JSm7oEVk0BDol64rRwuPAs/Tc6IwDLY63
	 7u/qSBWfvf28yS28jRThPXbUlMLXEeKNFbPJJFp8iVjUx5Hg260z7Y4umZJs2ziRrWtKE
	 LP9rTLzegX/NsTTigL8ucrL9j4Btn5USt15PagpUaIPmkLnPtOXrrPSFW8IwSqWGLQ7AW
	 7lF19WHLwZfSis5X9bo17MK8BPY3N6KCoy04eLraGF+xfhmX9aQnT4BKphIRWL0IcMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795068722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+aVmYGlPjJsefkFJqxtCNYctzHRZ1qmJvOOBhc7q1Fs=;
	b=HXvVi9LWVnkgWHuC3xZAIY6EYv8zHIQIE2PwnkIyer8GCiov29GxHhPG4K3FxJYysCGm
	 /57BwMuU4BnJcZ1lR+GskA6XhCBzDk6AmB1yYhDzfPvbGJP5b1T9sEW9BM3+CoZP6UcUj
	 2a0QrOJPKFsgPgJUVEZGSo11HK8HyjRdZK6RhKAdVyWSZLrMfWSCvrl6S35UfqG24ykbN
	 BMajdOLrNmsHy47yaStoGvNpA9mU3iE2evPXy5Yx8oN95HRKPoutHdZEw6830qtW01qUh
	 2YG9wDPVNnRmBW2SeZhnoS3NB3TNjLGCdqj3JUNewzpJxWml5Xd9ZTsw/YicEP1Vfkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795068722;
	bh=+aVmYGlPjJsefkFJqxtCNYctzHRZ1qmJvOOBhc7q1Fs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKt3bu22sd07E/qSyozx++f6pBImHyPMwwoYMHUsMyaNw+8ORv26Hbk6X/rgrTALM
	 wjw8O5eDBtT3GpkMDJ5ltxxZkBQ0WVf9d9b1qOeL7lGcjEf5TWcN+DtoTFOEBX08US
	 uU6V3iQq8Ory77wno+TwPueJTwxNGSXyMLgghoMlxs2xPYGSqEhqFbQ7VYlTzeAEOI
	 YIaKAUQmCJVKPTkJc5EnW19PKLDFKJDDBJ39+mpyUdw/Zk0+RSwfaW1J/A0fpaROTr
	 RWRcxq95tUEG3rSEUxI7UvEMd0xj+pymonzQ0zorjHVjwYWQU3rTkjLsQGzn4xEktj
	 XKZELqztObxJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2832360A94;
	Thu, 19 Nov 2026 06:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0216E22
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9600840927
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlqiuzVrp3zP for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 06:11:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A1A80408F7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Mw23Boc4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1A80408F7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795068713;
 bh=6hhGw9bD62+eOA+g3AbbcrGS9jdNJ1Xcdlee1f/j1+s=;
 h=From:To:Cc:Subject:Date:From;
 b=Mw23Boc4oywSBXeNRHt/c4qin70uesVgxYVygmTGnqhWqgOnA5S7zLaE3WI44glyC
 xxVKVbRwIfNnGrGTAmBE27qSqG/ripB7E/3wucnMEmH5JF76kuoaXPbFH8IAk4PwWH
 fGz3Uiqs8g8WZAM14Kl+8WWSUoZRfC629/RAbZHz6yIJIIr3JNC3UGXpP4ZKC4dB4f
 8HaZbWa8n3Eol0beNtsceMYUMX9UkDzeJDD0fhxPsdte1n1Ys9lw/2hDqdw9YCD9Rp
 DKHpUFr0rBg/7NKGdHbVfuyAJyXDXJXua7vbfO77DXCZi2jpsIlHFQuJMclrVkie46
 ildy2HCA1o5sw==
X-KAS-Sym: v3:f51bdf72230551df:N+Ci9nlnIPpd4ggdNKIsa8eigTCDyD0wF7BIiM9lBaZNu
 HIsfu+YutWPKdQ7mvHkwNVqlQXEHL81ED7yFrYvg3fvrJ91kozMGXgzcQC8RSUsR+sAAaeJdU0K
 eiKkXiSCKWwM0zDcwMivF5+x08UAXXwjW1/gEvdCRJpydzAfk3Op/gz9d+JEFpyQLyTwdb8N1Ln
 E9P+KofrVdOXJ8FnGmLZ9RFElFJOlVhLP8biWT2EwryeBHQ6sCcP0OBl9vokPI1+0wxcuwzUYhS
 oJ5cjZ8nEhtQ30QENEKzBpE5iw7mi9Mg44IozKxQpfU5b31BT5GbyBUJ1hMysi38SRIKWLHw==:
 LdG3aXyQIoA4vi6X1LgChM+ZR+8YQw7pneR2tN8/MKcIrFw4GgOJcDvJEJX2+RjSc7wI49c5m7c
 LlxyI5Cch9Mww7TeViSuGn5ukhDnZsEbBb8UuuxT/N9uY1T1FRrU1Cu8fJzWUqOoSXSfuiLm4+8
 JA7R5D+yU1weY8WwOWf9v3gcsK2OrgHuGw7mQTq0cGvYSfHl+cMNIemRojQlAI0Xk11kRi14L1U
 xevjVZpI/uzsVVPBk+EIk+6QAEjyxTYB0z2DLSPw+IFRNguHWg2GqAIdJAd8m53lqqZQXLICV0G
 zWXFJDkA1T3+P7CxdTl5mMI6IC2JU2LVY3OqGXOkNaGYIMWAuo3rcHzjgSWaeuxlPM4Xt4+2MKy
 nhqHaweIHpHMGJ/YqGxM4rqZM46C43frrTOeQ0cehVrMR3avkVfWNOxa6OOJvThmpCE4Qe/jePh
 48LHhvB4ei8axSJ5VTOQXACWZPyrkI3Tb6C0DhyqwcdXUmDsdK2x8K6xsJtoDhg6Jew8AapnBoc
 0hNtaMW2Mml36yTTardRprpIr4r8UYmIVLmgf/gJvYSya2PHsMjm/Ry+JztXbnCFAjZsfRegK39
 PfWApRqq3Dw+tN5I73rkhCgpYYw+c5VLbxN+U0sSSrQKMpfM1EsOARopRB0=
Received: from fli4l.lan.fli4l (p54a1b778.dip0.t-ipconnect.de [84.161.183.120])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 531FDA4C4F29;
 Thu, 19 Nov 2026 07:11:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52256)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xTvNA-000000003Gj-2PzW;
 Thu, 19 Nov 2026 06:11:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 19 Nov 2026 07:11:52 +0100
Message-ID: <20261119061152.4368-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.7
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

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2026-November/000873.html
https://lists.freedesktop.org/archives/mesa-announce/2026-October/000872.html

Removed patches which are included in this release.
Renumbered patch 0008 and added upstream commit URL.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a63a8ffddb6fc15911ec658746c34ec1440c2a2f

 package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
 ...floating-point-exception-flags-with.patch} |   2 +-
 ...do-not-compare-sys_path-against-NULL.patch | 129 ------------------
 ...d_libclc-turn-sys_path-into-an-array.patch | 109 ---------------
 ...load_libclc-add-llvm-23-libclc-paths.patch |  46 -------
 package/mesa3d/mesa3d.hash                    |   6 +-
 package/mesa3d/mesa3d.mk                      |   2 +-
 7 files changed, 6 insertions(+), 290 deletions(-)
 rename package/mesa3d/{0008-nir-fix-build-of-floating-point-exception-flags-with.patch => 0005-nir-fix-build-of-floating-point-exception-flags-with.patch} (96%)
 delete mode 100644 package/mesa3d/0005-nir-load_libclc-do-not-compare-sys_path-against-NULL.patch
 delete mode 100644 package/mesa3d/0006-nir-load_libclc-turn-sys_path-into-an-array.patch
 delete mode 100644 package/mesa3d/0007-nir-load_libclc-add-llvm-23-libclc-paths.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d42e7c7a0a..b87e890603 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.2.5
+MESA3D_HEADERS_VERSION = 26.2.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch b/package/mesa3d/0005-nir-fix-build-of-floating-point-exception-flags-with.patch
similarity index 96%
rename from package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
rename to package/mesa3d/0005-nir-fix-build-of-floating-point-exception-flags-with.patch
index 7130588206..cd00255dfa 100644
--- a/package/mesa3d/0008-nir-fix-build-of-floating-point-exception-flags-with.patch
+++ b/package/mesa3d/0005-nir-fix-build-of-floating-point-exception-flags-with.patch
@@ -16,7 +16,7 @@ Check for fenv.h and guard the fenv code added by commit
 https://gitlab.freedesktop.org/mesa/mesa/-/commit/6351df29e2d99a982dbfed931b23a76defca0132
 with ifdef's.
 
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45569
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/49d0063365a3e6902ad1612dd58b01a86af1aadc
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
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
index fdcc345896..62eb463629 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
-sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
-sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-November/000873.html
+sha256  04294f75d22e9f61cd1e050206bc48b3d39366e788f1803a3368e3d5a872ce18  mesa-26.2.7.tar.xz
+sha512  1886bd11f1a2cf8aad5289636004f26536c8dbef47848c15f1ca307b8f8e98dc853c5901630f9be37bd0f1bc044990b924ab698bd493751ce48acb8eddf569d1  mesa-26.2.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20f02190a..7e7366b275 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.2.5
+MESA3D_VERSION = 26.2.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
