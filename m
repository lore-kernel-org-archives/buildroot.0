Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E8DCCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 09:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D71F405F0;
	Tue, 21 Oct 2025 09:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28GjqC4rcgJo; Tue, 21 Oct 2025 09:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C4BF4054A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4BF4054A;
	Tue, 21 Oct 2025 09:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB3A43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825EA4060D
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTWpe4ag7DXw for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 09:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72E9A4044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E9A4044C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72E9A4044C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:35:01 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4EBAD2C80CE3;
 Tue, 21 Oct 2025 11:34:59 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 11:35:00 +0200
Message-ID: <20251021093500.744569-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761039299; bh=LnUbGAG/Ive6FXnBJLtB2Rx3LGFBq6GftrhJ/cX5h/o=;
 h=From:To:Cc:Subject:Date;
 b=YlBdCiQvlInCqDp2vVGrFWN83pGIGLH5LxPfV0LWCCECQkTnNuxlV37Sb6/Wwd/Mh
 8AiZz50t1hItt/U5DcR4seMexQY5FRS5yd/zXJ+Q/0eIp5z/PgQbonSYbXgsLgj/RX
 6MzbzfxAUzDDNhASpQRftSvsSiD13Mxwlk9kPAhY2RcXxqpEBqO+M2p8ePcTKoDCFh
 aCFr2Vfy4pDSu4QPsZobA42b1oHX/rW4BHyNWiSUBTG9B+Qsk8v0fX7ix1l9uTHM+X
 EY2OUqM1dmpHckGQNSMsdzK0ob7FQvvcouuzhpc6GwG3WaqdfZp+JPlQpH6NZs9muo
 jiNrcAiz6hdwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=YlBdCiQv
Subject: [Buildroot] [PATCH v2] package/python-diskcache: new package
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

The package imports itself in setup.py to get the package-name and
version number. This doesn't work during the buildroot build, so we
replace this by the hardcoded package-name and the version number stored
in buildroot.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v1 -> v2:
  - Rebase on current master
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/python-diskcache/Config.in            |  8 ++++++++
 .../python-diskcache/python-diskcache.hash    |  5 +++++
 package/python-diskcache/python-diskcache.mk  | 20 +++++++++++++++++++
 .../tests/package/sample_python_diskcache.py  |  9 +++++++++
 .../tests/package/test_python_diskcache.py    | 12 +++++++++++
 7 files changed, 58 insertions(+)
 create mode 100644 package/python-diskcache/Config.in
 create mode 100644 package/python-diskcache/python-diskcache.hash
 create mode 100644 package/python-diskcache/python-diskcache.mk
 create mode 100644 support/testing/tests/package/sample_python_diskcache.py
 create mode 100644 support/testing/tests/package/test_python_diskcache.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 66199a5b72..15266b4583 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2272,6 +2272,7 @@ F:	package/pico-sdk/
 F:	package/picotool/
 F:	package/python-apscheduler/
 F:	package/python-crc/
+F:	package/python-diskcache/
 F:	package/python-django/
 F:	package/python-immutabledict/
 F:	package/python-jc/
@@ -2287,6 +2288,7 @@ F:	package/python-waitress/
 F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
 F:	support/testing/tests/package/test_python_crc.py
+F:	support/testing/tests/package/test_python_diskcache.py
 F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
@@ -2298,6 +2300,7 @@ F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_apscheduler.py
 F:	support/testing/tests/package/sample_python_crc.py
+F:	support/testing/tests/package/sample_python_diskcache.py
 F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
diff --git a/package/Config.in b/package/Config.in
index 161d61728b..d8d5007186 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1089,6 +1089,7 @@ menu "External python modules"
 	source "package/python-dictdiffer/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-dicttoxml2/Config.in"
+	source "package/python-diskcache/Config.in"
 	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
diff --git a/package/python-diskcache/Config.in b/package/python-diskcache/Config.in
new file mode 100644
index 0000000000..4bf6c57406
--- /dev/null
+++ b/package/python-diskcache/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_DISKCACHE
+	bool "python-diskcache"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
+	help
+	  Disk Cache -- Disk and file backed persistent cache.
+
+	  http://www.grantjenks.com/docs/diskcache/
diff --git a/package/python-diskcache/python-diskcache.hash b/package/python-diskcache/python-diskcache.hash
new file mode 100644
index 0000000000..4befb40a4e
--- /dev/null
+++ b/package/python-diskcache/python-diskcache.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/diskcache/json
+md5  d92b4afa944bb70ed38c84a622f7abb5  diskcache-5.6.3.tar.gz
+sha256  2c3a3fa2743d8535d832ec61c2054a1641f41775aa7c556758a109941e33e4fc  diskcache-5.6.3.tar.gz
+# Locally computed sha256 checksums
+sha256  583546baa3fd93607d845126570677a401f508e228b5044fefbc3949af179672  LICENSE
diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
new file mode 100644
index 0000000000..327d076779
--- /dev/null
+++ b/package/python-diskcache/python-diskcache.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-diskcache
+#
+################################################################################
+
+PYTHON_DISKCACHE_VERSION = 5.6.3
+PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
+PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
+PYTHON_DISKCACHE_SETUP_TYPE = setuptools
+PYTHON_DISKCACHE_LICENSE = Apache-2.0
+PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
+
+define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
+	sed -i -e '/import diskcache/d' -e 's/diskcache.__title__/"diskcache"/' -e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' $(@D)/setup.py
+endef
+
+PYTHON_DISKCACHE_POST_PATCH_HOOKS += PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_diskcache.py b/support/testing/tests/package/sample_python_diskcache.py
new file mode 100644
index 0000000000..8ba34daf6e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_diskcache.py
@@ -0,0 +1,9 @@
+from diskcache import Cache
+
+cache = Cache()
+
+cache['test'] = 123
+assert cache['test'] == 123
+del cache['test']
+assert 'test' not in cache
+cache.close()
diff --git a/support/testing/tests/package/test_python_diskcache.py b/support/testing/tests/package/test_python_diskcache.py
new file mode 100644
index 0000000000..d8618c1681
--- /dev/null
+++ b/support/testing/tests/package/test_python_diskcache.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3DiskCache(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DISKCACHE=y
+        """
+    sample_scripts = ["tests/package/sample_python_diskcache.py"]
+    timeout = 10
-- 
2.51.1.dirty

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
