Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35873C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A5E6113F;
	Tue,  6 Feb 2024 16:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A5E6113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUaHfc-jhXyZ; Tue,  6 Feb 2024 16:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0E4E6126F;
	Tue,  6 Feb 2024 16:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E4E6126F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C63641BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E263408BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E263408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYNMSo-piult for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:17:19 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54B3E40189
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54B3E40189
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7c3e4290f5fso77861839f.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 08:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707236238; x=1707841038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q6QjzTc1ziliYTZS0VYMbKl/PF3S7A2O/ny7nc6wMpE=;
 b=LWxFPyPctoO8mPcvl62KOaIX3e9ApAEQ/xSoIU/8H1WV7dwbQ2b6L2UIKzipsp1oH6
 PurmobxiJ67EE3SBDntllMJJCP4a/YQ8IC3cBH1IYg85Mqgk/RJ1PX+dIPlcoZEGc3B/
 TDc8a6laYeqBeEw5Kn4q/psNkvUFQyYmctyF3ET/VYFaEa2TrLGY9anZemz1VkIfqpfY
 GfMCPH7auCiFZv75pOc90Ljirk1QQAg235bA7IbawIK5MUJgqu1lPmardKTdGLQBVv1k
 sEyFHL95+YqkITBXuvZFMZBQDbiTL/h4OdgNci3qbcD7YZnH7j3JoCN8gtOCNOXBqP8C
 ti1w==
X-Gm-Message-State: AOJu0YyTsjzmma5zQwc7gV8AoJy2O2a2U2uCJf/l8f7sbviVFQMbseTA
 3iQg6bPAK6fm1xG90zIXGcCZImiZey8ThlP3NC6C3TsyfiibCHxFqrdLMSPx9rk=
X-Google-Smtp-Source: AGHT+IGwAWI63sH+F6b9hnQOKJWUVSQJBKawxYcMYyEVb99ZJzJgHizMqXwHYgu9P45Wrgab/Uj1jQ==
X-Received: by 2002:a6b:db15:0:b0:7c0:2b8f:6461 with SMTP id
 t21-20020a6bdb15000000b007c02b8f6461mr2972665ioc.18.1707236237787; 
 Tue, 06 Feb 2024 08:17:17 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUbQ73G3Tka+/ejJp7i8cSZtpLAjyuqyYIMAbxru4Y9+/UHF0257aEdqmJrsPDe/PdT3yYjhyKrJWD9471ww+znex+nUHGe3C3Xku2mfYBQADh5A/wqEMge/uSZeZ5xNl0EVjZc1Y9EqL+5Dx8xk+XwkyZXT7qnFVo=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 k24-20020a02a718000000b004712f04ce5asm575349jam.100.2024.02.06.08.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 08:17:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 09:17:15 -0700
Message-Id: <20240206161715.550268-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707236238; x=1707841038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6QjzTc1ziliYTZS0VYMbKl/PF3S7A2O/ny7nc6wMpE=;
 b=hkzgg8zx2zzgOEfmCyYAu8ClTpCnEevJODHPrDfAa4s0G23J6XYKiYtMkqqV4HdFy8
 YGkx52Pn/jFgLxLVCQOo1zORqs+4MNHJQktaNf4DOKz78CtTret02AdnNN7DttBSM5m4
 rwMQTMjvZu4RYM0n4GTE+bx4fqbLjQdcjbSB8UqgyIxUyOLGUVLDDlhu72XbIqZF9jJI
 TlzYuAh0qWFAJHRHY2BkESnmytzSrkflw5QcLMPP1sb6cBn1lNsX41Lqrcrv3EqRG8cE
 idMCdSEIRJZ0Eqv0qkn/uuRDRsdqrl27DNA3yJr2BwfScqUDChf/z/ElBVMiq776tvFM
 ASaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hkzgg8zx
Subject: [Buildroot] [PATCH v2 1/1] package/python-ml-dtypes: bump to
 version 0.3.2
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from distutils which is being deprecated to setuptools.

Drop python-pybind which is no longer required:
https://github.com/jax-ml/ml_dtypes/blob/v0.3.2/CHANGELOG.md#032---2024-01-03

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - drop pybind
---
 package/python-ml-dtypes/Config.in             | 1 -
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 9 ++++-----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 72506896df..8791564b19 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
 	select BR2_PACKAGE_PYTHON_NUMPY
-	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  ml_dtypes is a stand-alone implementation of several NumPy
 	  dtype extensions used in machine learning libraries.
diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index a440268e39..53bfacb528 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  6adbb05530819bdb4a78d2372d187fe2  ml_dtypes-0.3.1.tar.gz
-sha256  60778f99194b4c4f36ba42da200b35ef851ce4d4af698aaf70f5b91fe70fc611  ml_dtypes-0.3.1.tar.gz
+md5  438c04dc0d941ec1b3b71667225c74c8  ml_dtypes-0.3.2.tar.gz
+sha256  533059bc5f1764fac071ef54598db358c167c51a718f68f5bb55e3dee79d2967  ml_dtypes-0.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 92d23bece4..676137ecf1 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.3.1
+PYTHON_ML_DTYPES_VERSION = 0.3.2
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/16/6e/9a7a51ee1ca24b8e92109128260c5aec8340c8fe5572e9ceecddae559abe
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/39/7d/8d85fcba868758b3a546e6914e727abd8f29ea6918079f816975c9eecd63
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
-PYTHON_ML_DTYPES_SETUP_TYPE = distutils
+PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
 
 PYTHON_ML_DTYPES_DEPENDENCIES = \
 	host-python-numpy \
-	python-numpy \
-	python-pybind
+	python-numpy
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
