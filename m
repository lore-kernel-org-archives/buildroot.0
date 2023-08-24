Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96115C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 05:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB2E5418D9;
	Thu, 24 Aug 2023 05:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB2E5418D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbmI_3VAVYSA; Thu, 24 Aug 2023 05:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFBAD418DE;
	Thu, 24 Aug 2023 05:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFBAD418DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D00E61BF573
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA2674107B
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 05:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2674107B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qz4Cki5p4UEi for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 05:02:30 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A88400C7
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 05:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A88400C7
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9BB643520B64; Thu, 24 Aug 2023 07:02:26 +0200 (CEST)
Date: Thu, 24 Aug 2023 07:02:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZObkYg7QwKJVHGVw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692853346; bh=HQyodUXjK8N+D+usdiha/zJ2HU+lA56XxsGxqaiOIMo=;
 h=Date:From:To:Subject:From;
 b=nuJ2Snt5U9wA+u2wler8Hzdw3M36fHCAAIZQZg5fXJF4B4va/6XAz33LhGEK0JSw5
 kxnXHldDd+CbORXJs7+s3VLTqv3490R5xNHU6VfZnPhD4UT4qMATJ+r1E3bC7FTse6
 E719L54SoBSy9sBZSefcxwnQ8yaFoHmiM6d9UxG4jAy5apREsVHOf7BwTcOQsWb4fB
 dcf/1BZZo9xg/4zlZz/N4ylqMvi0DVI98LQ5APFdlWZafjNjhUUF5r8Ih0pNzpKLfe
 +Ht1NxTkDLSwaSWyiS08zh5PCd40QTwuPvdnU7bq7vMcyw2Ake29LFKd4vSyz20j1s
 q8Oh+Kfuuncaw==
Subject: [Buildroot] [PATCH] package/gmp: guard riscv definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 30997eaa65438a2ce726ad8a204ac5a36363f5c8 a mistake
was made. Guard the definition correctly.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gmp/gmp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 3b732dfa71..1ef4dd43a2 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -24,9 +24,11 @@ GMP_CONF_OPTS += --disable-assembly
 endif
 
 # GMP needs M extension for riscv assembly
+ifeq ($(BR2_riscv),y)
 ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)
 GMP_CONF_OPTS += --disable-assembly
 endif
+endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GMP_CONF_OPTS += --enable-cxx
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
