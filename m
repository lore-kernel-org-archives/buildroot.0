Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E165CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF57F60FA4;
	Sun,  3 May 2026 17:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfJRZEaAgwxi; Sun,  3 May 2026 17:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA08760FEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777830384;
	bh=G+G0LhDWp3gvHw0d0FNmSN17nsLUy4GvWfk6z5poyDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I6LqlPlj3iMewB0cELbhze0KL2uJLLclUzSVFehQlnBVeInudfJ4LB2d01IVO1f3o
	 cgr60A/mGZ+C2GfKtpTFEmE3atAQtUblbNX0yp7Eishi+lRROQL6h40saMkToreHz+
	 OCHMyDFrk1Y9lhkSZ1wJGOgJznwGKivoLe6PgeVU8IGYGWY0XTFAAV2oWA03FsONlQ
	 okToVccuJh9Hss4+B53Z4cXYTOAy2xbqaz12TEu1Lo/VAxoZQYapTABaoJZ8ema0Ae
	 SvHTqkE5eCFrHH4aXGV3v/NNuJfUqqwbQKJ/3+CJAuWFkITHsxAXOEJRgymHUasLJ4
	 9J0Qyq0EJ1S1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA08760FEB;
	Sun,  3 May 2026 17:46:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A9425D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A71FC41531
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP34rIjLgGLV for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0114B41031
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0114B41031
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FBFE8409E; Sun,  3 May 2026 17:46:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 18:59:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f3097bcf69166e6341806537a09ff4414840b61
X-Git-Newrev: dd26af479a10ac316f491887b499e7de87e160be
X-Patchwork-Hint: ignore
Message-Id: <20260503174621.2FBFE8409E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump
 version to 22.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd26af479a10ac316f491887b499e7de87e160be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 1f2886ec6c..59edb3f70d 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  83e7007b8b9b5536b30991661738a98e9cd607d4a203e9342b628aaea5ea32d7  spirv-llvm-translator-22.1.1.tar.gz
+sha256  b37196b1a1a60282a24cf937ab7d6807d7d54dc718f2a37a78e211be26df57ac  spirv-llvm-translator-22.1.2.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 0f5fbb814e..2d8170fc80 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.1
+SPIRV_LLVM_TRANSLATOR_VERSION = 22.1.2
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,v$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
