Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A95C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 776DE40576;
	Mon, 24 Jan 2022 11:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBlmeo2cLOFF; Mon, 24 Jan 2022 11:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63DCB40475;
	Mon, 24 Jan 2022 11:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45E531BF3A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337CF40977
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-aErqBxbs2H for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3DD540935
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:00:16 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id u6so4866076iln.3
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uxr2NpbFLLWHT3eSGGYmBvIw5Q5r2kwNtsTt2Z3/R1s=;
 b=RW/7hlRjxovT4nsRl78dr+qel8FqaX3GekXXMSKn0hnOVtSw+HDKSsCMiaN+KklhFx
 J/ztaiy92uk5GPDr6u2MOvynyW/tCIREBsLjaw9hBfaD9hScUqCJXMm6tb6lHtZO532r
 r5aAMg5ICRTDSgT11Vqy5s20ZA60q3lp2KczWm9HElGVQJ6kGiOkgLU8gfpv/voven/I
 9Bm7TNeK99T/NhPbFIo2dn4NyflEA5P6vtym2Tkr7AiUke2HVqrOn8EX7Ws5MKyUufIm
 pvlXJV9ExIKNgBwuHKAhwcXPtZeoSbXJIvi+PN2uhL49LIQAbO/mJzZ7yP5DD6hdnM7M
 aE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uxr2NpbFLLWHT3eSGGYmBvIw5Q5r2kwNtsTt2Z3/R1s=;
 b=l80yNm4GicCaUo9cgwD8FE7b53jZPmwBmHp7V8ait+3T0m3CVTjVvocykxQx0qeoIE
 E6tesD3hoVTAJ8Mlpb6DOEOJv+7diZOWGy6MjWhluJ2vGxHteTwMha5eSxpFVKXDsGvK
 dwPQAgbOwraHcnB2SoFvzRYYbwhqIpCrYqFjBSH0p0XX2wcaRtGlv6qo5OM0LzVIAWy+
 e56qMz7nzYowZ/Nh9JX075P2EWbYMMgBw9md+i40r+O/lsYl70hcoU4giOtV6jQUW77O
 oVPStoK0GCCHwPYnJ3vTCIchws96jcuyevpwqQDJyJ34wDUK9AmX60C9EY3M7dtzBnej
 mtLg==
X-Gm-Message-State: AOAM532f30osUei8eqbJkoRwc4IiikLtdfuX5r+cwYBi1HnmO/yk5+3t
 rIEeSdkl3mJdbP3B9hXdb11avnLJ408=
X-Google-Smtp-Source: ABdhPJwn5YFouBbofmZ8yH0uL0CBBEmi5wZF1ntN2KgYHGoflwHEqq6iflSTnRLeF5/kwtNl2VaM+g==
X-Received: by 2002:a05:6e02:1946:: with SMTP id
 x6mr8053236ilu.10.1643022015893; 
 Mon, 24 Jan 2022 03:00:15 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id k11sm5973030iob.23.2022.01.24.03.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:00:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:00:14 -0700
Message-Id: <20220124110014.537689-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-pycparser: bump to
 version 2.21
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

License hash changed due to year update:
https://github.com/eliben/pycparser/commit/78beeb7d6f0a760f90a8592d9533042363a82810

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 package/python3-pycparser/python3-pycparser.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 0426444399..34401a319a 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  b8f88de737db8c346ee8d31c07c7a25a  pycparser-2.20.tar.gz
-sha256  2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0  pycparser-2.20.tar.gz
+md5  48f7d743bf018f7bb2ffc5fb976d1492  pycparser-2.21.tar.gz
+sha256  e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206  pycparser-2.21.tar.gz
 # Locally computed sha256 checksums
-sha256  3c76629880aec2f8578ed914701a4ff9e5da8b60acb8b7ec675abf83c90c5168  LICENSE
+sha256  3e7df25b8dfb658c9a91501930d4d943b05087a8347c7e2b4325616af535047b  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 5f44a562af..20c3f641a9 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pycparser/python3-pycparser.mk
-PYTHON_PYCPARSER_VERSION = 2.20
+PYTHON_PYCPARSER_VERSION = 2.21
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
index 68769ceb46..4075f4a38f 100644
--- a/package/python3-pycparser/python3-pycparser.mk
+++ b/package/python3-pycparser/python3-pycparser.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pycparser/python-pycparser.mk
-PYTHON3_PYCPARSER_VERSION = 2.20
+PYTHON3_PYCPARSER_VERSION = 2.21
 PYTHON3_PYCPARSER_SOURCE = pycparser-$(PYTHON3_PYCPARSER_VERSION).tar.gz
-PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd
+PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
 PYTHON3_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON3_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON3_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
