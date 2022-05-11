Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 08:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0449582CCB;
	Wed, 11 May 2022 08:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3B6mvrSitO6; Wed, 11 May 2022 08:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3A582C5E;
	Wed, 11 May 2022 08:02:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 321CF1BF294
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 08:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AA4160881
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 08:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1-Mel5ByFv4 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 08:01:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06F90607E1
 for <buildroot@buildroot.org>; Wed, 11 May 2022 08:01:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id z2so2408165ejj.3
 for <buildroot@buildroot.org>; Wed, 11 May 2022 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=I2Uv4SRxVts1M3gbAWCB5d3S+tl6F+Hfejd+ermEtks=;
 b=SMyJJOMJZn0Dq8cTo6KM97tDkh7Jypf5MhQkO3ixVqWPxfuFP3DtUknJf88u6o1sxc
 SHOymXmvI82YDyKbX+u8wnsur0f42h11tD8EZqj1qHYsXASIQP0MA3SQ/8DEDAZ6z+lg
 XIgZZZWY3soBi0RcEsK8mx4yspTj9r2fjxXfv7vE8Y3l2Qyyq+4SqpXgAl6pmptt2K5Y
 K1Q93KITTj9tGEc1h7j9Y2zRcuDmUafEwp6uHJ3qAzRBGCxiDCEjt2B6i7Ug997vTyKR
 gGPXCp9NA6n9hnA14l0tKhn1lcHozJ1XiDeKcCSgEbOE1sUd0pQJviFrTCewAdjSylw0
 Otiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I2Uv4SRxVts1M3gbAWCB5d3S+tl6F+Hfejd+ermEtks=;
 b=5Ey1jifrULgtP/hCW/MAbCjczQuYRDBvGd4AQ7akaIoWaNG09dvsNJDY/IZDNyI0LC
 vxqNvNxDYFWtuC7sz4GtI3p22yUHuoi1/i1Wgk42LVylhDWnIrlHNfJayo8LTekqaWLq
 LHlDNJxWoApUbfkR926AKgdQM7i1+jH9TujOcMvUuHHDlTP6RlQBTjTR02daGoeYBTrP
 O91gLFupOhc8NzUBMm4OuMACeAYWxOwHFqobSneHOO1IihPZSVTvieemNO/xW4lZXVf6
 yg30pABva2bj1NS1ZOqjXIc0WuSPrNF/aX9hDDpDLmiqz9cXv+woMwu8wW8akjs9yqzd
 QoZA==
X-Gm-Message-State: AOAM5328kkASyasvl8l1Vm7uO6jHmb28NtsQYQjPoalpZFaEGzKe+xaK
 wj9KOTVm8YuImCrtm2gdaKtrtRlGIIk=
X-Google-Smtp-Source: ABdhPJwy2jUgGRkrfGZjy2OGAgN3OlbIr7GX9FcpfdDzO4yO24CPNgxBi0+pAMX4VXjfEDhcJFR/yg==
X-Received: by 2002:a17:907:7e83:b0:6f9:1fc:ebf3 with SMTP id
 qb3-20020a1709077e8300b006f901fcebf3mr17090484ejc.403.1652256116794; 
 Wed, 11 May 2022 01:01:56 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 l17-20020a170906079100b006f3ef214e5csm638894ejc.194.2022.05.11.01.01.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 May 2022 01:01:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 10:01:48 +0200
Message-Id: <20220511080148.5084-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-pylibfdt: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-pylibfdt/Config.in            |  6 ++++++
 package/python-pylibfdt/python-pylibfdt.hash |  6 ++++++
 package/python-pylibfdt/python-pylibfdt.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-pylibfdt/Config.in
 create mode 100644 package/python-pylibfdt/python-pylibfdt.hash
 create mode 100644 package/python-pylibfdt/python-pylibfdt.mk

diff --git a/package/Config.in b/package/Config.in
index a693761f18..17789be100 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1164,6 +1164,7 @@ menu "External python modules"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyjwt/Config.in"
+	source "package/python-pylibfdt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymodbus/Config.in"
diff --git a/package/python-pylibfdt/Config.in b/package/python-pylibfdt/Config.in
new file mode 100644
index 0000000000..8fc1cdb064
--- /dev/null
+++ b/package/python-pylibfdt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYLIBFDT
+	bool "python-pylibfdt"
+	help
+	  Python bindings for the Device Tree Compiler (dtc) toolchain.
+
+	  https://github.com/devicetree-org/pylibfdt
diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
new file mode 100644
index 0000000000..056fd3a62e
--- /dev/null
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
+md5  5765c20ac6cde517d5b7218503ab707b  pylibfdt-1.6.1.tar.gz
+sha256  90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778  pylibfdt-1.6.1.tar.gz
+# Locally computed
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
new file mode 100644
index 0000000000..d4d0b20625
--- /dev/null
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pylibfdt
+#
+################################################################################
+
+PYTHON_PYLIBFDT_VERSION = 1.6.1
+PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
+PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
+PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause, GPL-2.0+
+PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
+PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
