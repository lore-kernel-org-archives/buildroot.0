Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB61C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4210F40EFD;
	Tue,  9 Jul 2024 19:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhlaqR3EdxFt; Tue,  9 Jul 2024 19:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B2D40EE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B2D40EE7;
	Tue,  9 Jul 2024 19:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5171BF97E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3985340B8B
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 19:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h9MHlDsBnQq for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 19:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC845409D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC845409D3
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 19:41:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF587843A7; Tue,  9 Jul 2024 19:41:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 21:23:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f290f8de2265317daec80e6ae143dcdd74043f59
X-Git-Newrev: 01aa65bc57c370ee71ace9ab40ed61c48b0eb226
X-Patchwork-Hint: ignore
Message-Id: <20240709194109.CF587843A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasyncore: new package
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
Content-Type: multipart/mixed; boundary="===============0127920721702320045=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0127920721702320045==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=01aa65bc57c370ee71ace9ab40ed61c48b0eb226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pyasyncore is a compatibility package that provides the asyncore
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/python-pyasyncore/Config.in              | 10 ++++++++++
 package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
 package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 90d1a111ab..3f8a42c1d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1088,6 +1088,9 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-pyasyncore/
+
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
 F:	board/asus/tinker-s/
diff --git a/package/Config.in b/package/Config.in
index 48ef1a6fdc..38ebf13dbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pyasyncore/Config.in"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
diff --git a/package/python-pyasyncore/Config.in b/package/python-pyasyncore/Config.in
new file mode 100644
index 0000000000..ad1376a243
--- /dev/null
+++ b/package/python-pyasyncore/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PYASYNCORE
+	bool "python-pyasyncore"
+	help
+	  Make asyncore available for Python 3.12 onwards.
+
+	  This is a compatibility package using the code removed from
+	  the standard libary, upstream does not intend any
+	  maintenance.
+
+	  https://github.com/simonrob/pyasyncore
diff --git a/package/python-pyasyncore/python-pyasyncore.hash b/package/python-pyasyncore/python-pyasyncore.hash
new file mode 100644
index 0000000000..ee4665fe5e
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasyncore/json
+md5  f97e2b69f1fa11470867b395c2fabf84  pyasyncore-1.0.4.tar.gz
+sha256  2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6  pyasyncore-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
new file mode 100644
index 0000000000..4b1e3c98b6
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasyncore
+#
+################################################################################
+
+PYTHON_PYASYNCORE_VERSION = 1.0.4
+PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
+PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
+PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
+PYTHON_PYASYNCORE_LICENSE = PSF-2.0
+PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============0127920721702320045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0127920721702320045==--
