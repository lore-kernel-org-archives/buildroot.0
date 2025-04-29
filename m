Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D70BC3ABA4
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 06:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B3380C87;
	Tue, 29 Apr 2025 06:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rj6sGbF7cIw3; Tue, 29 Apr 2025 06:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C4E80BD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C4E80BD3;
	Tue, 29 Apr 2025 06:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0B51E3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01E2380C20
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AevNOm946KlF for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=20723122b=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B74A80BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B74A80BC3
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B74A80BC3
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 06:41:56 +0000 (UTC)
X-CSE-ConnectionGUID: bKa2xpqTRSaMBxsSc3vR0g==
X-CSE-MsgGUID: AxJzvHVXQpyswi44NW5gjg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739862000"; d="scan'208";a="41007750"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2025 23:41:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 23:41:51 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 28 Apr 2025 23:41:50 -0700
Date: Tue, 29 Apr 2025 12:11:29 +0530
MIME-Version: 1.0
Message-ID: <20250429-optee-4-6-v1-3-1cdb296ef7c8@microchip.com>
References: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
In-Reply-To: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
To: <buildroot@buildroot.org>
CC: Etienne Carriere <etienne.carriere@foss.st.com>, Nayab Sayed
 <nayabbasha.sayed@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848;
 i=nayabbasha.sayed@microchip.com; h=from:subject:message-id;
 bh=VRZJu3a43/d3jTSzq5hrdT8hOZ6WoE+nbTaJnh3KXhE=;
 b=owGbwMvMwCEmfMj/xNz7ei8ZT6slMWQIlCxnP8+0Saz728L7Mn//qvKln/H+x1J5guNVuG9+2
 U/uKbG/O0pZGMQ4GGTFFFm6N8+fbVj0pzPzJ+cKmDmsTCBDGLg4BeAmT2L4X/B94S4Pt6AAX06v
 bXyrBLyXmyz14PKxueJ3evGkn/PL6hgZ7qee3Ot4aV/7HK9SsaT3wvePnv3rd0FY+2WWI/P7drX
 fvAA=
X-Developer-Key: i=nayabbasha.sayed@microchip.com; a=openpgp;
 fpr=E108A58C09FB2280B0AB41DAE24318EF3B3861A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1745908916; x=1777444916;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VRZJu3a43/d3jTSzq5hrdT8hOZ6WoE+nbTaJnh3KXhE=;
 b=AqtSD8cRSl08TbWkllCvSW/rUlNWbDYpjQlR2WZk3XaE9aAHeJhlFbsA
 f+2xfeuIYakeBbw/c2gxgzK5/6jlHee31wTS0trsTSrNq+Xi0t3IEpaab
 A3qhP1R66D7OFE9hSRutAHPpGuHxqxiFVMyjOyGZ8TTMnbl+ot9PcuLDC
 ls9dqIv2ZPKCmWollDvYMm2jS5TTMrI8wh2CtlSZVFZEanuJ4N/ARZp2d
 ek8qWiLxQ8sFPVroZ6OU5jt+6XM40A1ZQ4OLVcXrdrl/nnuaBLVPbAOhy
 WiGMqj0Z4nUJC/RlqsXeLX5gt5mqsRYmM6vd7qHGZO3GOKt9Qs4GsbuH/
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=AqtSD8cR
Subject: [Buildroot] [PATCH 3/4] package/optee-examples: bump to 4.6.0
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

Update optee-examples to the latest tagged release

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 222beb2af10c17ed3c91a183139a5f94dd2cee62..702adc84db3c3eb9aa784a406e6071991b9c9203 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.5.0"
+	bool "4.6.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.5.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.6.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 5a12bb22ba1987624560c8204d4546c7450b5787..54b98868d79941b8c6c5f0e741f01277b4e85ec9 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3fcf1f9eab8d094f898bbb3e2a69a0ca321765f39c832749fdb571a21063bcfc  optee-examples-4.5.0.tar.gz
+sha256  6891390aefa2046d500d3ffec05c327d7763e89645b2e99ef2330b561ba645f5  optee-examples-4.6.0.tar.gz
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
