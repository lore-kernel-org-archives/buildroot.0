Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BEFEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B06612C1;
	Thu, 20 Jul 2023 21:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5B06612C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9KQHX_ChUMae; Thu, 20 Jul 2023 21:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E884E612B9;
	Thu, 20 Jul 2023 21:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E884E612B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 847221BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59C3641E55
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C3641E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bhHS6QtnInrR for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5909141E35
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5909141E35
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44D488749A; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d7d00ba550bb9498df4e56976a4af30ac095d23
X-Git-Newrev: b4c8785ca22dbff0fbcfc373e1cbe2cd6a9b629e
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.44D488749A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/llvm-libunwind: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4c8785ca22dbff0fbcfc373e1cbe2cd6a9b629e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with version 15, lld needs the llvm implementation
of libunwind, therefore it is added as a host package.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../llvm-project/llvm-libunwind/llvm-libunwind.hash    |  3 +++
 package/llvm-project/llvm-libunwind/llvm-libunwind.mk  | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
new file mode 100644
index 0000000000..86775f5dba
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
new file mode 100644
index 0000000000..825e1beac0
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# llvm-libunwind
+#
+################################################################################
+
+LLVM_LIBUNWIND_VERSION = 15.0.3
+LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
+LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
+LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
+LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
+LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_LLVM_LIBUNWIND_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBUNWIND_INSTALL_HEADERS=ON
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
