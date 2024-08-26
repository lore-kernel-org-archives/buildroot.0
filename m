Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7CDC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 11:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEB2401B8;
	Mon, 26 Aug 2024 11:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jtCkW7FX2in; Mon, 26 Aug 2024 11:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6CE401C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6CE401C0;
	Mon, 26 Aug 2024 11:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A10B91BF308
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD3940202
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvI2ViVziLaw for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 11:53:22 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 26 Aug 2024 11:53:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57444401B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57444401B8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.234.176.197;
 helo=aposti.net; envelope-from=paul@crapouillou.net; receiver=<UNKNOWN> 
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57444401B8
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 11:53:22 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 13:47:57 +0200
Message-ID: <20240826114757.150278-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1724672890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k/zRO0WONWbXia2OoXGS1Z23UiEsmM5ygoVCIynaYGY=;
 b=vxW4DB+VdQRYkoQ0TCVFrc5yIl6CU146vyQva5WLhz+EIJP1z0YENHjZtrPF/knOATJr6o
 78hzJgaFkwLjEggrGkLTLp1DBNUks2MQ8SSd+qbcobXeep8Bz5PZBTU5j4Z/27sGuiyGLr
 nF5QwCrf3AqXHlJL/4xy9Bz5Aovjm+4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=vxW4DB+V
Subject: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.6.8
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.8/Release-notes.txt

Drop the patch 0001-Fix-output_dir-make-dependency.patch which is not
needed anymore.

Swap "$(MAKE) $(TARGET_CONFIGURE_OPTS)" to
"$(TARGET_CONFIGURE_OPTS) $(MAKE)", otherwise the package does not
build.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../0001-Fix-output_dir-make-dependency.patch | 46 -------------------
 package/umtprd/umtprd.hash                    |  2 +-
 package/umtprd/umtprd.mk                      |  4 +-
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/umtprd/0001-Fix-output_dir-make-dependency.patch

diff --git a/package/umtprd/0001-Fix-output_dir-make-dependency.patch b/package/umtprd/0001-Fix-output_dir-make-dependency.patch
deleted file mode 100644
index fcbca6b000..0000000000
--- a/package/umtprd/0001-Fix-output_dir-make-dependency.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d84216a678edaca81c0899318231cdcca2100d38 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Mon, 17 Oct 2022 16:39:56 -0600
-Subject: [PATCH] Fix output_dir make dependency
-
-Object file targets need to depend on the output_dir target.
-
-Fixes:
-make --shuffle=reverse -j1
-cc -o obj/mtp_op_truncateobject.o src/mtp_operations/mtp_op_truncateobject.c -c  -I./inc -lpthread -Wall -O3
-Assembler messages:
-Fatal error: can't create obj/mtp_op_truncateobject.o: No such file or directory
-make: *** [Makefile:19: obj/mtp_op_truncateobject.o] Error 1 shuffle=reverse
-
-[paul@crapouillou.net: Backport from upstream commit d84216a]
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7c98b63..c28e186 100644
---- a/Makefile
-+++ b/Makefile
-@@ -7,15 +7,15 @@ objects := $(sources:src/%.c=obj/%.o)
- ops_sources := $(wildcard src/mtp_operations/*.c)
- ops_objects := $(ops_sources:src/mtp_operations/%.c=obj/%.o)
- 
--all: output_dir umtprd
-+all: umtprd
- 
- umtprd: $(objects) $(ops_objects)
- 	${CC} -o $@    $^ $(LDFLAGS) -lpthread
- 
--$(objects): obj/%.o: src/%.c
-+$(objects): obj/%.o: src/%.c | output_dir
- 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
- 
--$(ops_objects): obj/%.o: src/mtp_operations/%.c
-+$(ops_objects): obj/%.o: src/mtp_operations/%.c | output_dir
- 	${CC} -o $@ $^ -c $(CPPFLAGS) $(CFLAGS)
- 
- output_dir:
--- 
-2.35.1
-
diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index 7cd75619ab..f682dd6d84 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1de40511c1dd4618719cff2058dfe68a595f1b9284c80afa89d6d1a1c80aec29  umtprd-1.6.2.tar.gz
+sha256  e0b3c308016595a5d956eaaa086d3bfe4c9af2270857181695338df9affb3574  umtprd-1.6.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index c5e0ee512e..1f1f6bcd23 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.6.2
+UMTPRD_VERSION = 1.6.8
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
 
 define UMTPRD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define UMTPRD_INSTALL_TARGET_CMDS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
