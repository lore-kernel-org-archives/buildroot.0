Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B89CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8AB844A1;
	Wed,  3 Jun 2026 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90jMwRH7fat0; Wed,  3 Jun 2026 20:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E73384474
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780519526;
	bh=DVw/K1fEEGcWFK+mEUWcyGIT6ns7IAsuzmDq3UoD/OA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nUoDBg5wEQRU57CKEcZmylx4AWX/VN8+o1G0x2qlqZBZq27RN//RI1c/uUHj8THpK
	 /7FhfgMge7DK04ItaWRZJm2oRw1pSfOnihax844qqzLU8CQ7++3IhcItEgqx3Vwdrq
	 dGbhsJTCemNPnaQdPDaUCbV76IU+VhE92QtPFot4dutp3dhGlHt9+cnOX6Km0YBEoM
	 rvG24stdk5WaVl+nZphLYAUhEwfi2JYpNayKp9yf+O1Gr4deX42EDrOhpeMgEnHv9y
	 g0gYqgdSfmK2VySBQ+/M5jgXOhGyGBwnoPBKA2Ns/qFWDP+tW3qVxgiqUnShxWOy5V
	 J5rtHV2knvXXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E73384474;
	Wed,  3 Jun 2026 20:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCEE7192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C33F661B46
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYjYIVzDdNfS for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F7161B44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25F7161B44
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:45:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06B79879A3; Wed,  3 Jun 2026 20:45:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 22:41:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cba1cfaaf7acb64d7e73ffeb4ad455c784d7764
X-Git-Newrev: efc8b141fe39b06ba21f3c2fe5ab2fdb2ddd4295
X-Patchwork-Hint: ignore
Message-Id: <20260603204509.06B79879A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efc8b141fe39b06ba21f3c2fe5ab2fdb2ddd4295
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:
https://discourse.llvm.org/t/llvm-22-1-7-released/90961

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 4f2c07414e..d498fbe6e1 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.6
-sha256  6e0b376a1f6d9873e7dfb09ae6e04b9c7024400f01733fa4c29be69d5c138bc2  llvm-project-22.1.6.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.7
+sha256  5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e  llvm-project-22.1.7.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 2f137b871b..7ddf25a37b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
