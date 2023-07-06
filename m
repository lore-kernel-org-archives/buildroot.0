Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F26BEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 09:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3EAE408B3;
	Thu,  6 Jul 2023 09:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3EAE408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfGXDUEH86wM; Thu,  6 Jul 2023 09:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8119A416DA;
	Thu,  6 Jul 2023 09:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8119A416DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8011BF3EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37E1940313
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E1940313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_kXAk-1rVh0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 398A6408B4
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 398A6408B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 249DE867D5; Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 11:24:45 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ba378b79b241381b74800262373c1c85db91d233
X-Git-Newrev: 442e7cab3a9881e082279cb48cb8df6905bdb6e5
X-Patchwork-Hint: ignore
Message-Id: <20230706092513.249DE867D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python3: security
 bump version to 3.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=442e7cab3a9881e082279cb48cb8df6905bdb6e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Rebased two patches.

Changelog:
https://docs.python.org/release/3.11.4/whatsnew/changelog.html#python-3-11-4

Fixes the following security problems:

- gh-99889: Fixed a security in flaw in uu.decode() that could allow for
  directory traversal based on the input if no out_file was specified.

- gh-104049: Do not expose the local on-disk location in directory
  indexes   produced by http.client.SimpleHTTPRequestHandler.

- gh-102153: urllib.parse.urlsplit() now strips leading C0 control and
  space characters following the specification for URLs defined by WHATWG
  in response to CVE-2023-24329. Patch by Illia Volochii.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b7b11d7e94e316632fcc8ec49831e7b372cc055a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python3/0012-Add-an-option-to-disable-lib2to3.patch   |  8 +++++---
 .../0014-Add-an-option-to-disable-the-tk-module.patch     | 15 +++++++++------
 package/python3/python3.hash                              |  2 +-
 package/python3/python3.mk                                |  2 +-
 4 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
index 0085d5a63f..228b86a90b 100644
--- a/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0012-Add-an-option-to-disable-lib2to3.patch
@@ -12,6 +12,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Bernd Kuhls: ported to Python 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.pre.in | 17 ++++++++++++-----
  configure.ac    |  6 ++++++
@@ -48,9 +50,9 @@ index 403380e181..f5d0573067 100644
 -		lib2to3/tests/data \
 -		lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		test test/audiodata \
- 		test/capath test/cjkencodings \
- 		test/data test/decimaltestdata \
+ 		test \
+ 		test/audiodata \
+ 		test/capath \
 @@ -2013,6 +2010,14 @@ ifeq (@PYDOC@,yes)
  LIBSUBDIRS += pydoc_data
  endif
diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
index 04f7e34435..b89e1d27bc 100644
--- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
@@ -9,6 +9,8 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 [ Adam Duskett: ported to Python 3.10.0 ]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[ Bernd Kuhls: ported to Python 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.pre.in | 10 +++++++---
  configure.ac    |  9 +++++++++
@@ -26,14 +28,15 @@ index 9f4cdf14cf..4f83911200 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2001,8 +2000,6 @@ TESTSUBDIRS=	ctypes/test \
- 		test/tracedmodules \
- 		test/xmltestdata test/xmltestdata/c14n-20 \
+@@ -2038,9 +2038,6 @@
+ 		test/xmltestdata \
+ 		test/xmltestdata/c14n-20 \
  		test/ziptestdata \
--		tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test \
+-		tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk \
- 		unittest/test unittest/test/testmock
- 
+ 		unittest/test \
+ 		unittest/test/testmock
  ifeq (@PYDOC@,yes)
 @@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
  LIBSUBDIRS += sqlite3
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index b04ee7fa2c..6c43e01a44 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a5db99c961a7ecf27c75956189c9602c968751f11dbeae2b900dbff1c085b5e  Python-3.11.3.tar.xz
+sha256  2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6  Python-3.11.4.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ece5cad93e..bdb7cfd22f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
