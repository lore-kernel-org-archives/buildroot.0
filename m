Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA361C3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 22:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 848FD83E9F;
	Fri,  9 May 2025 22:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWKxuDsXHkST; Fri,  9 May 2025 22:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D1B83EA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D1B83EA0;
	Fri,  9 May 2025 22:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7D19E2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 22:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2DC2607FC
 for <buildroot@buildroot.org>; Fri,  9 May 2025 22:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2NaAJwgN6YC for <buildroot@buildroot.org>;
 Fri,  9 May 2025 22:06:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9873B606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9873B606BA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9873B606BA
 for <buildroot@buildroot.org>; Fri,  9 May 2025 22:06:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 859D342EF5;
 Fri,  9 May 2025 22:06:29 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yair Ben Avraham <yairba@protonmail.com>
Date: Sat, 10 May 2025 00:05:41 +0200
Message-ID: <20250509220542.379160-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfffueegveefueeugfegteefveehiedtieeugffgiedtvedukeetjedvgfekheegnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgedphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeihrghirhgsrgesphhrohhtohhnmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746828389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AW37Eq/I3CPvhZj1f6wniO0ju+pMC++uUspNLwQEZZM=;
 b=fs3EeoEscnKvKhj6Cb+LXj50rOgeLzvDTSvn+CWfwtYeFuivMgeeDPqt2W4Ysq1tk8Er0F
 qfZQ6jGqB/7cMq5CBGTGz1hH4bXgExIW6oyoaYFYOTJGYJaNg9XfSqqkJVNUUfyzNWnSJd
 zsL3R4lW7pJk9t0ND12nlI5VLMenfJmUVVDjaAM35g1rjJmmfJa1x0/OH63K8pGnwLZD5C
 PjuxvYuuPzE8P4AlCC3PzGPTCIEREf7M6UVpGlx99nS7qQgylLYonwToob3BmLN12ZRXU1
 I4+He+mYXhaXbXw8vPPGTsl+T1IgRgyE2BmfR0e3wzCfpYhZ5zFegJb8MppzNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fs3EeoEs
Subject: [Buildroot] [PATCH] package/tpm2-pkcs11: bump to version 1.9.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

1.9.0..1.9.1 changes described at:

  https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.9.1

Update suggested by https://gitlab.com/magerkraut at
https://gitlab.com/buildroot.org/buildroot/-/issues/109 as "There is a
issue with the database LOCK file".

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/issues/109

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 797955a69b..5f5abfbbe8 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  35bf06c30cfa76fc0eba2c5f503cf7dd0d34a66afb2d292fee896b90362f633b  tpm2-pkcs11-1.9.0.tar.gz
+sha256  ce24aa5ec2471545576e892b6f64fd873a424371bbf9be4ca3a0e689ea11c9b7  tpm2-pkcs11-1.9.1.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index c6218d772e..b26f53de27 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.9.0
+TPM2_PKCS11_VERSION = 1.9.1
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
