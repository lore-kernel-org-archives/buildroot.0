Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BECCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6D560EB8;
	Sat, 18 Oct 2025 19:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g41Bq0tk6IWF; Sat, 18 Oct 2025 19:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7B360E57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7B360E57;
	Sat, 18 Oct 2025 19:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DF511CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84B6E60E57
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTOCw52NrRrq for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DB1060E52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB1060E52
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DB1060E52
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D4BD34E41186;
 Sat, 18 Oct 2025 19:43:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ACFB06069D;
 Sat, 18 Oct 2025 19:43:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1121102F238D; 
 Sat, 18 Oct 2025 21:43:54 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:04 +0200
Message-ID: <20251018194314.114284-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816635; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=7C5xyjdD9Cp2eDGxYmbLwJRPMcv2BieoZ/qWHE49sco=;
 b=G/hi2/SvlvHD+w1zrN8HhVsc06JTBd9UwLxrIM/Ae0tok7XZ4GOMV9FTJQpYNBCJYe/d0E
 Q5HBY45PPfAdNpplm5E1fTNfrW/mcX7h55nekK3IGyLtHrD7WTFmV6jDzWZ6L7JRL5gBfc
 zEdIfNJUCRDzpereHijyRWunGl9Hrsk0mFjL6cctNz0A1ZYR85DlIrxxhN5AUEafLNkxOk
 Ik+6v5TlJe1mFiD4e+LfvcsASQjY8SiDbwYEVGpg/Rmn31YppoVkooWDYaKpVfQZjSwPiF
 e2n4p7BRThq6pIdFr4yRQRSH5rjbEbYVLXT4Plcy+kU+tT4swisfKyfdj6/lFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=G/hi2/Sv
Subject: [Buildroot] [PATCH 06/11] package/python-pyusb: enable host variant
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host variant of python-pyusb will be neded for Snagboot, so it is
enabled with this commit. In addition, we're adding a very simple test
case to validate that host-python-pyusb minimally works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         | 1 +
 package/python-pyusb/python-pyusb.mk               | 2 ++
 support/testing/tests/package/test_python_pyusb.py | 9 +++++++++
 3 files changed, 12 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_pyusb.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6b525538d7..4501a1c98d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index 7f4c9724f2..cce48e0df8 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -11,5 +11,7 @@ PYTHON_PYUSB_LICENSE = BSD-3-Clause
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = setuptools
 PYTHON_PYUSB_DEPENDENCIES = host-python-setuptools-scm libusb
+HOST_PYTHON_PYUSB_DEPENDENCIES = host-python-setuptools-scm host-libusb
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pyusb.py b/support/testing/tests/package/test_python_pyusb.py
new file mode 100644
index 0000000000..1e0dbba446
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyusb.py
@@ -0,0 +1,9 @@
+import infra.basetest
+
+
+class TestHostPythonPyusb(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pyusb"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import usb"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
