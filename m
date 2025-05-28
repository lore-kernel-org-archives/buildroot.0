Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7058C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 13:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7431C406FC;
	Wed, 28 May 2025 13:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHOkZ_DuG6mo; Wed, 28 May 2025 13:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC77040743
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC77040743;
	Wed, 28 May 2025 13:35:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5213DDCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42FC140743
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMZIzlJbNvyj for <buildroot@buildroot.org>;
 Wed, 28 May 2025 13:35:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75595406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75595406FC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75595406FC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 13:35:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6D4134397A;
 Wed, 28 May 2025 13:35:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 15:35:12 +0200
Message-ID: <20250528133513.69079-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeefleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemsgdvtggrmegstgdvkeemkehftgemvgduheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemsgdvtggrmegstgdvkeemkehftgemvgduheeipdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrnhhiv
 ghlrdgtrhhofigvsehmrgigmhhinhgvrdgtohhmrdgruhdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhmpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748439314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AzX0EHo6hE5Ey3AKJCOkVTmHJX4e+83c8FmViShJ5DE=;
 b=nWU+Z2rSQjm9KN/asAOyC9eRJfrSPgaOhq2thEXLkGvbsJttLkkc9zbLzN49HlpLTbf7LZ
 6ODuLOm3CK6/+IXucxu7ijSqkxxvyUulxeWLqhbMH55Xv3SOEMHNnusFeb9W9CJcvthZIF
 iajHjrqnCrP5JOwbU5cWaUfIJChOhmiuQ4Bcf+iZ1mP6wN2+OxvE34wO61kmC+aR+p8hjp
 vt3CayfCv7s685/xhrZ6Ej+Cw+RBaIBM6SHi+fOOnxnyqN+j2Hjyuu32mtZfhbHc1soxZR
 gBLcoK3V+hY6jvFArRb1Vt8yNvt4mUwRYIlt2gVVTjP3dD+lVECRVaMnPW8DpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nWU+Z2rS
Subject: [Buildroot] [PATCH] package/python-flask-restx: add missing depends
 on
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the package was introduced in commit
02de34989560b40a963fa13dddfb4714470fec25, it selects
BR2_PACKAGE_PYTHON_JSONSCHEMA without taking care of its dependencies,
causing the following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_JSONSCHEMA
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

Fix this by adding the missing depends on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-restx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index 4906869a38..ec5b3283bd 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
