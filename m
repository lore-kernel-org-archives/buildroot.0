Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEA2C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9079D40BD3;
	Tue, 15 Apr 2025 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXaY2I9YBjt6; Tue, 15 Apr 2025 20:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04C840E38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C04C840E38;
	Tue, 15 Apr 2025 20:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35075200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B45D40E13
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AjW3pks_rro for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29D1440DCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D1440DCC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29D1440DCC
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:56:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1A87B438F2;
 Tue, 15 Apr 2025 20:56:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:56:42 +0200
Message-ID: <20250415205643.2526615-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetvdfhvdfgfeeludffudehleejueehueehtdetteffveffhfeggfehieeljeevnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhot
 hhlihhnrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744750604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jbJLNtHALReQ0CHmyUQLBGNTMzSj+yHXSKinevj4mGQ=;
 b=j6al8Y6taSqSBqPkMKUCu41EqM1zellAIh64bG+S4aPVAWo8lukvDrEheIYfks/YZwxSzy
 PitIRlzDZcjU56XdoqcCSW3AahvFWSwHTMVP3c8q0k8ocivQpS+icJuEN8BxrzEnEYqsLy
 8nlLc7MBrEaQlNv91Ovk/tx5RNLsjJA89tMbx1dvtvMZiBds7zLRfUbvevVb8TlvGttKJC
 n2UD4dPy/PqRuGBsWQBgJmtOf10kqq1FoY6uCiO1JBGgQSxzNlC1W4BIORSG7FWr4bFs06
 e0+qSaQu0UL3fka9xk87lL65fOe2/CUsczzXgqZoo9qQH3nTQD1GTu6/MXtOgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j6al8Y6t
Subject: [Buildroot] [PATCH] package/python-qrcode: bump to 8.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes since 8.0:

- Added support for Python 3.13

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-qrcode/python-qrcode.hash | 4 ++--
 package/python-qrcode/python-qrcode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index ceeaf05f49..549e077c2b 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/qrcode/json
-md5  29561c9082864010f884d2fc5b3e62de  qrcode-8.0.tar.gz
-sha256  025ce2b150f7fe4296d116ee9bad455a6643ab4f6e7dce541613a4758cbce347  qrcode-8.0.tar.gz
+md5  71039efd5939238780bcd6861bf0bc50  qrcode-8.1.tar.gz
+sha256  e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48  qrcode-8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 8222ceac8e..8ee751b0d8 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 8.0
+PYTHON_QRCODE_VERSION = 8.1
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
 PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/d7/db/6fc9631cac1327f609d2c8ae3680ecd987a2e97472437f2de7ead1235156
 PYTHON_QRCODE_SETUP_TYPE = poetry
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
