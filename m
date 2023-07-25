Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA688EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E33408EF;
	Tue, 25 Jul 2023 21:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E33408EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk-Z1xXzhrjV; Tue, 25 Jul 2023 21:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B870E40EC1;
	Tue, 25 Jul 2023 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B870E40EC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96D9B1BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6695C41907
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6695C41907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loqHcJ9qM__L for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:36:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D908E408EF
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D908E408EF
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7744113F895;
 Tue, 25 Jul 2023 23:36:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:36:09 +0200
Message-ID: <20230725213609.19784-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690320979;
 bh=Ke3Xm7psY6qeeapZHl9CoGbcznwG1tfH1z3QrJt72Zk=;
 h=From:To:Cc:Subject:Date:From;
 b=JrN3Fw/LtQpC2XImI+m/12IhPPMTYDvhpz6XW9Nm1i3o9z/UCbFYnVBoEGqd9RwuY
 jcpHoYI8MoZ1NBKcmgW/8V1vmLG25L2gskLTW7L0hBdvpAu96DC46NWwY4bY1DSa2p
 VK+orn4nPyHli472aLXN38xC9vpYgysfi7GrifIw9S1gByYGl5ECNZ59XFPE5Z/Yhh
 Q2ET9YqkNC5ZwbuFmGGD44WX8MlhlDc9F9dBxDcnDt3lnJhQmLOI29s1/c1Y6K+LBF
 mllcEOfSM38aMS3INJURDMwFy2FOUzi8vuN9/tT3j2lYpnx5Y5cEIytd49BOIxqcOy
 4cpgyI4ZsdK7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JrN3Fw/L
Subject: [Buildroot] [PATCH v3 1/1] package/acpica: bump to version 20230628
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
- https://github.com/acpica/acpica/blob/R06_28_23/documents/changes.txt

This commit also drop the patch removing -Werror in CFLAGS, as an
alternative is now available upstream, merged in [1]. This commit is
included in release 20221020. The build commands are updated
accordingly to set the new NOWERROR=TRUE option to achieve the same
behavior.

With the patch removal, .checkpackageignore is also updated
accordingly.

Upstream commit [2] also introduced a use of wcslen() and <wchar.h>.
This commit was first included in tag R10_20_22 (version 20221020).
Therefore, this new version need wchar. The new depedency is added.

The _SOURCE file is also changed from acpica-unix2 to acpica-unix,
as the current acpica download page at [3] shows:

"""
Note: The unix2 source package is deprecated since the dual license is
now included in all source modules (along with the Intel
license). This package will be removed from future ACPICA releases.
"""

The _SITE url is also updated to the new download link, since the
acpica website now redirects to Intel:

    curl -si https://www.acpica.org | grep Location:
    Location: https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html

The license file hash is also updated, due to the copyright year
update. It is also worth mentioning that the files in the new archive
have three alternative licenses in their headers: Intel, BSD-3-Clause
and GPL-2.0.

Finally, since a SHA1 hash is published on the download page, it is
added to the hash file.

This version bump is motivated by the introduction of RISC-V related
definitions.

[1] https://github.com/acpica/acpica/commit/3fd0f940408fc01a2c52c5be5f2beb0218a3d907
[2] https://github.com/acpica/acpica/commit/cd6a30897593f6052abf0b9a791671dcf07b9596
[3] https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html

Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v2 -> v3:
- Update package to version 20230628
- Also reflect https://acpica.org website changes
- Changed source file to follow upstream deprecation notice
- Added SHA1 archive hash now published upstream

Changes v1 -> v2:
- Add the new dependency on BR2_USE_WCHAR in Config.in
---
Patch tested on master branch at commit 64f2a35 with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p acpica
    ...
    45 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_acpica
    ...
    OK
---
 .checkpackageignore                           |  1 -
 .../acpica/0001-build-do-not-use-Werror.patch | 82 -------------------
 package/acpica/Config.in                      |  5 +-
 package/acpica/acpica.hash                    |  6 +-
 package/acpica/acpica.mk                      |  8 +-
 5 files changed, 12 insertions(+), 90 deletions(-)
 delete mode 100644 package/acpica/0001-build-do-not-use-Werror.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 8eb88813c9..8f7ddb1b28 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -136,7 +136,6 @@ package/4th/0001-avoid-regen-during-install.patch Upstream
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
index 564e393cb4..dd9f8a1d22 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,5 @@
+# From: https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html
+sha1  3b893fb771cf3fbd3531de3036e1a5bfc624c9d2  acpica-unix-20230628.tar.gz
 # locally computed hash
-sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
-sha256  40d8e351f8dfdf5340ec76ac28f0c201b825077d7060bb3686ca1112cb26985d  source/include/acpi.h
+sha256  86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce  acpica-unix-20230628.tar.gz
+sha256  905d6f191f3c29aa673602d9c66eb8df00f7e1b35064a081e0de81284ff17ee6  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 9901c1ed48..81f7d8e103 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20220331
-ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://acpica.org/sites/acpica/files
+ACPICA_VERSION = 20230628
+ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
+ACPICA_SITE = https://downloadmirror.intel.com/783534
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
