Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AFFC30658
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 465B641A5A;
	Thu, 27 Jun 2024 07:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElQFnoIs8Kpf; Thu, 27 Jun 2024 07:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B047341AA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B047341AA7;
	Thu, 27 Jun 2024 07:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36B6A1BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C96D940120
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD1EHf5U-5BM for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 500D3400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500D3400A4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 500D3400A4
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3674e1931b7so94831f8f.2
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474887; x=1720079687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4htCXGDjaNZo0GXooyAFJjRuNGgagd+q5V5O6RDEAw=;
 b=g6Zv22pxoD6MdqFF6yjbaF53+wddAGCNWqqN9dVO6G21XQ1dYZEyIQY5bx0ZYrQxlh
 /ZqLl5WEaWOgwJHTvVqafghmGCPgqVld2YiY118J64x6pjeG4sCc+g8tqqCcv0wzpJhB
 MUBH06eLkU4vIVgNxpXMo/8wO4dUVqiOaf+MUhp7EUAkcFlUC55sxk27by2tEQugVr1F
 +sGZjCvWJdQgPewvjebwbkrlJb/L7/GKniVE0eJDEm9qnvKjbHF4pSERxbFWtNbsjFlw
 JPb1k9J3SI/8Ci8vkGZHq0R82KKUoEwpByAVKG6/IuazEAw3t80MQ5vJhcLZRQZjFa2+
 XHYw==
X-Gm-Message-State: AOJu0YyAEpD147a2WsbqDe9YRL1oIblPfJYXt9kZYxXelUgwbEUQAito
 EEpLKxmIgREwPU4mcR+Oo7kwIUgcTdbpuQvYtejJ+ZdySy/vuzhSfz6D2ogyRNOtFmOqhETNgJO
 q
X-Google-Smtp-Source: AGHT+IFib2TGOnBkU9qbX4Bwt5Mu/+Pe2esEEKqQdAVA3JDU/t0OBcq7FIb8Ccb5XtCN3U56eBB8DA==
X-Received: by 2002:a5d:5745:0:b0:364:81e7:3917 with SMTP id
 ffacd0b85a97d-366e946480fmr9420502f8f.3.1719474887338; 
 Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:40 +0200
Message-ID: <20240627075441.4116645-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474887; x=1720079687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4htCXGDjaNZo0GXooyAFJjRuNGgagd+q5V5O6RDEAw=;
 b=bzgiKFFz4NRMBUMdtKhYcNHF5QVYkLnGsVy/Y5VNNZ58nS3qbfiW5C9DP+j9xeK+qk
 AtOP0++xNjIxsDnDuSJJKLw24G+eHE/KSAqVHuj/CzQr5wBLNKGfiRpIYWUYk7Z6Oc3K
 neNhdSdvHFggnQzA2OhaEGdhDwnUxbFt4/m2s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=bzgiKFFz
Subject: [Buildroot] [PATCH 5/6] package/python-tpm2-pytss: new package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-tpm2-pytss/Config.in           | 14 ++++++++++++
 .../python-tpm2-pytss/python-tpm2-pytss.hash  |  5 +++++
 .../python-tpm2-pytss/python-tpm2-pytss.mk    | 22 +++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/python-tpm2-pytss/Config.in
 create mode 100644 package/python-tpm2-pytss/python-tpm2-pytss.hash
 create mode 100644 package/python-tpm2-pytss/python-tpm2-pytss.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 91aed11860..69dd0a5fb0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2774,6 +2774,7 @@ F:	package/physfs/
 F:	package/piglit/
 F:	package/python-libevdev/
 F:	package/python-pkgconfig/
+F:	package/python-tpm2-pytss/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 20fd8a965a..a24c47a440 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1388,6 +1388,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tpm2-pytss/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
new file mode 100644
index 0000000000..60d9e8b9d3
--- /dev/null
+++ b/package/python-tpm2-pytss/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_TPM2_PYTSS
+	bool "python-tpm2-pytss"
+	depends on !BR2_STATIC_LIBS # tpm2-tss
+	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_TPM2_TSS
+	help
+	  TPM 2.0 TSS Bindings for Python.
+
+	  https://github.com/tpm2-software/tpm2-pytss
+
+comment "python-tpm2-pytss needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
new file mode 100644
index 0000000000..10a9f112b7
--- /dev/null
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
+md5  069a02c99d3203fada940c3dd43b699c  tpm2-pytss-2.2.1.tar.gz
+sha256  b8f15473422f377f59c7217dcd1479165cce62dfa33934ec976a278baf2e9efe  tpm2-pytss-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
new file mode 100644
index 0000000000..80491aac46
--- /dev/null
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-tpm2-pytss
+#
+################################################################################
+
+PYTHON_TPM2_PYTSS_VERSION = 2.2.1
+PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/13/e5/8d4a9ac91579c741ec9fb63befcf6577107f22f3508c364fd53e277d7237
+PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
+PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
+PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
+
+PYTHON_TPM2_PYTSS_DEPENDENCIES = host-pkgconf \
+	host-python-asn1crypto \
+	host-python-cffi \
+	host-python-cryptography \
+	host-python-pkgconfig \
+	host-python-pycparser \
+	tpm2-tss
+
+$(eval $(python-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
