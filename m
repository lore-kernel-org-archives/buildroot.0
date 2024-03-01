Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D7C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64E8361042;
	Fri,  1 Mar 2024 10:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sd3Pj5brhSjW; Fri,  1 Mar 2024 10:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F6C6101B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F6C6101B;
	Fri,  1 Mar 2024 10:11:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A87A1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1546C606DF
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTp6PYXp9OUW for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1DE607E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B1DE607E1
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45C1587E7F; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 11:08:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ef23bb3f129026c8cc3165d5fad1bfb3d68f3d13
X-Git-Newrev: e91c745499ccf66dbf5657f8f718352bb1f5d493
X-Patchwork-Hint: ignore
Message-Id: <20240301101129.45C1587E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-bitarray:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e91c745499ccf66dbf5657f8f718352bb1f5d493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

This package is needed at runtime by python-bitstring since
4.1.0 already [1].

Note: the License is under Python-2.0 but "Python Software
Foundation License (PSF)" has been remplaced by the author
of bitarray Ilan Schnell.

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 218fa820f541df593f35ee8468c4f531499caf4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |  1 +
 package/python-bitarray/Config.in            |  6 ++++++
 package/python-bitarray/python-bitarray.hash |  5 +++++
 package/python-bitarray/python-bitarray.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f003f3dd91..2a9a0bd79d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -997,6 +997,7 @@ menu "External python modules"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bidict/Config.in"
+	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-blinker/Config.in"
diff --git a/package/python-bitarray/Config.in b/package/python-bitarray/Config.in
new file mode 100644
index 0000000000..38d685f4fd
--- /dev/null
+++ b/package/python-bitarray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BITARRAY
+	bool "python-bitarray"
+	help
+	  efficient arrays of booleans -- C extension.
+
+	  https://github.com/ilanschnell/bitarray
diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
new file mode 100644
index 0000000000..d91a28af20
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bitarray/json
+md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
+sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
new file mode 100644
index 0000000000..f86320c112
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bitarray
+#
+################################################################################
+
+PYTHON_BITARRAY_VERSION = 2.9.2
+PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
+PYTHON_BITARRAY_SETUP_TYPE = setuptools
+PYTHON_BITARRAY_LICENSE = Python-2.0
+PYTHON_BITARRAY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
