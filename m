Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99473C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 01:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C87160794;
	Tue, 23 Jul 2024 01:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfVzyIBWmkXb; Tue, 23 Jul 2024 01:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5BC607DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5BC607DD;
	Tue, 23 Jul 2024 01:32:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8BC1BF2F4
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57958400B9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7iJcccGXR43 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC2C84011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2C84011D
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC2C84011D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WD8m011115;
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N1WDl1003438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 20:32:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 20:32:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDXv127512;
 Mon, 22 Jul 2024 20:32:13 -0500
Date: Mon, 22 Jul 2024 20:32:09 -0500
MIME-Version: 1.0
Message-ID: <20240722-optee-bump-v1-4-8e25b342634d@ti.com>
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721698333;
 bh=QDkdd5EjR5oaTtsvdDKwI/mff0DVMRVcbf7tvSejzGQ=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=oBHilQMwp0/cL8i5RjGRi39MDMNGp6edMUDqAjxG/FAkb1YTqx2KgSyA3xhy8PWJb
 5VD+Z+DkbJ7Tt+wOPrQM8HuBQtb/OKAag02JYvqggM21WuEXNxBXq78QHYKQAyK3qd
 oBLxPXxP5dodKL6aSDDJJ8vgNkrkKQmefhCRzhK8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oBHilQMw
Subject: [Buildroot] [PATCH 4/4] package/optee-test: bump to 4.3.0
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update optee-test to the latest tagged release

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 269b7a31655f4..5922487a6275b 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/4.2.0/optee-test-4.2.0.tar.gz
-sha256  e976d3dccf38947d79e358a0385b581fc3d48efa10b6eebd3b3b048facb1235d  optee-test-4.2.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/4.3.0/optee-test-4.3.0.tar.gz
+sha256  7bb181b74be88593df48321b816837acaad8e4d45e883f25a2e039978e5ec415  optee-test-4.3.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 69e84fdbd2f31..9037678b1d9f7 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 4.2.0
+OPTEE_TEST_VERSION = 4.3.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
