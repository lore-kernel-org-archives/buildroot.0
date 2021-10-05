Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CCFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CD06137C
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3CD06137C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F62383E35;
	Tue,  5 Oct 2021 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4kaaPM-er-Ec; Tue,  5 Oct 2021 19:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C5E983E03;
	Tue,  5 Oct 2021 19:41:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C28ED1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E854407C2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKtFEpRivAu2 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4446F4024E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 030088C9D6; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2ed01a417e86b8e7b0ce2e7e251a50b73271468
X-Git-Newrev: 7bfe142e0d84400e386286347afd6e26f90b8aae
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.030088C9D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-decorator: bump to version
 5.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bfe142e0d84400e386286347afd6e26f90b8aae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pacakge doesn't support python2 anymore. Therefore, we can remove
host-python3-decorator and add a host variant for python-decorator.
As a consequence of that, the python-networkx dependency was renamed from
host-python3-decorator to host-python-decorator.

In addition, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-decorator/Config.in               |  1 +
 package/python-decorator/python-decorator.hash   |  6 +++---
 package/python-decorator/python-decorator.mk     |  6 +++---
 package/python-networkx/python-networkx.mk       |  2 +-
 package/python3-decorator/python3-decorator.hash |  1 -
 package/python3-decorator/python3-decorator.mk   | 18 ------------------
 6 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/package/python-decorator/Config.in b/package/python-decorator/Config.in
index e7ec00cd69..0e84840657 100644
--- a/package/python-decorator/Config.in
+++ b/package/python-decorator/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DECORATOR
 	bool "python-decorator"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Better living through Python with decorators
 
diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 77b48d84cd..46ff7206d7 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5	933981f288c4230816b5beee8d40e6ea decorator-4.4.1.tar.gz
-sha256	54c38050039232e1db4ad7375cfce6748d7b41c29e95a081c8a6d2c30364a2ce decorator-4.4.1.tar.gz
+md5  d01585c3ea5b36a209747fcc978a98c8  decorator-5.1.0.tar.gz
+sha256  e59913af105b9860aa2c8d3272d9de5a56a4e608db9a2f167a8480b323d529a7  decorator-5.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
+sha256  fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 7c4b353aaa..a61f045e2a 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-decorator/python3-decorator.mk
-PYTHON_DECORATOR_VERSION = 4.4.1
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
+PYTHON_DECORATOR_VERSION = 5.1.0
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/92/3c/34f8448b61809968052882b830f7d8d9a8e1c07048f70deb039ae599f73c
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
@@ -15,3 +14,4 @@ PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index e84bddf86f..3b05011eb9 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -12,7 +12,7 @@ PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
 PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python3-decorator
+HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
 HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
diff --git a/package/python3-decorator/python3-decorator.hash b/package/python3-decorator/python3-decorator.hash
deleted file mode 120000
index f515d3133b..0000000000
--- a/package/python3-decorator/python3-decorator.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-decorator/python-decorator.hash
\ No newline at end of file
diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
deleted file mode 100644
index ed6d86fe3a..0000000000
--- a/package/python3-decorator/python3-decorator.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python3-decorator
-#
-################################################################################
-
-# Please keep in sync with package/python-decorator/python-decorator.mk
-PYTHON3_DECORATOR_VERSION = 4.4.1
-PYTHON3_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
-PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
-PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
-PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
-PYTHON3_DECORATOR_CPE_ID_VENDOR = python
-PYTHON3_DECORATOR_CPE_ID_PRODUCT = decorator
-PYTHON3_DECORATOR_SETUP_TYPE = setuptools
-HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
