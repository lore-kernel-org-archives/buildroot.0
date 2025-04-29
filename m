Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ACBC369CB
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 06:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8597780DBC;
	Tue, 29 Apr 2025 06:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F3idsgmlnG2; Tue, 29 Apr 2025 06:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78B980D6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78B980D6D;
	Tue, 29 Apr 2025 06:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C27351C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23E2280BC3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjMy7hMl8SLH for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=20723122b=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7823980BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7823980BD3
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7823980BD3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
X-CSE-ConnectionGUID: bKa2xpqTRSaMBxsSc3vR0g==
X-CSE-MsgGUID: vm4AqtfMQ16pFJGbvXYJXQ==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; d="scan'208";a="41007751"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2025 23:41:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:41:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 23:41:52 -0700
Date: Tue, 29 Apr 2025 12:11:30 +0530
MIME-Version: 1.0
Message-ID: <20250429-optee-4-6-v1-4-1cdb296ef7c8@microchip.com>
References: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
In-Reply-To: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=8jF6ywL068i89AI5iJoeJskIa6xM4Jwh8wyvsxMk6uw=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMWQIlCxP37PM4f3DlvQU7dmR7ttn3lfg2aHteCf4HJejh
 AiHeszCjlIWBjEOBlkxRZbuzfNnGxb96cz8ybkCZg4rE8gQBi5OAZiIJC8jw6nVyozHpr/J0tVj
 fvd8cjTfkzajzg8TBRPd11Q6rtot583I8O5v+aLYv8F/moJLhb+aXc52vdUbvzawObRistG0+5s
 8mQE=
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1745908916; x=1777444916;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=8jF6ywL068i89AI5iJoeJskIa6xM4Jwh8wyvsxMk6uw=;
 b=Lsr/3WZ7wyO5GHOIN/SlFrLHIHRnuWXRWlUHZKgLQhFcEQMMsLBXz30Q
 yIr38/yXCU8va9c01UrUpLV4HSrbvrTLNblsieIldyuqWzumw+4aatZSS
 ILSCMv6JMpt4aOIc34S8Bt3z3rt6p1rA8F5Cbl41FBZ0iInh3FTsEMNrV
 B42bcWlEr2xOo1B7e0LmTPqSPmGKGB/HGVKdahHkowP6tG26I77mK5xGo
 GNKrjWJga5GhVk+xPyLGt7koE0Ay0GbaHG/3UVQE+wbgFX9BWaVrx56H2
 U1gwkSLjl3NIX+znyOJUSgTnme12MK+MMQM+onBrDx7b3hGTADfHhgDxU
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Lsr/3WZ7
Subject: [Buildroot] [PATCH 4/4] package/optee-client: bump to 4.6.0
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to the latest version of optee-client

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-client/Config.in         | 4 ++--
 package/optee-client/optee-client.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 865b0d8f31f7b77fcf0afa88fa5c47f611775663..ac3b680743f4f60f18e417b3bdaa9044aa04df18 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 2ef793c9d6b5fec8efd392d42dda4942b9e89930..a5d98521a3822febcce98929136e17ea3cca7cdf 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
+sha256  a970338c9f69861901336716d89684646e4480b9970996a5b3581ae7d49fdaa3  optee-client-4.6.0.tar.gz
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
