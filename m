Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F94C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 06:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5010381C0A;
	Thu,  9 May 2024 06:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRQ1iH80T6Ef; Thu,  9 May 2024 06:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F1EB83CD5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1EB83CD5;
	Thu,  9 May 2024 06:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 499D11BF84C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F54160D71
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKBirwVnxy88 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 06:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8524e0df5=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E80CD60D87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E80CD60D87
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E80CD60D87
 for <buildroot@buildroot.org>; Thu,  9 May 2024 06:32:36 +0000 (UTC)
X-CSE-ConnectionGUID: PbUr6rRBRNCFX05CXiAZ0w==
X-CSE-MsgGUID: sGC11zawTieSdPvuIBUzdQ==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="191600367"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2024 23:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:32:06 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 23:32:05 -0700
Date: Thu, 9 May 2024 11:58:57 +0530
MIME-Version: 1.0
Message-ID: <20240509-optee-bumps-v1-2-fa2a6e1096a6@microchip.com>
References: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
In-Reply-To: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715236356; x=1746772356;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IIzeqfpBmX+8AJ3Vg2tcFs1BJcI1XS4/SyAvidwPztU=;
 b=wPaokA0j/ZGOycVSHvoeMfyjCcjQXhlrx4N4FXQCdhbIPOW3KFWVWgly
 neZdvoZmM/BHa1qjsTPyla0fuMClyvnCVQC/c3T00bSowlbJja6lBmXZp
 ap5FHymJWVoST4WCMQOakYA22mC6F1E6nrVYp7h+pvWUrS12NgnNkICKc
 x6NdHkIt8GN1fmHrXP4Im9fk1oACNTnKeyffZgJmaMC2wwUzH1SHcHj2m
 inBRsQ/dJKG4k1e8IGLfJgxkdKGIN174TieS5kiOjbCHHyxhR09XEo51f
 rtATOfAJ+YHQm4p0ZW+S2awZ148P+trQLgf876BQe2fgQqZeFJD5JbzjQ
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=wPaokA0j
Subject: [Buildroot] [PATCH 2/3] package/optee-test: bump to version 4.2.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE test package version to OP-TEE release 4.2.0.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 9744ab6d92..269b7a3165 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/4.0.0/optee-test-4.0.0.tar.gz
-sha256  dc37b90c98db54068e61b31e20378878e2cfdf3c71f90c8a635786164651c62f  optee-test-4.0.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/4.2.0/optee-test-4.2.0.tar.gz
+sha256  e976d3dccf38947d79e358a0385b581fc3d48efa10b6eebd3b3b048facb1235d  optee-test-4.2.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 44d3015ae1..69e84fdbd2 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 4.0.0
+OPTEE_TEST_VERSION = 4.2.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
