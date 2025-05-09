Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71030C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A45670BB1;
	Mon, 19 May 2025 10:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHKhppano21D; Mon, 19 May 2025 10:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8DB70BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8DB70BB0;
	Mon, 19 May 2025 10:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BFE9E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F94B4138E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNrrgdnGDt8g for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D44B41482
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D44B41482
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B851873D5; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 May 2025 18:38:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 380dc9332f13c1279338d0aedd96a9aa22389ccf
X-Git-Newrev: 02de34989560b40a963fa13dddfb4714470fec25
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.7B851873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flask-restx:
 new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02de34989560b40a963fa13dddfb4714470fec25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support REST APIs with Flask applications
https://flask-restx.readthedocs.io/en/latest/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-flask-restx/Config.in               | 12 ++++++++++++
 package/python-flask-restx/python-flask-restx.hash |  5 +++++
 package/python-flask-restx/python-flask-restx.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d314be7946..36bf42da32 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -728,6 +728,7 @@ N:	Daniel Crowe <daniel.crowe@maxmine.com.au>
 F:	package/python-aniso8601/
 F:	package/python-cachelib/
 F:	package/python-flask-caching/
+F:	package/python-flask-restx/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 59ac4ad070..9e4b0ea167 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
+	source "package/python-flask-restx/Config.in"
 	source "package/python-flask-smorest/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flask-wtf/Config.in"
diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
new file mode 100644
index 0000000000..4906869a38
--- /dev/null
+++ b/package/python-flask-restx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FLASK_RESTX
+	bool "python-flask-restx"
+	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
+	help
+	  Fully featured framework for fast, easy and documented API
+	  development with Flask.
+
+	  https://github.com/python-restx/flask-restx
diff --git a/package/python-flask-restx/python-flask-restx.hash b/package/python-flask-restx/python-flask-restx.hash
new file mode 100644
index 0000000000..f90601cdc1
--- /dev/null
+++ b/package/python-flask-restx/python-flask-restx.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/flask-restx/json
+md5  262984a0c902db0b6f4afb86a69ea40e  flask-restx-1.3.0.tar.gz
+sha256  4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728  flask-restx-1.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d736fc20d979831ab5c380973d01542de97857d975b60a4cf03efbd9e4e38997  LICENSE
diff --git a/package/python-flask-restx/python-flask-restx.mk b/package/python-flask-restx/python-flask-restx.mk
new file mode 100644
index 0000000000..23596f23d4
--- /dev/null
+++ b/package/python-flask-restx/python-flask-restx.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-restx
+#
+################################################################################
+
+PYTHON_FLASK_RESTX_VERSION = 1.3.0
+PYTHON_FLASK_RESTX_SOURCE = flask-restx-$(PYTHON_FLASK_RESTX_VERSION).tar.gz
+PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/45/4c/2e7d84e2b406b47cf3bf730f521efe474977b404ee170d8ea68dc37e6733
+PYTHON_FLASK_RESTX_SETUP_TYPE = setuptools
+PYTHON_FLASK_RESTX_LICENSE = BSD-3-Clause
+PYTHON_FLASK_RESTX_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
