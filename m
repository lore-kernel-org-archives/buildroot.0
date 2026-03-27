Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B67F10F286B
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 20:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF1A82EE1;
	Fri, 27 Mar 2026 20:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYt6KrRy25Aw; Fri, 27 Mar 2026 20:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4059827C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774643963;
	bh=1bwga1YMylwAIXhV9UkfTVF6w5U+27mMzcX2++3dY8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h7zSkkY7jReqBO1nshZC//k1A9pYc14dEkCeV31bcW07PC50YrbxuxSH4LIKGj0UA
	 iIjT2X7gv1lzC9++ifDv9n5qQdZA67zx/KLge5vTPTjhc9t69KBd7m6ztaLSU3DD2O
	 0p7Fm8OUGXbIwmsBjMpmUlzeKZMv3Xt+ygF13+mzkhuqVt9BGCqF5AnnQ9CJYFS5j1
	 mYw7E5xTmLNfwxMgIyTbb/QLKNNbXwzcrFzknXzSB/ZGejR1ZRUjhkBAXJK2LaN8GG
	 aigmsuYvZNVRCX8C4+7r6RsRkmSrLfSI2zJNKIQmGCza1d6X1XvXx5EIE1lj4YSJGK
	 PGPBlU2md6sxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4059827C5;
	Fri, 27 Mar 2026 20:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18EBC2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A6D3827C5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ilkrk5P7l6bJ for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 20:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D42F827AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D42F827AF
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 20:39:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A08C67FC0E; Fri, 27 Mar 2026 20:39:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 21:34:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c183f8b724aeee5f8619b9ca7a30bf176191799
X-Git-Newrev: 422c1af1cd885ae24cd67f785ae76bde4019f90f
X-Patchwork-Hint: ignore
Message-Id: <20260327203920.A08C67FC0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/422c1af1cd885ae24cd67f785ae76bde4019f90f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-2-released/90308

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 528591ba09..095dc76dfd 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.1
-sha256  9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95  llvm-project-22.1.1.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.2
+sha256  62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c  llvm-project-22.1.2.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index b358b80e23..becbcc0612 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
