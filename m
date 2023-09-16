Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70649CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2495C81E09;
	Sat, 16 Sep 2023 12:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2495C81E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDfJe4F9iV3b; Sat, 16 Sep 2023 12:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72DA181BFA;
	Sat, 16 Sep 2023 12:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72DA181BFA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C56D1BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7607F6103B
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7607F6103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQxFZO4HMfOz for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:21:09 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26A5960C0C
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A5960C0C
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AF927353A916; Sat, 16 Sep 2023 14:21:06 +0200 (CEST)
Date: Sat, 16 Sep 2023 14:21:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZQWdso+HxD7K+tme@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1694866866; bh=FTGcbDok9wG7PgCaTq+uOdMOZLe0PLyGhT02Ou85a3I=;
 h=Date:From:To:Subject:From;
 b=m03qTMM+O7s7yxm2o/lPRLr0UuTUaJ1c3ctGc30eCKsTjC7Ej+XLemEB8dPdxS8C6
 kf1F544LeJHVJ8ldi1T+bRNyriG5/elS5eOJrKU994309a6a0fVObbmC3tDXxjMHFP
 zwytAgoYb8myp4AidOElLM8AeX2xAugJiJMTbQ8HW7LLrPH2AA36RmNkIg2yc9iely
 yKaCDlnaW3VGSBTRcbAzO/VCOvWcoNetdWZ07bwQWWNX/C2uK2CHQV1I/Asn70Z4s1
 T7GGH1dFCk4YeYnStPFOHLP7NQTOpjc+3Ix12Xi506TE56tChH3zQUpRkRXceuylTl
 Op+O7h+VUf8oA==
Subject: [Buildroot] [PATCH] package/libarchive: bump version to 3.7.2
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

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 02f7d84246..818113585e 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  b17403ce670ff18d8e06fea05a9ea9accf70678c88f1b9392a2e29b51127895f  libarchive-3.7.1.tar.xz
+sha256  04357661e6717b6941682cde02ad741ae4819c67a260593dfb2431861b251acb  libarchive-3.7.2.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 5bcf559a6e..2db36156b8 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.1
+LIBARCHIVE_VERSION = 3.7.2
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
