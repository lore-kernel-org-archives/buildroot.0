Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E61C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 688D280BEC;
	Wed,  7 Feb 2024 15:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zT_i7gf-b-_V; Wed,  7 Feb 2024 15:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B8AD80BE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B8AD80BE7;
	Wed,  7 Feb 2024 15:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3391BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53EC74058F
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWFfdHquh6sM for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0780D40184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0780D40184
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:09:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E23EA875B8; Wed,  7 Feb 2024 15:09:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 15:59:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65a12fb53ab95a22a2a7b19b8f53396ce4fb561c
X-Git-Newrev: 218fa820f541df593f35ee8468c4f531499caf4f
X-Patchwork-Hint: ignore
Message-Id: <20240207150901.E23EA875B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=218fa820f541df593f35ee8468c4f531499caf4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is needed at runtime by python-bitstring since
4.1.0 already [1].

Note: the License is under Python-2.0 but "Python Software
Foundation License (PSF)" has been remplaced by the author
of bitarray Ilan Schnell.

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-bitarray/Config.in            |  6 ++++++
 package/python-bitarray/python-bitarray.hash |  5 +++++
 package/python-bitarray/python-bitarray.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4c6deb1333..91a6f1de00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "External python modules"
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
