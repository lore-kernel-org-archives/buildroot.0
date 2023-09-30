Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06488E748EA
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 22:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8E4883CBB;
	Sat, 30 Sep 2023 22:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E4883CBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6l7-jxzTCEJr; Sat, 30 Sep 2023 22:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053A083CB1;
	Sat, 30 Sep 2023 22:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053A083CB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9901BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5481B41B6E
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5481B41B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8X93lRZlBbKI for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 22:17:41 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEE7C41B3E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 22:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEE7C41B3E
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3248ac76acbso2626351f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696112259; x=1696717059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXpyH7fQuOv731/mcAgdDCg8a2WfBqyLO8+J18KwDi0=;
 b=SzNMC20ntOttc30wiYwpDSqxc11XcW1MXqvFMc7pJhekWrKzV6G2M/n2+++h1hizxF
 0z4k4Kon1VOL0jOLKqqWzlEboJIAiLRCrwn8guDvIlL9Q1+ML061RWQMAY57JCpTdQfG
 y7HuwOP0F3qtH+5JLEqiznuml8AsPR9ALvqnmmIQbqIJOHWrA4gDNsJjXYxWm51srKha
 dq9t23dgbZzwDImx0AdrOI5jIwLv0TCxvKNlQX2lUcyuPBDddNDIT3XTXB5Ew5+TZUG2
 XksYHt3tMgzd1D24osqkzG9T+Bce8VZDp+ShUZXcrdA7WSpwNS/LWqG1p9dAM6Oo8a0c
 /dkQ==
X-Gm-Message-State: AOJu0YyHnSFJLlHAeqk5D6Jc9+dcDEVilRgEd6hZFazvx2MZb3PSOIa6
 oe7bGRP6yX1M13Y7Rpp4m6H7K7bZssXphQZvn3D4pg==
X-Google-Smtp-Source: AGHT+IHl5iGYr50zQsATP7rny4FcWm1dNtlM44B9YC1Zv4M6FFJbKMeYg/ZCWJ6wHjNNnzdOjoEYRg==
X-Received: by 2002:adf:f5d2:0:b0:313:f463:9d40 with SMTP id
 k18-20020adff5d2000000b00313f4639d40mr6117705wrp.65.1696112258852; 
 Sat, 30 Sep 2023 15:17:38 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b00324ae863ac1sm5681274wrt.35.2023.09.30.15.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 15:17:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 00:16:30 +0200
Message-ID: <20230930221727.1458825-7-arnout@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
References: <20230930221727.1458825-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696112259; x=1696717059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXpyH7fQuOv731/mcAgdDCg8a2WfBqyLO8+J18KwDi0=;
 b=EHVV26oNKAunzFP8nHlTxYLoCHdC2dfmXzGvWIEkjC1EhpD3/DaInddMFtLGha1N21
 5ZJa2u+SimAIM047aWkSlH3Zo4gWRxEyhcL2OLQKi0TBMsbijl8EEPBc3HV0IneXZdOa
 E976CbBa9BPu36HcSfhIgtlG6171CKtz9TBhvcNpiW9l+MiDxXoQ5gp+kgip1O0/K2t6
 0K+1ITZFm282cY20MyQOy3cHM1D0G0XtKuL4vUCV+H4/Iw3xkvDbjxdG+qnc7EoqnjKm
 oQv9WL84ZeJAd5cqD9pTxrmkL1Wat+wI5tVzJ20cDFjEbesX5ZSVrp68E0MP7mV6oV/G
 qA4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EHVV26oN
Subject: [Buildroot] [PATCH 06/10] package/python-flit-core: instantiate
 _INSTALL_CMDS
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

host-python-flit-core is the only package that overrides
_BASE_INSTALL_CMD. Since we're going to remove that variable in a
follow-up patch, we no longer will be able to do that.

Since host-python-flit-core is really a special case, it makes sense to
define HOST_PYTHON_FLIT_CORE_INSTALL_CMDS in its entirety.

While we're at it, also instantiate
HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS directly there. This
variable is not used anywhere else, and it's a bit confusing to have it
in pkg-python.mk - it looks like a mistake.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-python.mk                        | 3 ---
 package/python-flit-core/python-flit-core.mk | 9 +++++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5f8ef14262..be9756acc4 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -177,9 +177,6 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
 	--scripts=$(HOST_DIR)/bin \
 	--data=$(HOST_DIR)
 
-HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
-	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-
 # Target flit packages
 PKG_PYTHON_FLIT_ENV = \
 	$(PKG_PYTHON_PEP517_ENV)
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index ea887a0258..34e58d03ca 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -13,7 +13,12 @@ PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 # Use flit built in bootstrap_install for installing host-python-flit-core.
 # This is due to host-python-installer depending on host-python-flit-core.
-#
-HOST_PYTHON_FLIT_CORE_BASE_INSTALL_CMD = -m bootstrap_install dist/* $(HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS)
+define HOST_PYTHON_FLIT_CORE_INSTALL_CMDS
+	cd $($(PKG)_BUILDDIR)/; \
+		$(HOST_PKG_PYTHON_FLIT_BOOTSTRAP_ENV) \
+		$(HOST_DIR)/bin/python3 \
+		-m bootstrap_install dist/* \
+		--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+endef
 
 $(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
