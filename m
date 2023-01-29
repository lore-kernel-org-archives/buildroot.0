Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659A8C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0184260BEF;
	Sun, 29 Jan 2023 16:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0184260BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQzUEcbbHJSZ; Sun, 29 Jan 2023 16:42:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D5DB60A79;
	Sun, 29 Jan 2023 16:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D5DB60A79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4E871BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA1B60A79
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA1B60A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QgpB6GxrYq3 for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE19360A77
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE19360A77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CA8D88167; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14d301cbb621e1f044938d628ec47279a80ad7d0
X-Git-Newrev: e72cca9b2b60fe4fbac6b12461bf6ee4ecf08907
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.9CA8D88167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sniffio: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e72cca9b2b60fe4fbac6b12461bf6ee4ecf08907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-sniffio/Config.in           |  6 ++++++
 package/python-sniffio/python-sniffio.hash |  7 +++++++
 package/python-sniffio/python-sniffio.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6cf2b48a8f..608512a4bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1396,6 +1396,7 @@ F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
 F:	package/python-snappy/
+F:	package/python-sniffio/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
diff --git a/package/Config.in b/package/Config.in
index dd15467b11..594590a52a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1280,6 +1280,7 @@ menu "External python modules"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
+	source "package/python-sniffio/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
diff --git a/package/python-sniffio/Config.in b/package/python-sniffio/Config.in
new file mode 100644
index 0000000000..6f3947afe6
--- /dev/null
+++ b/package/python-sniffio/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SNIFFIO
+	bool "python-sniffio"
+	help
+	  Sniff out which async library your code is running under.
+
+	  https://github.com/python-trio/sniffio
diff --git a/package/python-sniffio/python-sniffio.hash b/package/python-sniffio/python-sniffio.hash
new file mode 100644
index 0000000000..00af7c58bb
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/sniffio/json
+md5  abb96bcda81817d6c632915c53ac29c8  sniffio-1.3.0.tar.gz
+sha256  e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101  sniffio-1.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
new file mode 100644
index 0000000000..fa369a0e2f
--- /dev/null
+++ b/package/python-sniffio/python-sniffio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sniffio
+#
+################################################################################
+
+PYTHON_SNIFFIO_VERSION = 1.3.0
+PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
+PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac
+PYTHON_SNIFFIO_SETUP_TYPE = setuptools
+PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
+PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
