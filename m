Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F28CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C165140533;
	Sun, 22 Sep 2024 06:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMHpS_omxk5x; Sun, 22 Sep 2024 06:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A3A240360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A3A240360;
	Sun, 22 Sep 2024 06:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA121BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DD8081183
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js7GATcCdf_c for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9468581177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9468581177
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9468581177
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:00:08 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so18397655ab.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726984807; x=1727589607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvYOFwr/FALFJLIU1CxM8HWGYyRt5l1UcCMwHSwumoU=;
 b=rcoC2gwuG9m3qI9BvKHhlfEU5yILb0BPGd+7yUI9Tj297Ha5bsIQJOjSmjQTqhgLqn
 wZxUkZK0YxaXLlYBsprRPcmkgn/ARlMzbD5lpea6kR1Dzb7vmeWlewQOHVCDGV7OcHu+
 Fz+qZsmAB7DLOwlj/doAtKB8890l8cj7TMxVDp+ujGPXzQ0dHpZIwA5NmgIj1u8S2H/3
 k3N/Hv1qMlQyCCxlbhVS1sttms3n5KmGdBy+n7O4wXCa+zH64eufbeIKi0x0cHmr517U
 j8JUN0UAdxjlyWOvtaj27WsmQpYeNextX21JEdPBqJA1vYTy8IEe/pRuvykboX5F/KU8
 m0rQ==
X-Gm-Message-State: AOJu0YwNuCa9N1sELgbx3gDEcafvv0waMddQ/6Z7d2PIjFuO5G2OcrkC
 oIpf+Jd6Dt6vAs6/aiaM/ZN1crjN3Mea6Wx/CU128ybO/eBpEGioAz9gbA==
X-Google-Smtp-Source: AGHT+IHWMzf1aSGYrpMI5Kv/pV+6Ek7GvRNrlJMQ7GsynzhisJW1kqFU3bD3vVyQC//A9v3uJH9SkA==
X-Received: by 2002:a05:6e02:1748:b0:39a:eb57:dc7 with SMTP id
 e9e14a558f8ab-3a0c8c6a2f2mr75885125ab.1.1726984807311; 
 Sat, 21 Sep 2024 23:00:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d3e2347b74sm927634173.53.2024.09.21.23.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:00:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:00:05 -0600
Message-Id: <20240922060005.954461-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726984807; x=1727589607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvYOFwr/FALFJLIU1CxM8HWGYyRt5l1UcCMwHSwumoU=;
 b=gV0J3yv9MD8a8k+4J+cQGO1cVdTNp8LS0JWylKnAnsDR5alifJRxQgcpexHq6yAmkO
 AQQ59S/O0U4m0HVDCVilajxFMlTwEE2lwS1GA26XUWRY/A6Np6CF58Zl5kyi6zdi0u8Z
 hp7MLQdHFIXy9DmbTGLpGGp51QpHpDl+z9+DbxN2uquKmFcRXypbm4X3UPYZdmrXpch9
 MUNLFNqpqj8A7IQUk+7aBmbFN9+rKjc914QpFmaOCqicj1VfaSrMSER3OakBoC9GNDRM
 6vbocB+gmtQdtGGh6YSWCjT8FT2E1PpNq47QC/PAHGMCwebiFXxgjzsCRRnZphdJUy8S
 tycA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gV0J3yv9
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.2.3
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

Add new python-hatch-vcs build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index c6ff8bd249..7f4a7505a9 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  efb79cfdef7b811687afe02ccaf67433  urllib3-2.2.2.tar.gz
-sha256  dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168  urllib3-2.2.2.tar.gz
+md5  d65de4f0effae2b52669246f0aab0a91  urllib3-2.2.3.tar.gz
+sha256  e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9  urllib3-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 55e2856545..dfbcbc608c 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.2.2
+PYTHON_URLLIB3_VERSION = 2.2.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = pep517
-PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
-HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling
+PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+HOST_PYTHON_URLLIB3_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
