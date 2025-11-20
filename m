Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84240CF8852
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 12:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557008062C;
	Thu, 20 Nov 2025 12:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibUNLIYyaapu; Thu, 20 Nov 2025 12:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B9E38061E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9E38061E;
	Thu, 20 Nov 2025 12:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 980312A9
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 765A740C9D
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqnwQhHzu9ph for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 12:44:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94FB64037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FB64037E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94FB64037E
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 12:44:29 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 438572C80269;
 Thu, 20 Nov 2025 13:44:27 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 13:44:26 +0100
Message-ID: <20251120124427.1374845-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763642667; bh=C974PFOFLT7v3mT5OVLwJcT6zpWS5T3L9OEM2h+4gBY=;
 h=From:To:Cc:Subject:Date;
 b=fcibUinPJFDJoORG9ii5PJ1DrxbHFJb0GxAHHdLZ5GiKnaGXz0INZGP1XFsd8FKQ1
 B7z895d3ZxsAokZOzd5b47NBb5Mgx7d0GicOGD3v/BTl0yWc3NEgczYwX+CtBVpqzq
 QXgFONbG9KxrKPG8PgLGITYFNibHyYOXGOjr7ob/xuEjor9U6HwqtHAyu3JJ2405+5
 yRWJIHaJVEjr0uRxGBm382ver9qOVlPnFO7fyCWokWQqvBt9AnfXvgqW/ZRNal8bFE
 0w5IsRpInIugBrQxHBCmkshqAcCsAST+yWaTth38WAFlp/Qv6v7N4DIaT7jKj8kgPc
 n7a0KJMFNSIcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=fcibUinP
Subject: [Buildroot] [PATCH v2] package/python-gpiod: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the python bindings of libgpiod for version 2+.
While the python bindings for v1 were optionally built and
installed as part of the main libgpiod build, for v2 they have now been
published to pypi.org for easier consumption in the general python
ecosystem.

We need to set LINK_SYSTEM_LIBGPIOD=1 to actually build against the
system version of libgpiod which we install and not use a separate
bundled copy.

The package is licensed as libgpiod, but as published to pypi doesn't
include the LICENSE file that's part of upstream repository.
Reference pyproject.toml as that has the license identifier as a
workaround.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-gpiod/Config.in         | 15 +++++++++++++++
 package/python-gpiod/python-gpiod.hash |  5 +++++
 package/python-gpiod/python-gpiod.mk   | 17 +++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/python-gpiod/Config.in
 create mode 100644 package/python-gpiod/python-gpiod.hash
 create mode 100644 package/python-gpiod/python-gpiod.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0272b4ba33..68409d7c34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2263,6 +2263,7 @@ F:	package/picotool/
 F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
+F:	package/python-gpiod/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-log-rate-limit/
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..53fda7e086 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1136,6 +1136,7 @@ menu "External python modules"
 	source "package/python-google-api-core/Config.in"
 	source "package/python-google-auth/Config.in"
 	source "package/python-googleapis-common-protos/Config.in"
+	source "package/python-gpiod/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpc-requests/Config.in"
diff --git a/package/python-gpiod/Config.in b/package/python-gpiod/Config.in
new file mode 100644
index 0000000000..8f67178ae7
--- /dev/null
+++ b/package/python-gpiod/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_GPIOD
+	bool "python-gpiod"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # libgpiod2
+	depends on !BR2_PACKAGE_LIBGPIOD # libgpiod2
+	select BR2_PACKAGE_LIBGPIOD2
+	help
+	  Python bindings for libgpiod (v2+).
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/
+
+comment "python-gpiod needs kernel headers >= 5.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+comment "python-gpiod is incompatible with libgpiod"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
new file mode 100644
index 0000000000..bbcc7181ff
--- /dev/null
+++ b/package/python-gpiod/python-gpiod.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gpiod/json
+md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.g
+sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
+# Locally computed
+sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
new file mode 100644
index 0000000000..8ab901972e
--- /dev/null
+++ b/package/python-gpiod/python-gpiod.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-gpiod
+#
+################################################################################
+
+PYTHON_GPIOD_VERSION = 2.4.0
+PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
+PYTHON_GPIOD_SETUP_TYPE = setuptools
+PYTHON_GPIOD_LICENSE = LGPL-2.1+
+# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
+PYTHON_GPIOD_LICENSE_FILES = pyproject.toml
+PYTHON_GPIOD_DEPENDENCIES = libgpiod2
+PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1
+
+$(eval $(python-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
