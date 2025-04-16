Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14E7C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87DB180C87;
	Wed, 16 Apr 2025 21:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUqqja4u5VsG; Wed, 16 Apr 2025 21:41:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A5684908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A5684908;
	Wed, 16 Apr 2025 21:41:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAD520E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43B5E6F551
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cit-lrUk7MQI for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 228A16F5A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228A16F5A5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 207208458F; Wed, 16 Apr 2025 21:40:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 23:38:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2b8badc39bdb429cb98638b687e77fdfaa8b788d
X-Git-Newrev: ffb96d7c7a4d326c473d684fc107720bf92924f4
X-Patchwork-Hint: ignore
Message-Id: <20250416214042.207208458F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to 3.12.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffb96d7c7a4d326c473d684fc107720bf92924f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog: https://docs.python.org/release/3.12.10/whatsnew/changelog.html#python-3-12-10

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...0008-Add-an-option-to-disable-the-tk-module.patch | 20 +++++++++++---------
 package/python3/python3.hash                         |  6 +++---
 package/python3/python3.mk                           |  2 +-
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
index 6fb80871cb..5408231168 100644
--- a/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0008-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From 4d02905278ef62aaf9e984022033c3390d675948 Mon Sep 17 00:00:00 2001
+From 7ce7f1c5bc94e7609fe1a7317f8094892cf3c43e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -13,13 +13,15 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [ Adam Duskett: ported to Python 3.12.1 ]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[ Marcus Hoffmann: ported to Python 3.12.10 ]
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 ---
  Makefile.pre.in | 8 +++++---
  configure.ac    | 7 +++++++
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7c5bcea59ba..5de6f63220d 100644
+index 42f665e12b3..01e62203cd5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2108,7 +2108,6 @@ LIBSUBDIRS=	asyncio \
@@ -30,7 +32,7 @@ index 7c5bcea59ba..5de6f63220d 100644
  		tomllib \
  		turtledemo \
  		unittest \
-@@ -2213,7 +2212,6 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2214,7 +2213,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_peg_generator \
  		test/test_pydoc \
  		test/test_sqlite3 \
@@ -38,15 +40,15 @@ index 7c5bcea59ba..5de6f63220d 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2234,7 +2232,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_tomllib/data/valid/multiline-basic-str \
+@@ -2236,7 +2234,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
+ 		test/test_tools/msgfmt_data \
 -		test/test_ttk \
  		test/test_unittest \
  		test/test_unittest/testmock \
  		test/test_warnings \
-@@ -2259,6 +2256,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2261,6 +2258,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_multiprocessing_forkserver \
  		test/test_multiprocessing_spawn
  
@@ -59,10 +61,10 @@ index 7c5bcea59ba..5de6f63220d 100644
  
  ifeq (@PYDOC@,yes)
 diff --git a/configure.ac b/configure.ac
-index 3fbcabe29c8..4331ed4264f 100644
+index b2a60b7865f..23db7446cdc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4532,6 +4532,13 @@ AC_ARG_ENABLE(pydoc,
+@@ -4553,6 +4553,13 @@ AC_ARG_ENABLE(pydoc,
  	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
  	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
  
@@ -77,5 +79,5 @@ index 3fbcabe29c8..4331ed4264f 100644
  AH_TEMPLATE([ENABLE_IPV6], [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.39.5
+2.43.0
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 34e795b704..2772e33109 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3129/
-md5  880942124f7d5c01e7b65cbad62dc873  Python-3.12.9.tar.xz
+# From https://www.python.org/downloads/release/python-31210/
+md5  0c0a6cce86d7611aed691d61e0599de0  Python-3.12.10.tar.xz
 # Locally computed
-sha256  7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112  Python-3.12.9.tar.xz
+sha256  07ab697474595e06f06647417d3c7fa97ded07afc1a7e4454c5639919b46eaea  Python-3.12.10.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b15c27053f..6b3a3e81f3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
