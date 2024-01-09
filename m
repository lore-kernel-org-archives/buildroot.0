Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B2C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C40E418E6;
	Tue,  9 Jan 2024 06:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C40E418E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Wh6umJ-Rqxv; Tue,  9 Jan 2024 06:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37AFD41901;
	Tue,  9 Jan 2024 06:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37AFD41901
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2EEF1BF3D8
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8B5D60BDE
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B5D60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skNwyE-Mtoe6 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:01:32 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4D7660743
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D7660743
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bed9f3ca97so14332339f.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704780090; x=1705384890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HezDGWuFmlfQFJTeY+DJ7xQfjUjipMpN7nJ8xBYxyXE=;
 b=DisoOg4D4rIsclQ4K3XzAskUgaEj5n9fHRheusrEuriMbExu+DWLoIOl3kxPPSfb8E
 wlrjo2hefNzwXPGRC9VZEDXqpwXzYQU7nJhVPBnbbkZDwGCGLtxHX4TwVqID/AD8qV2r
 Nmh4awmEjR7U/Q43A8iFxdZWm0E0g2v/YLtR945V4cGgnASuDs3f45x+cXgVfDY6+/7a
 t09kXN5P0GqkPM9bJu08NCE0iUj6AkuXnf2PgDbnS34A85hM+O53gZulOhuT5vGaUCDo
 uC36DaOA7eHpwH9bExMs+g4+JW7FWpch5EMBjAZq2xNAlB/0RdeLftcqNr/zKu3JNTNw
 ksRQ==
X-Gm-Message-State: AOJu0YxcbPtac8EfdqXTeN38ZMfDmGvPFajGME5WZC4VD5iHOoJeYipv
 QuTX2Ey2NPcvGxm/UqVQgh1H6L6VWhYlHw==
X-Google-Smtp-Source: AGHT+IG1ztKZ2jApgJ6PNipw/eBmjGRwpdfDKJ47ZZ902d4B5KP/F875Q5X7rA6SbWKcmxoaV98v9g==
X-Received: by 2002:a05:6e02:1d82:b0:360:1dc:d524 with SMTP id
 h2-20020a056e021d8200b0036001dcd524mr6223688ila.15.1704780089936; 
 Mon, 08 Jan 2024 22:01:29 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92d9cf000000b0036063b51610sm410975ilq.27.2024.01.08.22.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:01:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:01:23 -0700
Message-Id: <20240109060128.3974794-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704780090; x=1705384890; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HezDGWuFmlfQFJTeY+DJ7xQfjUjipMpN7nJ8xBYxyXE=;
 b=ga/XPrMoHGf37e+CY+DdA8S2sXGfClu2J7Wzmpidh14aubPUdukqPcLASmgNX4uIJu
 AWczQpgfqxDuYe4csYEDhBv4OqwVSz9OYsOpIL8Psl4N1LnSQe5QupZatHQLm8EdVGVH
 z6ohYreYLVanpvVCo1kbJPV2a+SNx33TXvBZhiLWqSaUmqgvWHSVczewfYX6gHuSi9Bp
 XMxDeUXluygZ6SQAj2InS3I+sxaxh0slcrejCr5/cVrvArCVamf4yklwTHhv5KyAR2EK
 7ftss+QMjzLt1nyMbgdyoGHdaORJBa6jmA+uHixgLRWaxWLUI1ACfIO58FrXOQ5oj0ex
 tCUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ga/XPrMo
Subject: [Buildroot] [PATCH 1/6] package/python-autocommand: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-autocommand/Config.in               |  6 ++++++
 package/python-autocommand/python-autocommand.hash |  5 +++++
 package/python-autocommand/python-autocommand.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-autocommand/Config.in
 create mode 100644 package/python-autocommand/python-autocommand.hash
 create mode 100644 package/python-autocommand/python-autocommand.mk

diff --git a/package/Config.in b/package/Config.in
index f5d0c06334..7f9800a7e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1000,6 +1000,7 @@ menu "External python modules"
 	source "package/python-attrs/Config.in"
 	source "package/python-augeas/Config.in"
 	source "package/python-autobahn/Config.in"
+	source "package/python-autocommand/Config.in"
 	source "package/python-automat/Config.in"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
diff --git a/package/python-autocommand/Config.in b/package/python-autocommand/Config.in
new file mode 100644
index 0000000000..41533e644e
--- /dev/null
+++ b/package/python-autocommand/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_AUTOCOMMAND
+	bool "python-autocommand"
+	help
+	  A library to create a command-line program from a function.
+
+	  https://github.com/Lucretiel/autocommand
diff --git a/package/python-autocommand/python-autocommand.hash b/package/python-autocommand/python-autocommand.hash
new file mode 100644
index 0000000000..9513010d0e
--- /dev/null
+++ b/package/python-autocommand/python-autocommand.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/autocommand/json
+md5  0cab5141bad0dfb363b086e93fd4125e  autocommand-2.2.2.tar.gz
+sha256  878de9423c5596491167225c2a455043c3130fb5b7286ac83443d45e74955f34  autocommand-2.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  ade78d04982d69972d444a8e14a94f87a2334dd3855cc80348ea8e240aa0df2d  LICENSE
diff --git a/package/python-autocommand/python-autocommand.mk b/package/python-autocommand/python-autocommand.mk
new file mode 100644
index 0000000000..0a1426d7f7
--- /dev/null
+++ b/package/python-autocommand/python-autocommand.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-autocommand
+#
+################################################################################
+
+PYTHON_AUTOCOMMAND_VERSION = 2.2.2
+PYTHON_AUTOCOMMAND_SOURCE = autocommand-$(PYTHON_AUTOCOMMAND_VERSION).tar.gz
+PYTHON_AUTOCOMMAND_SITE = https://files.pythonhosted.org/packages/5b/18/774bddb96bc0dc0a2b8ac2d2a0e686639744378883da0fc3b96a54192d7a
+PYTHON_AUTOCOMMAND_SETUP_TYPE = setuptools
+PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0
+PYTHON_AUTOCOMMAND_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
