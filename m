Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB08C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 12:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E353061090;
	Mon, 14 Apr 2025 12:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZFtbUC6AQU4; Mon, 14 Apr 2025 12:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E79B46083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79B46083C;
	Mon, 14 Apr 2025 12:46:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C32FADE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B435C60684
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wCaFZbCKQSA for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 12:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9CB5560A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB5560A6B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CB5560A6B
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:45:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5F63B4390D;
 Mon, 14 Apr 2025 12:45:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 14:45:53 +0200
Message-ID: <20250414124554.1963058-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfftddtledvgeefveegfedtjedvveeltdevkeffgfejgeeiveeijeeuvdevgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehnihgtohhlrghsrdgtrghrrhhivghrsehorhholhhirgdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744634755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CR6F4P7u9yR1F5YMxqVhlgiMKtxy+qRPtzXyddj0rnE=;
 b=He49A9NcrMnqiSHs7t4aDRhToq6HDzslRpaCr5jrz3KG1Bvt+g6QNZ//RkOt3/9D+QBn8e
 z1fM3gv2fh9PiV8J/NEQF0/WaV/IoDcNVI1GTxhf43f1ue0AF4OJE+FLVb8yaLm5mIxi7+
 LTuIbm47LZpMFnrBYq5hdxZuBRmXLU7yZhSQakzM/tBVPJdLT7s3ULGS/MGypc31PhpJY8
 Q6v4w28NeGkMdkEr4uWVX/75LdNIhcXkhXR4NulUjF9EJX8VY8dFFgB9QjBRhtpZMoTgV0
 1JV7br/Sq+/InMsjBa3M6/jLqcpR6ZRIK315CBPqWtHdd3iWvNseszWb0t7RFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=He49A9Nc
Subject: [Buildroot] [PATCH] package/bmap-tools: bump to 3.9.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:

https://github.com/yoctoproject/bmaptool/releases/tag/v3.9.0

Two important changes from a packaging point of view:

- Switch to using hatch to build
- Remove six from production code

So we do adjust our packaging accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bmap-tools/Config.in       | 1 -
 package/bmap-tools/Config.in.host  | 1 -
 package/bmap-tools/bmap-tools.hash | 2 +-
 package/bmap-tools/bmap-tools.mk   | 4 ++--
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index b5ccce786e..c71d6f6ea0 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_BMAP_TOOLS
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
 	  bmaptool is a generic tool for creating the block map (bmap)
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index 499f9d177d..056e76f959 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_HOST_BMAP_TOOLS
 	bool "host bmap-tools"
 	select BR2_PACKAGE_HOST_PYTHON3 # runtime
-	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
 	  bmaptool is a generic tool for creating the block map (bmap)
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
index 28a68e8b8e..0ead4ab1b1 100644
--- a/package/bmap-tools/bmap-tools.hash
+++ b/package/bmap-tools/bmap-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmap-tools-3.8.0.tar.gz
+sha256  9940bb97fa0f2c11ee4625a2f620a4ae2b94c556f8d01c070aee08486a2a1812  bmap-tools-3.9.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 3c661cb9e2..b8dec2c774 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BMAP_TOOLS_VERSION = 3.8.0
+BMAP_TOOLS_VERSION = 3.9.0
 BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = LICENSE
-BMAP_TOOLS_SETUP_TYPE = poetry
+BMAP_TOOLS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
