Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B88C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117A560BD9;
	Fri, 13 May 2022 22:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5_hq2M31vmC; Fri, 13 May 2022 22:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141D660B32;
	Fri, 13 May 2022 22:13:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9776A1BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 943CB60AC1
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i36Y0auJb6Dz for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4300606E7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id ADA0F85E2B; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a072b2c07efcbc2b8398a0c124f72ed7e0845e34
X-Git-Newrev: b2a569b9899da1529a1f3b61b15ff4481980e240
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.ADA0F85E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyopenssl: bump to version
 22.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2a569b9899da1529a1f3b61b15ff4481980e240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer used BR2_PACKAGE_PYTHON_SIX runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pyopenssl/Config.in             | 1 -
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index 1a6fbd2147..56f38f5888 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python wrapper module around the OpenSSL library.
 
diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 5a3bc5dde9..0dc9f921fa 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  2ec707d15b4e92f5ca5e46e5aab2f4ca  pyOpenSSL-21.0.0.tar.gz
-sha256  5e2d8c5e46d0d865ae933bef5230090bdaf5506281e9eec60fa250ee80600cb3  pyOpenSSL-21.0.0.tar.gz
+md5  182c9f258c431c731906ab7fdaf6d0a8  pyOpenSSL-22.0.0.tar.gz
+sha256  660b1b1425aac4a1bea1d94168a85d99f0b3144c869dd4390d27629d0087f1bf  pyOpenSSL-22.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 2ba8c2e73d..21a3f06907 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 21.0.0
+PYTHON_PYOPENSSL_VERSION = 22.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/54/9a/2a43c5dbf4507f86f7c43cba4195d5e25a81c988fd7b0ea779dfc9c6973f
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/35/d3/d6a9610f19d943e198df502ae660c6b5acf84cc3bc421a2aa3c0fb6b21d1
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
