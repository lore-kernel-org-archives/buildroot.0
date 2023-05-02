Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F274C77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 15:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226F283B20;
	Tue,  2 May 2023 15:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226F283B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0304AhfkQCs8; Tue,  2 May 2023 15:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAE983B2F;
	Tue,  2 May 2023 15:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AAE983B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69E811BF41B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F2F86145A
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F2F86145A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAa45LrlrgDe for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 15:48:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D747761455
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D747761455
 for <buildroot@buildroot.org>; Tue,  2 May 2023 15:48:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2470715f8f.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 08:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042487; x=1685634487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdGsabMo7DiQBR0N0K/J9+gQIngj4XmTtmPcavUezTY=;
 b=GdHQJ9F27edKX76IsVPxCiZPgRlz57GZcVbT4jhyYGhvSk/x+GBDJ7iDfml5AlecaQ
 ZX8d6UbJplQ84kPmqTLNKzMEkoclkTTlpslY5+k7ZnnHpxBu3f9ve8fjb+usGFMUPqR5
 aQZiJcpxvDRCUPwzWzsucg8tk6GJBfLEJh/TtHWpnCpAUWs0TGxlkw1dkAq9nC1XWDZm
 2MyvZ3lDvAMM7tBfRU9cCGlzL7QF8NV3bTMul3kmJqZm4bQEbIDIOO5Q2jqxhLmsM54o
 3HCjbaJqGtJd5/vTnKgH9aP79eQrfknBNeb085NDufW7LKmSAhwRpDTYefVU50A7Yg/C
 o6NQ==
X-Gm-Message-State: AC+VfDyckTKgGvvhw+Rs2DA41j6RQ6GNHxSAeoOxlX6XeaTLc2V0PA7h
 BiLHQ6TuvtAek8pIfHJZetR9QD9xVlhC9X0unJ0=
X-Google-Smtp-Source: ACHHUZ4i5dsOAOoygTANWUnG5/0IGTmBOJhx1D4dC/fFqLx4JIz4LVd/XN7qN6KCyLaIZCyj+PEAYg==
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id
 x4-20020adfec04000000b002f9a798602cmr12944751wrn.12.1683042486773; 
 Tue, 02 May 2023 08:48:06 -0700 (PDT)
Received: from lmecxl1178.lme.st.com ([80.215.39.12])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm31342990wrp.59.2023.05.02.08.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:48:06 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 17:47:09 +0200
Message-Id: <20230502154713.1490788-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230502154713.1490788-1-etienne.carriere@linaro.org>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042487; x=1685634487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdGsabMo7DiQBR0N0K/J9+gQIngj4XmTtmPcavUezTY=;
 b=f6aWHpqwsbB2EszsGK563P5nVCU6oN23B8eHDnf8xoSo7px7rkJiGhX5MJTnTT4AnH
 kYGmV+nL72XeGsLSOq2KN8BCuW7ktLP7QmnhwGpPevHScYeGX9EZAg3wlP9RR4YPSy0f
 CEirYrNnc0iSSTIeDAGNZ994IxhOTU/9AJHV6Am9Kv7AettjMf7gS+rdjfxJlbEzOaxs
 zQoKwdDCByedAO5Nd1AFFCpcWrs33TvTbtwq4AEejJQzfwqxToFieEsxwSEY2ulgAgrd
 oZal1HuvD4CXR2NtXSL/+Z+5igJV2o7gmJ8y0pfMoFiOk3Gd5qor5AHyZgucG7UaPczE
 N2sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=f6aWHpqw
Subject: [Buildroot] [PATCH 2/6] boot/optee-os: bump to version 3.21.0
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

Bumps OP-TEE OS package version to OP-TEE release 3.21.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 boot/optee-os/Config.in     | 4 ++--
 boot/optee-os/optee-os.hash | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index a3cb8390b4..cc2c90b5ac 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.19.0"
+	bool "3.21.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -70,7 +70,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.19.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.21.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index a87f21a9bf..cf3ee7a36e 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.19.0/optee-os-3.19.0.tar.gz
-sha256  5e0c03bbc4d106f262a6bd33333c002c3380205ae6b82334aa7b644721ff7868  optee-os-3.19.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.21.0/optee-os-3.21.0.tar.gz
+sha256  92a16e841b0bdb4bfcb1c20b6a1bd3309092203d534ed167dfdb5a5f395bf60b  optee-os-3.21.0.tar.gz
 # Locally computed
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
