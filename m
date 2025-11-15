Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71544CEB2E4
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 16:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E52D608C1;
	Sat, 15 Nov 2025 16:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DczXZdt90xC; Sat, 15 Nov 2025 16:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45043608E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45043608E4;
	Sat, 15 Nov 2025 16:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF9F1A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F4083FAF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpzqZr0Fjfe3 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 16:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4652683F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4652683F9E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4652683F9E
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 16:49:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E74DA4C6C7D;
 Sat, 15 Nov 2025 17:48:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34800)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJRu-000000002XJ-0lrF;
 Sat, 15 Nov 2025 16:48:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 15 Nov 2025 17:48:27 +0100
Message-ID: <20251115164828.1519438-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251115164828.1519438-1-bernd@kuhls.net>
References: <20251115164828.1519438-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763225310;
 bh=gwm2TH8Dr/jpdRCEDNQnIFKnOsB+tDRknWLhmf97uXk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KcqmkKOQIA40lokgXDVzGCv0/aMCKaoVP08p+ACZVz6oC3sXkUsW8eoE/HyD5uf5f
 fXZniHyGt1+hZ4RA4fW4RqJWKqHTKJ/Oom1otn5EtVQXtwQpt29P9nhGsmOP8NO49X
 S3F+NRYv7wDEnsCSH3JWtynh+MYNlLIX+gcq/8uynsWw3YgytjAt9whc1R5C65NJ+0
 Iv4cdFxRRT0wN64ZbfTxsYVD1KNcrBH9qjouyfGV+Yyqty7+TP9vORYVXrVrZuTAwc
 qAo4PorGyvSRD8Y2A5qxg0gArAbO1dAAoL9fDGZbwh2hHwoB1O7cPUPcrbdMdA7NiS
 vy9nSLj53+cFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=KcqmkKOQ
Subject: [Buildroot] [PATCH 4/4] package/lttng-libust: bump to version 2.14.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Devin Steffler <devin.buildroot@gmail.com>

This is the third of three patches relating to lttng-modules 2.13.10 not compiling with buildroot.

Since I am submitting a patch to bump lttng-modules to 2.13.17 and lttng-libust is a tightly related package,
I am also submitting this patch to bump lttng-libust to 2.13.8 (the latest version at this time).

The chanagelog for lttng-libust 2.14.0 can be found here:
https://git.lttng.org/?p=lttng-ust.git;a=blob;f=ChangeLog;h=1ddf7956cd80674f8bb0cec4b9362a9b1bf943b4;hb=refs/heads/stable-2.14

Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd:
 - bumped to 2.14.0, updated link to changelog
 - rebased patch 0001 due to upstream commit:
   https://git.lttng.org/?p=lttng-ust.git;a=commitdiff;h=464c475658ae29039b3b9e769b5b02195688a94a
 - updated license files and hashes due to upstream commit:
   https://git.lttng.org/?p=lttng-ust.git;a=commit;h=e03d7c66c57bf268b87296566a5160039f35ccfb
 - added dependency to host-python-setuptools due to upstream commit:
   https://git.lttng.org/?p=lttng-ust.git;a=commitdiff;h=cb80e2fb106d56b4a0ae9c0480a368572f4d0d35]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-configure.ac-add-disable-tests.patch      | 10 ++++++----
 package/lttng-libust/lttng-libust.hash             | 14 +++++++-------
 package/lttng-libust/lttng-libust.mk               | 11 ++++++++---
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/package/lttng-libust/0001-configure.ac-add-disable-tests.patch b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
index bb962000b4..3b22a0ce37 100644
--- a/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
+++ b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
@@ -7,6 +7,8 @@ Add configure option to disable tests.
 Upstream is not likely to accept it, see lttng-tools package.
 
 Signed-off-by: Norbert Lange <nolange79@gmail.com>
