Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB9CC7EE23
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 15:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5981280DA5;
	Tue,  2 May 2023 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5981280DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSYzFGC97QIS; Tue,  2 May 2023 15:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFFC81F23;
	Tue,  2 May 2023 15:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CFFC81F23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9D11BF41B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D9240260
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D9240260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ojfqltp-QOVp for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 15:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC81B401F1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC81B401F1
 for <buildroot@buildroot.org>; Tue,  2 May 2023 15:48:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so3820276f8f.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 08:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042489; x=1685634489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTA3yhCwc58cuEQmrvrhUoCTWEANkHRcJ7W82k+9Wqg=;
 b=MplQEdugyHbBudR5Z7mYncRiauJFsF0FYrFL8O2NEzQaIl3/sPZz8dJPgz64PZBfut
 KbA+aQu363AC27s/EhUv5/6xT74BmnDeoVbo+MbhyebKHN31Z2OT6oUFifjVGzMgl+sE
 jblUlTeqWkqxOS3mbuhw/sABcH+8MTSu+n6ha2Ar+Ax4p4kJ79TXPQhg6QSO69Kf0veO
 yT00JjDUkKsefA91PsTQ6VylvsaYWCkmXkOTWfFV/fHP/UYEXv7i+agmqo/tIkN2v+G9
 m0Qb1nmvxIV8N1bXvUQ55zqBgvt+7fpopbD5VF6/WMIE1rn6uJcod7evH6mD59ymCHaD
 qXLw==
X-Gm-Message-State: AC+VfDxyVwqj0LQlylrLZwOqeiYvCTiX6xhz7Mpl5TccNSpvqRBJiLNg
 +gFe9SDipxTSyYc59N/3h+yJ50b4ulkHcr4Sp1I=
X-Google-Smtp-Source: ACHHUZ6mcgROM2+3edP/4kPzUZYzhJ4HYWD7Vq8A71JfXpuYHIzU0Ag94qyOIzHWUtFF5rIw0rBytw==
X-Received: by 2002:adf:f305:0:b0:2f8:3225:2bc2 with SMTP id
 i5-20020adff305000000b002f832252bc2mr12042688wro.41.1683042489639; 
 Tue, 02 May 2023 08:48:09 -0700 (PDT)
Received: from lmecxl1178.lme.st.com ([80.215.39.12])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm31342990wrp.59.2023.05.02.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:48:09 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 17:47:12 +0200
Message-Id: <20230502154713.1490788-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502154713.1490788-1-etienne.carriere@linaro.org>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042489; x=1685634489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTA3yhCwc58cuEQmrvrhUoCTWEANkHRcJ7W82k+9Wqg=;
 b=dFJl3e7UgIRHJFZUYuZhvvsB1uC2mem39evc4i2GKijc1gDZlRiF8KNBZYY8saN0a/
 2b6qAjIz7koai/nHDIsd5gq7IXEihMBj5nc40zTHt5J5P7HVRXduk3GUxoww3XN49d/V
 argjezqERFakApclEL+ePJJ/qsDwwMT57hbDEvjdWbVdzc9IiX3vaKolNCvPBYMFvQx5
 255Crd8oUsxjAfdQWF0oZhVeQOQ8ckglG0e0ktHLwsduTZGyjqO7/yAloLIlJEEtj3yY
 gEknYNqdyYD0aXZy0ofkiBup3MgzIYpIteJuuQNMtjKUuerDCVX5Dz4+L4up6/EZPUL0
 aF0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=dFJl3e7U
Subject: [Buildroot] [PATCH 5/6] package/optee-examples: bump to version
 3.21.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE examples package version to OP-TEE release 3.21.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/optee-examples.hash | 4 ++--
 package/optee-examples/optee-examples.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 937dd44c8c..c61c434c60 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.19.0/optee-examples-3.19.0.tar.gz
-sha256  545f9438885220e890a4f785249a586a957b22dacc31a3cbafa4656f8e9db349  optee-examples-3.19.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.21.0/optee-examples-3.21.0.tar.gz
+sha256  9b965f829adc532b5228534d3b9b38ae1fc4f2ac55d73159a39d43e59749f3ed  optee-examples-3.21.0.tar.gz
 # Locally computed
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index bb2b208583..c182bab4cc 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.19.0
+OPTEE_EXAMPLES_VERSION = 3.21.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
