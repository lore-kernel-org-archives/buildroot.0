Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AEBC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0683641573;
	Tue,  6 Feb 2024 15:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0683641573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKWVbgVhvHk6; Tue,  6 Feb 2024 15:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E99C841579;
	Tue,  6 Feb 2024 15:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99C841579
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24E1C1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08C1961290
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08C1961290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGcLy1Dac57Z for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F28861299
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F28861299
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2B2F870F3; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 16:18:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb2f00f621315054b7f6ac5a8b99681af5c4af35
X-Git-Newrev: 0f8cd4499afa28b0757013781c7f0509a810092c
X-Patchwork-Hint: ignore
Message-Id: <20240206151815.F2B2F870F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibftdi: bump to version
 0.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f8cd4499afa28b0757013781c7f0509a810092c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/codedstructure/pylibftdi/commit/c96231bb8134a2afeb0b77c12474b97a3355d2dc

Fixup patch so that it applies against 0.21.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-pylibftdi/0001-do-not-use-find-library.patch   | 15 ++++++++-------
 package/python-pylibftdi/python-pylibftdi.hash            |  6 +++---
 package/python-pylibftdi/python-pylibftdi.mk              |  4 ++--
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/python-pylibftdi/0001-do-not-use-find-library.patch b/package/python-pylibftdi/0001-do-not-use-find-library.patch
index 192ed43e54..19dabebffe 100644
--- a/package/python-pylibftdi/0001-do-not-use-find-library.patch
+++ b/package/python-pylibftdi/0001-do-not-use-find-library.patch
@@ -15,17 +15,18 @@ this package.
 Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
 
 ---
-diff -purN pylibftdi-0.15.0.orig/pylibftdi/driver.py pylibftdi-0.15.0/pylibftdi/driver.py
---- pylibftdi-0.15.0.orig/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
-+++ pylibftdi-0.15.0/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100
-@@ -121,8 +121,8 @@ class Driver(object):
+diff -purN pylibftdi-0.21.0.orig/src/pylibftdi/driver.py pylibftdi-0.21.0/src/pylibftdi/driver.py
+--- pylibftdi-0.21.0.orig/src/pylibftdi/driver.py	2015-04-26 22:41:39.000000000 +0200
++++ pylibftdi-0.21.0/src/pylibftdi/driver.py	2017-02-27 13:08:56.502958000 +0100
+@@ -148,9 +148,8 @@ class Driver:
                      lib = getattr(cdll, lib_path)
                      break
          if lib is None:
--            raise LibraryMissingError('{} library not found (search: {})'.format(
--                name, search_list))
+-            raise LibraryMissingError(
+-                f"{name} library not found (search: {str(search_list)})"
+-            )
 +            return cdll.LoadLibrary(name + '.so')
 +
          return lib
- 
+
      @property
diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index ee0ba127ca..5d8a19647f 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  fb43ade3283b809d4ebe92bf4a60d7fc  pylibftdi-0.20.0.tar.gz
-sha256  f4a87fc4af2c9c7d42badd4192ca9b529f32c9d96fdc8daea7e29c509226df5f  pylibftdi-0.20.0.tar.gz
+md5  75b63f325b760cc6342b7d35fbb84fde  pylibftdi-0.21.0.tar.gz
+sha256  eb7e2f5052852547f4c6c46022a1665f9d7453439639171eade56fdc80a58832  pylibftdi-0.21.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0d3f1af06b566a783091422061b60e864fc5d5853418b71643041e254b4ae7f9  LICENSE.txt
+sha256  b8a7b113cfaa2c01d0701183de16ba653465692b1e29e0229244eee42fb3a9a8  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index 34040b72ac..7dca37e416 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.20.0
+PYTHON_PYLIBFTDI_VERSION = 0.21.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/b8/03/4f778ce6dceea58dc5bfd555c22fdb265afc922d81d3c4496a791a54c479
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/d2/ce/ff3e83f3a14eb5b7950ff3657f07cdc3033dd0ded5c8ed093db515e1de33
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
