Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F6FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42C584E95;
	Sun, 26 Apr 2026 20:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aX5vfXKhcuM5; Sun, 26 Apr 2026 20:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A5E84E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777233695;
	bh=Ijw1eXv+W98FHRqjvqJ+HqwdRM2kJbJ2zK+G6M6bkhQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jsr6Za3XqO+nuEXgMUU23uyP6f35lECM8JSuHkWQS2/b2VUWBI73jDQuCc5733Ct3
	 QnFRu7Z1Z9kghV324g5ewM35bTBuMZToEytznyT7mw/+TrW3qLp+wzonQSLECS3Eb6
	 2spiZy3vt64BCHU3Fr6UwhX29hRxBoUrkAzFxKDclqn+QNVGoaGho5mKt4FJ9YtTjX
	 W+/2iv25xLlg4jsUWRP/rrgOJlCrrUVQeUEPET0fVAXiRQGpIRNaSNGMC2EnzYa+VS
	 qIb5CkP+WRlb7Cu+X/5SCSi54KHSWt1nXL1TCfRdC++X4sBts7ZGLw/ZRcA/Shyd2x
	 /BaiG1aTUM/dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A5E84E92;
	Sun, 26 Apr 2026 20:01:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D07B91B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B656F42088
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9gIMoAulH2o for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 20:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1227140129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1227140129
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 20:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3E9B836FA; Sun, 26 Apr 2026 20:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 21:16:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae39a4d57c8ea8abe0cd12183c26b1266def274
X-Git-Newrev: 5ae431d3911f5d5cf7a0f0f5d4c5d2ee1cf484f1
X-Patchwork-Hint: ignore
Message-Id: <20260426200131.C3E9B836FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ae431d3911f5d5cf7a0f0f5d4c5d2ee1cf484f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-4-released/90622

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 282bca63f7..eb3775659f 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.3
-sha256  2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd  llvm-project-22.1.3.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.4
+sha256  3e68c90dda630c27d41d201e37b8bbf5222e39b273dec5ca880709c69e0a07d4  llvm-project-22.1.4.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 6f12cbaa58..1aa02e0800 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
