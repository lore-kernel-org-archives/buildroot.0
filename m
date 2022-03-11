Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33591419C4;
	Fri, 11 Mar 2022 19:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzcGwMFNOd5v; Fri, 11 Mar 2022 19:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486E440928;
	Fri, 11 Mar 2022 19:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC57F1BF479
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B763940122
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yv76dtDvvdD5 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 19:45:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5482A40116
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 19:45:05 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id e22so11303876ioe.11
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 11:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YE5n/kHlesfOEQk/wsdqdSwKByb0KH0uXpMquTGi6M=;
 b=Ho9Ind5EF1XWeaFkVftH0NuNbD5mQWMn6fvG/Zmu/Wd/eOBLSk1TkH/cwaIc7ReL8T
 pjGDANiN1WZ5eBhP0unnJPJqteWrogNryNQMnnZUPuEhm/DUi8yq0KxG0hRG8q/lIefe
 BY1ySO5lzcYljApzrW+31oX02W5GUI9j5CZZvoTXv4afMSYRHXnaggBJmgHcHSGS3K6j
 u+2CPAEwPa86jyuhiBcifXkVu4MZKXWhbMce3CCmvzUAewY9oetJuhhwO+EwnmV2oF8E
 Y/epTheNDBcPDshdlUPJV1s4vpB9Ox8R9wySPOeLfy+ybb0ypfLNOjRtBJP6odJckzSW
 Ficg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YE5n/kHlesfOEQk/wsdqdSwKByb0KH0uXpMquTGi6M=;
 b=XX7G3wrO++iNrGij/J0j4WfdnSSOhUzsvg59KlkNLk0yY7cj8linPvra66HI3m7qSz
 bKPumLStIFD+YpWeM8uPFKcnH5NtbRe0J4WwTYbo1Pg3Dzp4731fGRQFuKTy01Ol9kGN
 iF+yBDte+NpuItKw9cAFgDGZnj9K+qcmz7cTplU/DLgOGojtTCaAWKDwamFdTz3nnsm3
 o116nxj5xqELyGb0SU7rjQ4foOsqYvn05+vJTMXZdbhvyI7LmDIeANSvncb8Zoz5stXx
 UELX0meaOPBlN+Ov44j5aXjzaYtpfZUZSsusHLEitG3T5Etg5DdYMGKoCndLeIytNT7i
 HfXg==
X-Gm-Message-State: AOAM532df8jTCC67NjcCmONcyG/QOi3Sl1RZGGb/lqMToEFPNXW3J9dw
 NtL6PNSmIFGzYSXihM6JMM2ZhJBeix4=
X-Google-Smtp-Source: ABdhPJzBY988SE9Vzp4DLwbh2XW3BeqfUpABZrqmNFMh8lJdWRVo1mIKv7OHKBqhuZOOBVYMinYKow==
X-Received: by 2002:a5e:a80a:0:b0:645:b477:bc23 with SMTP id
 c10-20020a5ea80a000000b00645b477bc23mr9093220ioa.191.1647027904161; 
 Fri, 11 Mar 2022 11:45:04 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d9647000000b00638d53cd21esm4685685ios.26.2022.03.11.11.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 11:45:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 12:44:46 -0700
Message-Id: <20220311194446.3952944-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to version
 21.3.0
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

Migrate to new flit based build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argon2-cffi/Config.in               |  8 +++-----
 package/python-argon2-cffi/python-argon2-cffi.hash |  4 ++--
 package/python-argon2-cffi/python-argon2-cffi.mk   | 14 +++-----------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/package/python-argon2-cffi/Config.in b/package/python-argon2-cffi/Config.in
index 5cddb3314e..5940d1c910 100644
--- a/package/python-argon2-cffi/Config.in
+++ b/package/python-argon2-cffi/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_ARGON2_CFFI
 	bool "python-argon2-cffi"
-	depends on BR2_USE_MMU # libargon2
-	depends on !BR2_STATIC_LIBS # libargon2
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_LIBARGON2
+	depends on BR2_USE_MMU # python-argon2-cffi-bindings -> libargon2
+	depends on !BR2_STATIC_LIBS # python-argon2-cffi-bindings -> libargon2
+	select BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS # runtime
 	help
 	  The secure Argon2 password hashing algorithm.
 
diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 6c416ffd88..09da5855a3 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
-md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
-sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
+md5  b7843e8690c790f8e743d37bb75c25a8  argon2-cffi-21.3.0.tar.gz
+sha256  d384164d944190a7dd7ef22c6aa3ff197da12962bd04b17f64d4e93d934dba5b  argon2-cffi-21.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index f01c940589..0fb3e50ff3 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 21.1.0
+PYTHON_ARGON2_CFFI_VERSION = 21.3.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
-PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/3f/18/20bb5b6bf55e55d14558b57afc3d4476349ab90e0c43e60f27a7c2187289
+PYTHON_ARGON2_CFFI_SETUP_TYPE = flit
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-PYTHON_ARGON2_CFFI_DEPENDENCIES = host-python-cffi libargon2
-PYTHON_ARGON2_CFFI_ENV = ARGON2_CFFI_USE_SYSTEM=1
-
-ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=1
-else
-PYTHON_ARGON2_CFFI_ENV += ARGON2_CFFI_USE_SSE2=0
-endif
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
