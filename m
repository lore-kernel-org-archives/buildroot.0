Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391A2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D795783FBE;
	Mon, 24 Jan 2022 11:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TzCTgX0Cg1t; Mon, 24 Jan 2022 11:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6651583FB8;
	Mon, 24 Jan 2022 11:37:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E36021BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D128883FB8
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlQAKHrkKPH4 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:37:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4CE083FB3
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:37:52 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id v6so19079087iom.6
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlMOpv45qW3b89atk0dPsHu8Incc2S8Jhye1E6wDRKo=;
 b=i8cQolYMoJVCAdUa46T3MqaW6nhNI5q6UNtPiYvKTBbqkNx8X43iNg2DNutj8rC/Ck
 m3i4qkQbNjZisrC5bJLUjdYNgH+ySk8Pf4FdZXEtIDx5RIrpeS/6ApUodBre3rAjw8Sg
 bPYfMIjXniZWb6ViBMpOgDb/yCjBUNXf3c6dHG4uF/Ph+uQ7IV+4bJmt4I0S5OjB6E/+
 7h2C7cVVn+aKU0Z2fO0mhFj7WlHvJbehU8HtWjbXKELWg1sh7QOT7uXDCEaa52CFy/rZ
 WzaHJ7iOR4zKaaojtLQq/1rmwvetbWa/yBORuH/ZiPspSFs9/Zdp0f9yD2e80fvoBwAI
 kvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qlMOpv45qW3b89atk0dPsHu8Incc2S8Jhye1E6wDRKo=;
 b=1JeiF5fDoC3zsBgqqsyabwQY1A4Ju1OCP2z221XttBuzR22kXX+WtpYEQVTOd8NBqj
 rOHaXJt7s2wIQt0bzAwJM7VTKKJiD9TxDW6PXKmxFV7RwScEp7hkoF+1J44UnRj3hGV+
 mhew7Y4giHFh8Aljw8Jwum/b2ss5Ai0f2JRUG2gQPnevpAWNVknnaRcBGVwptsW7Xnm+
 qSE0V61FZcV+lf9qyxq/U9CPvl7lZ2+PViR5+CRmHdDBaWOVGM7oxkvkwjsuFdv74ZF+
 hk3PnUh01SxqayNOLCX6HN0n4JmJeWk0QHYUhA7YsC0GQhRGe4VyqGPstC/pag0+bOC5
 MC7g==
X-Gm-Message-State: AOAM531uduY8ui9haINT9tCoYWwMkuqJL6JHknS3HeoxT6P4FTB2BJu+
 PHXjfxnlNPHww/JoUeteG+ovo65ap+I=
X-Google-Smtp-Source: ABdhPJw9mL/tLl9Q+GOfAjKBzx5/r3AvOSQ/2d/tdKmKDCl1V1wsV7rXPHU26B26YDRCaforU4p+ow==
X-Received: by 2002:a02:942f:: with SMTP id a44mr6420058jai.13.1643024271665; 
 Mon, 24 Jan 2022 03:37:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id r15sm7155377ilo.25.2022.01.24.03.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:37:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:37:49 -0700
Message-Id: <20220124113749.585264-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version 1.5.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now upstream.

Drop python2 support.

Drop python-six dependency which is no longer needed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...e-spurious-requirement-for-wheel-596.patch | 34 -------------------
 package/python-pynacl/Config.in               |  2 +-
 package/python-pynacl/python-pynacl.hash      |  6 ++--
 package/python-pynacl/python-pynacl.mk        |  4 +--
 4 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch

diff --git a/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch b/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
deleted file mode 100644
index 4f4a76ce29..0000000000
--- a/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 44fb453931c611d4822343debe902cca8e1c8afe Mon Sep 17 00:00:00 2001
-From: Scott Kitterman <sklist@kitterman.com>
-Date: Tue, 26 May 2020 20:08:16 -0400
-Subject: [PATCH] Remove spurious requirement for wheel (#596)
-
-* Remove spurious requirement for wheel
-
-* Put wheel back in pyproject.toml
-
-Co-authored-by: Scott Kitterman <scott@kitterman.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-44fb453931c611d4822343debe902cca8e1c8afe]
----
- setup.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9319c1c..d82a7fe 100644
---- a/setup.py
-+++ b/setup.py
-@@ -35,8 +35,7 @@ except ImportError:
- 
- 
- requirements = ["six"]
--setup_requirements = ["setuptools",
--                      "wheel"]
-+setup_requirements = ["setuptools"]
- test_requirements = ["pytest>=3.2.1,!=3.3.0",
-                      "hypothesis>=3.27.0"]
- docs_requirements = ["sphinx>=1.6.5",
--- 
-2.25.1
-
diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 256f9d5eb6..3bb4e29630 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBSODIUM
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index b6ee2baf0e..85a7447b32 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5  8c6c57893327a694c72510fb620e4744  PyNaCl-1.4.0.tar.gz
-sha256  54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505  PyNaCl-1.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/PyNaCl/json
+md5  93989045e25f1111452cfdf5e021814d  PyNaCl-1.5.0.tar.gz
+sha256  8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba  PyNaCl-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 1e4155992a..bd2571c3ad 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.4.0
+PYTHON_PYNACL_VERSION = 1.5.0
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/cf/5a/25aeb636baeceab15c8e57e66b8aa930c011ec1c035f284170cacb05025e
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/a7/22/27582568be639dfe22ddb3902225f91f2f17ceff88ce80e4db396c8986da
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
