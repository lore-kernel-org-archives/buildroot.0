Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C395606A32D
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cNFgRBcr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4604086E;
	Thu,  5 Nov 2026 19:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyxvYos_DTuu; Thu,  5 Nov 2026 19:18:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3F56C40825
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793906335;
	b=mpJpezg1n8NCPuPczs2VI2SJlsog6mvNJCp3sJRjfR0LzD/wADVtr2G9eAnzCrUjCHtN
	 EAUEvEavkizVGqczW+GDVAqNjVSR974KagW3L4LD3nAPjDZGCCplv4Xu4WynW/rbP6Ysd
	 AhQH/ePHWma8VGxsFPCNuRSlxDwyWE59QmEH2ScUqSPdaDI7Z6qLr+bRuI6fnMkpvqERo
	 mp4BZ/YgpHP0sYa/M91U/TzMbAi00pI30/eOyeycUFvk6Ysk7cic++eMDVvI/SAZuK0fi
	 pHKnrwAnIvvJKFdRqq3X6CtzNu/CSR72Hd5lrX5404TRjx4jdbdps4TNE55sbNOGbTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xu1daDtfSQzu0VqExcUbcxx6XxOHwSDVXyLuNCYopBY=;
	b=gpF1+eApbvz9gVY9dMwqN/KMLYNgJ5jQnpuQHOs+RR+TfG0J7sX8IZbgmyOiYHvn9Xyf
	 uZGTD6ZDRAOuudG/tEhjHiqyRuqzscNCcMOZsYYDwxWd9NSgPPTmEWkRURynhsrgaPb5Q
	 v7EAruU7LW+IEDfrFz/FbBBHf06t3exHzyy6vgq4Duf8hjh6c3X/u6hCAIZcvC9hWpDRW
	 gA15AnqQvX+skuMpA8Ja8+xzBhvwAyUpOoL1T028hzOQCY58n0enkop3QKWdkTHMCXSbG
	 erfPGh1ulad3gEW6EALD5pMTpseTL413MMZDwxFK0rhms18QgB4MpZ7LaDcmG143Lng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793906335;
	bh=Xu1daDtfSQzu0VqExcUbcxx6XxOHwSDVXyLuNCYopBY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cNFgRBcr3cjkJAtfhNKOosKXFRI+Z2jxYh713j40xR/64zdxv+yepM2O1kjT5hNry
	 8TjUWrI7HYsbrzk7cP7g2JRkS1aBMP6MgJIWPXh2tqseWbT48Rrq6dScxZ5o1IE5Cy
	 YUol1bBR7IAjE4uXCX3YwBIeIDBl+hVTMWJ89RPAWyXaJ2B21gFcaQVBgr2an/tDcY
	 XaX4lytDO4EKuWXJ7/6WvpAM2YaSHoFzbI3shKfexJdIdm/yxJbqurPghalAIt5Ju3
	 rdO6ze/o5j0RysTZC6vfjIMMGDdRqXmaLboLBuwjY6bviiau5QcRXVYPHEZTEyW0fU
	 iiKHC/TqvtJTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F56C40825;
	Thu,  5 Nov 2026 19:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C30CA235
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3B52810A0
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7RMvPuurGBQ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18EEA80C86
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18EEA80C86
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89C709E043; Thu,  5 Nov 2026 19:17:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 20:16:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d80b5651d8126b15c3689c87d7baa12330df8d9
X-Git-Newrev: b34752398f28ee6b15ab852daa8479864330eed1
X-Patchwork-Hint: ignore
Message-Id: <20261105191720.89C709E043@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b34752398f28ee6b15ab852daa8479864330eed1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-5-released/92716

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 2327c20408..15d2885a2a 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.4
-sha256  819ecf7351f1a66f76b2d701d8942faaf5faeb324cb90c9d5b090de142434bb2  llvm-project-23.1.4.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.5
+sha256  fb50b1eac93ddeb3aa8dab4cfe324dff74f4a9c2bdee6160c9e36188f8d06a6e  llvm-project-23.1.5.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index f0020b4804..9f99c9077b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
