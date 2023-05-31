Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B021C77B73
	for <buildroot@archiver.kernel.org>; Wed, 31 May 2023 17:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC72C81EE3;
	Wed, 31 May 2023 17:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC72C81EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAUEZPmMvO4P; Wed, 31 May 2023 17:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8A081E9D;
	Wed, 31 May 2023 17:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8A081E9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 278271BF37C
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 17:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D4E8605AC
 for <buildroot@lists.busybox.net>; Wed, 31 May 2023 17:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4E8605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjXgUzr9C7op for <buildroot@lists.busybox.net>;
 Wed, 31 May 2023 17:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4757D60030
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4757D60030
 for <buildroot@buildroot.org>; Wed, 31 May 2023 17:02:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.185.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B6FAA13F8A9;
 Wed, 31 May 2023 19:02:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 May 2023 19:02:07 +0200
Message-Id: <20230531170207.727576-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685552540;
 bh=abc00Jm2c8A+FZAWSO6bv5TPn76V310/pet6UhB5ymI=;
 h=From:To:Cc:Subject:Date:From;
 b=ASgJeK8mau3y6RMbZRS/kHoLDmBrWQWjiPFGL1Hfh2GdfNc1UP0GbFVzVNXN2VQw/
 vh6Fhq6Mb7mjXSALIzP/SuPPGR3o1jXvKuwNEAkOrZMChkauyUBjHQsIyaPNdlr4dB
 V+kbcElo0BkM5edmTwjrJdVdoKvB2H6KLx1LVsggYJJJThMQbLd/KKQtaAcPVZXLvJ
 ZPGhvcJG+n3dVFcL5VwxzEdYdumMUtjEQGUkDIgL3F3w7VxXZDS52fvhtLdPN7Iq+P
 X9CponsDEhHbZ8lGm14H7V/8+0fuqpX1G4eQnv6jrOGzC2anc379vP5fs5vYrA1d+W
 rl1X8MDsCtU/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ASgJeK8m
Subject: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20230331
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 20220331, see:
- https://www.acpica.org/node/201
- https://www.acpica.org/node/202
or
- https://github.com/acpica/acpica/blob/R03_31_23/documents/changes.txt

This commit also drop the patch removing -Werror in CFLAGS, as an
alternative is now available upstream, merged in:
https://github.com/acpica/acpica/commit/3fd0f940408fc01a2c52c5be5f2beb0218a3d907
which is included in release 20221020. The build commands are updated
accordingly to set the new NOWERROR=TRUE option to achieve the same
behavior.

With the patch removal, .checkpackageignore is also updated
accordingly.

The license file hash is also updated, due to the copyright year
update.

This version bump is motivated by the introduction of RISC-V related
definitions.

Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit c765ac9 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated
---
 .checkpackageignore                           |  1 -
 .../acpica/0001-build-do-not-use-Werror.patch | 82 -------------------
 package/acpica/acpica.hash                    |  4 +-
 package/acpica/acpica.mk                      |  4 +-
 4 files changed, 5 insertions(+), 86 deletions(-)
 delete mode 100644 package/acpica/0001-build-do-not-use-Werror.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f2dea0dfd9..8468aad8ed 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -141,7 +141,6 @@ package/4th/0001-avoid-regen-during-install.patch Upstream
 package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch Upstream
 package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch Upstream
 package/acl/0001-Build-with-old-GCC-versions.patch Upstream
-package/acpica/0001-build-do-not-use-Werror.patch Upstream
 package/acpid/0001-dont-use-isfdtype.patch Upstream
 package/alchemy/0001-toolchains-remove-hash-style-management.patch Upstream
 package/alsamixergui/0001-misc-fixes.patch Sob Upstream
diff --git a/package/acpica/0001-build-do-not-use-Werror.patch b/package/acpica/0001-build-do-not-use-Werror.patch
deleted file mode 100644
index f905e552bd..0000000000
--- a/package/acpica/0001-build-do-not-use-Werror.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 9382ae2431d2962c430e7149302c8690f5bc159c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 10 Jul 2016 15:06:15 +0200
-Subject: [PATCH] build: do not use -Werror
-
-Warnings come and go with various compiler versions, so using -Werror is
-prone to cause build failures with various compiler versions, especially
-newer versions that introduce new warnings.
-
-Remove use of -Werror.
-
-[Vincent: tweak patch for 20170531 release]
-[Bernd: tweak patch for 20191018 release]
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- generate/unix/Makefile.config |  1 -
- generate/unix/iasl/Makefile   | 16 ++++++++--------
- 2 files changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/generate/unix/Makefile.config b/generate/unix/Makefile.config
-index c28e8a9b1..7064bed97 100644
---- a/generate/unix/Makefile.config
-+++ b/generate/unix/Makefile.config
-@@ -204,7 +204,6 @@ CWARNINGFLAGS = \
-     -Wall\
-     -Wbad-function-cast\
-     -Wdeclaration-after-statement\
--    -Werror\
-     -Wformat=2\
-     -Wmissing-declarations\
-     -Wmissing-prototypes\
-diff --git a/generate/unix/iasl/Makefile b/generate/unix/iasl/Makefile
-index 47ea73cab..2c756af79 100644
---- a/generate/unix/iasl/Makefile
-+++ b/generate/unix/iasl/Makefile
-@@ -360,32 +360,32 @@ $(OBJDIR)/prparserparse.c $(OBJDIR)/prparser.y.h :       $(ASL_COMPILER)/prparse
- #
- $(OBJDIR)/aslcompilerlex.o :   $(OBJDIR)/aslcompilerlex.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/aslcompilerparse.o : $(OBJDIR)/aslcompilerparse.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtcompilerparserlex.o :      $(OBJDIR)/dtcompilerparserlex.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtcompilerparserparse.o :    $(OBJDIR)/dtcompilerparserparse.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserlex.o :      $(OBJDIR)/dtparserlex.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/dtparserparse.o :    $(OBJDIR)/dtparserparse.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/prparserlex.o :      $(OBJDIR)/prparserlex.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
- 
- $(OBJDIR)/prparserparse.o :    $(OBJDIR)/prparserparse.c
- 	@echo "- " "Intermediate" $<
--	@$(CC) -c $(CFLAGS) -Wall -Werror -o$@ $<
-+	@$(CC) -c $(CFLAGS) -Wall -o$@ $<
--- 
-2.20.1
-
diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 564e393cb4..a5056cf1a2 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
-sha256  40d8e351f8dfdf5340ec76ac28f0c201b825077d7060bb3686ca1112cb26985d  source/include/acpi.h
+sha256  bd8ac5ffa77ddc5ffc1f88be412b65a0926d25750e87ac180666c5b63de7ea36  acpica-unix2-20230331.tar.gz
+sha256  42772064aec4f49677641690d2fab571c9d266922022e28af666072c60a04831  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 9901c1ed48..7b21202780 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20220331
+ACPICA_VERSION = 20230331
 ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
 ACPICA_SITE = https://acpica.org/sites/acpica/files
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
@@ -15,11 +15,13 @@ HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
+		NOWERROR=TRUE \
 		all
 endef
 
 define HOST_ACPICA_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		NOWERROR=TRUE \
 		all
 endef
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
