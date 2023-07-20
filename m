Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846D8EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC696129E;
	Thu, 20 Jul 2023 21:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC696129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYvyv57cyjnh; Thu, 20 Jul 2023 21:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E884612C7;
	Thu, 20 Jul 2023 21:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E884612C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E53C1BF20B
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4829B4175F
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4829B4175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUGQ5yHmp3YA for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5014E4175B
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5014E4175B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D41487496; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:41:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fad34d0d1a2285233ca6cb087e0509d98379a50
X-Git-Newrev: 2d7d00ba550bb9498df4e56976a4af30ac095d23
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.3D41487496@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project/llvm-cmake: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d7d00ba550bb9498df4e56976a4af30ac095d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small host package containing shared cmake modules
that are needed by various projects during configuration.
For example llvm 15 needs it.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 100644
index 0000000000..862c5d92e8
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
new file mode 100644
index 0000000000..b305797891
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# llvm-cmake
+#
+################################################################################
+
+LLVM_CMAKE_VERSION = 15.0.3
+LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
+LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
+
+define HOST_LLVM_CMAKE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
