Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD87C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CDBE40026;
	Tue,  9 Jul 2024 19:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtpOP9RRMI2d; Tue,  9 Jul 2024 19:41:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB5984012B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB5984012B;
	Tue,  9 Jul 2024 19:41:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE271BF5DE
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3885F60F1A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuOED1ML1Ib2 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4992260AF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4992260AF0
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:41:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECA94843A9; Tue,  9 Jul 2024 19:41:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 21:27:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01aa65bc57c370ee71ace9ab40ed61c48b0eb226
X-Git-Newrev: fd315306726c0150bbc105f5488711c18557460b
X-Patchwork-Hint: ignore
Message-Id: <20240709194109.ECA94843A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasynchat: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4565569614595674378=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4565569614595674378==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd315306726c0150bbc105f5488711c18557460b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pyasynchat is a compatibility package that provides the asynchat
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-pyasynchat/Config.in              | 11 +++++++++++
 package/python-pyasynchat/python-pyasynchat.hash |  5 +++++
 package/python-pyasynchat/python-pyasynchat.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f8a42c1d8..5927a97908 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1089,6 +1089,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
diff --git a/package/Config.in b/package/Config.in
index 38ebf13dbf..faf8dd7d7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pyasynchat/Config.in"
 	source "package/python-pyasyncore/Config.in"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
diff --git a/package/python-pyasynchat/Config.in b/package/python-pyasynchat/Config.in
new file mode 100644
index 0000000000..bf11cc5b39
--- /dev/null
+++ b/package/python-pyasynchat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYASYNCHAT
+	bool "python-pyasynchat"
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
+	help
+	  Make asynchat available for Python 3.12 onwards.
+
+	  This is a compatibility package using the code removed from
+	  the standard libary, upstream does not intend any
+	  maintenance.
+
+	  https://github.com/simonrob/pyasynchat
diff --git a/package/python-pyasynchat/python-pyasynchat.hash b/package/python-pyasynchat/python-pyasynchat.hash
new file mode 100644
index 0000000000..232f936bcc
--- /dev/null
+++ b/package/python-pyasynchat/python-pyasynchat.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasynchat/json
+md5  9fa7e3822f689b1236ca59c5f1b71415  pyasynchat-1.0.4.tar.gz
+sha256  3f5333df649e46c56d48c57e6a4b7163fd07f626bfd884e22ef373ab3c3a4670  pyasynchat-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
new file mode 100644
index 0000000000..6fb460cee1
--- /dev/null
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasynchat
+#
+################################################################################
+
+PYTHON_PYASYNCHAT_VERSION = 1.0.4
+PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
+PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
+PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
+PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
+PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============4565569614595674378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4565569614595674378==--
