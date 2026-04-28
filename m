Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0A1FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589C7610D2;
	Tue, 28 Apr 2026 17:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXfiTH1QUVQs; Tue, 28 Apr 2026 17:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DABC610B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777397285;
	bh=jzHMJvXM9OT+CzTZST3aJsAyc84FGa3RHxjWc/Xxfow=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YBzSAYnV3HcI2lDTISuVhUk4Wx/jJlb4WRmrHzYPQdPaGEPH0596vMHWG3/O3/X1U
	 ba+qOETat6FQk+Qpf90pvsKqD+h30neW5C+r0aysKn+qeRQWdeG3XopID1S28NBRdq
	 uh6jjCpCKDW0butSSrkBEufSmwgi1uOE+29lrKTZKS4g7RX5K+pJt0uq/WSvfQ8bYb
	 2yegLpXm/0iLqUvoc0mUy65Q2+dsGhXKD3cvn+rGecAda3XmXYJ5KREmduZzGfz4uH
	 oT9oJhOmipZvZWHqoqyO3KC0OmHRk+ilSi5Y8kR8S27FQR4k62t96dLLjBaWMAoS/S
	 1RrlU3pt809xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DABC610B5;
	Tue, 28 Apr 2026 17:28:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B227231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F111A83C50
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nt1lUx_loHBj for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA5AB83C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5AB83C4F
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA5AB83C4F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:28:02 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-8acb09ddbf6so166969076d6.2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777397281; x=1778002081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h60AJIPCvDV2nG6YAvwQBV9KnBmrroPTpmIzcG/Ur/k=;
 b=iCSRsQeOAjkTEFit6CaMuvkLwZ8inQL/gJiMj1iwLtCF52mU+rNUdEXuQq3AtyDqQC
 +LR8dfn8tZfCLaTJiUjRwoL7ADf1+H/ovtHHEmkC7kZkhKXBDaREmzSW4/r3cqHNPuRA
 SWYxW5EUDjv0RFBy3LFpYmhnzqfqsrZnFkoTwY4zYHDaOFivzKUVgy81XwhOp1BY/YO4
 /HX9bNSFecTgktqD71rpsXOcmnGQ5rRUYG/EMmrm8hK1TGRKaPULoCVOKwuvguDUacWx
 BUUHDP6tJOH76YfPKg38AGWAP1lZwmyz3EX+oCPDv63yyU9D0bA5bVmQMw+TinKhjO3/
 EYNg==
X-Gm-Message-State: AOJu0YzQ0IKtmRAkbWkT+Qj75RWwFBxdfa/cEjCEt2PVXUkKhI/S3V0b
 mjbVEbpD6tmLor9qohLAiTufOiJoFYGz0CXD07pvTUJUfEwVo9V4xf+FVMOiin6r/M2Ajrl4
X-Gm-Gg: AeBDieshFbRd2wXkERuOvYzlUZq3LEJ09JDRzw3sTQ3JX/QxRwi7FjPuhBlrkyTsMT4
 0H10OHUxejraZeZDaCU4SqXtBm708AwUG5yZp+M6JFX+Hc8UD9QowxJRm+iZELd6Ow/yrcBbTgl
 TE6bIunerZWE8m6JDwI1E6zoLXkzPOLzhp7wrF+b1qSsyNYmslcFyxLFJi9wWDAxQfis9KXJOV2
 3ETFWVe8njixDw8rxyCdThO5cOjz8ASwQKWoRp6yf/rB+DAx69cdjVefhlqMZzkAsRjaRl4T1+c
 PZs/VlJF7RFEsl20C0qAqKFdqfFiOVFzXEGTQGA583iDM7giGqdPuqCSspvAYphSGwPCovlLJ56
 lOrv+v4Xi2PvuLaS/k2avtsEyifgdmpEmA/oki2sEUSkKzArhyrPMuy9YpmAFLRO76Pd64dcHEV
 8c6zzw32l/+EolsRd3MaV+6wwJgk1PLp4vuUh3/aj8nN5gnPU/UQNBd6yxoAU+38W9i1qiefJgO
 s2PAoOl3bw3ZWyGVXKZ
X-Received: by 2002:a05:6214:21cc:b0:8ac:bb05:ddce with SMTP id
 6a1803df08f44-8b3e3061d57mr66771986d6.32.1777397281547; 
 Tue, 28 Apr 2026 10:28:01 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e2979241sm24997216d6.39.2026.04.28.10.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:28:01 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:27:55 -0400
