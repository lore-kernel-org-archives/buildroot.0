Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0083FCAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 22:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F6881D3A;
	Tue, 17 Sep 2024 22:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsteaOvoQfk9; Tue, 17 Sep 2024 22:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF22D81DEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF22D81DEA;
	Tue, 17 Sep 2024 22:23:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8F521BF316
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7B4381DEA
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRhdCohD-TL7 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 22:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B507981D3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B507981D3A
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B507981D3A
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 22:23:25 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so218142639f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 15:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726611804; x=1727216604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3YDXaKkEV4wvHId0qVvmJPJFKLejLrB56iWtCprovQg=;
 b=IxEbSzrcvrL9VELon27t4OJPM0PtI8JKNA/4XmxbHkPcaC9OMTbRJG+YsScXj3k6iS
 gN7/pe046AF3ZsT8fMY/069Re7/Al2g5Gj/e9T0xxBFXs94mPmtajt7wQHvF40B2xVXr
 kl88XXLzV9bptHBTGTU/gsoaahfQbF/emHCuByszTfvDep872hM2S+JH9GWVOWoMvS7d
 oyFgUE4WhyGnDNPWYdsFbSDfkN0RRzFQVWHYSMxQ68x8+P4pwo8U9/IWQNNFNPDjQSU+
 tvWNjTX4GKhuz6hezfZYWz2hQqzqkXHmDPHHQrPEBYtFEnx+01mWn3haHF+s3c9h5KLK
 6wiQ==
X-Gm-Message-State: AOJu0YxMMEoNaCf26TGcgEMGLSbGrqMIKg3xszh9xet3Y2cGcYIzq1zS
 khoYoK6TB2XsRQRc0pK4gDsZ4Y7ssAfU39ShQmKjim0UQQNMa9nU4Vri3w==
X-Google-Smtp-Source: AGHT+IGGJMbjY0tWMPy+JLqr1Q73+/StXD8sSnntnBI2TUgMfX6Uw/YIldJhb6k6EV44YN//flyiVg==
X-Received: by 2002:a05:6602:158c:b0:81f:8f5d:6e19 with SMTP id
 ca18e2360f4ac-82d1f8b4d44mr1935950939f.2.1726611804369; 
 Tue, 17 Sep 2024 15:23:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b920csm228316239f.29.2024.09.17.15.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 15:23:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 16:23:22 -0600
Message-Id: <20240917222322.113560-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726611804; x=1727216604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3YDXaKkEV4wvHId0qVvmJPJFKLejLrB56iWtCprovQg=;
 b=kuV1CadRSNOAJxMND3OgYUfL6t0zQ0uwMaJaWfW7S6N/tLvx7wgO79XYQ8fB6lXzm8
 8DK+rdveToJTQQHPDiEotfzMgIR3s2MCIGyw+ZgkRRxzafTu7/8l7ReSsMrnJ+En3+V4
 HSJcSyh3FvRCx8Q7RSssBqiOm04Gk9sLBbktfSAprRghclkccrYBsO592ffdm+/+BqJt
 oLrg18nHZan+tw6O7fCbQQ1oDgEa+oLkKLjSEBHAM+D0AQ5n7p+d+Lz/L5VBu+cAEh+Y
 TPdV5IgP8K0mwWsdjMdVBL3WvAMxJDztsBqU6JZ65ge0JdmL9Tx0vqS3Qyq89yQOjWJI
 9VTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kuV1CadR
Subject: [Buildroot] [PATCH 1/1] package/python-pylibfdt: bump to version
 1.7.1
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

We need to pass the --skip-dependency-check build option as we do
not provide the swig dependency as a python package but rather
as a normal installed package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 8 ++++----
 package/python-pylibfdt/python-pylibfdt.mk   | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 82527e727e..38a07742b6 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
-# md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
-md5  353ee3063d0b10e94d165e032897d34e  pylibfdt-1.7.0.post1.tar.gz
-sha256  2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1  pylibfdt-1.7.0.post1.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/pylibfdt/json
+md5  8b137ca636ab30a8fa10c35c419bf3ec  pylibfdt-1.7.1.tar.gz
+sha256  254224035abd85d1409bfa59967ed249103e7bcf0d3a638aea64454e2f776e97  pylibfdt-1.7.1.tar.gz
+# Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 9591439b01..494d030288 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.0.post1
+PYTHON_PYLIBFDT_VERSION = 1.7.1
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/96/5c/77ef0f0459e0b13f39ecc22e21ad4ac9fbe741e8a7cd70702ac8165f80e2
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/1f/99/26fa7008cc0020da5c6407c48b34de21b3613232bd8875814016aec3ead5
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
 PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+PYTHON_PYLIBFDT_BUILD_OPTS = --skip-dependency-check
 HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+HOST_PYTHON_PYLIBFDT_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
