Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F23AEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EDD612B8;
	Thu, 20 Jul 2023 20:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EDD612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ql27pvv5n3cI; Thu, 20 Jul 2023 20:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1047612CB;
	Thu, 20 Jul 2023 20:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1047612CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 109321BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8A8441756
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8A8441756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7E4vk0uEKyfu for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1275241738
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1275241738
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1EDA8747E; Thu, 20 Jul 2023 20:59:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 157089d34d06712b67f42b083bcfb16a9bdee1f0
X-Git-Newrev: f6eaf60e8087cb2d6c251fa17757014114946c5c
X-Patchwork-Hint: ignore
Message-Id: <20230720205935.F1EDA8747E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: new group for llvm
 packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6eaf60e8087cb2d6c251fa17757014114946c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make updating easier in the future, group all llvm projects in
one subfolder and define some variables for all of them.

Introduce LLVM_PROJECT_VERSION_MAJOR to be used by the clang package
in a followup change.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/llvm-project/llvm-project.mk | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 405ccd645a..f2908fabc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -660,6 +660,7 @@ F:	package/glibmm2_66/
 F:	package/gtkmm3/
 F:	package/libsigc/
 F:	package/libsigc2/
+F:	package/llvm-project/
 F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
new file mode 100644
index 0000000000..747a6f5647
--- /dev/null
+++ b/package/llvm-project/llvm-project.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# llvm-project
+#
+################################################################################
+
+LLVM_PROJECT_VERSION_MAJOR = 11
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+
+include $(sort $(wildcard package/llvm-project/*/*.mk))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
