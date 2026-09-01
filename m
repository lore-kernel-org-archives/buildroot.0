Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32663C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C937E809C1;
	Tue,  1 Sep 2026 21:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iq07SVof_TJc; Tue,  1 Sep 2026 21:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788299824;
	bh=46aj1Cxnfr5wSOooRXfsLD66xxpLV1BjHvDbQ6JiFho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g34NQ9zXRopUUxj9nhyn86M4PzzJt61RSBnl+sInNgFQe4IEj3blf/6TNkwv80ra1
	 uadfl+m28zzVKTl/xX1e2tp97hrcMRcH0HzEehzNCz+eGhwo9xO20i2uEwJQB+p913
	 rO3B075el4K5QYckt2bgc/M/qZOHGY71RoAOsMzdFnitINFG8dup19C5H17Q45YER2
	 MrSg3MmEwTsWeAiwdzp5EYFD39UcF7KpWiKFObrd2RAA9GkUMrDwz1o/LyNjqG1ZPY
	 Rzq9dcvxc3nNFFV+0OnzyS6by9vjqIQ8L2HbGzmlY4KUgY5Y9jj/1OcqruyYKMaaCV
	 D0U8uymUHkxaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2BA80B9A;
	Tue,  1 Sep 2026 21:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AAB0498
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7E6607B8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8JEz_JB22uX for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 647196079B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:57:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E64A93581; Tue,  1 Sep 2026 21:56:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 23:56:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08cc0938b53cd7e8c6a746bf6592747bad1cfa5f
X-Git-Newrev: 789485b3e7a70e18c799ea330b3c184ce9ea245e
X-Patchwork-Hint: ignore
Message-Id: <20260901215602.3E64A93581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: enable decimal float on s390
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/789485b3e7a70e18c799ea330b3c184ce9ea245e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Floating-point type _Float16 added in gcc-16 on s390 now requires
decimal floating-point support enabled in the toolchain [1][2].

Without decimal floating-point, gcc 16.2.0 fails to build with:

../../../libgcc/config/s390/_dpd_sd_to_hf.c:27:25: error: decimal floating-point not supported for this target
   27 | HFtype __dpd_truncsdhf (_Decimal32);
      |                         ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:31:16: error: decimal floating-point not supported for this target
   31 | force_convert (_Decimal32 x)
      |                ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_hf_to_td.c:34:1: error: decimal floating-point not supported for this target
   34 | _Decimal128
      | ^~~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:35:18: error: decimal floating-point not supported for this target
   35 | __dpd_truncsdhf (_Decimal32 x)

Enable decimal floating-point support as suggested by Alexander
Egorenkov.

Fixes:
https://lore.kernel.org/buildroot/ansJ5dXXblvYeMLB@windsurf/

[1] https://gcc.gnu.org/gcc-16/changes.html#s390
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d6d56d837c3dbeabd382c1fb4f7d21d9891f4b9

Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gcc/gcc.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 04ba70c52c..c183bf8848 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -70,7 +70,6 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
-	--disable-decimal-float \
 	--enable-plugins \
 	--enable-lto \
 	--with-gmp=$(HOST_DIR) \
@@ -80,6 +79,15 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
 	--without-zstd
 
+# https://gcc.gnu.org/gcc-16/changes.html#s390
+# Floating-point type _Float16 added in gcc-16 on s390 now requires
+# decimal float support enabled in the toolchain.
+ifeq ($(BR2_s390x)$(BR2_TOOLCHAIN_GCC_AT_LEAST_16),yy)
+HOST_GCC_COMMON_CONF_OPTS += --enable-decimal-float
+else
+HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
