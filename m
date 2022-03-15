Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F329CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C03416FF;
	Tue, 15 Mar 2022 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AapNkTQy9RYg; Tue, 15 Mar 2022 21:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB837416F6;
	Tue, 15 Mar 2022 21:22:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 459721BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E344056D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-o0sH8Xce-w for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCADC408B7
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CC6208408C; Tue, 15 Mar 2022 21:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e0bf309a46dcda2be8c2491ac0aabc5883f5c89
X-Git-Newrev: 4542c6714d3951070c31739d24e4bd42b446fbae
X-Patchwork-Hint: ignore
Message-Id: <20220315211222.CC6208408C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libscrypt: bump to version 1.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5591402928919596277=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5591402928919596277==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4542c6714d3951070c31739d24e4bd42b446fbae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch and use {C,LD}FLAGS_EXTRA which are available since
  https://github.com/technion/libscrypt/commit/bdfec26744122e8f52a58bc086c89b27faaf5888
- While at it, also move PREFIX to LIBSCRYPT_MAKE_OPTS as advocated by
  Arnout in
  https://patchwork.ozlabs.org/project/buildroot/patch/20220221172900.1937856-1-fontaine.fabrice@gmail.com/
- Update indentation in hash file (two spaces)

https://github.com/technion/libscrypt/compare/v1.21...v1.22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...g-options-to-CFLAGS-and-LDFLAGS-variables.patch | 34 ----------------------
 package/libscrypt/libscrypt.hash                   |  4 +--
 package/libscrypt/libscrypt.mk                     | 14 ++++++---
 3 files changed, 12 insertions(+), 40 deletions(-)

diff --git a/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch b/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
deleted file mode 100644
index a023a6fe1c..0000000000
--- a/package/libscrypt/0001-Allow-adding-options-to-CFLAGS-and-LDFLAGS-variables.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 097c5d9248f4afd34c73de5aba01a143ef784257 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Tue, 14 Mar 2017 09:23:51 +0100
-Subject: [PATCH] Allow adding options to CFLAGS and LDFLAGS variables
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This also removes a number of hard-coded CFLAGS, leaving it up to the
-user to pass appropriate optimization/hardening flags.
-
-Signed-off-by: Stefan Sørensen <stefan.sorensen@spectralink.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7022a4a..3098a9a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,8 +5,8 @@ MAKE_DIR     ?= install -d
- INSTALL_DATA ?= install
- 
- CC?=gcc
--CFLAGS?=-O2 -Wall -g -D_FORTIFY_SOURCE=2 -fstack-protector -fPIC
--LDFLAGS?=-Wl,-z,now -Wl,-z,relro -Wl,-soname,libscrypt.so.0 -Wl,--version-script=libscrypt.version
-+override CFLAGS+=-fPIC
-+override LDFLAGS+=-Wl,-z,now -Wl,-z,relro -Wl,-soname,libscrypt.so.0 -Wl,--version-script=libscrypt.version
- CFLAGS_EXTRA?=-Wl,-rpath=.
- 
- all: reference
--- 
-2.7.4
-
diff --git a/package/libscrypt/libscrypt.hash b/package/libscrypt/libscrypt.hash
index fda63d1c0d..fcdc4bbeeb 100644
--- a/package/libscrypt/libscrypt.hash
+++ b/package/libscrypt/libscrypt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	libscrypt-1.21.tar.gz
-sha256	aacbfd9e19e5b38ea09616cebf0751ef0cc7b6a19ea0fd78f4b0598b2c503394	LICENSE
+sha256  a2d30ea16e6d288772791de68be56153965fe4fd4bcd787777618b8048708936  libscrypt-1.22.tar.gz
+sha256  aacbfd9e19e5b38ea09616cebf0751ef0cc7b6a19ea0fd78f4b0598b2c503394  LICENSE
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index fa89ed31bc..d28bd4e900 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -4,23 +4,29 @@
 #
 ################################################################################
 
-LIBSCRYPT_VERSION = 1.21
+LIBSCRYPT_VERSION = 1.22
 LIBSCRYPT_SITE = $(call github,technion,libscrypt,v$(LIBSCRYPT_VERSION))
 LIBSCRYPT_LICENSE = BSD-2-Clause
 LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
 
+LIBSCRYPT_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS_EXTRA="$(TARGET_CFLAGS)" \
+	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
+	PREFIX=/usr
+
 define LIBSCRYPT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSCRYPT_MAKE_OPTS)
 endef
 
 define LIBSCRYPT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSCRYPT_MAKE_OPTS) \
 		DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBSCRYPT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=/usr \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSCRYPT_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) install
 endef
 

--===============5591402928919596277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5591402928919596277==--
