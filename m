Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C0CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5BB440247;
	Sun, 22 Sep 2024 18:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtuHlah7ABnG; Sun, 22 Sep 2024 18:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18922402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18922402BC;
	Sun, 22 Sep 2024 18:04:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA961BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38D6D40247
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWc7vaJHhI1Q for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0662340018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0662340018
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F01868430A; Sun, 22 Sep 2024 18:04:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:49:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d3eae42cb7b8c8ed671f449c2227ba8f00e5db6
X-Git-Newrev: 143b6331a9bffd9264794867c0c21aaf148242d7
X-Patchwork-Hint: ignore
Message-Id: <20240922180446.F01868430A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmpcrypto: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=143b6331a9bffd9264794867c0c21aaf148242d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                    |  1 +
 package/python-pysnmpcrypto/Config.in                |  9 +++++++++
 package/python-pysnmpcrypto/python-pysnmpcrypto.hash |  5 +++++
 package/python-pysnmpcrypto/python-pysnmpcrypto.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2200f16520..c0b64de7f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1322,6 +1322,7 @@ menu "External python modules"
 	source "package/python-pysmi/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pysnmpcrypto/Config.in"
 	source "package/python-pysocks/Config.in"
 	source "package/python-pyspnego/Config.in"
 	source "package/python-pytablereader/Config.in"
diff --git a/package/python-pysnmpcrypto/Config.in b/package/python-pysnmpcrypto/Config.in
new file mode 100644
index 0000000000..da9dd6cf43
--- /dev/null
+++ b/package/python-pysnmpcrypto/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYSNMPCRYPTO
+	bool "python-pysnmpcrypto"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	help
+	  Strong cryptography support for PySNMP (SNMP library for
+	  Python).
+
+	  https://github.com/lextudio/pysnmpcrypto
diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.hash b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
new file mode 100644
index 0000000000..d36d20b43f
--- /dev/null
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pysnmpcrypto/json
+md5  969f3690cf2ba4309c047af31d17617e  pysnmpcrypto-0.1.0.tar.gz
+sha256  ee6819247ceee09aa2de54b998c51ccf595d75a9ccc2e303383b39a5ac63816c  pysnmpcrypto-0.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  24c90090900edc62b49e27888132293a096248408f73993dc8f0147a6fe200ae  LICENSE.rst
diff --git a/package/python-pysnmpcrypto/python-pysnmpcrypto.mk b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
new file mode 100644
index 0000000000..4472434286
--- /dev/null
+++ b/package/python-pysnmpcrypto/python-pysnmpcrypto.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pysnmpcrypto
+#
+################################################################################
+
+PYTHON_PYSNMPCRYPTO_VERSION = 0.1.0
+PYTHON_PYSNMPCRYPTO_SOURCE = pysnmpcrypto-$(PYTHON_PYSNMPCRYPTO_VERSION).tar.gz
+PYTHON_PYSNMPCRYPTO_SITE = https://files.pythonhosted.org/packages/e6/70/b71f5f1321ea548a7152fc23926258caaec353c8c3edce1aaafbb030ba76
+PYTHON_PYSNMPCRYPTO_SETUP_TYPE = pep517
+PYTHON_PYSNMPCRYPTO_LICENSE = BSD-2-Clause
+PYTHON_PYSNMPCRYPTO_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSNMPCRYPTO_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
