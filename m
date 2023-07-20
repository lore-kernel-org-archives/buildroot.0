Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A972AEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B3E607CE;
	Thu, 20 Jul 2023 21:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B3E607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SF_9s1pPhCQ8; Thu, 20 Jul 2023 21:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2B2612B6;
	Thu, 20 Jul 2023 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F2B2612B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE2B1BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0545641738
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0545641738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItVeaIbBLBrB for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D09F4175F
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D09F4175F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0988A87496; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:39:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6eaf60e8087cb2d6c251fa17757014114946c5c
X-Git-Newrev: 2bef68f3b0c684d640dd64711ec5ea3fbcfd0334
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.0988A87496@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm: move to llvm-project folder
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bef68f3b0c684d640dd64711ec5ea3fbcfd0334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make updating easier, move llvm into the llvm-project folder
and use the defined information.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                | 2 +-
 DEVELOPERS                                                         | 6 +++---
 package/Config.in                                                  | 2 +-
 package/{ => llvm-project}/llvm/0001-nfc-Fix-missing-include.patch | 0
 package/{ => llvm-project}/llvm/Config.in                          | 0
 package/{ => llvm-project}/llvm/llvm.hash                          | 0
 package/{ => llvm-project}/llvm/llvm.mk                            | 5 ++---
 7 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0c2a882135..55d2985707 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -881,7 +881,7 @@ package/lite/0002-no-tests.patch Sob Upstream
 package/lite/0003-pkg-config.patch Sob Upstream
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch Upstream
 package/lldpd/S60lldpd Indent Shellcheck Variables
-package/llvm/0001-nfc-Fix-missing-include.patch Upstream
+package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch Upstream
 package/lm-sensors/0001-static-build.patch Upstream
 package/lm-sensors/0002-no-host-ldconfig.patch Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index f2908fabc5..8ccecc248e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1634,7 +1634,7 @@ F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
@@ -2545,7 +2545,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/mesa3d/
@@ -2955,7 +2955,7 @@ N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
diff --git a/package/Config.in b/package/Config.in
index 57d3646566..0e9f7c35e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2130,7 +2130,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm/Config.in"
+	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
similarity index 100%
rename from package/llvm/0001-nfc-Fix-missing-include.patch
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
similarity index 100%
rename from package/llvm/Config.in
rename to package/llvm-project/llvm/Config.in
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
similarity index 100%
rename from package/llvm/llvm.hash
rename to package/llvm-project/llvm/llvm.hash
diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
similarity index 98%
rename from package/llvm/llvm.mk
rename to package/llvm-project/llvm/llvm.mk
index 977c0a08c2..1adad17b16 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 11.1.0
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_SITE = $(LLVM_PROJECT_SITE)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
