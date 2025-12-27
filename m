Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F2E92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3D64043B;
	Sat, 27 Dec 2025 15:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xn_3Qj7Joi-y; Sat, 27 Dec 2025 15:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3647F4043C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766851146;
	bh=DFyPyg+g626nY0DeMxuVWmVkTPbWQH+Go0EA8xk8354=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I36n+IhKmc7t/V2sIlV/MVHX+G5ryFNEguPYhyI/U0WDtgkq8l0guJ9up2/tKpLZq
	 1nkVx4kDxB93dz+G965SnrW39fxrNmIS9391T34wQI8ULTphjtfxK3Hp62UYChpHc5
	 gu3/rc06jo1TzkYpKM7X+4eT+DBO/jm6eyiZHncKXtzSITJUkW3v3tPlkhi6/WyZ5j
	 Pc7KFf6A9kbGzDChYdiEa71mN4g5059kjaCycpmC5xcaOyDD7gQ1Ul/Ws9XUm4+6Jr
	 x6bcqoZyOPcIEN3idQa8MGVfCKQm5kUqHA962UxMIrkxr6Yyn7dlbUlOCEZuZ1vbLm
	 iIZE9PK8UCyEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3647F4043C;
	Sat, 27 Dec 2025 15:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4094BD8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32A2A4043C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDlr_c-dcTJI for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 513304043B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 513304043B
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:59:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 433EF87719; Sat, 27 Dec 2025 15:59:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:57:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4cdb412f15f3b6abad2028c955aa3bda7b486df
X-Git-Newrev: d582de683880df17bd80d07b4bda0a8d9b970a70
X-Patchwork-Hint: ignore
Message-Id: <20251227155904.433EF87719@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.16.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d582de683880df17bd80d07b4bda0a8d9b970a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This maintenance release introduces support for newer versions of the
Mesa library. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.16.1.html

Also imports an upstream patch that is needed at least to successfully
build when using the Musl libc.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-ws-egl-Add-missing-unistd.h-include.patch | 30 ++++++++++++++++++++++
 package/wpebackend-fdo/wpebackend-fdo.hash         |  8 +++---
 package/wpebackend-fdo/wpebackend-fdo.mk           |  2 +-
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch b/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch
new file mode 100644
index 0000000000..037682a608
--- /dev/null
+++ b/package/wpebackend-fdo/0001-ws-egl-Add-missing-unistd.h-include.patch
@@ -0,0 +1,30 @@
+From 5316ecb0193d8c8cbbbe0921ba711859b36f8ef3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sat, 20 Dec 2025 15:05:05 +0200
+Subject: [PATCH] ws-egl: Add missing unistd.h include
+
+Fixes #204
+
+(cherry picked from commit 84492327673fa0dedfa4fa0ab9488bed1763a5a8)
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://github.com/Igalia/WPEBackend-fdo/commit/5316ecb0193d8c8cbbbe0921ba711859b36f8ef3
+---
+ src/ws-egl.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ws-egl.cpp b/src/ws-egl.cpp
+index 76d6194..cc7a8f2 100644
+--- a/src/ws-egl.cpp
++++ b/src/ws-egl.cpp
+@@ -33,6 +33,7 @@
+ #include <vector>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ 
+ #ifndef EGL_WL_bind_wayland_display
+ #define EGL_WAYLAND_BUFFER_WL 0x31D5
+-- 
+2.52.0
+
diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index f0578808c4..5e36137524 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.0.tar.xz.sums
-md5  38f488aaa6d68252b593b65ba3e2d9d1  wpebackend-fdo-1.16.0.tar.xz
-sha1  8a06e51aeb2c94b4cf254d866c19eca587d3cd37  wpebackend-fdo-1.16.0.tar.xz
-sha256  beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635  wpebackend-fdo-1.16.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.16.1.tar.xz.sums
+md5  a112358168e03abf4937c0cecfe1dc9d  wpebackend-fdo-1.16.1.tar.xz
+sha1  4ed9d1d568ef805f79b691baa0d1cbdff17ef453  wpebackend-fdo-1.16.1.tar.xz
+sha256  544ae14012f8e7e426b8cb522eb0aaaac831ad7c35601d1cf31d37670e0ebb3b  wpebackend-fdo-1.16.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index e5972754f6..6dbe6edfe3 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.16.0
+WPEBACKEND_FDO_VERSION = 1.16.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
