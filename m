Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14027C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A67B880F0A;
	Sun, 18 Aug 2024 09:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI4LTVAyO0SU; Sun, 18 Aug 2024 09:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D4380F0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D4380F0D;
	Sun, 18 Aug 2024 09:33:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5762C1BF479
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511554023F
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JenfCNDvuwmt for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A83940194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A83940194
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A83940194
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:33:33 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D8F3335211C6; Sun, 18 Aug 2024 11:33:30 +0200 (CEST)
Date: Sun, 18 Aug 2024 11:33:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsG/6okn7XCUP4T0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723973610; bh=3CBMG00eTz1SOk929y0F2CgHZklGKX6Beg+cM0MjTX0=;
 h=Date:From:To:Subject:From;
 b=gIX5rm7t6cylZM9lYR6I1Dc+gqYb3fMF4aMS5o9U24Ab0BzImD20LKDtyddmvS6p/
 pYhfYlzM7WqXm7rn15S/B5uWSdUsYJRCahiN/Hoiek3mYtPrnrD56q6oxjRfaRVpKJ
 GYLl08/WLdJT0XoXmMQHtPZvwhSktAErnDtFxY5NJmDMLxdLgkiH6d48Tw8Hl5qpdH
 svXGyKDccSaopf3leJWW0isl1e9s7NO/hf25YU6bqIRBg3XJWv5Ey1Bf1wqpS6W8Vf
 4V8ewvh2Xr9bUoEsuy/P1ZYiDL1f6fG/3twMrDR5rJda38dSeQGbm4MguYtGt/Jtd6
 op5pEB4Zno/Nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=gIX5rm7t
Subject: [Buildroot] [PATCH next] package/e2fsprogs: update to 1.47.1
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

See here for a detailed changelog:
https://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.47.1

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 28a47c15d1..94ce2d5bc9 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.0/sha256sums.asc
-sha256  144af53f2bbd921cef6f8bea88bb9faddca865da3fbc657cc9b4d2001097d5db  e2fsprogs-1.47.0.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.1/sha256sums.asc
+sha256  5a33dc047fd47284bca4bb10c13cfe7896377ae3d01cb81a05d406025d99e0d1  e2fsprogs-1.47.1.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index cbaac4f40b..7e2d9a739d 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.47.0
+E2FSPROGS_VERSION = 1.47.1
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
