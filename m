Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467E0D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDBB160BEA;
	Mon,  8 Dec 2025 20:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnZKaCnDaBKz; Mon,  8 Dec 2025 20:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5D260F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765226816;
	bh=AQ6WINzixhjpGNTUYM798SGWacNaV3lVhPsb8w7AgJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mw21kyqb4vnpvERHp2eEOZ4XkyHPzYSndW2I6H6CkTzKEvv/bSjBmtUuahe+6f9RK
	 2yU89mfxOpd0f8A0EbAA9TyTkqj8li4ygEFWPWutijFFzpKafdDBRXLo2l8r/xKdFf
	 9Bp15ePtHqQJ88qStomvb+w78sLibtbPTTLaOuFq7O+LQ0jnMyDBFDqWASK/Q+QDOX
	 ccI05lmz7vs0+VZWmWBHLsiacyBXZqhTn8sPA3ozZ3T33Ng8xzrCSvGsYCB/b6s+qu
	 jIBoeFaZ5rESNwq3pwJs0ayIKVo2d5oeJ1SnXyXe9ZjlGpUyEz0nQtogJLeyNkHqi6
	 te17ZVJIwbuPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5D260F2B;
	Mon,  8 Dec 2025 20:46:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 382BB151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19F4383C6A
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5clUTSGSKtWl for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 519E983A4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 519E983A4D
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:46:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C677867B1; Mon,  8 Dec 2025 20:46:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 21:32:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8344efd7646d3eed0e2313b1f692bb662d6e2d8f
X-Git-Newrev: d98d9ba28ffa5b468fa243ae1a359aadef3ed0a0
X-Patchwork-Hint: ignore
Message-Id: <20251208204653.3C677867B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: fix zlib build,
 add optional dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=d98d9ba28ffa5b468fa243ae1a359aadef3ed0a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 930660890bf8b40d9bd55cd9e202e574b53d5d49 bumped kbd to
version 2.9.0 which includes optional support for various compression
libraries. This commit adds the corresponding configure options and a
fix for build errors caused by zlib.

The build error was happening when a zlib was compiled before kbd.
The issue can be reproduced with the commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PACKAGE_KBD=y
    BR2_PACKAGE_ZLIB=y
    EOF
    make olddefconfig
    make zlib
    make kbd

The compilation fails with the erro:

    kbdfile-zlib.c: In function 'dlopen_note':
    elf-note.h:27:30: error: 'sym_gzopen' undeclared (first use in this function); did you mean 'sym_gzopen64'?
       27 | #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
          |                              ^~~~

Fixes:
https://autobuild.buildroot.net/results/8ff/8ff6c3d940b68069f748f12646f7516ec86172c1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add commands to reproduce the issue
 - update patch "Upstream:" link to upstream commit
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kbd/0001-libkbdfile-fix-zlib-build.patch | 35 ++++++++++++++++++++++++
 package/kbd/kbd.mk                               | 29 ++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
new file mode 100644
index 0000000000..1324d0b53e
--- /dev/null
+++ b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
@@ -0,0 +1,35 @@
+From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
+Date: Fri, 5 Dec 2025 16:45:36 +0100
+Subject: [PATCH] libkbdfile: fix zlib build
+
+Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libkbdfile/elf-note.h | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
+index a0fd9e2..d3b8d5c 100644
+--- a/src/libkbdfile/elf-note.h
++++ b/src/libkbdfile/elf-note.h
+@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
+  */
+ #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
+ 
+-/* For symbols being dynamically loaded */
+-#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
+-
+ /*
+  * Helper defines, to be done locally before including this header to switch between
+  * implementations
+  */
+-#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
++#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
+ 
+ /*
+  * Originally from systemd codebase.
+-- 
+2.47.3
+
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 8008a9b3be..34401075ce 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -13,6 +13,35 @@ KBD_CONF_OPTS = \
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+KBD_CONF_OPTS += --with-bzip2
+KBD_DEPENDENCIES += bzip2
+else
+KBD_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+KBD_CONF_OPTS += --with-lzma
+KBD_DEPENDENCIES += xz
+else
+KBD_CONF_OPTS += --without-lzma
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+KBD_CONF_OPTS += --with-zlib
+KBD_DEPENDENCIES += zlib
+else
+KBD_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+KBD_CONF_OPTS += --with-zstd
+KBD_DEPENDENCIES += zstd
+else
+KBD_CONF_OPTS += --without-zstd
+endif
+
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
