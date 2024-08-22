Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9C7C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 12:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5F260B25;
	Thu, 22 Aug 2024 12:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go1vRqNDj7Bn; Thu, 22 Aug 2024 12:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3DEF60B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DEF60B42;
	Thu, 22 Aug 2024 12:33:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 793661BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6778781746
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 12:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-gINqcS65Q5 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 12:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE4FD80C3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4FD80C3E
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE4FD80C3E
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 12:33:02 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CC8BD3535C1E; Thu, 22 Aug 2024 14:33:00 +0200 (CEST)
Date: Thu, 22 Aug 2024 14:33:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zscv/DsGJXfVtX6N@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724329980; bh=r2dBidSkHxRBsuYSKXGuj9MbwxlJNAhC0enqZINX4ME=;
 h=Date:From:To:Subject:From;
 b=Bt8Bjljwnwbp3z/gV+kTTGBixtInexDY3ltSK277J7uAQOhhiPBsQ2XggCS3YQoiw
 LB2UcVtCp6avfwqNrLK8AMyH//1mh0zg2dwvT+tUeb0sKo9jjf8ewXwnqPetzKYMNS
 T8gAebGMcN06oWPg1cGSFYWXOP2ETCYEfDBvLRY3CI50KmxGh4O5xw9tNGfPBEJmy+
 pbiwnG6cFaZTk3s4UQJacqmOs/gQNC2lldlyBGbhzmH0e2JrzamUCLUgxQ40XVHfIs
 xEz1s17pZxNDHSPdcrGj6h9YNeEVG6iG5N5NzXE3C67zbmfFlNnk3jaJx3k3UBhvZd
 lApGINCYnPGjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Bt8Bjljw
Subject: [Buildroot] [PATCH] package/fcft: update to 3.1.8
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

See here for a changelog:
https://codeberg.org/dnkl/fcft/src/branch/master/CHANGELOG.md#3-1-8

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index 96d885db1d..431f2218c6 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  904f40d749d198d97c46c5a459cd3c53fe92f008cf1e3e61949f6cf3036a78b7  3.1.6.tar.gz
+sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 538d8a0748..62c85a15c5 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FCFT_VERSION = 3.1.6
+FCFT_VERSION = 3.1.8
 FCFT_SOURCE = $(FCFT_VERSION).tar.gz
 FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
 FCFT_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
