Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6839DC54F32
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0833940270;
	Wed, 28 Aug 2024 12:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2BaOJsWgpEO; Wed, 28 Aug 2024 12:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D6E40273
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D6E40273;
	Wed, 28 Aug 2024 12:15:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7B251BF83A
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23FF80CBE
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 12:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsTqj5lsGJO8 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 12:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C73180C9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C73180C9B
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C73180C9B
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 12:15:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D41E43521430; Wed, 28 Aug 2024 14:15:37 +0200 (CEST)
Date: Wed, 28 Aug 2024 14:15:37 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zs8U6aFlyfvfLg7c@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724847337; bh=NKLouyUuBsqvVccRUIVX3LNeHOIi3iBPr/MwK3BlcqA=;
 h=Date:From:To:Subject:From;
 b=B5QgcM5M72pOMClm1pB1cdwfgGVQ8K6YgdwftxajyjUZU26gciyKZc3d1IEX1btCN
 2quQASafNibdkbpks/IBsz/R3SYbgJJ6IRttrudBjNHjgFKWF/Ttwpqnb+bfglpTR3
 Fka/V1cOqaTpuYkr/w4KB5DmAFTAYUB9Jv3r1gkIgE8s07+ESIAIR1ZDs61qfVGHKl
 uuKlzKL4t561D5L+LuNGve+bldxtkDScc9ba/ZLWML9o2rKLDXQXTEsJqelLGenqNH
 NSce8xTlTKYxfMSWm99PzCG3k0O6PaeTyoL1CqJAoB3WmAHkaSW0uHqr7Rxqon/pJI
 VQgk3sbkrmetA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=B5QgcM5M
Subject: [Buildroot] [PATCH] package/p910nd: update download URL
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

Project moved to Github. Update download URL and hash.
License file got renamed, but it is still GPLv2.

Fixes:

 http://autobuild.buildroot.org/results/6e0/6e0e34c342fe712d5314de80488a2d034a2f5983/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/p910nd/p910nd.hash | 4 ++--
 package/p910nd/p910nd.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/p910nd/p910nd.hash b/package/p910nd/p910nd.hash
index 93b1389909..0f69e402d5 100644
--- a/package/p910nd/p910nd.hash
+++ b/package/p910nd/p910nd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f  p910nd-0.97.tar.bz2
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  a1bcc2dd75bad4e00a9de5098dbd970e8380f978fc09292bcfa15852af6a6964  p910nd-0.97.tar.gz
+sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  LICENSE.md
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
index 163ab1bcf2..fea8aafd50 100644
--- a/package/p910nd/p910nd.mk
+++ b/package/p910nd/p910nd.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 P910ND_VERSION = 0.97
-P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
-P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+P910ND_SITE = $(call github,kenyapcomau,p910nd,$(P910ND_VERSION))
 P910ND_LICENSE = GPL-2.0
-P910ND_LICENSE_FILES = COPYING
+P910ND_LICENSE_FILES = LICENSE.md
 
 define P910ND_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
