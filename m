Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7A0E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9D483D07;
	Sat, 30 Sep 2023 22:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9D483D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCt8xvTeMp8m; Sat, 30 Sep 2023 22:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C4583CBB;
	Sat, 30 Sep 2023 22:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C4583CBB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7082D1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A8C583C74
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8C583C74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kjasn69HuvVZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8716783C73
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8716783C73
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-405524e6769so11267625e9.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112259; x=1696717059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mg2NNJ0/8WMVIX5V8ANN+LwvGNVcPfXAteJ/ZwljmW8=;
 b=WvvtZyb+i7P9u9r69eSRJ/nCcCOPfNrW6bXww5A3oME8fDhMdKTaU82pBcNXB9tFUT
 fR2CILpBkDA8luNNFuTYnQxQSRF1t0TvRg56/Unvsx3Hccp6UKqYE0jP/iMlTBCuMIIb
 y4bMHGkGicPARTu3H+nBPyeYLU/DygQlU9dLGc8YJdDJJnfCLHa/CsPVPGZ6/BKJpVt6
 o2li3juxlv02j1ffLfSblhmAleQWcrU4+vnOtn3qFyEKZjfaWay/v2TQm3Bh2ph1eXz0
 hhucGF2Nb85wLSTglIS+4CB4EwthHGNZzQ+uq0Y27fTwVSrCoXSB4Mzd9/X4hYAH95i2
 Z06Q==
X-Gm-Message-State: AOJu0YwGGZLkTH8+4Kj6RbYsRopnVbV/nhth9GSwyp1+otCBqVtpBtCJ
 a5r2ubPuaRGII6Sw90FekReG+UGetZsfVmBNhbjxLA==
X-Google-Smtp-Source: AGHT+IHzPWOQIwgHQcFOBJ6VRybUhq1oQONsg32s3uOP9JvuMit3cqqbIrxfJs4/LnPuMCYH2UUpDw==
X-Received: by 2002:a05:600c:4991:b0:401:b92f:eec5 with SMTP id
 h17-20020a05600c499100b00401b92feec5mr6663079wmp.9.1696112259688; 
 Sat, 30 Sep 2023 15:17:39 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:31 +0200
Message-ID: <20230930221727.1458825-8-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112259; x=1696717059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mg2NNJ0/8WMVIX5V8ANN+LwvGNVcPfXAteJ/ZwljmW8=;
 b=atwr7JvMBccD6PO2ROvVbAGTIdJdUhQ/WI1jCD4TpVos9AgoTQzw6XxT8ttUF2uDOH
 H2XVU2nS97eTxAeYuaOTEo7gL25JmK3msHBvGwLu34bUq9xencLfheBYqt2ojSbunmCq
 PNYdsturn/GQOmNoBc027YZumzDw55SCB9OixbPTvII9Z8mgbD4H1U2JdC6HI07WbFP6
 XjWEId5nzNq7oD5nRzgOQgS2WR2vaU1RWPIAc45ELtu18KwhiEO0fdiSq+ibrfUls4BO
 7xFokiY5aCYvbrdcnp/QAoIWojZq+m9i+9Q72o21FpYqr+xlOSEutYAh/Piji2Xjoiwq
 8KfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=atwr7JvM
Subject: [Buildroot] [PATCH 07/10] package/jailhouse: expand
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In a follow-up patch, we want to remove this variable. Replace it with
its expansion, which is anyway just
$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) --root=$(TARGET_DIR)

While we're at it, split the very long line.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/jailhouse/jailhouse.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 6356c5a7aa..095032a1dd 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -48,7 +48,12 @@ define JAILHOUSE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/local/libexec/jailhouse/demos
 
 	$(if $(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS), \
-		cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python setup.py install --no-compile $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
+		cd $(@D) && \
+		$(PKG_PYTHON_SETUPTOOLS_ENV) \
+		$(HOST_DIR)/bin/python setup.py \
+		install --no-compile \
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
 endef
 
 $(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
