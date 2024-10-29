Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A7D3A699
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9532780E30;
	Tue, 29 Oct 2024 20:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOAM-o0wQwzO; Tue, 29 Oct 2024 20:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3088680E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3088680E32;
	Tue, 29 Oct 2024 20:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF184EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A4FD408E8
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbTy3Lmf1QfU for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC17405F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC17405F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:33:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62B78848D1; Tue, 29 Oct 2024 20:33:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 21:30:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9682ac24fe4fcb8af37ebc44a0355923b25a3a76
X-Git-Newrev: 8d1ec57d008e1d4d56293014f9cfbdc77b6fd302
X-Patchwork-Hint: ignore
Message-Id: <20241029203353.62B78848D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyaml: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d1ec57d008e1d4d56293014f9cfbdc77b6fd302
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/python-pyaml/Config.in         |  8 ++++++++
 package/python-pyaml/python-pyaml.hash |  5 +++++
 package/python-pyaml/python-pyaml.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 72b8d8bdc9..f8d4e4d24c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1281,6 +1281,7 @@ menu "External python modules"
 	source "package/python-py/Config.in"
 	source "package/python-pyaes/Config.in"
 	source "package/python-pyalsa/Config.in"
+	source "package/python-pyaml/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pyasynchat/Config.in"
diff --git a/package/python-pyaml/Config.in b/package/python-pyaml/Config.in
new file mode 100644
index 0000000000..72d00d5c4c
--- /dev/null
+++ b/package/python-pyaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYAML
+	bool "python-pyaml"
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  PyYAML-based module to produce a bit more pretty and
+	  readable YAML-serialized data.
+
+	  https://github.com/mk-fg/pretty-yaml
diff --git a/package/python-pyaml/python-pyaml.hash b/package/python-pyaml/python-pyaml.hash
new file mode 100644
index 0000000000..06e99448d0
--- /dev/null
+++ b/package/python-pyaml/python-pyaml.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyaml/json
+md5  1301f53ad68626ac295c2663315b1804  pyaml-24.9.0.tar.gz
+sha256  e78dee8b0d4fed56bb9fa11a8a7858e6fade1ec70a9a122cee6736efac3e69b5  pyaml-24.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  dc1342cc1cb49e24c1c9e8a495acc9625ce2e04146c116279af0ab0949cd829c  COPYING
diff --git a/package/python-pyaml/python-pyaml.mk b/package/python-pyaml/python-pyaml.mk
new file mode 100644
index 0000000000..e908aa089a
--- /dev/null
+++ b/package/python-pyaml/python-pyaml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyaml
+#
+################################################################################
+
+PYTHON_PYAML_VERSION = 24.9.0
+PYTHON_PYAML_SOURCE = pyaml-$(PYTHON_PYAML_VERSION).tar.gz
+PYTHON_PYAML_SITE = https://files.pythonhosted.org/packages/fd/a6/5b51160ff7ce60b0c60ec825359c0e818b0ce4a2504fa3dd1470f42f9b10
+PYTHON_PYAML_SETUP_TYPE = setuptools
+PYTHON_PYAML_LICENSE = WTFPL
+PYTHON_PYAML_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
