Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B41E7DEFE
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B4540B69;
	Mon,  2 Feb 2026 16:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMsbO0Xoc7IB; Mon,  2 Feb 2026 16:32:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD1240B72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770049947;
	bh=LZ9/IzK3WmbhD9nqmbJHK4hxH4oJ0ssXD9UTpPUIH+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EedDJoLDttxXYPdVYd0IXP8Xlwqx6Ua2Kau5PAFYeHjiQuR3FZaDoPdQqC1EDRzc6
	 K3RBBOCKgdtvSUxwlAXsYuwK+WUE59fZlB4sYOaFrbkq/qknbN/nLzvi+aXYeruzjA
	 MP/tFsiV0wYU2VwVn+doNn0TrIzpUBYal3BOcoH3kz8p0hQ28xF9OKs3KQV1hUEVgg
	 FsLG7AE5y3LstMp/q9hi6Pf6kfsbhj+vPwTcSbd+U9UX/mKT/PNpb27ZtE1/FDJcMQ
	 +onh5Y5H1gAQvxjwDJpXbki9cQtJ8LH0cuNw61AoeiTF8vLdlpqCFrzeVPNBhhZ/rC
	 NECXVUOjRMkNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD1240B72;
	Mon,  2 Feb 2026 16:32:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5499C1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 372B460BBD
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMjUL3-YElbH for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 528006060A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 528006060A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3685E863CC; Mon,  2 Feb 2026 16:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 17:32:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a6e81fa13b8c36fc743a358773bbeebcbed0c92
X-Git-Newrev: 934d3e62e658a641e2236afcf1cb60fe0385f78d
X-Patchwork-Hint: ignore
Message-Id: <20260202163225.3685E863CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-diskcache: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=934d3e62e658a641e2236afcf1cb60fe0385f78d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package imports itself in setup.py to get the package-name and
version number. Dping this during the buildroot build would require
buisling host-python with sqlite support, which we are currently not set
up for. It also seems wasteful for just extracting the version number
and package name, so instead we replace the import by using a hardcoded
package-name and the version number stored in buildroot.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-diskcache/Config.in                 |  8 +++++++
 package/python-diskcache/python-diskcache.hash     |  5 +++++
 package/python-diskcache/python-diskcache.mk       | 26 ++++++++++++++++++++++
 .../tests/package/sample_python_diskcache.py       |  9 ++++++++
 .../testing/tests/package/test_python_diskcache.py | 12 ++++++++++
 7 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a81272d20..8290ccc281 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2263,6 +2263,7 @@ F:	package/picotool/
 F:	package/python-annotated-doc/
 F:	package/python-apscheduler/
 F:	package/python-crc/
+F:	package/python-diskcache/
 F:	package/python-django/
 F:	package/python-gpiod/
 F:	package/python-immutabledict/
@@ -2280,6 +2281,7 @@ F:	package/python-waitress/
 F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
 F:	support/testing/tests/package/test_python_crc.py
+F:	support/testing/tests/package/test_python_diskcache.py
 F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
@@ -2293,6 +2295,7 @@ F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_apscheduler.py
 F:	support/testing/tests/package/sample_python_crc.py
+F:	support/testing/tests/package/sample_python_diskcache.py
 F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
diff --git a/package/Config.in b/package/Config.in
index 94ea56b297..41fc5af330 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1084,6 +1084,7 @@ menu "External python modules"
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
index 0000000000..70b53469d8
--- /dev/null
+++ b/package/python-diskcache/python-diskcache.mk
@@ -0,0 +1,26 @@
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
+# diskcache imports itself during the build to get its own version,
+# which doesn't work in the Buildroot context, so we inject the
+# package name and version manually.
+define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
+	sed -i -e '/import diskcache/d' \
+		-e 's/diskcache.__title__/"diskcache"/' \
+		-e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' \
+		$(@D)/setup.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