+[Bernd: rebased for version 2.14.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am  | 5 ++++-
  configure.ac | 6 ++++++
@@ -16,7 +18,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 9ab93ccd..8a1c1dca 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -7,9 +7,12 @@ SUBDIRS = \
+@@ -9,9 +9,12 @@ SUBDIRS = \
  	src \
  	tools \
  	doc \
@@ -34,7 +36,7 @@ diff --git a/configure.ac b/configure.ac
 index b6254228..fe5f2700 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -360,6 +360,11 @@ AE_FEATURE([python-agent],[build the LTTng UST Python agent])
+@@ -371,6 +371,11 @@ AE_FEATURE([python-agent],[build the LTTng UST Python agent])
  AE_FEATURE_DEFAULT_ENABLE
  AE_FEATURE([examples],[Do not build and install examples])
  
@@ -46,13 +48,13 @@ index b6254228..fe5f2700 100644
  # Man pages
  # Enabled by default
  AE_FEATURE_DEFAULT_ENABLE
-@@ -525,6 +530,7 @@ AC_DEFINE([LTTNG_UST_CTL_LIB_SONAME_MAJOR], [ust_ctl_lib_version_current], [Majo
+@@ -565,6 +570,7 @@ AC_DEFINE([LTTNG_UST_CTL_LIB_SONAME_MAJOR], [ust_ctl_lib_version_current], [Majo
  ##                                                                          ##
  
  AM_CONDITIONAL([ENABLE_EXAMPLES], AE_IS_FEATURE_ENABLED([examples]))
 +AM_CONDITIONAL([ENABLE_TESTS], AE_IS_FEATURE_ENABLED([tests]))
  AM_CONDITIONAL([ENABLE_GEN_TP_EXAMPLES], [test "x$PYTHON" != "x"])
- AM_CONDITIONAL([ENABLE_JAVA_AGENT], AE_IS_FEATURE_ENABLED([java-agent-jul]) || AE_IS_FEATURE_ENABLED([java-agent-log4j]))
+ AM_CONDITIONAL([ENABLE_JAVA_AGENT], AE_IS_FEATURE_ENABLED([java-agent-jul]) || AE_IS_FEATURE_ENABLED([java-agent-log4j]) || AE_IS_FEATURE_ENABLED([java-agent-log4j2]))
  AM_CONDITIONAL([ENABLE_JAVA_AGENT_WITH_JUL], AE_IS_FEATURE_ENABLED([java-agent-jul]))
 -- 
 2.34.1
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 42f2b372dc..946b22d40f 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,9 +1,9 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
-sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.14.0.tar.bz2.sha256
+sha256  82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763  lttng-ust-2.14.0.tar.bz2
 
 # Hash for license files
-sha256  5b52242fd2045d62dd664c8358137b46c1e08efdba674c91cbfc06585efe1ce7  LICENSE
-sha256  f206ce02ddf94d03120b58381064702729a0e6cbb03cafc84dc0e434ce5689fa  LICENSES/BSD-3-Clause
-sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
-sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
-sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
+sha256  5a93d5831e1297ab10fe643e1a631e83be392896da14ee2951285a79012df69d  LICENSES/BSD-3-Clause.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  4b432d14b8f0b85489a784a5ff9d0ccd8a265def548b0794e22ea5ff5e8dd910  LICENSE
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 7ead28052e..fbd565271f 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,10 +5,15 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.13.1
+LTTNG_LIBUST_VERSION = 2.14.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
-LTTNG_LIBUST_LICENSE_FILES = LICENSE LICENSES/BSD-3-Clause LICENSES/GPL-2.0 LICENSES/LGPL-2.1 LICENSES/MIT
+LTTNG_LIBUST_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	LICENSE
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS = \
@@ -21,7 +26,7 @@ LTTNG_LIBUST_AUTORECONF = YES
 LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LTTNG_LIBUST_DEPENDENCIES += python3
+LTTNG_LIBUST_DEPENDENCIES += python3 host-python-setuptools
 LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
 else
 LTTNG_LIBUST_CONF_ENV += am_cv_pathless_PYTHON="none"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
