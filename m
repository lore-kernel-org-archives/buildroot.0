Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F0AC001DF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33E2607B0;
	Thu, 20 Jul 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D33E2607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pf5HjKonprEj; Thu, 20 Jul 2023 21:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8317612A1;
	Thu, 20 Jul 2023 21:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8317612A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E67B1BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 373C14175B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 373C14175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0OrKlmmil-E for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4685F41749
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4685F41749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34BD28747E; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:41:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 353f8bd02541e282d8e21bf36677a2ef23de1f43
X-Git-Newrev: 5fad34d0d1a2285233ca6cb087e0509d98379a50
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.34BD28747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libclc: move to llvm-project
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fad34d0d1a2285233ca6cb087e0509d98379a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make version bumping easier, move libclc to a new llvm-project subfolder
and specify site for the project. Since the version of libclc is more
recent than the version specified in LLVM_PROJECT_VERSION, don't change
it for now until a later update.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 2 +-
 DEVELOPERS                                                            | 4 ++--
 package/Config.in                                                     | 2 +-
 .../{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch    | 0
 package/{ => llvm-project}/libclc/Config.in                           | 0
 package/{ => llvm-project}/libclc/libclc.hash                         | 0
 package/{ => llvm-project}/libclc/libclc.mk                           | 2 +-
 7 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 059732bf37..612d54cab3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -691,7 +691,6 @@ package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch Upstream
 package/libcec/0001-cecloader-h-fix-null-return.patch Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch Upstream
 package/libcgicc/0001-disable-documentation-option.patch Sob Upstream
-package/libclc/0001-support-out-of-tree-build.patch Upstream
 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch Upstream
 package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch Upstream
 package/libcuefile/0001-fix-static-link.patch Upstream
@@ -881,6 +880,7 @@ package/lite/0003-pkg-config.patch Sob Upstream
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch Upstream
 package/lldpd/S60lldpd Indent Shellcheck Variables
 package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch Upstream
+package/llvm-project/libclc/0001-support-out-of-tree-build.patch Upstream
 package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch Upstream
 package/lm-sensors/0001-static-build.patch Upstream
 package/lm-sensors/0002-no-host-ldconfig.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index baa2856a43..43058cedf9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2539,12 +2539,12 @@ F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libbpf/
-F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2953,8 +2953,8 @@ F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clinfo/
-F:	package/libclc/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index ca1a515a7b..601922aad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2067,7 +2067,6 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
-	source "package/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcrossguid/Config.in"
@@ -2130,6 +2129,7 @@ endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/compiler-rt/Config.in"
+	source "package/llvm-project/libclc/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
similarity index 100%
rename from package/libclc/0001-support-out-of-tree-build.patch
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.in
similarity index 100%
rename from package/libclc/Config.in
rename to package/llvm-project/libclc/Config.in
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
similarity index 100%
rename from package/libclc/libclc.hash
rename to package/llvm-project/libclc/libclc.hash
diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
similarity index 93%
rename from package/libclc/libclc.mk
rename to package/llvm-project/libclc/libclc.mk
index 5d246cf4f8..406adfdb53 100644
--- a/package/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCLC_VERSION = 13.0.1
-LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
