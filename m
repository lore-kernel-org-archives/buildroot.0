Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6BDC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B1D140482;
	Wed, 10 Jan 2024 16:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B1D140482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4S9W2mYi2b7; Wed, 10 Jan 2024 16:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2D8B4360F;
	Wed, 10 Jan 2024 16:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2D8B4360F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4B381BF2C7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D9C9613F3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9C9613F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKdGrxat2iwY for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 16:37:36 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5250E613D9
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 16:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5250E613D9
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so49219505e9.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 08:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704904654; x=1705509454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJOuK79xtU+161OUfFDExLKyy9D+Fw1ca0xUXhalPF8=;
 b=NVOBxCz5wbFMQr91rgLuFoFiZbDWyyePj3nb8iZca6Ha7puswC705Awlvs6tKQQ6Fz
 Xy5CwRyj9bRpIdLHLkQoqSnILlJQe/9lSfDv3YgL8rv7XhuxImsgeYD27tpMIt7l7CwY
 y2Vl3JRDHAdykFRRjo3rFgh3tpDjENk6zaAOoTdtLxuF5kzOnls21pYGueM4ny5InZEr
 cauEJDmJA3ivIB9rjpUTBR+nDtO1NetsSx5u7d8FYjFI5xraIuC6zZnV9XgaCh8cUQGO
 5QRCK79yLHwfpWbJd2HBw0+pWuB48HmzlincaitfpTQYgy4eFe6A/LCEoL1mpboWQw4w
 xHDg==
X-Gm-Message-State: AOJu0YyW9fPbAwZdOChocxaiF9pX+v5xnkAbv6F33l43mb5nchYImbv4
 VU1f8ICgNKOJkoCpTHfWtNmlxVMTGCOkqg==
X-Google-Smtp-Source: AGHT+IHXS8tZSQemg02YWYokDhB5K1jUa/tIR+mzEouIPfJx6wwVm7rHva2H3yFnD+tkK1tMZaAF4Q==
X-Received: by 2002:a05:600c:4a21:b0:40e:4a7b:7659 with SMTP id
 c33-20020a05600c4a2100b0040e4a7b7659mr690377wmp.59.1704904654034; 
 Wed, 10 Jan 2024 08:37:34 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:e267:d100:9901:8192:c5e1:a0a9])
 by smtp.gmail.com with ESMTPSA id
 ao20-20020a170907359400b00a26ac6d55dasm2203934ejc.46.2024.01.10.08.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:37:33 -0800 (PST)
From: arnomessiaen@gmail.com
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 17:37:26 +0100
Message-Id: <20240110163726.447025-1-arnomessiaen@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704904654; x=1705509454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bJOuK79xtU+161OUfFDExLKyy9D+Fw1ca0xUXhalPF8=;
 b=IFd/G9uA+rMl0TVybNfa6Uzyyi9polICDhvqu0IjRnx/MFF8ALt2G2Gg2lknEyvrl6
 gIHTkqtrL1zkSC1G7m1RT67COOKQBJ+n29apDOejYb1nWrq+QBQVTfQRd1keoQDPCytc
 TUspSmTw6uk3zPKGxfFkvv7wlFt6l4xWr0sphmOq5xKMYQYQ8Q9LRN8yxa2Hr2Zipbdl
 1jr1bbwGkah5tMsgcPcwIvHPUBXz93gQf77OpHL1TkQcDBZZ8zhtlXVQtMDBTYZuBYtA
 933Vp+LV8hRMx6ofk0KbW1Z33WFhtoHHMgYAkoA/8mDxVGwG6cIcxViWsQRyGWClCKrF
 t2IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IFd/G9uA
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse-client: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Arno Messiaen <arnomessiaen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Arno Messiaen <arnomessiaen@gmail.com>

