Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7D1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B9E41609;
	Thu, 13 Jan 2022 20:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLgV6BqXPzjS; Thu, 13 Jan 2022 20:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AB5415C8;
	Thu, 13 Jan 2022 20:48:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 267C51BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E5440196
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ciXQg1wFyhag for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:48:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDAE4010C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:48:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 89FD383582; Thu, 13 Jan 2022 20:42:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:41:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0c778c18ce180c02b0210169d7f7df0f9b4499a
X-Git-Newrev: 5b8abbe72c281bf646373b53abc2471631b8be71
X-Patchwork-Hint: ignore
Message-Id: <20220113204212.89FD383582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b8abbe72c281bf646373b53abc2471631b8be71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A wrapper for the Gnu Privacy Guard (GPG or GnuPG).

The gnupg module allows Python programs to make use of the functionality
provided by the GNU Privacy Guard (abbreviated GPG or GnuPG). Using this
module, Python programs can encrypt and decrypt data, digitally sign
documents and verify digital signatures, manage (generate, list and
delete) encryption keys, using Public Key Infrastructure (PKI)
encryption technology based on OpenPGP.

https://docs.red-dove.com/python-gnupg/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-gnupg/Config.in         | 15 +++++++++++++++
 package/python-gnupg/python-gnupg.hash |  5 +++++
 package/python-gnupg/python-gnupg.mk   | 13 +++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c15b117610..a17e828aa5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,6 +1605,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
 F:	package/python-distro/
+F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 
diff --git a/package/Config.in b/package/Config.in
index b76f50e565..4df1474b91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1038,6 +1038,7 @@ menu "External python modules"
 	source "package/python-futures/Config.in"
 	source "package/python-git/Config.in"
 	source "package/python-gitdb2/Config.in"
+	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
diff --git a/package/python-gnupg/Config.in b/package/python-gnupg/Config.in
new file mode 100644
index 0000000000..038a940778
--- /dev/null
+++ b/package/python-gnupg/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_GNUPG
+	bool "python-gnupg"
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime
+	help
+	  A wrapper for the Gnu Privacy Guard (GPG or GnuPG).
+
+	  The gnupg module allows Python programs to make use of the
+	  functionality provided by the GNU Privacy Guard (abbreviated
+	  GPG or GnuPG). Using this module, Python programs can
+	  encrypt and decrypt data, digitally sign documents and
+	  verify digital signatures, manage (generate, list and
+	  delete) encryption keys, using Public Key Infrastructure
+	  (PKI) encryption technology based on OpenPGP.
+
+	  https://docs.red-dove.com/python-gnupg/
diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
new file mode 100644
index 0000000000..fa0e8ae6e5
--- /dev/null
+++ b/package/python-gnupg/python-gnupg.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-gnupg/json
+md5  02c5d77b8db9dfba0741627560d89bd5  python-gnupg-0.4.8.tar.gz
+sha256  b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7  python-gnupg-0.4.8.tar.gz
+# Locally computed sha256 checksums
+sha256  9620da3d3afdfca7dea53c4375c1507ab2d3a4af4e706827023acb49a9ec4a5e  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
new file mode 100644
index 0000000000..f16910e517
--- /dev/null
+++ b/package/python-gnupg/python-gnupg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-gnupg
+#
+################################################################################
+
+PYTHON_GNUPG_VERSION = 0.4.8
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
+PYTHON_GNUPG_LICENSE = BSD-3-Clause
+PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
+PYTHON_GNUPG_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
