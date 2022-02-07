Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CB3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 19:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3729640191;
	Mon,  7 Feb 2022 19:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gz_kx8qTMFZx; Mon,  7 Feb 2022 19:03:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC4140168;
	Mon,  7 Feb 2022 19:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 866A01BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F20A4032A
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 19:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSBEYrx27HoO for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 19:02:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 336544010F
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 19:02:48 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 y15-20020a17090a474f00b001b88562650aso439593pjg.0
 for <buildroot@buildroot.org>; Mon, 07 Feb 2022 11:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFgsziqxJftPXrb7fPca+w3QEUsB+Di19iW1SeNuNKw=;
 b=fAEZP4Yux+CidBZXaB+1evXN8rJ0fBjRnorBeyvZBNoZrn7mvRL5VzzsUKDBzU/JG4
 7NpNH18hX+mu/2iyyU2NwPMvIgE/EAeRc3mLJi18G2lGbeM1mfMUZwuLV7jt2NMuJPZF
 8qKUQfXx3rRQVsjSowcEWvnNm9rRbVc90J+AQmEk/w6ZRTxW6jN4p7ZtoY6Sf+D/RcNB
 4RNAQgnixNjD5HeFofq5dljYs2HmfPpq7+ao5JF8iGw4Z6uvf6px5N5SoTI+Me9dBc7Y
 xqwiSSf7bWZI/xSk4yM+cs6capb3MSsMR/4gweufZnI84IH8cVstbdGFc9f6riATZVpo
 FDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFgsziqxJftPXrb7fPca+w3QEUsB+Di19iW1SeNuNKw=;
 b=hPgYoBbbOqO3GQIoe7QPvRT/mkjDbv5ndEmx+2v6DcnDOs+743Edt+R0S+IXVKMjgm
 vbwyMaIsD51hWMDORTzvQNtO0w0BPTOeL7MMoYxtmnhRyDYhKyCtKnzSspL/HhOcxT45
 D2KlcWBnvelftIkjcXbUmL5AERM8U05hdlxxQrNgqqyICGuCn/z7afmSZwN46goNY7Ic
 jAQ4k25KEBQX5mveXpqn/tPKTF4VgczBt+JM9gnrnZs6J97MYM6au0A+MECbrnS8IAAO
 Vmjkv0/oA07PThWEA3WsqzLUoVs5EuZ2Q/a18321Z08Y30oB+0AHCd+OW25ctpXDVYS1
 TIjw==
X-Gm-Message-State: AOAM532MtVpeLAk+WSoCIhih/C6Iaqcpn2qO6N1s1kq4FIkSGxj3iB5x
 cjZo6Cc7u5OnB1NrQq5U7z129AkfEyM=
X-Google-Smtp-Source: ABdhPJzIG78MoAFqOCAk2+CqBxmhLEcyYMSy0FZHpHusq4XlkCdAp1FY0b2+s3xKRbUzZxB51SLUKg==
X-Received: by 2002:a17:903:1c6:: with SMTP id e6mr885309plh.12.1644260567198; 
 Mon, 07 Feb 2022 11:02:47 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id pf4sm102682pjb.35.2022.02.07.11.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 11:02:46 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Feb 2022 11:02:38 -0800
Message-Id: <20220207190238.73906-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207190238.73906-1-aduskett@gmail.com>
References: <20220207190238.73906-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/mender-artifact: bump to version
 3.7.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Other changes:
  - Updated license hashes due to year changes, removals, and additions.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.hash | 27 ++++++++++++++++----
 package/mender-artifact/mender-artifact.mk   | 22 +++++++++++++---
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 27f18862bc..3018a349b4 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  c46c305616cf53e65b786862addf04d97c388e451f11478886967b494c4ce5d9  mender-artifact-3.6.1.tar.gz
-sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FILES_CHKSUM.sha256
+sha256  42898957ae015ea36ecf068e293df12572c09c1d4f0a8a615c106ae9aed5695d  mender-artifact-3.7.0.tar.gz
+sha256  31e34a6aeee65e7d45e243e86ac16de5530679f76041df362a7e86c90a54ad90  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -11,6 +11,14 @@ sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FI
 sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/genproto/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/grpc/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/appengine/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/kms/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/LICENSE
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  vendor/go.opencensus.io/LICENSE
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/golang/groupcache/LICENSE
+
 #
 # BSD 2 Clause licenses.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -18,10 +26,18 @@ sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor
 # BSD 3 Clause licenses.
 sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
-sha256  a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
-sha256  16f848582e4b276a7392cd34496b7a33d6f65c0e190c163ff3a056a7c61219ce  vendor/github.com/klauspost/compress/LICENSE
+sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
 sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
+sha256  17b5d209ba8f9684257ecfcff87df6ceda6194143a8fbd074f29727cff6f0c40  vendor/github.com/google/go-cmp/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/oauth2/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/text/LICENSE
+sha256  110244b02140866ee37d17fa7449436a377ec3b85a481fbb208f4c87964382de  vendor/google.golang.org/api/LICENSE
+sha256  fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d04658ed2ba9  vendor/google.golang.org/api/internal/third_party/uritemplates/LICENSE
+sha256  4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20  vendor/google.golang.org/protobuf/LICENSE
+sha256  8778a9fc1eaffb03ab873caae251df2d224f6b5502be8777d3cd573a4dd43903  vendor/github.com/golang/protobuf/LICENSE
+sha256  b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor/github.com/googleapis/gax-go/v2/LICENSE
 #
 # ISC licenses.
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
@@ -35,3 +51,4 @@ sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor
 sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
+sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 34d0cd9469..68bbad9a4d 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.6.1
+HOST_MENDER_ARTIFACT_VERSION = 3.7.0
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -12,13 +12,28 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/minio/sha256-simd/LICENSE \
 	vendor/github.com/mendersoftware/progressbar/LICENSE \
+	vendor/google.golang.org/genproto/LICENSE \
+	vendor/google.golang.org/grpc/LICENSE \
+	vendor/google.golang.org/appengine/LICENSE \
+	vendor/cloud.google.com/go/kms/LICENSE \
+	vendor/cloud.google.com/go/LICENSE \
+	vendor/go.opencensus.io/LICENSE \
+	vendor/github.com/golang/groupcache/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
-	vendor/golang.org/x/crypto/LICENSE \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
+	vendor/github.com/google/go-cmp/LICENSE \
+	vendor/golang.org/x/net/LICENSE \
+	vendor/golang.org/x/oauth2/LICENSE \
+	vendor/golang.org/x/text/LICENSE \
+	vendor/google.golang.org/api/LICENSE \
+	vendor/google.golang.org/api/internal/third_party/uritemplates/LICENSE \
+	vendor/google.golang.org/protobuf/LICENSE \
+	vendor/github.com/golang/protobuf/LICENSE \
+	vendor/github.com/googleapis/gax-go/v2/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
@@ -27,7 +42,8 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
 	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
-	vendor/github.com/mattn/go-isatty/LICENSE
+	vendor/github.com/mattn/go-isatty/LICENSE \
+	vendor/github.com/klauspost/cpuid/v2/LICENSE
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
