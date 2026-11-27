Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB387606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NysFzsXz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=DXfXSWHW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891744090C;
	Fri, 27 Nov 2026 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0mg2PkWkLEl; Fri, 27 Nov 2026 13:36:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4401D40911
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795786571;
	b=rftdy8EbwVtkWyzk6cOnY4qtQ3woS7koq7TOfbOQDizCl5rYPjDrN+sg3MzZF4l68VNP
	 RDx1HgNe6iEmB6vbOYjBpZK6sFon47PzIPyAAKd0fiVxbY64HQHanaKwCiVaaV1y9U1Ns
	 v3u81IAagNIrgktX6pZxLRMu8KIf6/0VsyLeQTsSKi43HHpnZQsoh9ieoqEYuo+Wj4Fqw
	 Zxuc7A6w1e2Mm8junTYPDOPElTd5rP4GMOLzbC0BFNXIufIYPQdNKihjJ7Gm2YP6L+uYh
	 WpaBVgE4ARVZn4YOS9Sbfv25M7Jl2J0S75XTYPCXsgP+clKvjRmVkmO6lLNPB2pguRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795786571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Rspamd-Queue-Id:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1h/7r0F3jBZvuLMWmh3PMOziwdiXFK/YDlla3APNzAk=;
	b=W/hUrlY5gs9i2MHdHTB+YobTYdqhI3XUozBwOyeZ/z8p15PGabZaWJD0/t9M+f4kqYMf
	 OdkxJnd2n5XqlTPg0CmCj4LU2wvEBTkOjtMW/wNPPKUgiB1B+5W7B3ZGQIRK+Oswl6bPs
	 FD4d2QuI9oZYsNVZNTtG1eJDxn17SEqYmxWrUnprIqoM68BKPBR6r38EMdJKwJQchVmeO
	 mZ9+KUv86WZ8nhT5Cj+hLjj2QrSiJVOVHqxez6efgTtQZIpsgcdD7HXjvg9E+P7q97o8I
	 piHAce3O8e8ji+UXErnGN0A8m2Q8Nlzs+lGd+eM2QlsBHsxIaM40m/1WtfOwTeVF7dA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795786571;
	bh=1h/7r0F3jBZvuLMWmh3PMOziwdiXFK/YDlla3APNzAk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NysFzsXzn7CxZvwHiJk/QabMrfVVouIF/05MAAd6kup12kYp4w+u/rKWCUaoZNdPH
	 vACObMtiUrr9KWwa+fcNTI5MrghADiPLyMCpIFD4jJYupXc/WzVDsmBTfwPpEH9T/f
	 DaPVtgnhItfRrFpaBWvipQGLdHCWZI+R+BwyrzMj/dyP7QK1/wZfDl1a4AcRgYr65V
	 gSXuUmPLUUogEdOx/FcxJM2Dunc+M/jHSdjVHZ6dv2TwKdSjjCH6aCdHoWEtU/znRq
	 cwdEocUjXlLmfoLzGGlOh/HyoI+aZ/s74qjxYmeDBGT2vxBJAS8IVxyFPw8ivzyM/C
	 +8OIinLW1E7uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4401D40911;
	Fri, 27 Nov 2026 13:36:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0CD4D1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A286F400F5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyBD8lRQmfzA for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 13:36:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E3284004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=195.10.208.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.42;
 helo=mout-b-112.mailbox.org; envelope-from=sebastian.michel@oss.othermo.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=DXfXSWHW
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E3284004D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 13:36:07 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jbZF01G4Pz5w72;
 Fri, 27 Nov 2026 14:36:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1795786564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QhPjYcStTcDP3Snojh1cJCdJmnR0595WbpTrv2j0fKc=;
 b=DXfXSWHW/vIT/YfwJeKXG8EphF9Z5aJ+z0m9RrECPVLPDYW4JQC8IITRn9ssKyg3yLlGaT
 y7qGLgYl9Q2wZ3fvREHaTKB7GG6cuK61arNGq36EZ7VUECzl2X4xxESZ0UgvyO7m5ZVgLP
 DL9sVBIKfpd7aff6EYEYBCMdSQifYHgkUYdOzl8i94xyuKBJlQzMLNefI1FvV/okTW8a7f
 IrnoAXgJs/IrNMcp66kX5PXzeBO0OEBhSmSZniBwm7uiiPRfpD4fxQ5WsqLN7jq+iTlT9v
 o0+fkz+MbdTnAunRy46J4VI9HrZe3zEbb1rUXHbCtQuNkmwOJFLXp6+qshdn3w==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Date: Fri, 27 Nov 2026 14:34:33 +0100
Message-ID: <20261127133434.3434822-1-sebastian.michel@oss.othermo.de>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4jbZF01G4Pz5w72
Subject: [Buildroot] [PATCH] package/python-udsoncan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sebastian Michel <sebastian.michel@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Python library of the Unified Diagnostic Services
(UDS) protocol (ISO 14229).

https://github.com/pylessard/python-udsoncan

