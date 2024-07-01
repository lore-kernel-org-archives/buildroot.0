Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14052C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88DD60AC4;
	Mon,  1 Jul 2024 18:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0M_81ETBuxJ; Mon,  1 Jul 2024 18:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1ADD60AC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1ADD60AC6;
	Mon,  1 Jul 2024 18:13:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF481BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2959C411A1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pfm3Hoatdlc for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B010D40433
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B010D40433
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B010D40433
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:13:44 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7f3d3f1294dso122253539f.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857623; x=1720462423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghcdmhmZqmHLN7s+7WNfPnnGttCAImpIMKqRQaZ479s=;
 b=TJbOv8MmfijssNkco/j73tsbeeut6lVeG+zzbMLaN7w9ALrs3BmwDEmhhz0EFitTlW
 YTi3jdA+vI5CzeEOk32NMpzvrydTix1U1fh2mEKqpPCJ+qMMlH2y4a935b6IjsLFqYsD
 VZ3gxm+ZsG8RWql0wLjQCTss1dVsPMUWdm+Ljxl8C3RAIATPXhHcTTDWxNiZI6XLXISz
 m6Aq6abZ1NcsA7dIK7B0aoFq9DmgIg+aIA9uZBb4zxRqDeIYcDj+hiPFK0LxKSEUs7HX
 KdLalAubZAts9nqMi8GqsU92o2djrlLfRl2523OnfRT6bQcCwtQStNs/9bc090IXo+fs
 N5lA==
X-Gm-Message-State: AOJu0YyIoTIM3QEvbpU3hMkzsEYz66f6ZFtyaOq2xPbQEF70Dl8cbHWD
 ecbnwN7BHXUFxgZx3ClPd1j4KkgBnivx8gtr1S/uFY/HJhGjeOg8AcT/pw==
X-Google-Smtp-Source: AGHT+IE1Og+za/i4KViV+HjdOf0VQhvCBtR8jZRqRrVg48UP+T0o/aKJvKynV79Ff4eldAR1yvL1tQ==
X-Received: by 2002:a05:6602:72d:b0:7f3:8ff8:e3d1 with SMTP id
 ca18e2360f4ac-7f62ee1c147mr705384139f.10.1719857623385; 
 Mon, 01 Jul 2024 11:13:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bc01b1sm2273499173.30.2024.07.01.11.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:13:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:13:38 -0600
Message-Id: <20240701181338.1737348-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719857623; x=1720462423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ghcdmhmZqmHLN7s+7WNfPnnGttCAImpIMKqRQaZ479s=;
 b=Q8bG86jFieqd2CLrKNhDFJB1zoir98r8P3GuzjH8UcIBizjaNdXhMg/jrDU1+BjSxm
 XHBCN57b2SF9hhucpNFJU5/gr3QPlVA0URW4LZ1kSIhJHPCE6mMKiZohV8oBnXQZbDf7
 Hi+YS34vkPQkFBY9SLTUGs/HC4/xhl2p1zdFJogrIdT48cZP6XGaHBMiTa/UWegRVYSY
 Yyz2oMPN5tXdSFjHvLd4ROLOeMPb6a5H6EGt9CgGYi49syVc7ayVHvv/uMIUA81hreVb
 grnJQSr8pLSV+jeo3BSv5f2NkKdP7RaENUHe45MhgTSN1K9uZ8FHs9/UELuLNUTQABqS
 PVPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8bG86jF
Subject: [Buildroot] [PATCH 1/1] package/python-annotated-types: bump to
 version 0.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-annotated-types/python-annotated-types.hash | 4 ++--
 package/python-annotated-types/python-annotated-types.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
index 1663bcb51f..fc92476eda 100644
--- a/package/python-annotated-types/python-annotated-types.hash
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-types/json
-md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
-sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
+md5  5c943b7c51b0b7dcadf46da4a99c84a1  annotated_types-0.7.0.tar.gz
+sha256  aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89  annotated_types-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index 8bc617069d..e7a3b7e64b 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
+PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
-PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
 PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
