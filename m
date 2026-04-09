Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7919CF364BA
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 21:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1670981D02;
	Thu,  9 Apr 2026 21:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6qYcdcbr_z3; Thu,  9 Apr 2026 21:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D8B081D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775770155;
	bh=z07bjYv80nzDkh0xtvlNL9kqKB0nY3gjaOOdu3GWK6k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hA5DdWiLCxAsg8u04FBZ1mBOysOIQOiYDzMObOWS7hg6Cj4EjTF4QAwYn8B3Car1V
	 i59i1yA/Lq5FMNhacGx90g0eAG13SWcc9/XG/x53Q6h7dDSpoiLudvEMEa8e6fRsXa
	 Zx0i47JuU47h8Y495HAoe4VDtgpi4UWt6M1O9fzuiIHkqzoVIU7jONIWnrNBfXPS4d
	 kxUeHFpdv/AW54DZlJqkyfOUSjg+xRkXg64igBlZSvtzggX3zhm+um59/YMSEhBerC
	 /HALiPmKdgOL5JkIGCZkWvm/SsjolgdZwDMcsD6Gv/VB+a9cHWekp4prFj1zDln3XI
	 64Z+Jy4Jw/pLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D8B081D16;
	Thu,  9 Apr 2026 21:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3123237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98C804022A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VHnNeNtiu6a for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 21:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE89401A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE89401A1
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7574381025; Thu,  9 Apr 2026 21:29:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Apr 2026 22:52:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3adec23fe0230abaaf28d764e816300d15df17a5
X-Git-Newrev: 706a8b248cb87407597fe99c31bddbceac255bc1
X-Patchwork-Hint: ignore
Message-Id: <20260409212912.7574381025@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/706a8b248cb87407597fe99c31bddbceac255bc1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-3-released/90467

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 095dc76dfd..282bca63f7 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.2
-sha256  62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c  llvm-project-22.1.2.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.3
+sha256  2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd  llvm-project-22.1.3.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index becbcc0612..6f12cbaa58 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
