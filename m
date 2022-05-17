Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B2AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 22:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB2D83EAC;
	Tue, 17 May 2022 22:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7N62XI6hWt3; Tue, 17 May 2022 22:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A93C83E90;
	Tue, 17 May 2022 22:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27CCA1BF20B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1665F40399
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHJDEtGx9wIi for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:59:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2054940191
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:59:39 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id i5so316504ilv.0
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZXia6AUufW0/KKNpG525qEol5T8AKvb5RuxhJOO2uA=;
 b=myIkzY+8z06QbVkQxlmJQsCY0Yiz8+eyz8M5bEPOxtgsguF7DxtHYOHJ1+ukSoWs6j
 KhiRw8vfKwF2ZsIt3eH4/68HQHPs/BGA16iVuJvU6ladTERCQGcsBkaIvl0SbZ2I1/ya
 dnm3L1klr6CXz9d3/A/A3fACzBOQHAvYUhZ4z+33+n3SJhVDeSPjX7gQ6owoFcmVe9J1
 j6F0Ci/8gKGs/6Lf4DsE/iBt17JMY4TWjFm68uTsxHvw71ffcimUO9uxYU35mibNOwOy
 AzCx1uyJuG2Dx3IO13FEj9fLz6TX7iO2ktncG8ZWJGDb5KkbyGzlg+BhJnHexNwA4hXY
 ZZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZXia6AUufW0/KKNpG525qEol5T8AKvb5RuxhJOO2uA=;
 b=JufIkJwIulZ7CGvAeM/Lpz9xR+NH8m4HTmmASzvblSub0d71HXD++QeZ99sqYjwfpL
 j+Eh0aWTsVabQcfgKQ6NKC2LQdV9kNKZ40coMyjG+W81eRZfZPNthFaRrARogS3ApRv0
 ZHfgEfwPVxXS5tMQTRy2u7icFmhBX9/THpH9VrekTkPQnsDjSIC6idJVcOPYek/9oZ3g
 MjOuufY7RaOEkKro+KrczWJPdBY7Wc3JNUrb7Gg1Ba8sQk+qJi3Mxncy5RN2VMXa2+BO
 A0VvLVmhakTGW6kwDAvfIMOppBtLOzfnVTQHT7aBCmBeUfi+OKp0MgA0zIvn/9CCLVt2
 K5PA==
X-Gm-Message-State: AOAM530GygfXQ+3nOJZQ+eFQR24XjWK/4P4ye1q9n/BPAkdLF+zpSxfV
 ko9KFupmfefP5ELCFf0prmmYIu4ddZ4=
X-Google-Smtp-Source: ABdhPJw1YPIY9BXKkl/G7bD2bLFwremAcwES5JsWVY6HNX/0LlOozq17vJ3a/kJfmiKDuCxfrEh8gw==
X-Received: by 2002:a05:6e02:1e07:b0:2d1:4a0d:61d7 with SMTP id
 g7-20020a056e021e0700b002d14a0d61d7mr1248139ila.238.1652824778772; 
 Tue, 17 May 2022 14:59:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 j13-20020a02cb0d000000b0032e262428d1sm67354jap.143.2022.05.17.14.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 14:59:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 15:59:33 -0600
Message-Id: <20220517215933.1553086-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517215933.1553086-1-james.hilliard1@gmail.com>
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-flask-jsonrpc: bump to
 version 2.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-typeguard and python-typing-inspect runtime
dependencies.

Add a patch to remove invalid setup_requires.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-Move-pytest-runner-to-tests_require.patch | 32 +++++++++++++++++++
 package/python-flask-jsonrpc/Config.in        |  5 +--
 .../python-flask-jsonrpc.hash                 | 11 ++++---
 .../python-flask-jsonrpc.mk                   |  6 ++--
 4 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch

diff --git a/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch b/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
new file mode 100644
index 0000000000..8b6712e601
--- /dev/null
+++ b/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
@@ -0,0 +1,32 @@
+From 8f07768085fa4c8d21dbe27805b7238e67d3aea5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 17 May 2022 15:52:58 -0600
+Subject: [PATCH] Move pytest-runner to tests_require
+
+This isn't a build requirement so it shouldn't be under
+setup_requires.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/cenobites/flask-jsonrpc/pull/227]
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 197d6c9..f23c472 100755
+--- a/setup.py
++++ b/setup.py
+@@ -42,8 +42,8 @@ setuptools.setup(
+         'async': ['Flask[async]>=1.0.0,<3.0'],
+         'dotenv': ['Flask[dotenv]>=1.0.0,<3.0'],
+     },
+-    setup_requires=['pytest-runner'],
+     tests_require=[
++        'pytest-runner',
+         'mock==4.0.3',
+         'coverage==6.3.2;python_version>"3.6"',
+         'coverage<6.2;python_version<="3.6"',
+-- 
+2.36.0
+
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
index c8ecd854b3..024fbc4b85 100644
--- a/package/python-flask-jsonrpc/Config.in
+++ b/package/python-flask-jsonrpc/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
 	bool "python-flask-jsonrpc"
-	# runtime dependency
-	select BR2_PACKAGE_PYTHON_FLASK
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECT # runtime
 	help
 	  A basic JSON-RPC implementation for your Flask-powered sites.
 
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index 4204f59dd5..ee407dbd7a 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,5 +1,6 @@
-# md5 from https://pypi.python.org/pypi/flask-jsonrpc/json
-md5	5c0592f53b2f18e34d5be435acee8842  Flask-JSONRPC-0.3.1.tar.gz
-# Locally computed
-sha256	4d0cc9c20874093306af91f5a48009fb8659a041428dcdb11703598ffbbc97d0  Flask-JSONRPC-0.3.1.tar.gz
-sha256  f613b06cbe766fd514b1b619a71a12c353cccaa55fa4f547be55563d9829be6f  setup.py
+# md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
+md5  f2b7bf5222f3aaf050f396522d7f692d  Flask-JSONRPC-2.2.1.tar.gz
+sha256  f994f8dd80bf31cf7272eb1a3030c6caf30fef3ced5866e66b56871d4047be68  Flask-JSONRPC-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
+sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index dbb37c373c..542b9e73f5 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 0.3.1
+PYTHON_FLASK_JSONRPC_VERSION = 2.2.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://pypi.python.org/packages/cb/1f/e6d66e8498609ba04bac76155b2ea884df95531e93501bf4ef009d40a83c
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/ca/2a/3f2bd79840d9643fc909cf27f730b2c5006351746ba09c4dab1b898ddee9
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
-PYTHON_FLASK_JSONRPC_LICENSE_FILES = setup.py
+PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
