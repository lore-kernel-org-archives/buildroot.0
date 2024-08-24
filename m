Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0F5C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 08:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0588F80F23;
	Sat, 24 Aug 2024 08:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xFuQ2GDZ7mJ; Sat, 24 Aug 2024 08:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A6881E8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A6881E8E;
	Sat, 24 Aug 2024 08:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 787E41BF339
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 08:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67557400F3
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 08:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmQFPG4KBQRF for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 08:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2269240042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2269240042
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2269240042
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 08:30:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EF580352115B; Sat, 24 Aug 2024 10:30:46 +0200 (CEST)
Date: Sat, 24 Aug 2024 10:30:46 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsmaNs8OCMDI+vs1@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724488246; bh=U7og+5jx3vyjSPHRGhTlEgcHytgf5gvPtAuPqqSUHsE=;
 h=Date:From:To:Subject:From;
 b=fl6ySNpCvAOEG+G+YQZYlljnV7Dm3Xb0b3dOq8rLSbhsM9bi1a5zbStuol9DIbQLv
 TkQN/CIW6WgF9aOel1UjqYehraZEe6PVnrW/MBhXQdAYEjGK8hE/+YXbi4emklcogm
 KrPGUkbR/nuEg2ZwoxgIqx5mSVIvcfgZDpeuiD3w5PMlP5kBOglW42Z8mUwjZ3kKet
 Ao1P+jheBCNCv+Vrdcxj7dJz1milpTUVZ+mTu7vBxP9Vtp9Qqq0PX0I3qdSkOtpbXo
 Cw4C4SGAdjZNOpCaQ7IB4v6DhsgymnUoyL/X9NG5zz6Hq56ExTjjKvypwFUVi9zDUm
 BEw8TPJP5Uf3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=fl6ySNpC
Subject: [Buildroot] [PATCH] package/szip: update SZIP_SITE
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

Fix broken link.

Fixes:

 http://autobuild.buildroot.org/results/35d/35d08103bbd0da22a5e111f1f86f28aba7062ee6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/szip/szip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/szip/szip.mk b/package/szip/szip.mk
index 7a8a5a82e6..d8b83ed82a 100644
--- a/package/szip/szip.mk
+++ b/package/szip/szip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SZIP_VERSION = 2.1.1
-SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1.1/src
+SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/2.1.1/src
 SZIP_LICENSE = szip license
 SZIP_LICENSE_FILES = COPYING
 SZIP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
