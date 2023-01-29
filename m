Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE80C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF2860C16;
	Sun, 29 Jan 2023 16:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF2860C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMPdbRo7yP5U; Sun, 29 Jan 2023 16:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E7060BEF;
	Sun, 29 Jan 2023 16:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2E7060BEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B35791BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 994D5400D9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 994D5400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gG9BAkrNDMP for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC5D1404B3
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5D1404B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9A8788168; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e72cca9b2b60fe4fbac6b12461bf6ee4ecf08907
X-Git-Newrev: 675fdc08f673bc992e9b169363c49fbd18662555
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.A9A8788168@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-outcome: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=675fdc08f673bc992e9b169363c49fbd18662555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-outcome/Config.in           |  7 +++++++
 package/python-outcome/python-outcome.hash |  7 +++++++
 package/python-outcome/python-outcome.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 608512a4bb..b686dbd87a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1388,6 +1388,7 @@ F:	package/python-logstash/
 F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
+F:	package/python-outcome/
 F:	package/python-pathspec/
 F:	package/python-pep517/
 F:	package/python-pycares/
diff --git a/package/Config.in b/package/Config.in
index 594590a52a..195398b844 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1148,6 +1148,7 @@ menu "External python modules"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
 	source "package/python-orjson/Config.in"
+	source "package/python-outcome/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-outcome/Config.in b/package/python-outcome/Config.in
new file mode 100644
index 0000000000..bd51f3daea
--- /dev/null
+++ b/package/python-outcome/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_OUTCOME
+	bool "python-outcome"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	help
+	  Capture the outcome of Python function calls.
+
+	  https://github.com/python-trio/outcome
diff --git a/package/python-outcome/python-outcome.hash b/package/python-outcome/python-outcome.hash
new file mode 100644
index 0000000000..43796e89ac
--- /dev/null
+++ b/package/python-outcome/python-outcome.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/outcome/json
+md5  58612ee4407901985f85ad3869dd83b8  outcome-1.2.0.tar.gz
+sha256  6f82bd3de45da303cf1f771ecafa1633750a358436a8bb60e06a1ceb745d2672  outcome-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
diff --git a/package/python-outcome/python-outcome.mk b/package/python-outcome/python-outcome.mk
new file mode 100644
index 0000000000..27d7fdede3
--- /dev/null
+++ b/package/python-outcome/python-outcome.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-outcome
+#
+################################################################################
+
+PYTHON_OUTCOME_VERSION = 1.2.0
+PYTHON_OUTCOME_SOURCE = outcome-$(PYTHON_OUTCOME_VERSION).tar.gz
+PYTHON_OUTCOME_SITE = https://files.pythonhosted.org/packages/dd/91/741e1626e89fdc3664169e16300c59eefa4b23540cc6d6c70450f885098f
+PYTHON_OUTCOME_SETUP_TYPE = setuptools
+PYTHON_OUTCOME_LICENSE = Apache-2.0 or MIT
+PYTHON_OUTCOME_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
