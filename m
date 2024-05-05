Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F08FC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 447FB404E5;
	Sun,  5 May 2024 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSTOLQ7B5BoT; Sun,  5 May 2024 13:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E74C40643
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E74C40643;
	Sun,  5 May 2024 13:01:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 398251BF4E6
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25195407D0
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 13:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhIOLi-0hGSI for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 13:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=egorenar-dev@posteo.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF44C402E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF44C402E9
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF44C402E9
 for <buildroot@buildroot.org>; Sun,  5 May 2024 13:01:24 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 19B34240103
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:01:21 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VXPmx45R2z6tm8;
 Sun,  5 May 2024 15:01:21 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 13:01:28 +0000
Message-ID: <20240505130128.18289-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1714914082; bh=l00d0iqBzROoHYN/lsKOXAy7natV+jO0AnGxqAUmfkg=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=EeaE1CjejhTjafo3IZ+vYkRF3um3PH1Jnt6guplQAqfR97edHRf44NQgmxAjJC9v/
 zw0JSuY3NWT2I67+IjVUMMT1UKozzvOzn1w769t00Xf0rIY4fBdGBUtkAbVc49Aj+A
 PNcpMcvMUZ/yWaQNiRmQSlsKCKmBQNe+/UHyAryrwFealgKozY+U3wBAEqk1nFIO81
 D2eHuGjr1mOxRChdE+oagH76itbOCcPdIld0GDzOmY40gxtG2Uuhkk2PrOEAq2v+cm
 iYC1RT6huzBNl83yuTal391mlibZYtvlSWJLkXVgXmaO2SBCxw2KtrxBWxcNMqmha2
 sUsMElO2WeiDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256
 header.s=2017 header.b=EeaE1Cje
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump version to 1.7.5
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index fdb30de88d8d..9083ced4230a 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0554f5de516c51f5756e437dbfc353722b16b20e875241275554b474e89298db  makedumpfile-1.7.4.tar.gz
+sha256  0c53f1e5e11e75e4896197df795bee63b3d46b8821fbc3368f7a240861b543b5  makedumpfile-1.7.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 410752682da4..5fa1331910a8 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.4
+MAKEDUMPFILE_VERSION = 1.7.5
 MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
