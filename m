Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22BC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923716150D;
	Thu,  8 Jun 2023 16:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 923716150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVMdW--6Z9ZF; Thu,  8 Jun 2023 16:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A449E6150A;
	Thu,  8 Jun 2023 16:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A449E6150A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10D611BF39D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB4F083EDD
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 16:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB4F083EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIMUka-F3L5y for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 16:53:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B21D83ED0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B21D83ED0
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 16:53:09 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout12.t-online.de (Postfix) with SMTP id E1F761FA16;
 Thu,  8 Jun 2023 18:53:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7Isk-0gWWvJ0; Thu, 8 Jun 2023 18:53:06 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47666)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7Isj-0006Hf-2g;
 Thu, 08 Jun 2023 18:53:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 18:53:05 +0200
Message-Id: <20230608165305.451682-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686243186-62FE39E6-4631F0F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 12f088b2-b3aa-4cb4-9ecb-fcd5745c9775
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.11.4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .../0012-Add-an-option-to-disable-lib2to3.patch   |  8 +++++---
 ...4-Add-an-option-to-disable-the-tk-module.patch | 15 +++++++++------
 package/python3/python3.hash                      |  2 +-
 package/python3/python3.mk                        |  2 +-
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
