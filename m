Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EADDE784A9
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 06:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B466B81E48;
	Thu,  5 Oct 2023 06:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B466B81E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n98K0Onaf1uB; Thu,  5 Oct 2023 06:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE2281E3D;
	Thu,  5 Oct 2023 06:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE2281E3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA321BF25B
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4FE74046F
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 06:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4FE74046F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x0l4u2BEIZM for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 06:14:12 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B38940260
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 06:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B38940260
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BEBEC3520D5A; Thu,  5 Oct 2023 08:14:09 +0200 (CEST)
Date: Thu, 5 Oct 2023 08:14:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZR5UMYv3cDwycJDf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1696486449; bh=UEY9A5134lpckPcoOCWE38SCZ2O8yMHLNbjQ6UwgOlU=;
 h=Date:From:To:Subject:From;
 b=LM7NakAuxvkH+6n6SSIN89FlMlgpwzS8RGloawkUs61+wrG6G2wytjK9tUByEeBBF
 vsTY65eFxM/LjfnPZGOsiw7l6xhLvdKfz3OJqF3lvZMBEc7xHSPxZOn9G3/gpCyl90
 ql1UpFidcyZ3vftg9RS2STh50kndh2cxetRmmwHuRAVckpJVFLUJTmnh0BqTSQaJPo
 kMdyVAWki6DOtVTLWaTvIXkfI+FUYY48DEtJ/mAJnb9m7x4gJVo/Caq4mv361fv3eS
 dnr/pJ/kJbN6QO0fVoFOiFMZ6vxz5vWzzDqEmOuDblLevFb+O4Kabdhwq7FqyQpV4A
 rTuP3FjoSDd5A==
Subject: [Buildroot] [PATCH] package/squid: bump version to 6.3
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
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index ec60a0e9d1..a6d4c5d056 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.2.tar.xz.asc
-md5  ad01b7d82b6a00ffd8cd39b97113d05a  squid-6.2.tar.xz
-sha1  29ddb4c522a36f1270e7cfa66f0dec8805fd2b57  squid-6.2.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.3.tar.xz.asc
+md5  2512b5d27856e6f91a97719784506893  squid-6.3.tar.xz
+sha1  7bd74034015c6a4d345a4d277a431908bed2ec4a  squid-6.3.tar.xz
 # Locally calculated
-sha256  dd759e151e997d31786d91743d327b1b4b532f1caea66bf81100ec8ba04ec4c1  squid-6.2.tar.xz
+sha256  74a0f5586a7a5d89573d502708d5e1d66ddf0430cf4802cc7261b765653248fa  squid-6.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 167e9f67d8..019a202952 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.2
+SQUID_VERSION = 6.3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
