Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447B7C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC654708B3;
	Fri, 28 Feb 2025 17:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7KFVFCZw5E8; Fri, 28 Feb 2025 17:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 847AE708C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847AE708C7;
	Fri, 28 Feb 2025 17:14:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1872668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFB5A42F71
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYxWWhVA9qHh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B7754336C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B7754336C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43C34867E5; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 12:58:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2a862fe603b1d0c52249f58b8eacf85a0d37b8a
X-Git-Newrev: 38090cdbb610e60015c288e80b1aaedc3d052af4
X-Patchwork-Hint: ignore
Message-Id: <20250228163034.43C34867E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-aiohttp-sse-client: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=38090cdbb610e60015c288e80b1aaedc3d052af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds the python-aiohttp-sse-client package to buildroot.
This package adds SSE client support to the aiohttp library, as
opposed to the already exising python-aiohttp-sse package, which
only adds sse server support.

Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 ...setup.py-remove-pytest-runner-requirement.patch | 37 ++++++++++++++++++++++
 package/python-aiohttp-sse-client/Config.in        | 10 ++++++
 .../python-aiohttp-sse-client.hash                 |  5 +++
 .../python-aiohttp-sse-client.mk                   | 14 ++++++++
 6 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f20bd5ce3f..1264c26fbd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -275,6 +275,9 @@ F:	configs/snps_archs38_hsdk_defconfig
 N:	Arnaud Aujon <arnaud@intelibre.fr>
 F:	package/espeak/
 
+N:	Arno Messiaen <arnomessiaen@gmail.com>
+F:	package/python-aiohttp-sse-client/
+
 N:	Arnout Vandecappelle <arnout@mind.be>
 F:	package/arp-scan/
 F:	package/dehydrated/
diff --git a/package/Config.in b/package/Config.in
index 7da8e10c36..4896e6db76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -982,6 +982,7 @@ menu "External python modules"
 	source "package/python-aiohttp-security/Config.in"
 	source "package/python-aiohttp-session/Config.in"
 	source "package/python-aiohttp-sse/Config.in"
+	source "package/python-aiohttp-sse-client/Config.in"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
diff --git a/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch b/package/python-aiohttp-sse-client/0001-setup.py-remove-pytest-runner-requirement.patch
new file mode 100644
index 0000000000..59fc775f0f
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
+Upstream: N/A, Buildroot packaging related
+Signed-off-by: Arno Messiaen <arnomessiaen@gmail.com>
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
index 0000000000..2a89791b99
--- /dev/null
+++ b/package/python-aiohttp-sse-client/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_SSE_CLIENT
+	bool "python-aiohttp-sse-client"
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_YARL # runtime
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
