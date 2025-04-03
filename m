Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2C8C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 13:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA94846B4;
	Thu,  3 Apr 2025 13:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-UwERW3gKjT; Thu,  3 Apr 2025 13:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7F8844DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7F8844DE;
	Thu,  3 Apr 2025 13:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DAC1117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 13:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A38844DE
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 13:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOhx_O9hWK_c for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 13:34:51 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 03 Apr 2025 13:34:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E68E81338
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E68E81338
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E68E81338
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 13:34:50 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id E52D520359;
 Thu,  3 Apr 2025 08:27:41 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu,  3 Apr 2025 08:27:40 -0500
Message-Id: <20250403132740.493794-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1743686861; bh=rBM1rB4rMn82h+PbldAVKFBHyOxNGldmZtGIx9Fn7DM=;
 h=From:To:Cc:Subject:Date:From;
 b=hPgS6U3oTJ1s9zIxoSId8TVFY3X0jfM1WrbQoXnvtFdQ7XdBRC3xpNwMWhgZusyYO
 p4lhv0mMBcI8pO7kg+6wqY8QIDkz9/NLuFm9Ck85O8ZtExE47tMFyUwDfmmVKTE+K6
 7MNsH0Twbf3cAmwuUSuxhjrGlhggw2Vedcra79NU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=hPgS6U3o
Subject: [Buildroot] [PATCH] package/python-smbus2: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add python-smbus2 as an alternative for python-smbus-cffi as the latter
has not seen updates in 8 years and was archived on Jan 4 2024.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/Config.in                        |  1 +
 package/python-smbus2/Config.in          |  7 +++++++
 package/python-smbus2/python-smbus2.hash |  5 +++++
 package/python-smbus2/python-smbus2.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-smbus2/Config.in
 create mode 100644 package/python-smbus2/python-smbus2.hash
 create mode 100644 package/python-smbus2/python-smbus2.mk

diff --git a/package/Config.in b/package/Config.in
index eb22c81d1d..291e784f26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1403,6 +1403,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbprotocol/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-smbus2/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
 	source "package/python-sniffio/Config.in"
diff --git a/package/python-smbus2/Config.in b/package/python-smbus2/Config.in
new file mode 100644
index 0000000000..fdacae6da1
--- /dev/null
+++ b/package/python-smbus2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SMBUS2
+	bool "python-smbus2"
+	help
+	  smbus2 is a drop-in replacement for smbus-cffi/smbus-python
+	  in pure Python.
+
+	  https://github.com/kplindegaard/smbus2
diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
new file mode 100644
index 0000000000..65f9eefaf6
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/smbus2/json
+md5  5708a6cbf052f45a3ad6dd83c00902a6  smbus2-0.5.0.tar.gz
+sha256  4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035  smbus2-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
new file mode 100644
index 0000000000..c416a55005
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smbus2
+#
+################################################################################
+
+PYTHON_SMBUS2_VERSION = 0.5.0
+PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/10/c9/6d85aa809e107adf85303010a59b340be109c8f815cbedc5c08c73bcffef
+PYTHON_SMBUS2_SETUP_TYPE = setuptools
+PYTHON_SMBUS2_LICENSE = MIT
+PYTHON_SMBUS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
