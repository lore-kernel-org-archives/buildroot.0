Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0732C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 09:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB7B60BD3;
	Sun,  4 Jun 2023 09:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB7B60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BE1o-fBrZQ5F; Sun,  4 Jun 2023 09:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1244960BDD;
	Sun,  4 Jun 2023 09:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1244960BDD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07CDB1BF3BE
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 09:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCF8760BDD
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 09:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCF8760BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1O7UQg9H06Wh for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 09:17:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D376660BD3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D376660BD3
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 09:17:57 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.62.232])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2A3C378050A;
 Sun,  4 Jun 2023 11:17:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 11:17:44 +0200
Message-Id: <20230604091744.8368-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531170207.727576-1-ju.o@free.fr>
References: <20230531170207.727576-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685870274;
 bh=mzRt6NG+fKtWpbKei40lorwkIJ9mLpVTnVFRC3qDJF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BmCBbf4hFGdbl+tFh+JX5I3nqx6ouecRardwmC0utodCIUaiewLTbiKprtZMQFjxY
 zcxaRecVcpkX00vWOrBwefGHyCUWC6jn/I/gMpPbHfNRfA3xJUpc1WxnSEB0L5BBw2
 iRhuyhZo49NbxZPQdbTrAPRcecIc7HniAZP2f8EtmMAdtct2JxazGYr6k96J/rGRTL
 l70L+Nw8T7u7F1hZ87bnn7hOhTGpV4BOypVzzJ7VUXMRQlwGzygyobDyxkeFWlpWum
 3eJKcDJXy5StodTp2wKtgH5gA7jV12Xid4v3eHLSRaR4lSAVm+nOAX7K3+1gf6gxe1
 jHNKgkVXRQ3aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BmCBbf4h
Subject: [Buildroot] [PATCH v2 1/1] package/acpica: bump to version 20230331
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
alternative is now available upstream, merged in [1]. This commit is
included in release 20221020. The build commands are updated
accordingly to set the new NOWERROR=TRUE option to achieve the same
behavior.

With the patch removal, .checkpackageignore is also updated
accordingly.

The license file hash is also updated, due to the copyright year
update.

Upstream commit [2] also introduced a use of wcslen() and <wchar.h>.
This commit was first included in tag R10_20_22 (version 20221020).
Therefore, this new version need wchar. The new depedency is added.

This version bump is motivated by the introduction of RISC-V related
definitions.

[1] https://github.com/acpica/acpica/commit/3fd0f940408fc01a2c52c5be5f2beb0218a3d907
[2] https://github.com/acpica/acpica/commit/cd6a30897593f6052abf0b9a791671dcf07b9596

Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Add the new dependency on BR2_USE_WCHAR in Config.in
---
Patch tested on branch master at commit d2c1d8d with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p acpica
    ...
    45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 .checkpackageignore                           |  1 -
 .../acpica/0001-build-do-not-use-Werror.patch | 82 -------------------
 package/acpica/Config.in                      |  5 +-
 package/acpica/acpica.hash                    |  4 +-
 package/acpica/acpica.mk                      |  4 +-
 5 files changed, 8 insertions(+), 88 deletions(-)
 delete mode 100644 package/acpica/0001-build-do-not-use-Werror.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 10e70f0787..281334cd7d 100644
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
diff --git a/package/acpica/Config.in b/package/acpica/Config.in
index c5ffb005f5..ec5865c357 100644
--- a/package/acpica/Config.in
+++ b/package/acpica/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ACPICA
 	bool "acpica"
+	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The ACPI Component Architecture (ACPICA) project provides an
@@ -9,5 +10,5 @@ config BR2_PACKAGE_ACPICA
 
 	  https://www.acpica.org
 
-comment "acpica needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "acpica needs a toolchain w/ threads, wchar"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
