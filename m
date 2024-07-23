Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206A1C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 01:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E7260792;
	Tue, 23 Jul 2024 01:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErgcJVJwee8c; Tue, 23 Jul 2024 01:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0456074C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB0456074C;
	Tue, 23 Jul 2024 01:32:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0C311BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF07606F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 01:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id of5-axycUdgy for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98C53606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C53606EE
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98C53606EE
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:32:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDfA011111;
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N1WDqm128823
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 20:32:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 20:32:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 20:32:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N1WDe3127509;
 Mon, 22 Jul 2024 20:32:13 -0500
Date: Mon, 22 Jul 2024 20:32:07 -0500
MIME-Version: 1.0
Message-ID: <20240722-optee-bump-v1-2-8e25b342634d@ti.com>
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721698333;
 bh=r/wsbR18nmzz99cuvwSgvDbalaUoN1+iQ3GOnOkZ8+k=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=rIKo+WKbWKRlx9Va61QV8k6Ygx7AqXoHCvXCV8+TzfLt5G/UBAIjiFOG2wQiaa2Du
 rMR1a2umAAb5Z+dpXfGcAGZ/CWRCv5YGVd/vclSbaQ+9F0E3CL1+78I4zegEOx/zWy
 JKwPzvEHfY3KeVXfwgKutrvvZp6JEnYvVCNSK55k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rIKo+WKb
Subject: [Buildroot] [PATCH 2/4] package/optee-client: bump to 4.3.0
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

Bump to the latest version of optee-client

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 package/optee-client/optee-client.hash | 4 ++--
 package/optee-client/optee-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index b0c6dfcb5e1aa..8904c930ee67d 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/4.2.0/optee-client-4.2.0.tar.gz
-sha256  ba0dad79cec2dabb7b6a6d3e391804f0184863ee9810e90bf97a392d3c1ad5eb  optee-client-4.2.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/4.3.0/optee-client-4.3.0.tar.gz
+sha256  a9a91bdb433df795c87a6d15198effbd648e3671ae611f2a3f8b41229d61cce0  optee-client-4.3.0.tar.gz
 # Locally computed
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 6600a9c4fc938..c1813cd9b1148 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 4.2.0
+OPTEE_CLIENT_VERSION = 4.3.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
