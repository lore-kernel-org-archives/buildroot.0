Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED10BCAC583
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAA2B82F51;
	Tue,  9 Sep 2025 13:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etGFXvFN3oE8; Tue,  9 Sep 2025 13:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6089828F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6089828F2;
	Tue,  9 Sep 2025 13:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E37CA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E12A40148
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ3yEP6wVrA2 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 13:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3F584016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F584016B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F584016B
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EB5FA4E40C72
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C659C60630;
 Tue,  9 Sep 2025 13:00:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 177A3102F28A0; 
 Tue,  9 Sep 2025 14:59:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue,  9 Sep 2025 14:08:15 +0200
Message-ID: <20250909120822.1069595-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422800; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=q9rzlzHPm9riRWySqEWfXDK8St9hSnoQXigq8w6CFB4=;
 b=Lh/B9aGlWrsngRuY4dMeuuTdndVZVhNAkQ9ZLT/YE/iTlYZjaHnMerGh+SCwklMzNsukG5
 ShRYrhD96F4Am1LK9OABiT93tFA6cpcQvyTzL+QhF9W1SdLrvHtpsgcbPfJE1tdKh8oF9j
 wLWugCHTEvIyQoasCBppVSiVbBzlqMB/3XsNCZuOjRLHFKXLHiWry+Mjuq5iL/1/1aqTBI
 ByHdbxWscmMYUqVG7LA/fACQjmPbPKiKZdy6jeblYRx2P2ILaDV61byThWkTDmMCQfG1ZS
 puhXud/Zv6meQjWlvTqZo+grVr3N6qlXhg1r/QO2+3xWNhZ2xA9iip/9rotr7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Lh/B9aGl
Subject: [Buildroot] [PATCH 10/11] package/selinux-python: bump to version
 3.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

No notable changes for selinux-python.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 54173dc7ff..44095dcd74 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  749025bfa4aa0e009bf3ffc455d565a18d4db71cfe796be4405821717206c25a  selinux-python-3.8.1.tar.gz
+sha256  dcfa5f1919dcb7e7b775851994eb5c83b7580dc496cd2d1f73867dfa074d2339  selinux-python-3.9.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index ccac245fd8..635d5945a4 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.8.1
+SELINUX_PYTHON_VERSION = 3.9
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