This patch adds the python-aiohttp-sse-client package to buildroot.
This package adds SSE client support to the aiohttp library, as
opposed to the already exising python-aiohttp-sse package, which
only adds sse server support.

Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 ....py-remove-pytest-runner-requirement.patch | 37 +++++++++++++++++++
 package/python-aiohttp-sse-client/Config.in   |  7 ++++
 .../python-aiohttp-sse-client.hash            |  5 +++
 .../python-aiohttp-sse-client.mk              | 14 +++++++
 6 files changed, 67 insertions(+)
 create mode 100644 package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
 create mode 100644 package/python-aiohttp-sse-client/Config.in
 create mode 100644 package/python-aiohttp-sse-client/python-aiohttp-sse-client.hash
 create mode 100644 package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..ebdf8eb892 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -257,6 +257,9 @@ F:	package/mali-t76x/
 N:	Arnaud Aujon <arnaud@intelibre.fr>
 F:	package/espeak/
 
+N:	Arno Messiaen <arnomessiaen@gmail.com>
+F:	package/python-aiohttp-sse-client/
+
 N:	Arnout Vandecappelle <arnout@mind.be>
 F:	package/arp-scan/
 F:	package/dehydrated/
diff --git a/package/Config.in b/package/Config.in
index f5d0c06334..2302188fe5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -971,6 +971,7 @@ menu "External python modules"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
+	source "package/python-aiohttp-sse-client/Config.in"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
diff --git a/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch b/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
new file mode 100644
index 0000000000..96289797f1
--- /dev/null
+++ b/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
@@ -0,0 +1,37 @@
+From fdba1f12843d0fdbd5094144a8081244b71b2cf0 Mon Sep 17 00:00:00 2001
+From: Arno Messiaen <arnomessiaen@gmail.com>
+Date: Wed, 22 Nov 2023 08:12:08 +0100
+Subject: [PATCH] setup.py: remove pytest-runner requirement
+
+setup.py: pytest-runner is not required to install the package
+
+Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>
+
+---
+ setup.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 062bb08..f19bc0a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -13,8 +13,6 @@ with open('HISTORY.rst') as history_file:
+ 
+ requirements = ['aiohttp>=3', 'attrs', 'multidict', 'yarl', ]
+ 
+-setup_requirements = ['pytest-runner', ]
+-
+ test_requirements = ['pytest', ]
+ 
+ setup(
+@@ -41,7 +39,6 @@ setup(
+     keywords='aiohttp_sse_client',
+     name='aiohttp-sse-client',
+     packages=find_packages(include=['aiohttp_sse_client']),
+-    setup_requires=setup_requirements,
+     test_suite='tests',
+     tests_require=test_requirements,
+     url='https://github.com/rtfol/aiohttp-sse-client',
+-- 
+2.40.1
+
diff --git a/package/python-aiohttp-sse-client/Config.in b/package/python-aiohttp-sse-client/Config.in
new file mode 100644
index 0000000000..a4f6a14060
--- /dev/null
+++ b/package/python-aiohttp-sse-client/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_SSE_CLIENT
+	bool "python-aiohttp-sse-client"
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  Server-sent events client support for aiohttp.
+
+	  https://github.com/rtfol/aiohttp-sse-client
diff --git a/package/python-aiohttp-sse-client/python-aiohttp-sse-client.hash b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.hash
new file mode 100644
index 0000000000..5a1d240777
--- /dev/null
+++ b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp-sse-client/json
+md5  d9065bf151fbb485a175ae453a9a5f9f  aiohttp-sse-client-0.2.1.tar.gz
+sha256  5004e29271624af586158dc7166cb0687a7a5997aab5b808f4b53400e1b72e3b  aiohttp-sse-client-0.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  44c346abc42b39f1390e4747adfd60a3ca349e01462965e5750ae531299b8ff1  LICENSE
diff --git a/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk
new file mode 100644
index 0000000000..4feae517ae
--- /dev/null
+++ b/package/python-aiohttp-sse-client/python-aiohttp-sse-client.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-sse-client
+#
+################################################################################
+
+PYTHON_AIOHTTP_SSE_CLIENT_VERSION = 0.2.1
+PYTHON_AIOHTTP_SSE_CLIENT_SOURCE = aiohttp-sse-client-$(PYTHON_AIOHTTP_SSE_CLIENT_VERSION).tar.gz
+PYTHON_AIOHTTP_SSE_CLIENT_SITE = https://files.pythonhosted.org/packages/71/c3/4825c5f37909a70c8018924b3d521847dd7acf1fce7e1054574bafed2271
+PYTHON_AIOHTTP_SSE_CLIENT_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_SSE_CLIENT_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_SSE_CLIENT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
