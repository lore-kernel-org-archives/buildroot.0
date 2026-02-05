Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA13ECD994
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 17:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17703835FB;
	Thu,  5 Feb 2026 17:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujHRd_CVThUe; Thu,  5 Feb 2026 17:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F23682E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770312945;
	bh=TscVHbnrS6MJ1wpwbmE2VxvZdJp/zt4gmR/wocHWWdE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hZDpcHvQK44gjfZa3Lz8VwEOSdc583qVhPXSNDUyZb98W+D2ftPQ+25rBI/LvIN8l
	 M+EdlQ/Sq0FKRygtRDUJhEKIM+IThw9BVlse8fsZ9JVrdzutcx9uYboabS1/CcOkBB
	 WCt26hBmrtwkNICB9NFh1kEE6OrZMDOz6zwM2pLVwShJczkLYg7B6d6iwbtgsF0zqi
	 2dbcMNzD7xHISRiz7G+LtxRmR9m2Y/dcJCc8zoo7ngdsgeqihJHBwQYt2xacMyHpSu
	 eDkSvu7qeCtISJgUUr1QGHlD4Pvd+RDxBTil6rOu9Js077ArIqPx0brjJ37uOONVCj
	 9+NioPslByxGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F23682E1A;
	Thu,  5 Feb 2026 17:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21295BF
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AE9B41221
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xM-BDcloYGfl for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 17:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.57.108;
 helo=mail.villagedupre.fr; envelope-from=pyk@foss.peewhy.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BBAD4121B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBAD4121B
Received: from mail.villagedupre.fr (villagedupre.fr [163.172.57.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BBAD4121B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 17:35:39 +0000 (UTC)
Received: from sejong (82-64-130-240.subs.proxad.net [82.64.130.240])
 by villagedupre.fr (OpenSMTPD) with ESMTPSA id b6042997
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 5 Feb 2026 17:35:36 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Date: Thu,  5 Feb 2026 18:35:32 +0100
Message-ID: <20260205173532.3968214-1-pyk@foss.peewhy.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=foss.peewhy.fr
Subject: [Buildroot] [PATCH] package/libcamera: bump to v0.7.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0

Add missing licenses hash:
- LICENSES/Apache-2.0.txt
Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/Apache-2.0.txt?id=ce02faa088dd3128a097b0f7ac6ce4e507e89f98
- LICENSES/CC-BY-4.0.txt
Added with: https://git.linuxtv.org/libcamera.git/commit/LICENSES/CC-BY-4.0.txt?id=b4e31a88d304e09e200af9d1e00760074cc854c2

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
---
 package/libcamera/libcamera.hash | 4 +++-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 4e79be844e60..bddff77cda21 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,10 +1,12 @@
 # Locally computed
-sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
+sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
 
 # license files
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
 sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
 sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
+sha256  d557539df68e771cc1eedcc91d13f70fca930e508d11eedcafa4b15db49e3744  LICENSES/CC-BY-4.0.txt
 sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e86e05328c1c..17908e3c1c6f 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.6.0
+LIBCAMERA_VERSION = v0.7.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
