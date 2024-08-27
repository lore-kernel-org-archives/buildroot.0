Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E91C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE7C40585;
	Tue, 27 Aug 2024 16:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id annz0Wx6FfxH; Tue, 27 Aug 2024 16:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1260F40586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1260F40586;
	Tue, 27 Aug 2024 16:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5847F1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451A7402EA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5I4_ZLFf1OHM for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1055D40249
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1055D40249
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:39:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E98C286534; Tue, 27 Aug 2024 16:39:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:33:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd29f403d8fe78d42f9eb03d902c40151f1ed1a0
X-Git-Newrev: 89c04d7e12ce21d9ba77906ee1790687e5d034e4
X-Patchwork-Hint: ignore
Message-Id: <20240827163940.E98C286534@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/umtprd: bump to
 version 1.6.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89c04d7e12ce21d9ba77906ee1790687e5d034e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.8/Release-notes.txt

Drop the patch 0001-Fix-output_dir-make-dependency.patch which is not
needed anymore.

Swap "$(MAKE) $(TARGET_CONFIGURE_OPTS)" to
"$(TARGET_CONFIGURE_OPTS) $(MAKE)", otherwise the package does not
build.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Fix-output_dir-make-dependency.patch      | 46 ----------------------
 package/umtprd/umtprd.hash                         |  2 +-
 package/umtprd/umtprd.mk                           |  4 +-
 4 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8ce5047ae6..4380bc1a99 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1296,7 +1296,6 @@ package/uemacs/01-clear-ixon-termios-flag.patch lib_patch.Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch lib_patch.Upstream
 package/uhttpd/0001-Remove-Werror.patch lib_patch.Upstream
 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch lib_patch.Upstream
-package/umtprd/0001-Fix-output_dir-make-dependency.patch lib_patch.Upstream
 package/unbound/S70unbound Shellcheck
 package/unifdef/0001-Makefile-fix-error-on-install.patch lib_patch.Upstream
 package/unscd/S46unscd Shellcheck lib_sysv.Indent lib_sysv.Variables
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
