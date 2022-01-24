Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D519AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2FE410D8;
	Mon, 24 Jan 2022 11:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NO1gr5kQ16mH; Mon, 24 Jan 2022 11:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879C8410D2;
	Mon, 24 Jan 2022 11:52:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BBEE1BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8961B60DB2
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LshA2nLeRAZ5 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:52:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96E6360D73
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:52:13 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y84so2748703iof.0
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnV0b6BHz6lpu5pk5sjJuo4W6bWzzsO/CtoVEZmLfB4=;
 b=Xq2d8xgRvLJqjLqmnaOss+ET35FH7azvXc/A6RVOZrqOA6WncSKERFXR+aDUb+Z950
 Cm4sBcx6F6F5SP24VPe4ZVmBeUtxhBRIBYRPefiW1/Jo+p9TF+fBLD33CE8eaHXdZGus
 8cMFZDsRpYUaRp0YumgQfOmLQ4Arns4ip/jT2CH2vVTAcZLplqVVitrR3mfp9u7Clqcs
 nKhm6HOmrEOLMfpi2cQqc/L1DQ5i5damv8fzdNJRmXlUzyqPFPKUv5K8m/lrG0ts/o1V
 SqaVwiFAkTERRYprR29MN9bVHAfNgOsf/Rj3BrIJBrbwO56ARad7rftUm4K4XLc+uzKr
 8I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnV0b6BHz6lpu5pk5sjJuo4W6bWzzsO/CtoVEZmLfB4=;
 b=CiZhrhgVHzELsbSwDXZqrVPui1evy2JpOP0/JRV4F8NEU+oP/q8XNil0i+ZcVocJfc
 3ZXj7u5inB9CFLYn4eVXheaxa8CU8M/cIVMhzhK9BI5nMN70v/4OBWVAkdf7ngC3E5A4
 3adSRxZY9ip0IYr++35yHD2uSAZ9RH64bJwW9C81Kuok+R213B5Ae7+QZ+LAUc2v3+Y+
 0yF3/5/CBYcu8qR6Tjzbd84+C3Jj7KCDJS2hScCCqVTGfzoyfyqzJaziAX/DUujgMFe0
 elX27URV0KSqvzWiRL99F3NrU6wHwjA95FOeNZdN33VedBGHAe5aja3IWWUMu+FtwaYW
 bjZg==
X-Gm-Message-State: AOAM530xvy2dx4TGQUAZOpQ0uCwhNWVGIwA9/9KIxp70rfwjQvlaiqzk
 AEQYPF4ORtT2bbwnnLLLpI0aa5NXIUQ=
X-Google-Smtp-Source: ABdhPJwPdgIZ4KbUO1/tsLmaqpnUr82GtvvZPtoNE3qisKpU4etsGow8PhekUmRm3Dr6Ei32Y2jeLw==
X-Received: by 2002:a05:6602:2b10:: with SMTP id
 p16mr7767721iov.2.1643025132469; 
 Mon, 24 Jan 2022 03:52:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id h3sm6001448ioe.19.2022.01.24.03.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:52:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:52:10 -0700
Message-Id: <20220124115210.591345-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3-pycryptodomex: bump to
 version 3.13.0
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

License hash changed due to OCB patents expiry:
https://github.com/Legrandin/pycryptodome/commit/5d78d02220022592d79fd7789cc77af6d1859729

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 6 +++---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 7 +++----
 package/python3-pycryptodomex/python3-pycryptodomex.mk | 7 +++----
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 544468b37e..9512f185a8 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  3d007103f68f7e902167719655d2b57a  pycryptodomex-3.11.0.tar.gz
-sha256  0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d  pycryptodomex-3.11.0.tar.gz
+md5  dcf0d13044c700410bdce31a5afdf6d0  pycryptodomex-3.13.0.tar.gz
+sha256  63443230247837dd03c5d4028cae5cb2e6793a9ae110e321798bee48a04ff3e9  pycryptodomex-3.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c273fb45d120362875aafdd6189f4d7c70f6c36d4cb7ce427e0dc704753639df  LICENSE.rst
+sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index f1fda7aea2..92780327a1 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycryptodomex/python3-pycryptodomex.mk
-PYTHON_PYCRYPTODOMEX_VERSION = 3.11.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.13.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-	Public Domain (pycrypto original code), \
-	OCB patent license (OCB mode)
+	Public Domain (pycrypto original code)
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
 $(eval $(python-package))
diff --git a/package/python3-pycryptodomex/python3-pycryptodomex.mk b/package/python3-pycryptodomex/python3-pycryptodomex.mk
index ee03a08ec6..06a46cdf63 100644
--- a/package/python3-pycryptodomex/python3-pycryptodomex.mk
+++ b/package/python3-pycryptodomex/python3-pycryptodomex.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycryptodomex/python-pycryptodomex.mk
-PYTHON3_PYCRYPTODOMEX_VERSION = 3.11.0
+PYTHON3_PYCRYPTODOMEX_VERSION = 3.13.0
 PYTHON3_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON3_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78
+PYTHON3_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/7a/21/f399ba8dfd6e40eee444151af3237af22788b8b16077c75ec0419125f619
 PYTHON3_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON3_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-	Public Domain (pycrypto original code), \
-	OCB patent license (OCB mode)
+	Public Domain (pycrypto original code)
 PYTHON3_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR = python-pycryptodomex
 HOST_PYTHON3_PYCRYPTODOMEX_NEEDS_HOST_PYTHON = python3
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
