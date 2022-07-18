Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801D7C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F56F60761;
	Mon, 18 Jul 2022 10:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F56F60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gkVcoZvFNBa; Mon, 18 Jul 2022 10:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25DAF60FD1;
	Mon, 18 Jul 2022 10:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25DAF60FD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF4F41BF9AD
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C955B4154C
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C955B4154C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llSkIR3ohme5 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B911A41523
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B911A41523
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 87B3F83C8D; Mon, 18 Jul 2022 09:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:10:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb433ecfd066db576c2bc59d2d42b6ea092b7caa
X-Git-Newrev: 7d05e66e377d8e4ae23982d5f8d72909abd9e4d9
X-Patchwork-Hint: ignore
Message-Id: <20220718095754.87B3F83C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: fix/update
 version to v11.0.0-269
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d05e66e377d8e4ae23982d5f8d72909abd9e4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It appears that we were using a release branch instead of a stable
tag, since spirv-llvm-translator doesn't provide normal release
tags for clang v11.1.0 lets use a commit-ish based on the closest
tag.

Fixes:
 - http://autobuild.buildroot.net/results/157/157e85ab3445b0852d999b747765a0a020e90c06

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 02d8c20d08..6133b1326a 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8df057ceb2e08792f87c1e01209ccd32d0fd5858f0e5c8797a96555e4a78565a  spirv-llvm-translator-llvm_release_110.tar.gz
+sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 22f8765582..73f7fe02de 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = llvm_release_110
+# Generate version string using:
+#   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
+SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
