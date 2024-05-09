Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E59C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 06:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C104081DA0;
	Thu,  9 May 2024 06:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E85bnwvGeKbS; Thu,  9 May 2024 06:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1CED81FA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1CED81FA2;
	Thu,  9 May 2024 06:32:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 458361BF84C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979E060D5D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-XSa0cEmhI1 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 06:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8524e0df5=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9842560D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9842560D71
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9842560D71
 for <buildroot@buildroot.org>; Thu,  9 May 2024 06:32:36 +0000 (UTC)
X-CSE-ConnectionGUID: PbUr6rRBRNCFX05CXiAZ0w==
X-CSE-MsgGUID: 8ryHZdnjRbyNNLfmAuJR2w==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="191600365"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2024 23:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:32:05 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 23:32:04 -0700
Date: Thu, 9 May 2024 11:58:56 +0530
MIME-Version: 1.0
Message-ID: <20240509-optee-bumps-v1-1-fa2a6e1096a6@microchip.com>
References: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
In-Reply-To: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715236356; x=1746772356;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Jfq1OOkwoWA1saYnPsq5Hhj85bMQY7jRddMvQ8qorNs=;
 b=k6O8kFkmaM3zoRK5VA9p3fS13E6srakeaK22V9s4i0ALJxBgka9x+doJ
 bf1T7v8VWDAuLVQkSbTctu/QoIZbvKr1+2SSGDTfIkOy4h5bUPH6NfZxf
 4sLBsxzo+R6kut7EEMB6gBYi+ICufarJcEQRlyN6mB9+fThm4QAJNI8r5
 mSB49qPKed0ZrvFnMtobAHDGoM7/1jsdGWAXdNjh8kBw9910A/f4OVHHV
 MOdhKVuLeyxZaBF9snqE9L6d9zT4Rg6PZKx78ipzt0V09ufeeLfWclj1c
 mi/Nf5UGnqBoIJCQnhF0JEe58bmhDztPRSo1ysR45A7p7iYaoD/1WYAx/
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=k6O8kFkm
Subject: [Buildroot] [PATCH 1/3] package/optee-examples: bump to version
 4.2.0
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

Bumps OP-TEE examples package version to OP-TEE release 4.2.0.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 71cd95605d..a60b6619f1 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/4.0.0/optee-examples-4.0.0.tar.gz
-sha256  4e21455c889ffb93085eb76f76ce191e24f394b3fa8f1d2429cad38a36e4f6e5  optee-examples-4.0.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/4.2.0/optee-examples-4.2.0.tar.gz
+sha256  fcc032f84c0c7c90fbc3936c6d4d10e502797da7a7c23780ce2a5a88a720887d  optee-examples-4.2.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index d620f0e36a..7d52a277d2 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.0.0
+OPTEE_EXAMPLES_VERSION = 4.2.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
