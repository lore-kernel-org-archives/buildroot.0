Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23598EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF836129B;
	Thu, 20 Jul 2023 21:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCF836129B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztlmNnrHPPYl; Thu, 20 Jul 2023 21:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E4F612B9;
	Thu, 20 Jul 2023 21:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E4F612B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510CA1BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 358CE82BED
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 358CE82BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8a2k-Ny8nJVQ for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391EE82E29
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 391EE82E29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27FBB8749C; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d660e4cdc93cc3557458f671703e2df18adbfb5
X-Git-Newrev: 353f8bd02541e282d8e21bf36677a2ef23de1f43
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.27FBB8749C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/compiler-rt: move to llvm-project
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

commit: https://git.buildroot.net/buildroot/commit/?id=353f8bd02541e282d8e21bf36677a2ef23de1f43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make version bumping easier, move compiler-rt to a new llvm-project
subfolder and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                       | 2 +-
 package/{ => llvm-project}/compiler-rt/Config.in        | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.hash | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.mk   | 6 ++----
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4652ddc310..ca1a515a7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2026,7 +2026,6 @@ menu "Other"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
 	source "package/cmocka/Config.in"
-	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
@@ -2130,6 +2129,7 @@ comment "linux-pam plugins"
 endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
+	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
similarity index 100%
rename from package/compiler-rt/Config.in
rename to package/llvm-project/compiler-rt/Config.in
diff --git a/package/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
similarity index 100%
rename from package/compiler-rt/compiler-rt.hash
rename to package/llvm-project/compiler-rt/compiler-rt.hash
diff --git a/package/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
similarity index 85%
rename from package/compiler-rt/compiler-rt.mk
rename to package/llvm-project/compiler-rt/compiler-rt.mk
index c8ea86e899..84add60801 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
-# tied to the version of those tools
-COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_VERSION = $(LLVM_PROJECT_VERSION)
 COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
-COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_DEPENDENCIES = host-clang llvm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