Message-ID: <20260428172755.2865-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777397281; x=1778002081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h60AJIPCvDV2nG6YAvwQBV9KnBmrroPTpmIzcG/Ur/k=;
 b=LVX75zHYDgMdxMFxTLUrL6d01NVKympWiBSZPxpCFV0/CKUEWK0GRJWD+a066ujew7
 g60rGPWHvwdzLxirPCKbq0uy6PFw6mNWAI+mEYc6JzYLs5/NMQyiskXFEIdCmy2q6XKt
 aGTD056fX6cs7nJfNOAMHcgtLzlVDmsTeq+zWxOf1HGodsA4g/LmbFJcsxGt7oKCBHtc
 oVUXwlqiLUrRXMdHbvGEmMUDGov0ar/kkIB3jpHqVgXznGZuJ0P+igU6hHbZMXyb64ba
 +QskPJ1BX9gNI6mmh6oxJJWdeCY39kwrPaoSa+ZaOoc90zSZEDj2mDiBuxPDLA1kqoKa
 g2Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LVX75zHY
Subject: [Buildroot] [PATCH 13/13] package/python-azure-storage-blob: new
 package (12.28.0)
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
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/python-azure-storage-blob/Config.in        | 10 ++++++++++
 .../python-azure-storage-blob.hash                 |  3 +++
 .../python-azure-storage-blob.mk                   | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/python-azure-storage-blob/Config.in
 create mode 100644 package/python-azure-storage-blob/python-azure-storage-blob.hash
 create mode 100644 package/python-azure-storage-blob/python-azure-storage-blob.mk

diff --git a/package/python-azure-storage-blob/Config.in b/package/python-azure-storage-blob/Config.in
new file mode 100644
index 0000000000..660b8c2b92
--- /dev/null
+++ b/package/python-azure-storage-blob/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_AZURE_STORAGE_BLOB
+    bool "python-azure-storage-blob"
+    select BR2_PACKAGE_PYTHON_AZURE_CORE
+    select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+    select BR2_PACKAGE_PYTHON_ISODATE
+    select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS
+    help
+      Python library for Azure Blob Storage.
+
+      https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-blob
\ No newline at end of file
diff --git a/package/python-azure-storage-blob/python-azure-storage-blob.hash b/package/python-azure-storage-blob/python-azure-storage-blob.hash
new file mode 100644
index 0000000000..5acc53afea
--- /dev/null
+++ b/package/python-azure-storage-blob/python-azure-storage-blob.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/azure-storage-blob/json
+sha256  e7d98ea108258d29aa0efbfd591b2e2075fa1722a2fae8699f0b3c9de11eff41  azure_storage_blob-12.28.0.tar.gz
+sha256  fd532481d828e13a0b13ccb598e02338a3617740675a862ee6bdc1541b68e93d  LICENSE
\ No newline at end of file
diff --git a/package/python-azure-storage-blob/python-azure-storage-blob.mk b/package/python-azure-storage-blob/python-azure-storage-blob.mk
new file mode 100644
index 0000000000..3b6424261a
--- /dev/null
+++ b/package/python-azure-storage-blob/python-azure-storage-blob.mk
@@ -0,0 +1,14 @@
+PYTHON_AZURE_STORAGE_BLOB_VERSION = 12.28.0
+PYTHON_AZURE_STORAGE_BLOB_SOURCE = azure_storage_blob-$(PYTHON_AZURE_STORAGE_BLOB_VERSION).tar.gz
+PYTHON_AZURE_STORAGE_BLOB_SITE = https://files.pythonhosted.org/packages/71/24/072ba8e27b0e2d8fec401e9969b429d4f5fc4c8d4f0f05f4661e11f7234a
+PYTHON_AZURE_STORAGE_BLOB_SETUP_TYPE = setuptools
+PYTHON_AZURE_STORAGE_BLOB_LICENSE = MIT
+PYTHON_AZURE_STORAGE_BLOB_LICENSE_FILES = LICENSE
+
+PYTHON_AZURE_STORAGE_BLOB_DEPENDENCIES = \
+    python-azure-core \
+    python-cryptography \
+    python-isodate \
+    python-typing-extensions
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
