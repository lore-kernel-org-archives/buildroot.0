Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12AC369D2
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D331606F6;
	Mon, 21 Apr 2025 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guyzq36BPFxo; Mon, 21 Apr 2025 16:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83D8A60AF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D8A60AF1;
	Mon, 21 Apr 2025 16:08:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D3E1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A00B403D7
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3QH7T0vD7Wq for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E13C404FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E13C404FC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D9A285FE0; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 17:38:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1500712e32413dd694ca6e35dd445a27eaf06ff
X-Git-Newrev: 27a9837b50937d0ce8700760a3f75150a974770e
X-Patchwork-Hint: ignore
Message-Id: <20250421160802.8D9A285FE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 boto3-1.37.34
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1837136044724583723=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1837136044724583723==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27a9837b50937d0ce8700760a3f75150a974770e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test timeout is no longer sufficient, so double it.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash             | 4 ++--
 package/python-boto3/python-boto3.mk               | 4 ++--
 support/testing/tests/package/test_python_boto3.py | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 4036519183..833ec24b26 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  a8f7a881ac754a889490c65cad7aa97b  boto3-1.36.3.tar.gz
-sha256  53a5307f6a3526ee2f8590e3c45efa504a3ea4532c1bfe4926c0c19bf188d141  boto3-1.36.3.tar.gz
+md5  2b530f972284ee12cd0fc7a829a65d67  boto3-1.37.34.tar.gz
+sha256  94ca07328474db3fa605eb99b011512caa73f7161740d365a1f00cfebfb6dd90  boto3-1.37.34.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 3d8a7852ea..2373a6bb8f 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.36.3
+PYTHON_BOTO3_VERSION = 1.37.34
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/07/12/b9ad4c3dd6e6044243d08bae076795e41357651683f4fad99d5828c4291c
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/39/5d/6b1ca20ba4da350799509a69f2d295ae11d5ec08a98e82f74b5708a8180c
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index 02a1f69d40..e5fbc386b9 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -12,7 +12,7 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
         BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_boto3.py"]
-    timeout = 10
+    timeout = 20
 
     def login(self):
         ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")

--===============1837136044724583723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1837136044724583723==--
