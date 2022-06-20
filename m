Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E925DC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 631B6607B4;
	Mon, 20 Jun 2022 19:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 631B6607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZqEprGXuq9T; Mon, 20 Jun 2022 19:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C003260FF0;
	Mon, 20 Jun 2022 19:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C003260FF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA711BF9B9
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 790A660FF2
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790A660FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aI3AIzjGIzet for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B292460F71
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B292460F71
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CFC59874DE; Mon, 20 Jun 2022 19:22:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 20:59:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948dd3548099ef94b372c456e3154f70b4815f19
X-Git-Newrev: 016e21eb77c98863b5bbc8e6b0b7edf44f890d94
X-Patchwork-Hint: ignore
Message-Id: <20220620192231.CFC59874DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: new host
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=016e21eb77c98863b5bbc8e6b0b7edf44f890d94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../spirv-llvm-translator/spirv-llvm-translator.hash   |  3 +++
 package/spirv-llvm-translator/spirv-llvm-translator.mk | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
new file mode 100644
index 0000000000..02d8c20d08
--- /dev/null
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  8df057ceb2e08792f87c1e01209ccd32d0fd5858f0e5c8797a96555e4a78565a  spirv-llvm-translator-llvm_release_110.tar.gz
+sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
new file mode 100644
index 0000000000..22f8765582
--- /dev/null
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# spirv-llvm-translator
+#
+################################################################################
+
+SPIRV_LLVM_TRANSLATOR_VERSION = llvm_release_110
+SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
+SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
+SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
+HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
+HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DLLVM_BUILD_TOOLS=ON \
+	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
+	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
+	-DLLVM_SPIRV_INCLUDE_TESTS=OFF
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
