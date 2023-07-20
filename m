Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB058EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D86607B5;
	Thu, 20 Jul 2023 21:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D86607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfswwW86fO-X; Thu, 20 Jul 2023 21:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39608607A4;
	Thu, 20 Jul 2023 21:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39608607A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF4CE1BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87E3582102
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E3582102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIHQkvJhWbaJ for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:12:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4E7782114
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E7782114
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A19D2874AB; Thu, 20 Jul 2023 21:12:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:11:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4
X-Git-Newrev: 79f3d7af7ee2a6ea1a2a78473e572be8902a368b
X-Patchwork-Hint: ignore
Message-Id: <20230720211206.A19D2874AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5tools: adjust dependency of
 BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
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

commit: https://git.buildroot.net/buildroot/commit/?id=79f3d7af7ee2a6ea1a2a78473e572be8902a368b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of LLVM in commit
d8291fde5ee19fd475953f41d9c519e817554d6b ("package/llvm-project: bump
to version 15.0.3"), gcc >= 7.x is needed, so update the dependency of
BR2_PACKAGE_QT5TOOLS_QDOC_TOOL accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index aa8a1b1629..47a9ad0f5f 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	# currently supported in Buildroot, unless the target is
 	# already supported by llvm.
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # llvm, clang
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # llvm, clang
 	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
 	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
