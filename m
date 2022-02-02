Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 04:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F14FB8343F;
	Wed,  2 Feb 2022 04:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4N9mswFS4hqN; Wed,  2 Feb 2022 04:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D80C83437;
	Wed,  2 Feb 2022 04:06:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74BE51BF380
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62A36400D8
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 04:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lF_GsBvI41d for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 04:06:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DD0B40019
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 04:06:22 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id x6so3501621ilg.9
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 20:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lV1Xqwmg20ttqE0UYuavmoeHrlH1mBpnzD66XlgNd8k=;
 b=ip24Tr4IweLgvG5fzX2e1iMD6M4agX58OIZ05r6Wfw4Pk9pvZjnspju7a46biQ+mKm
 T+nqMOXBc4Ckl9ElUz919NpOCSfTkHrMeOYzIUoJTB5cKJeQSYtk4UOdzBirMs2iiiyQ
 03ZKuXEIG+WWSDrB3UkPNXuo83U/PeTtvBq64129ulgWxZVbP55JPxKZ8fwCS2ObINwY
 sprlczJ60Z0ornznpESRW4w3keRT/WvpW/dKPB/1yCJQNAZhsAzMbdIRmoRJahyteX8S
 wX6cj5C4zAgdMH62zC1JZ6ZLaWselVy+zEjEMq0hOouWTdkqeDxBJkANjlLeRc0uN3nx
 Vt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lV1Xqwmg20ttqE0UYuavmoeHrlH1mBpnzD66XlgNd8k=;
 b=F4QaW4205G5LFKY76tnV3EcApyVkDlPlpx4bdSzHiL0SoEpaGg1a5+RjGG0CJ9Va9v
 7ywQVHFWSi0PqAzFL/lRQ6uadjA0RX2yXq/n5yUAb3tLNkfr/u1A4mZyupBD9xXvnWQ3
 2h3n/e7J9Lj2etB8lW33UOrrVgGX3tAefjw5ZteMtkPJjdKmvskwt+sfvuiY01sSQx2H
 nZZdevNvkFd3hQu2S7npQ8jMw5e6nuzz3deC0EO0awlXyaqKjp/TTIKPhxPVjzMcTTD7
 ZGlENnwej5qpKEuSfRDKihd1+/C4rq/awcTVeaQEUxDIdIjiqLqr/EJefm8PpXNXCzHI
 AwuA==
X-Gm-Message-State: AOAM533Yp9XGZ6tFS9C+Nlc6scxpIMeVN+YF1RdlE7ZGuxwFPqStRbIT
 3S8vhrto8oFeWZnswoRDGcvqWeC++e4=
X-Google-Smtp-Source: ABdhPJzR+iKaJjoUPqSvNtNtVKdeh7rvlzeWxlwp6b8fCbVOVlhGb1pPdma38wmchlr1UkdDSYBmOg==
X-Received: by 2002:a92:2a0a:: with SMTP id r10mr16623010ile.147.1643774781202; 
 Tue, 01 Feb 2022 20:06:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id i20sm21675583iov.46.2022.02.01.20.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 20:06:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 21:06:19 -0700
Message-Id: <20220202040619.2197495-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-pycryptodomex: bump to
 version 3.14.0
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 9512f185a8..920cec2518 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  dcf0d13044c700410bdce31a5afdf6d0  pycryptodomex-3.13.0.tar.gz
-sha256  63443230247837dd03c5d4028cae5cb2e6793a9ae110e321798bee48a04ff3e9  pycryptodomex-3.13.0.tar.gz
+md5  18f571832bbfbf0f4516ccef009f2dfb  pycryptodomex-3.14.0.tar.gz
+sha256  2d8bda8f949b79b78b293706aa7fc1e5c171c62661252bfdd5d12c70acd03282  pycryptodomex-3.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 92780327a1..7821052b43 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.13.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.14.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/a6/b3/a5e59cd3ad65d4dc470a3a63381d0495885cf1ac7659c83c6bc9e9e79df6
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index 06a46cdf63..35469df85a 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.13.0
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.14.0
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/a6/b3/a5e59cd3ad65d4dc470a3a63381d0495885cf1ac7659c83c6bc9e9e79df6
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
