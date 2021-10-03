Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127A2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C047061216
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C047061216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB5E84954;
	Sun,  3 Oct 2021 19:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tReKUoUXe3H2; Sun,  3 Oct 2021 19:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F8E84972;
	Sun,  3 Oct 2021 19:58:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 257E11BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7AB7407EE
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUTRX1hO6LY1 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85144080A
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4780487A5E; Sun,  3 Oct 2021 19:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:54:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70440e28c8eefd469f6994c524d062dee168493e
X-Git-Newrev: b6ea44910889862f7a2ff992b78ae54eb6164dde
X-Patchwork-Hint: ignore
Message-Id: <20211003195309.4780487A5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyhamcrest: bump to version
 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6ea44910889862f7a2ff992b78ae54eb6164dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Update comment of reverse dependency
* Indent with two spaces in the hash file.
* License was changed with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[yann.morin.1998@free.fr: update comment of reverse dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyhamcrest/Config.in              | 1 +
 package/python-pyhamcrest/python-pyhamcrest.hash | 6 +++---
 package/python-pyhamcrest/python-pyhamcrest.mk   | 4 ++--
 package/python-twisted/Config.in                 | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
index c2a4dc06f7..1bbae3fec7 100644
--- a/package/python-pyhamcrest/Config.in
+++ b/package/python-pyhamcrest/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYHAMCREST
 	bool "python-pyhamcrest"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
index 0c1660e08a..b2e84d7d1f 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.hash
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
-md5	8b833a3fa30197455df79424f30c8c3f  PyHamcrest-1.9.0.tar.gz
-sha256	8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd  PyHamcrest-1.9.0.tar.gz
+md5  7a086f0b067f8d38958ec32f054559b4  PyHamcrest-2.0.2.tar.gz
+sha256  412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316  PyHamcrest-2.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ec76c04449607010d061b1e29c9d20a5ffae74db9d04670ae82538ccfe68b941  LICENSE.txt
+sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index 244aa8c606..28979600dd 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYHAMCREST_VERSION = 1.9.0
+PYTHON_PYHAMCREST_VERSION = 2.0.2
 PYTHON_PYHAMCREST_SOURCE = PyHamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/a4/89/a469aad9256aedfbb47a29ec2b2eeb855d9f24a7a4c2ff28bd8d1042ef02
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/58/05/7b993fabb44ff0b52a90916d96bfd91a65ecf90b8248e72bba325ba8e438
 PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 805a1aa345..29536ecf9d 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
-	depends on BR2_PACKAGE_PYTHON3 # python-hyperlink -> python-idna
+	depends on BR2_PACKAGE_PYTHON3 # python-pyhamcrest; python-hyperlink -> python-idna
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
