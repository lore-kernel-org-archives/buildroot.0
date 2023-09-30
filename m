Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323ABE748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E004D83D28;
	Sat, 30 Sep 2023 22:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E004D83D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLKDN6ukeFvd; Sat, 30 Sep 2023 22:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E8E483CB1;
	Sat, 30 Sep 2023 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8E483CB1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C58781BF5F5
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FFC983C78
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFC983C78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pdr2dtpJHTjv for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:43 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF8183C70
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF8183C70
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32336a30d18so7156343f8f.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112261; x=1696717061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITDyZUbaue4gr3Jo9xNOaYfWd3QslWPqOylLC8BcOlY=;
 b=IznozuOt6AIenVkGgIUX1mGmugNd2DS2i5FPdU6tEw/zm9XICNMzWtGngWq4CNIpUX
 CCkfE+FeGupn1gqKnpmptYrknofSFHV9ir6VmUpSeAg0/VjBDiWValvF2tWCfaJido0m
 B7ntw5ssIkazZWOhPBkJForRQOpbftM1TTJyPeUPjK1UPCnjz3y5iGVJqIUpPcA8Q2Mj
 QfEybDaVpQJE/+UAlR0d+8Mw0PzX9luyoFDtN6Le9iM2b8hlCf6cgN/o1rRXUlYBR8GP
 v0hoqh16hFug8+cPQntuVhnYPVI+U+OJG2vFOYlLZm7+iKmhforgAWwcf6z6u0Fkw8mb
 2xBA==
X-Gm-Message-State: AOJu0YwYS+KtNAh+CgN5wXYhRxnANbsXS92eArusBoK5RpsPIaywMqCh
 cWdZQbRec7BgLkcGO28Atrd7kd/aYyKadik7LKsdoQ==
X-Google-Smtp-Source: AGHT+IGtSKKCYEUU8xV+RYbPVLN3ICUzGKHm1rrf0Zj3/qZ60kGFgN33/0tPehYTiC21RWlgA6+L5Q==
X-Received: by 2002:a5d:410d:0:b0:314:1ce9:3c86 with SMTP id
 l13-20020a5d410d000000b003141ce93c86mr6444536wrp.0.1696112260886; 
 Sat, 30 Sep 2023 15:17:40 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:32 +0200
Message-ID: <20230930221727.1458825-9-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112261; x=1696717061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITDyZUbaue4gr3Jo9xNOaYfWd3QslWPqOylLC8BcOlY=;
 b=QGSeFgi1n9TDV8mcCezq/FiRsK9m0y1PiMUS1beltJe2nG6XCQfsKNK8mbOXh141ng
 O75md6uEbQawm1r+HQD16pAzpskj1lVWTeLI4saZCB/n0jlQS+p6NXF7lccG9wU7FDvP
 N2seRpZYP3Z4wOXwOdB4GpWKwT2dVqZbLr+s/4n+yvicTeHjHJcnQDxbZM+8ruC4WaA/
 48IKAxenR7rxxDiMdOVdnDEVvPWIDjapBKAlFGXv04ePJ5whF4mNXOvS3q6lxIQ3QG86
 CiKJAKoS1FgL+RcNQ4HPnIOecT/LBvXta4sAUbCWkfaxTjKaVZAup3wiKtMzEsSnrqnz
 beMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QGSeFgi1
Subject: [Buildroot] [PATCH 08/10] package/i2c-tools: expand
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

Also remove PKG_PYTHON_SETUPTOOLS_BUILD_OPTS, which is not defined (i.e.
empty).

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/i2c-tools/i2c-tools.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index adccd9475d..f8d1bcb4b0 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -36,15 +36,15 @@ I2C_TOOLS_PYTHON_BASE_ENV = \
 define I2C_TOOLS_BUILD_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/bin/python setup.py build \
-		$(PKG_PYTHON_SETUPTOOLS_BUILD_OPTS))
+		$(HOST_DIR)/bin/python setup.py build)
 endef
 
 define I2C_TOOLS_INSTALL_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
 		$(HOST_DIR)/bin/python setup.py install \
-		$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
 endef
 
 endif # BR2_PACKAGE_PYTHON3
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
