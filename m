Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989C6F53D9B
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0631241112;
	Mon, 16 Mar 2026 21:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2wAp0Cb7uyH; Mon, 16 Mar 2026 21:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6BBF40A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773697398;
	bh=4vP4o1z44H3jAlzkce4xALdvaregnjMygAdYxqzvzso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sxthWB/eYKLc3WVFyOTtTTDEbFQFbrykXHj+qtVfPphB4bi0yLSq4hF/XKl0Q+z6Z
	 E/EjIqYtnj7+50bDscXeeejFbmn/fmELQB9Vgl0ce7aXiZeoVxdelFwyGtK/bUwGg3
	 thqlYffqFE8jpeBnMiuiHHgReE2ztMY/Tlsy2BggqNUUjPqffYL2I5i8ZtcAwX25zo
	 d9z3J3H/KZrZQMsER3VjgSJlyCi2ryYeSmXwg7U0jnh7laKOXztlPAGD8ZgZdNdcW0
	 L9AyvUr4WA5JYyEHZR1qJ7ky32jkJmeoxqkbHxLax9BUiPfTLUCGG7z6gpqafG8OK+
	 KB+iqhMFWu6Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6BBF40A72;
	Mon, 16 Mar 2026 21:43:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B59693C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33254080A
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Txw0jLYpNtZ for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DAB840488
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DAB840488
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:43:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 923F7870F7; Mon, 16 Mar 2026 21:43:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 22:34:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49c1e1181f16ae1dd9ec3eac931a50961b02e893
X-Git-Newrev: e190962f3e7d27e6831e3c2e5e81d66fb4e55b40
X-Patchwork-Hint: ignore
Message-Id: <20260316214315.923F7870F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanfriendly: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e190962f3e7d27e6831e3c2e5e81d66fb4e55b40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
[Julien:
 - add DEVELOPERS entry
 - fix test class name
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-humanfriendly/Config.in                   |  7 +++++++
 package/python-humanfriendly/python-humanfriendly.hash   |  3 +++
 package/python-humanfriendly/python-humanfriendly.mk     | 16 ++++++++++++++++
 .../testing/tests/package/sample_python_humanfriendly.py |  6 ++++++
 .../testing/tests/package/test_python_humanfriendly.py   | 12 ++++++++++++
 7 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5293d94649..b722b5fd51 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3456,6 +3456,7 @@ N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
 F:	package/gpsd/
 F:	package/mosquitto/
+F:	package/python-humanfriendly/
 F:	package/skopeo/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
diff --git a/package/Config.in b/package/Config.in
index fab482c52f..49ff5e957c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1153,6 +1153,7 @@ menu "External python modules"
 	source "package/python-httplib2/Config.in"
 	source "package/python-httpx/Config.in"
 	source "package/python-huepy/Config.in"
+	source "package/python-humanfriendly/Config.in"
 	source "package/python-humanize/Config.in"
 	source "package/python-hwdata/Config.in"
 	source "package/python-hyperframe/Config.in"
diff --git a/package/python-humanfriendly/Config.in b/package/python-humanfriendly/Config.in
new file mode 100644
index 0000000000..06197843b3
--- /dev/null
+++ b/package/python-humanfriendly/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_HUMANFRIENDLY
+	bool "python-humanfriendly"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Human friendly input/output for text interfaces using Python.
+
+	  https://github.com/xolox/python-humanfriendly/
diff --git a/package/python-humanfriendly/python-humanfriendly.hash b/package/python-humanfriendly/python-humanfriendly.hash
new file mode 100644
index 0000000000..35f9395325
--- /dev/null
+++ b/package/python-humanfriendly/python-humanfriendly.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/project/humanfriendly/#humanfriendly-10.0.tar.gz
+sha256  6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc  humanfriendly-10.0.tar.gz
+sha256  4ac48f4117809f2734066150450f120b3bb110ac1d3b32170795e0560dbbc1f5  LICENSE.txt
diff --git a/package/python-humanfriendly/python-humanfriendly.mk b/package/python-humanfriendly/python-humanfriendly.mk
new file mode 100644
index 0000000000..fcf3b47924
--- /dev/null
+++ b/package/python-humanfriendly/python-humanfriendly.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-humanfriendly
+#
+################################################################################
+
+PYTHON_HUMANFRIENDLY_VERSION = 10.0
+PYTHON_HUMANFRIENDLY_SOURCE = humanfriendly-$(PYTHON_HUMANFRIENDLY_VERSION).tar.gz
+PYTHON_HUMANFRIENDLY_SITE = https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43
+
+PYTHON_HUMANFRIENDLY_LICENSE = MIT
+PYTHON_HUMANFRIENDLY_LICENSE_FILES = LICENSE.txt
+
+PYTHON_HUMANFRIENDLY_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_humanfriendly.py b/support/testing/tests/package/sample_python_humanfriendly.py
new file mode 100644
index 0000000000..31269a58f4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_humanfriendly.py
@@ -0,0 +1,6 @@
+import humanfriendly as hf
+
+
+h_size = "16MiB"
+b_size = hf.parse_size(h_size)
+assert b_size == 16*1024*1024
diff --git a/support/testing/tests/package/test_python_humanfriendly.py b/support/testing/tests/package/test_python_humanfriendly.py
new file mode 100644
index 0000000000..1e70992e92
--- /dev/null
+++ b/support/testing/tests/package/test_python_humanfriendly.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3HumanFriendly(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_CURSES=y
+        BR2_PACKAGE_PYTHON_HUMANFRIENDLY=y
+        """
+    sample_scripts = ["tests/package/sample_python_humanfriendly.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
