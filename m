Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D4EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDCB46128E;
	Thu, 20 Jul 2023 21:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDCB46128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9rkt1X0eWqf; Thu, 20 Jul 2023 21:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43420607B0;
	Thu, 20 Jul 2023 21:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43420607B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E20A1BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36FBF41740
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36FBF41740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcu0i-1XN4VU for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 304E64176C
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304E64176C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E6298749B; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:41:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0caf0d0dc251cda9f3ba20c07b763eae0c05c06
X-Git-Newrev: 2d660e4cdc93cc3557458f671703e2df18adbfb5
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.1E6298749B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clang: move to llvm-project
 subfolder
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d660e4cdc93cc3557458f671703e2df18adbfb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make version bumping easier, move clang to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                | 2 +-
 DEVELOPERS                                                         | 6 +++---
 package/Config.in                                                  | 2 +-
 ...0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
 package/{ => llvm-project}/clang/Config.in                         | 0
 package/{ => llvm-project}/clang/clang.hash                        | 0
 package/{ => llvm-project}/clang/clang.mk                          | 7 +++----
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 55d2985707..059732bf37 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -273,7 +273,6 @@ package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch Upstream
 package/chrony/S49chrony Indent Shellcheck Variables
-package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
 package/cmake/0001-rename-cmake-rootfile.patch Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch Upstream
@@ -881,6 +880,7 @@ package/lite/0002-no-tests.patch Sob Upstream
 package/lite/0003-pkg-config.patch Sob Upstream
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch Upstream
 package/lldpd/S60lldpd Indent Shellcheck Variables
+package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
 package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch Upstream
 package/lm-sensors/0001-static-build.patch Upstream
 package/lm-sensors/0002-no-host-ldconfig.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index 5526130847..baa2856a43 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1629,10 +1629,10 @@ F:	support/testing/tests/package/test_zfs.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-core/
-F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
@@ -2526,7 +2526,6 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
-F:	package/clang/
 F:	package/clinfo/
 F:	package/efl/
 F:	package/enet/
@@ -2545,6 +2544,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2952,9 +2952,9 @@ F:	package/gettext-tiny/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
-F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 0e9f7c35e8..4652ddc310 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2025,7 +2025,6 @@ menu "Other"
 	source "package/catch2/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
-	source "package/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
@@ -2130,6 +2129,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
similarity index 100%
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in
similarity index 100%
rename from package/clang/Config.in
rename to package/llvm-project/clang/Config.in
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.hash
similarity index 100%
rename from package/clang/clang.hash
rename to package/llvm-project/clang/clang.hash
diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
similarity index 96%
rename from package/clang/clang.mk
rename to package/llvm-project/clang/clang.mk
index 3c75f8d6b1..0943e21a8c 100644
--- a/package/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-CLANG_VERSION_MAJOR = 11
-CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
+CLANG_VERSION = $(LLVM_PROJECT_VERSION)
+CLANG_SITE = $(LLVM_PROJECT_SITE)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
