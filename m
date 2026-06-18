Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F06CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C051783AA0;
	Thu, 18 Jun 2026 20:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTiB868vlOXh; Thu, 18 Jun 2026 20:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA92A83AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781815800;
	bh=rcJHXADsOsfKakKpFluhQ1QJDJbZBkProhcXc5GNzTI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GQhi4z0rjQnBsJ69On51QMgkC38wKs4iv18XbkPn/V+SQPNj9Q9Cf+0UqCmCL8bta
	 21dUAzLfOaiCRD2CyDnjfgpapRQJm42O6a4eDBnRAkU9tln27rO0DfjOPS76+/IbEt
	 dM7Nplr8Ho1SoiMnaJsm8LwOUxfxIds8QYYFR9+5logcWKd8m8ZzvGGLH2jtKaQ9em
	 wyeoJGMfqhmujkjNJULIMxOSJUXOIxYXAcUp5gU+SXHwNa9lvrTo7nZcGsBhWmGNKx
	 ZbxRZnmQ6iaJ7vthyRXNDJx49xr2kr+3FFKn9hY6uh6b/hZxXYumccrgPp7vDE4v1y
	 srpd1Cu8IV7IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA92A83AA1;
	Thu, 18 Jun 2026 20:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9CF4C4
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 119596163A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoiJbUBCUHiI for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4391961637
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4391961637
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2351814A3; Thu, 18 Jun 2026 20:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 21:48:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9bbc8c0aca19fc1a699dd3313cd7ce9ef1512b9
X-Git-Newrev: 1e7187e1adc395c76c6abb54bb9127d1ddd8a35b
X-Patchwork-Hint: ignore
Message-Id: <20260618204933.F2351814A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e7187e1adc395c76c6abb54bb9127d1ddd8a35b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-8-released/91084

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index d498fbe6e1..96cdd76c92 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.7
-sha256  5cc4a3f12bba50b6bdfb4b61bdc852117a0ff2517807c3902fc13267fb93562e  llvm-project-22.1.7.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.8
+sha256  922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888  llvm-project-22.1.8.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 7ddf25a37b..5cbbda6e06 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.7
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
