Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B56C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D028177A;
	Sun, 29 Jan 2023 16:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D028177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5QQrxQXSKJ2V; Sun, 29 Jan 2023 16:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 488A881778;
	Sun, 29 Jan 2023 16:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 488A881778
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6FC01BF869
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0E7581772
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E7581772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZI1BpQ_AoZjZ for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83A68140E
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83A68140E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B645388169; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 675fdc08f673bc992e9b169363c49fbd18662555
X-Git-Newrev: c09481f7f0419e8a69a2813052bc56895a598353
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.B645388169@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c09481f7f0419e8a69a2813052bc56895a598353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-trio/Config.in        | 12 ++++++++++++
 package/python-trio/python-trio.hash |  7 +++++++
 package/python-trio/python-trio.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b686dbd87a..9fdc66f60b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1402,6 +1402,7 @@ F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
+F:	package/python-trio/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
diff --git a/package/Config.in b/package/Config.in
index 195398b844..aa6bb7bce3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1306,6 +1306,7 @@ menu "External python modules"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
+	source "package/python-trio/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio/Config.in b/package/python-trio/Config.in
new file mode 100644
index 0000000000..0aa53c90ca
--- /dev/null
+++ b/package/python-trio/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_TRIO
+	bool "python-trio"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_OUTCOME # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
+	help
+	  A friendly Python library for async concurrency and I/O.
+
+	  https://github.com/python-trio/trio
diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
new file mode 100644
index 0000000000..487194662e
--- /dev/null
+++ b/package/python-trio/python-trio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/trio/json
+md5  f7dbfa6a8722065f09da188641d8ed93  trio-0.22.0.tar.gz
+sha256  ce68f1c5400a47b137c5a4de72c7c901bd4e7a24fbdebfe9b41de8c6c04eaacf  trio-0.22.0.tar.gz
+# Locally computed sha256 checksums
+sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  faa301d72dcc023b432bd77dc08a773ca3449e5c27440b9d66eb46fb8500b430  LICENSE.MIT
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
new file mode 100644
index 0000000000..80da203c15
--- /dev/null
+++ b/package/python-trio/python-trio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-trio
+#
+################################################################################
+
+PYTHON_TRIO_VERSION = 0.22.0
+PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/0b/b8/1b81d2149c3e2c25900d40b8e6c8d3ca502a3cc844b90c962b0854aaf3f3
+PYTHON_TRIO_SETUP_TYPE = setuptools
+PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
+PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
