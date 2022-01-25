Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0823C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A90740919;
	Tue, 25 Jan 2022 18:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XfkUh7qqAot; Tue, 25 Jan 2022 18:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A212D408F1;
	Tue, 25 Jan 2022 18:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A97A81BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D88B826C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mntH0PpkOQnS for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FA48139A
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9A487827E1; Tue, 25 Jan 2022 18:27:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:29:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac3ae9446e7261445f6772ef4f76615cf16bf82
X-Git-Newrev: 1ad6b3974366844a54c7dadbcffbc62853504675
X-Patchwork-Hint: ignore
Message-Id: <20220125182727.9A487827E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pynacl: bump to version
 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ad6b3974366844a54c7dadbcffbc62853504675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Drop python2 support.

Drop python-six dependency which is no longer needed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: update paramiko python3 dependency comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-paramiko/Config.in                  |  2 +-
 ...Remove-spurious-requirement-for-wheel-596.patch | 34 ----------------------
 package/python-pynacl/Config.in                    |  2 +-
 package/python-pynacl/python-pynacl.hash           |  6 ++--
 package/python-pynacl/python-pynacl.mk             |  4 +--
 5 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index e44237b0c2..d48051bd22 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
-	depends on BR2_PACKAGE_PYTHON3 # python-bcrypt, python-cryptography
+	depends on BR2_PACKAGE_PYTHON3 # python-bcrypt, python-cryptography, python-pynacl
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
diff --git a/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch b/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
deleted file mode 100644
index 4f4a76ce29..0000000000
--- a/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 44fb453931c611d4822343debe902cca8e1c8afe Mon Sep 17 00:00:00 2001
-From: Scott Kitterman <sklist@kitterman.com>
-Date: Tue, 26 May 2020 20:08:16 -0400
-Subject: [PATCH] Remove spurious requirement for wheel (#596)
-
-* Remove spurious requirement for wheel
-
-* Put wheel back in pyproject.toml
-
-Co-authored-by: Scott Kitterman <scott@kitterman.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-44fb453931c611d4822343debe902cca8e1c8afe]
----
- setup.py | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9319c1c..d82a7fe 100644
---- a/setup.py
-+++ b/setup.py
-@@ -35,8 +35,7 @@ except ImportError:
- 
- 
- requirements = ["six"]
--setup_requirements = ["setuptools",
--                      "wheel"]
-+setup_requirements = ["setuptools"]
- test_requirements = ["pytest>=3.2.1,!=3.3.0",
-                      "hypothesis>=3.27.0"]
- docs_requirements = ["sphinx>=1.6.5",
--- 
-2.25.1
-
diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
index 256f9d5eb6..3bb4e29630 100644
--- a/package/python-pynacl/Config.in
+++ b/package/python-pynacl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYNACL
 	bool "python-pynacl"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBSODIUM
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Python binding to the Networking and Cryptography (NaCl)
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index b6ee2baf0e..85a7447b32 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5  8c6c57893327a694c72510fb620e4744  PyNaCl-1.4.0.tar.gz
-sha256  54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505  PyNaCl-1.4.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/PyNaCl/json
+md5  93989045e25f1111452cfdf5e021814d  PyNaCl-1.5.0.tar.gz
+sha256  8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba  PyNaCl-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 1e4155992a..bd2571c3ad 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.4.0
+PYTHON_PYNACL_VERSION = 1.5.0
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/cf/5a/25aeb636baeceab15c8e57e66b8aa930c011ec1c035f284170cacb05025e
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/a7/22/27582568be639dfe22ddb3902225f91f2f17ceff88ce80e4db396c8986da
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