Add a runtime test covering request and response encoding
and decoding.

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/python-udsoncan/Config.in             |  7 ++++++
 package/python-udsoncan/python-udsoncan.hash  |  5 ++++
 package/python-udsoncan/python-udsoncan.mk    | 14 +++++++++++
 .../tests/package/sample_python_udsoncan.py   | 24 +++++++++++++++++++
 .../tests/package/test_python_udsoncan.py     | 11 +++++++++
 7 files changed, 65 insertions(+)
 create mode 100644 package/python-udsoncan/Config.in
 create mode 100644 package/python-udsoncan/python-udsoncan.hash
 create mode 100644 package/python-udsoncan/python-udsoncan.mk
 create mode 100644 support/testing/tests/package/sample_python_udsoncan.py
 create mode 100644 support/testing/tests/package/test_python_udsoncan.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..7b19cb2fc1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3051,6 +3051,9 @@ N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
 N:	Sebastian Michel <sebastian.michel@oss.othermo.de>
+F:	package/python-udsoncan/
+F:	support/testing/tests/package/sample_python_udsoncan.py
+F:	support/testing/tests/package/test_python_udsoncan.py
 F:	package/python-servestatic/
 F:	support/testing/tests/package/sample_python_servestatic.py
 F:	support/testing/tests/package/test_python_servestatic.py
diff --git a/package/Config.in b/package/Config.in
index 49659b007e..5fbc2f4c99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1514,6 +1514,7 @@ menu "External python modules"
 	source "package/python-tzlocal/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
+	source "package/python-udsoncan/Config.in"
 	source "package/python-uhid/Config.in"
 	source "package/python-ujson/Config.in"
 	source "package/python-unittest-xml-reporting/Config.in"
diff --git a/package/python-udsoncan/Config.in b/package/python-udsoncan/Config.in
new file mode 100644
index 0000000000..1e73f33cc5
--- /dev/null
+++ b/package/python-udsoncan/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_UDSONCAN
+	bool "python-udsoncan"
+	help
+	  Implementation of the Unified Diagnostic Service (UDS)
+	  protocol (ISO-14229) used in the automotive industry.
+
+	  https://github.com/pylessard/python-udsoncan
diff --git a/package/python-udsoncan/python-udsoncan.hash b/package/python-udsoncan/python-udsoncan.hash
new file mode 100644
index 0000000000..3e32a79ae1
--- /dev/null
+++ b/package/python-udsoncan/python-udsoncan.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/udsoncan/json
+md5  48b0f56bce03ff1d2ce28e9d65d047ac  udsoncan-1.26.1.tar.gz
+sha256  e4e04df9ad3be4f1dd6cc6dd580aa8a25cb842b3bb1b10c482d3cffa07303910  udsoncan-1.26.1.tar.gz
+# Locally computed sha256 checksums
+sha256  aae122e22b842c7fe113e6968ff00a52619d3a11b37f7791eebecb7fc7042103  LICENSE.txt
diff --git a/package/python-udsoncan/python-udsoncan.mk b/package/python-udsoncan/python-udsoncan.mk
new file mode 100644
index 0000000000..b7cfd427fe
--- /dev/null
+++ b/package/python-udsoncan/python-udsoncan.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-udsoncan
+#
+################################################################################
+
+PYTHON_UDSONCAN_VERSION = 1.26.1
+PYTHON_UDSONCAN_SOURCE = udsoncan-$(PYTHON_UDSONCAN_VERSION).tar.gz
+PYTHON_UDSONCAN_SITE = https://files.pythonhosted.org/packages/b1/8e/7d0a876681f1578711c96a2996b114fd77d4a5786a9f00f440bc8655269a
+PYTHON_UDSONCAN_SETUP_TYPE = setuptools
+PYTHON_UDSONCAN_LICENSE = MIT
+PYTHON_UDSONCAN_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_udsoncan.py b/support/testing/tests/package/sample_python_udsoncan.py
new file mode 100644
index 0000000000..2c559b4bf0
--- /dev/null
+++ b/support/testing/tests/package/sample_python_udsoncan.py
@@ -0,0 +1,24 @@
+# Based on the upstream Request and Response examples:
+# https://udsoncan.readthedocs.io/en/latest/udsoncan/request_response.html
+
+from udsoncan import Request, Response
+from udsoncan.services import ECUReset
+
+req = Request(service=ECUReset, subfunction=1, data=b'\x99\x88')
+payload = req.get_payload()
+
+assert payload == b'\x11\x01\x99\x88'
+req2 = Request.from_payload(payload)
+assert req2.service == req.service
+assert req2.subfunction == req.subfunction
+assert req2.data == req.data
+
+response = Response(service=ECUReset, code=Response.Code.PositiveResponse, data=b'\x11\x22')
+payload = response.get_payload()
+assert payload == b'\x51\x11\x22'
+response2 = Response.from_payload(payload)
+assert response2.valid
+assert response2.positive
+assert response2.service == response.service
+assert response2.code == response.code
+assert response2.data == response.data
diff --git a/support/testing/tests/package/test_python_udsoncan.py b/support/testing/tests/package/test_python_udsoncan.py
new file mode 100644
index 0000000000..307fabb921
--- /dev/null
+++ b/support/testing/tests/package/test_python_udsoncan.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonUdsoncan(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_UDSONCAN=y
+        """
+    sample_scripts = ["tests/package/sample_python_udsoncan.py"]
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
