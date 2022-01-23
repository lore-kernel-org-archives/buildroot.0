Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD49C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF6340886;
	Sun, 23 Jan 2022 22:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSOw9l50GuhI; Sun, 23 Jan 2022 22:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4091B40289;
	Sun, 23 Jan 2022 22:39:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12FC81BF2F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FB3881D3D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VP7u9pSBnokn for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:39:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17F7081852
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:39:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a13so10275631wrh.9
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 14:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=190c1EAFErdcRLlquq9JekkgUc1Zri+2gCsGZyOn5BE=;
 b=UMEEzt66QF4540LKYEo7K/PkoxAQwFNd08whkuxs5eIp/AbmPEfw7LezgeRjw5CNjH
 zkO6Y7h0m3UZkv0i0Hb9k90yfjCSLcB2m6Z67a0WyF1ZouygMKrnFrAx+YNrF5T1fIwj
 Q/QXKSzWM/Uxdb0nnjDqWwkZU/KR5MXAti26Cfi6J1a9b50qjUHWVqVR/njFDJwzbEp1
 pKqnnueZf/4+txMHlRIfd16VXTFg9YWwtr0vMO7v+ffOdNGLcAwsiMQaXaIWBjpbrhDu
 TPK8czlgVh53cHKcCfab0OBUZym1mRktMZX4FhykvjRV2ieVsgrowLNNiv6E/viXZszv
 F8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=190c1EAFErdcRLlquq9JekkgUc1Zri+2gCsGZyOn5BE=;
 b=ZeCWR2aJ4CXjkhMK8wSOvj5n13jnPJZSutBU6TG+n3yEgZoj82OcCXaTNESgShtJ8R
 VQKMr/qpwsWxAbl8cWiXMONiJ0GJ5UyssjBvjLOzxHuSXFJneRqZSTxXdu8GA3cOek4p
 iIGrtJh4D7IuKMDdC9RCGztX83BcQP+CHn5jYeKa6tGg1Cy2TkY37v5D+xMWrEjU5L9P
 C2PW0czkdrmSz/SOxg+yR2S1TjStDgJ8l/zlc5yTAQqX3ZC5ajnUItLIOOV0BFqWzklL
 IBfJWaKxNUI2D1OJIGPppd3+ymo/PLI4PYhrbUA2IKMYKwTEalLHFtNB39Tg7sitShDj
 w5oA==
X-Gm-Message-State: AOAM531jmOb36a8TjSxat5dPcSYAoOTCYu0Oow8+35XMSb2p6+XLkWsa
 CyLrc/k8foU+4Ed3JQIsNvXauWp8aAs=
X-Google-Smtp-Source: ABdhPJz8HBndJ7dQ9ENMPwRwYtuUG6PalxOpHebY4NNGx+HZT0NKlMprei+W4e/1CDe8iskzmIFnAA==
X-Received: by 2002:a05:6000:180c:: with SMTP id
 m12mr11760011wrh.581.1642977542273; 
 Sun, 23 Jan 2022 14:39:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n11sm11424172wms.3.2022.01.23.14.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:39:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 23:37:25 +0100
Message-Id: <20220123223725.790209-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-itsdangerous: bump to
 version 2.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- python 2 support has been dropped since version 2.0.0 and
  https://github.com/pallets/itsdangerous/commit/e085f3eedf94fe42391aaa9fc349927f8feaa367
- Update hash of license file (license standardized:
  https://github.com/pallets/itsdangerous/commit/c880f85ccdaee29adab8b47ad79eb7bdec507b57)
- Update indentation in hash file (two spaces)

https://itsdangerous.palletsprojects.com/en/2.0.x/changes/#version-2-0-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-itsdangerous/Config.in                | 4 ++--
 package/python-itsdangerous/python-itsdangerous.hash | 8 +++++---
 package/python-itsdangerous/python-itsdangerous.mk   | 6 +++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-itsdangerous/Config.in b/package/python-itsdangerous/Config.in
index 39ec0b7725..72aa9165f8 100644
--- a/package/python-itsdangerous/Config.in
+++ b/package/python-itsdangerous/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_ITSDANGEROUS
 	bool "python-itsdangerous"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Itsdangerous contains various helpers to pass data to
 	  untrusted environments and to get it back safe and sound.
diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index 0904a91183..dad4ec0800 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,4 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
-md5	9b7f5afa7f1e3acfb7786eeca3d99307  itsdangerous-1.1.0.tar.gz
-sha256	321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19  itsdangerous-1.1.0.tar.gz
-sha256	feb28bfa348d816b0e7dbaeddf18499ee7e8007c67813db8d6ab37c65e046cd4  LICENSE.rst
+md5  996b9763d1b4bd0edd6eb86f0a490629  itsdangerous-2.0.1.tar.gz
+sha256  9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0  itsdangerous-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 9429233703..c53bc6b9ba 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 1.1.0
+PYTHON_ITSDANGEROUS_VERSION = 2.0.1
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/68/1a/f27de07a8a304ad5fa817bbe383d1238ac4396da447fa11ed937039fa04b
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/58/66/d6c5859dcac92b442626427a8c7a42322068c5cd5d4a463ce78b93f730b7
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
-PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
