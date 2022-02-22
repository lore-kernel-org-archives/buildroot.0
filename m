Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD494C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5529D81A64;
	Tue, 22 Feb 2022 10:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-nvC55yOV8g; Tue, 22 Feb 2022 10:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B50E81A4E;
	Tue, 22 Feb 2022 10:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8D31BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76AB440185
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf1m0p0uJqzW for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0655440137
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:55:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r13so18589327ejd.5
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoPSCcV60xywJWt8pFasej9DNpxQGzFoF/e/iSOZb48=;
 b=cdQrzGbjNr9mqBgzMwpayUVxYAzKDypqUhxKGrh2yS5THm+wbNoyys45PsxEVQ/q5d
 OloSKqU2IOWFK3W1mAG4DyQv2e9hJa4Uio2/hS1FHk1dePnA3dMLxCEaXNvXJ6BS1bwo
 LDP6Xdl6wJHNVhuzw4hy7hf4wc2EwOky+/F6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uoPSCcV60xywJWt8pFasej9DNpxQGzFoF/e/iSOZb48=;
 b=l+mxZWu8XnQ7eNQmWhZT4WeO03xfIhD9dYRyuS4QMHR07AG0aB+ZBENV2HU6ipoMhz
 bda5ZVi08c8dwaC9FqWolTLWw33nRoc/XQ+KwluGSH38lePWJAuT32biO2QgCPDFziSZ
 KGo3O2mUPA7tqx5j1x8j/Wiwhy9Q+t9nMheKyf72dp2PAxu+eTBbx5r4k0a5hm6K2mo4
 TSSF16m6ScqDE6zQ0yexOhKMFIsVq3QBctavNXfWY2QAv4CxxaZOaBR6BwcxC6+DC7Og
 7nZYA1JukkoHId0HM8FA3mpRjNAQV9kYhzf/A4lzMlkA2AESqLkvX8uV62wkarwt8Wj2
 GM7A==
X-Gm-Message-State: AOAM530fVKaPIqbaUSSswWLFn74j3rBHw9MqFUI5WZrEXaj22po0hp+q
 AyFWBFtN/AunKR3kU3YpuzAyvFrCIVx7Aw==
X-Google-Smtp-Source: ABdhPJxMhzPngm3mbIU1awIC8GJGFrUDCeZFjbHGU6uj0xKw5JF57glSPdlvYA7KKRinm04ym4++Nw==
X-Received: by 2002:a17:906:2486:b0:6cf:ced9:e4cc with SMTP id
 e6-20020a170906248600b006cfced9e4ccmr18369942ejb.201.1645527334153; 
 Tue, 22 Feb 2022 02:55:34 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id bo11sm6095327ejb.24.2022.02.22.02.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:55:33 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:55:31 +0100
Message-Id: <20220222105531.2498422-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender: bump to version 3.2.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Main LICENSE file hash is changed due to a copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/mender.hash | 15 ++++++++-------
 package/mender/mender.mk   |  7 ++++---
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 40d82f072f..3a7a675341 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,12 +1,12 @@
 # Locally computed:
-sha256  716ba7110dd68cdafc5caa989706ff67bbac0617c284d666aa81605850be5763  3.1.0.tar.gz
+sha256  8dd04f963f1816350c5406312969f5b11d45c772274a8c32f7a9da8b2cc36561  3.2.1.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
-sha256  32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
@@ -14,26 +14,27 @@ sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor
 # BSD 2 Clause license.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 sha256  e4646a82a976369d7ae8f6ed5c11d35dc0af18433a8ccc24c85b459ad8b95128  vendor/github.com/godbus/dbus/LICENSE
+sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
 #
 # BSD 3 Clause license.
-sha256  16f848582e4b276a7392cd34496b7a33d6f65c0e190c163ff3a056a7c61219ce  vendor/github.com/klauspost/compress/LICENSE
+sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
 sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
 sha256  0634b008cee55ca01f0888d2f5aba2d34e66c3f52c31a4e16a5d5d33d0c2a03e  vendor/github.com/bmatsuo/lmdb-go/LICENSE.md
 sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/term/LICENSE
 #
 # ISC license.
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
 #
 # MIT license.
 sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685  vendor/github.com/klauspost/pgzip/LICENSE
+sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
 sha256  ffa15bdce332058a03a1d923910864fb6e58bf6df66a0e3914284725b327183e  vendor/github.com/ungerik/go-sysfs/LICENSE
 sha256  da277af11b85227490377fbcac6afccc68be560c4fff36ac05ca62de55345fd7  vendor/github.com/urfave/cli/v2/LICENSE
 sha256  b2663894033a05fd80261176cd8da1d72546e25842d5c1abcc852ca23b6b61b0  vendor/github.com/stretchr/objx/LICENSE
-sha256  95b8ef9c4137a8f75ddd3101ffdc4cfd594fa875b261697b68baddc16b0e537c  vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE
 sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
 #
@@ -41,4 +42,4 @@ sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  4f3541ea69b9b6e3959679576c146b42ba9a840a9dc4e593bff43e5e3a313d24  LIC_FILES_CHKSUM.sha256
+sha256  e6d8321e71be932e08b8923fe9e24e06a95c7e74a6b86e6f73696436ae0ea54f  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ddf3e43be2..33b4611a5f 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.1.0
+MENDER_VERSION = 3.2.1
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
@@ -20,20 +20,21 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/mendersoftware/progressbar/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/godbus/dbus/LICENSE \
+	vendor/github.com/gorilla/websocket/LICENSE \
 	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
-	vendor/golang.org/x/crypto/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
+	vendor/golang.org/x/term/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/klauspost/pgzip/LICENSE \
+	vendor/github.com/klauspost/cpuid/v2/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
 	vendor/github.com/urfave/cli/v2/LICENSE \
 	vendor/github.com/stretchr/objx/LICENSE \
-	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
 	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
