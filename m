Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EA5106ACEA
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 21:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E5780763;
	Thu, 12 Mar 2026 21:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3SOZgbWPgHT; Thu, 12 Mar 2026 21:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F0B8075F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773349631;
	bh=cp5N0VSVD84tP0R2tSwcwxzAtLa/RCT++qt1IS/2hRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I/SL6ESShWS200xcAPV8L3QINJPm+Y99Wy/MeYV47HUQdSj1kQuz5c4O09tSZAe9F
	 GLdjfLsbiUbgbxhbNwCLBNACPx66tSE4be5MmBuaysGjgI7wZomJc9zuSP7nTCzL1/
	 i9FlDVOnb8sSQKasMG7XFWHkMPjQ/IBh+MPfsErGO9Wn6RUd0wvefV6c5Rit9TmQ9w
	 RhRveR3szazy880ZD9r0GKCbvjJIflt/FHbR20QkbHTOO7tdIu+NGjpmJ0LjWQY8JR
	 q9sR8VOKsFXNcLVhIzRRii31bYseDFPqtEwnJZ78Oa0njdCD5kAiQdVp0FtO3qe+IZ
	 eJnLX/nnt9ZGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3F0B8075F;
	Thu, 12 Mar 2026 21:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F698787
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1157F40195
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9h9iX-tnVHS for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 21:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65AE40186
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B65AE40186
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0FB387126; Thu, 12 Mar 2026 21:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 21:26:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2da1ccab3444a723dc6e3820890e193f9550dc95
X-Git-Newrev: 1ecdf682930e2367bc7f58dd55f2d427bb6e34a0
X-Patchwork-Hint: ignore
Message-Id: <20260312210708.D0FB387126@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 22.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ecdf682930e2367bc7f58dd55f2d427bb6e34a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-22-1-1-released/90150

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 99e5dc666a..528591ba09 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.0
-sha256  25d2e2adc4356d758405dd885fcfd6447bce82a90eb78b6b87ce0934bd077173  llvm-project-22.1.0.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.1
+sha256  9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95  llvm-project-22.1.1.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index d9820d7d12..b358b80e23 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
