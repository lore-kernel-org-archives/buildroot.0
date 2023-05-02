Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED459C77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93C6F8148D;
	Tue,  2 May 2023 15:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C6F8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1IXzvTUoUEd; Tue,  2 May 2023 15:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD52F80E66;
	Tue,  2 May 2023 15:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD52F80E66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CFEC1BF41B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB25283B22
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB25283B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZVmku6iHbxA for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 15:48:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55A983B20
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C55A983B20
 for <buildroot@buildroot.org>; Tue,  2 May 2023 15:48:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so1835938f8f.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 08:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042488; x=1685634488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6OGeh+I73nmA5itVWQktDcYfYPy4XSwbFIXW1F6xDI=;
 b=XJ3+3D9TRphKmusfoyAQXjrmQLt/sLG07/oyMIBGdHuQMOzQmOWjQH5iHwp5L/6F5S
 ozaEH86rqJymP1vbwl6z3fQRm8qZ5KMhBhP5HYCisntYIloAR+R8L/Pn5jiRYrTFnDTE
 R1PFMl9+kj17aJcfW9rMGAChU7ZBrHf3ahK6pMK2BxGbgIoXavNnEe4hBP7E59J9e7UQ
 XkVfyQtcj0XNkgYuSoLn5q/6GvTikegnk9OormkX99BK+lnCSfgvxfFmnfU9udq/Sklh
 mJQhME1+8sAg1GD5uA0tGELZWlzyHwdYWY5hxrZi4fJFsBtkfPGUhrCgFF5pmDTkpMtL
 RMlg==
X-Gm-Message-State: AC+VfDwMS5BzIPv/Ldylzgp4SMFzlmLKEyGRQw/aqJW3szxBNGkANuVG
 32pv6xahOe4YXIcAcSc7+0jALVYkj5oZw+JlFBA=
X-Google-Smtp-Source: ACHHUZ4wIe9mLhmgBX2Q4JOarPxGFh0pPzWSI9vf4AimohyeStpd+vJrxS5B3FEGT37psf2oeyXNeg==
X-Received: by 2002:a5d:456b:0:b0:2cd:bc79:5432 with SMTP id
 a11-20020a5d456b000000b002cdbc795432mr12316510wrc.25.1683042488770; 
 Tue, 02 May 2023 08:48:08 -0700 (PDT)
Received: from lmecxl1178.lme.st.com ([80.215.39.12])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm31342990wrp.59.2023.05.02.08.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:48:08 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 17:47:11 +0200
Message-Id: <20230502154713.1490788-4-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502154713.1490788-1-etienne.carriere@linaro.org>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042488; x=1685634488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6OGeh+I73nmA5itVWQktDcYfYPy4XSwbFIXW1F6xDI=;
 b=CoIrBjKshAet2s7NO5HGetc+UYnP/Jott+RJ6/wYHQVH7BmB8AmEFNFEBPBxYQTzZ7
 BHvluQ9/EwfoNd830MQ1c2QC7+Xc31QM/KJrTirlmk6DDT5d6XJ4Iju4qlQjYTvf+9nf
 KMI/Iipb0Z9+GjDyOxKPVJs3SxcuGBihqSqpZ5Gl4r0c9AWlp9Lh8xSTqz6twfnczRt4
 r2xFPDoDk9Y1E1BIFJo9uXAJmWRR25e5Pc0HDsV28CNH6TkznG94LQlRkG0cbiyWkLst
 eB+e8L/0GOSWPLT9gs9v83zmWdLG2CULhkaKl2kwbdwbgE4tksC80EZopOqB3SGqOyKU
 f+Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=CoIrBjKs
Subject: [Buildroot] [PATCH 4/6] package/optee-test: bump to version 3.21.0
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

Bumps OP-TEE test package version to OP-TEE release 3.21.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 4da3807bb5..08b3331374 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.19.0/optee-test-3.19.0.tar.gz
-sha256  9435901e9329a25ef4de3904e27d80377b8bb4dd6b215e8fb29d66a7b76afa11  optee-test-3.19.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.21.0/optee-test-3.21.0.tar.gz
+sha256  44c7dc3df48e9d73f12bbbef1cc2a4e22d859ab8a5e67a07923267f924175d65  optee-test-3.21.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 7b065b6123..d306ef8269 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.19.0
+OPTEE_TEST_VERSION = 3.21.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
