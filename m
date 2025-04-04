Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36510C3601E
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 11:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A5E9814A1;
	Fri,  4 Apr 2025 11:15:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iyWdhenliEi; Fri,  4 Apr 2025 11:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3E881387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3E881387;
	Fri,  4 Apr 2025 11:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 033E3117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8472240B5D
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SvGKSXouhjq for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 11:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=18212901c=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6ECA4405B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ECA4405B9
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6ECA4405B9
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 11:15:40 +0000 (UTC)
X-CSE-ConnectionGUID: OD9/7JEtTm6INTpKo/nToA==
X-CSE-MsgGUID: SOK1mYunQvCFkFLRDMz/PQ==
X-IronPort-AV: E=Sophos;i="6.15,188,1739862000"; d="scan'208";a="40101907"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2025 04:08:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 04:08:04 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 4 Apr 2025 04:08:03 -0700
Date: Fri, 4 Apr 2025 16:37:53 +0530
MIME-Version: 1.0
Message-ID: <20250404-optee-4-5-0-v1-1-704dadae3f5b@microchip.com>
References: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
In-Reply-To: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=m40RV8EjHyJN/5c6jJ6PT1dDP5n0xbOq90s+bNV+zWw=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMaS/3zvhYduTzm9hUaEu52b/aL59+4/rfs2J2/h6//dKL
 Tx4v/z++o5SFgYxDgZZMUWW7s3zZxsW/enM/Mm5AmYOKxPIEAYuTgGYCIMyI8Nf5k8ekpdzV76e
 FJ4qtOjEDJ+JAbEVGn7PPrKaRLUm3P/K8Fc+vfv4TxXXOV/VJKPV4n/qaGWv5WyZ+K+q9+JRISf
 JfXwA
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1743765341; x=1775301341;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=m40RV8EjHyJN/5c6jJ6PT1dDP5n0xbOq90s+bNV+zWw=;
 b=day2Xvd5GBHC7qDk9ybqdO4swvWhOlY5/1XuT4+Dtq9L0C4gaCU8WTQQ
 1e+POEzb4z3qFXVNiuPsjcvPb7r6S+pgib+iDEml84KrSeJV+9N5AQJK9
 +1QlyKdfb7T1e8qI+LJ9wMj5Pykl37SNZAykYyJdrVteFszpE9dpC36gb
 lpPwrIZtJQ9S8dH54LEVj6+N34oG8lcCD7STgp8P+8GToj4KES/jG8zgZ
 wqfb5TPUz3zob4xGR3Kz1CcBuLLnv0tzsFOgGBV1nWvby2fC4IjH8LQhe
 f8plMWiXZURJnwQEPfSGBn+OqaJGz8pvg0h9hvG4021GzV+mKBY6uvu//
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=day2Xvd5
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: bump to 4.5.0
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

Update OP-TEE to its latest tag

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 563f192b187ef32c215fb450c695629c008edc42..de0ed3168b1d57252c7f4462931c3959f4660142 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.3.0"
+	bool "4.5.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -79,7 +79,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.3.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.5.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 16b3d7430e0ae80af3c2051ca769bdc2b1df55cc..2bee7f5ac99f383361bbc74898a3bd62f04e59c1 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/4.3.0/optee-os-4.3.0.tar.gz
-sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  optee-os-4.3.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/4.5.0/optee-os-4.5.0.tar.gz
+sha256  43c389f0505e8bc21d6fbaa8ea83ec67d1746ed14a537e3f505cd0e5b4cc2db9  optee-os-4.5.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
