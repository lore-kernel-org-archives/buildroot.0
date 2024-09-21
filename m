Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2FBCF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D3956F589;
	Sat, 21 Sep 2024 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65PZjUMSPleD; Sat, 21 Sep 2024 21:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566AE60A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566AE60A66;
	Sat, 21 Sep 2024 21:10:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11D631BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D4BF607B9
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3exRVk1Z7QC for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989A36073D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 989A36073D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 938E181046; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6174b0b8d4dfdd1bf2041b437c01b59ea1d1ee90
X-Git-Newrev: 1dde7e861a6c9331863ba69c064d0031b8d1db82
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.938E181046@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyftpdlib: bump to version
 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dde7e861a6c9331863ba69c064d0031b8d1db82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-pyasyncore and python-pyasynchat runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyftpdlib/Config.in             | 2 ++
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/Config.in b/package/python-pyftpdlib/Config.in
index e25c34e5a3..6567385ecf 100644
--- a/package/python-pyftpdlib/Config.in
+++ b/package/python-pyftpdlib/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYFTPDLIB
 	bool "python-pyftpdlib"
+	select BR2_PACKAGE_PYTHON_PYASYNCHAT # runtime
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
 	help
 	  Extremely fast and scalable Python FTP server library.
 
diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 7b5dabdfdc..32f662ff91 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  cb32bca52ba0d4850a92513154c253e1  pyftpdlib-1.5.9.tar.gz
-sha256  323d4c42f1406aedb4df18faf680f64f32c080ff66f6c26090ba592f5bfc4a0f  pyftpdlib-1.5.9.tar.gz
+md5  36d7328c7dde493816bc3677b3c71287  pyftpdlib-2.0.0.tar.gz
+sha256  1aded131fc7d41b0fa734c7879a96a6251366b141e8886782bcb1de616ffc791  pyftpdlib-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index da101083b6..55de21f8f6 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.9
+PYTHON_PYFTPDLIB_VERSION = 2.0.0
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/47/9f/5dc055ab2db58db561f72b1b2f18b1dafc025f2ac5dd842c40259c17195e
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/f1/69/a524dcb5a9be722273a74d71c509f3d875238c54fd7426fab6fd05ca8521
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
