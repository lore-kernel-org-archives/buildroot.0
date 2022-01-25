Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F80BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B9641524;
	Tue, 25 Jan 2022 18:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEt9zBStQZdg; Tue, 25 Jan 2022 18:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01BE4156F;
	Tue, 25 Jan 2022 18:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 111151BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B1382897
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCg3A_ID7DoT for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D23B981421
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:34:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E5780827E1; Tue, 25 Jan 2022 18:27:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:20:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a5fd47c1eed1a350b7c24b16ba8c56fa5129846
X-Git-Newrev: 0bd2ae3b4fc0fd16300861a55c04ad6d72389d49
X-Patchwork-Hint: ignore
Message-Id: <20220125182726.E5780827E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-itsdangerous: bump to
 version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bd2ae3b4fc0fd16300861a55c04ad6d72389d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- python 2 support has been dropped since version 2.0.0 and
  https://github.com/pallets/itsdangerous/commit/e085f3eedf94fe42391aaa9fc349927f8feaa367
- Update hash of license file (license standardized:
  https://github.com/pallets/itsdangerous/commit/c880f85ccdaee29adab8b47ad79eb7bdec507b57)
- Update indentation in hash file (two spaces)

https://itsdangerous.palletsprojects.com/en/2.0.x/changes/#version-2-0-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-itsdangerous/Config.in                | 4 ++--
 package/python-itsdangerous/python-itsdangerous.hash | 8 +++++---
 package/python-itsdangerous/python-itsdangerous.mk   | 6 +++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-itsdangerous/Config.in b/package/python-itsdangerous/Config.in
index 39ec0b7725..72aa9165f8 100644
--- a/package/python-itsdangerous/Config.in
+++ b/package/python-itsdangerous/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_ITSDANGEROUS
 	bool "python-itsdangerous"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Itsdangerous contains various helpers to pass data to
 	  untrusted environments and to get it back safe and sound.
diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index 0904a91183..dad4ec0800 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,4 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/itsdangerous/json
-md5	9b7f5afa7f1e3acfb7786eeca3d99307  itsdangerous-1.1.0.tar.gz
-sha256	321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19  itsdangerous-1.1.0.tar.gz
-sha256	feb28bfa348d816b0e7dbaeddf18499ee7e8007c67813db8d6ab37c65e046cd4  LICENSE.rst
+md5  996b9763d1b4bd0edd6eb86f0a490629  itsdangerous-2.0.1.tar.gz
+sha256  9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0  itsdangerous-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  63af09891b6be8ad1a4252ed43af0f4efba7fc948e228367bed7f3c5ae0b09d7  LICENSE.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 9429233703..c53bc6b9ba 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 1.1.0
+PYTHON_ITSDANGEROUS_VERSION = 2.0.1
 PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
-PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/68/1a/f27de07a8a304ad5fa817bbe383d1238ac4396da447fa11ed937039fa04b
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/58/66/d6c5859dcac92b442626427a8c7a42322068c5cd5d4a463ce78b93f730b7
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
-PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst docs/license.rst
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
