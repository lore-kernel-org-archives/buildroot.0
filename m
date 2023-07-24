Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592EBEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC57081E16;
	Mon, 24 Jul 2023 20:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC57081E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VaguTAEX-mM; Mon, 24 Jul 2023 20:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B876481E23;
	Mon, 24 Jul 2023 20:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B876481E23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1E961BF5B4
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B6D540165
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 20:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6D540165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92adDxbGj_F7 for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 20:44:44 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 099FF400AC
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 20:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 099FF400AC
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2519A4C00BA
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 22:44:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41634)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qO2Q3-0006d3-0y
 for buildroot@buildroot.org; Mon, 24 Jul 2023 22:44:39 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 22:44:39 +0200
Message-Id: <20230724204439.1526127-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690231479;
 bh=uCvx+6bhHvgoPC+vd+ePlqYdB2Sir3vdlNgsi1r0IDc=;
 h=From:To:Subject:Date:From;
 b=gRT1Wjbr7aoibo5N1HxiWyEl2x0Zm4t7/nXk9nh/qhfwG//wDWNh7trVITuv8odLV
 +GMBCqhRiHVgJn4/IvkpOUkfC10ZTjj8KXlwHQQx4APQ0QwQxJywoHopOcdXKVdXq1
 22J+xEHXuL4vb7uBen/TdWR6VgoBG7VLtQL1gd+gBigiEUk4SjHvt4Ia7adosHHqp+
 1Jt7pfjqpyD7LlVfpqriQYPvihOLgYdoELn11hht8625sdUm44/vZwpalZNyrFKpQZ
 4VpKj0Ed7DivNyZO/qGk7yjDatap2IPU+7QJqH70X+3MaTY0CupUZicUx4wmNR8DKK
 PxYIY1oQKcgTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gRT1Wjbr
Subject: [Buildroot] [PATCH 1/1] package/opensc: disable tests
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/50b/50b6962ccd884a91391d13ee75852dd0e9ea1a84/

This error only occurs when building with BR2_SHARED_STATIC_LIBS=y, it
fails for src/tests/fuzzing/fuzz_pkcs15init which is only available when
static linking is enabled:
https://github.com/OpenSC/OpenSC/blob/master/src/tests/fuzzing/Makefile.am#L14

The upstream build system has no support to extract the correct ldflags
for libatomic.so provided by libcrypto.pc. Because we do not need the
tests anyway we just disable them to "fix" the build error for us.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...onfigure-add-option-to-disable-tests.patch | 67 +++++++++++++++++++
 package/opensc/opensc.mk                      |  4 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 package/opensc/0003-configure-add-option-to-disable-tests.patch

diff --git a/package/opensc/0003-configure-add-option-to-disable-tests.patch b/package/opensc/0003-configure-add-option-to-disable-tests.patch
new file mode 100644
index 0000000000..29342026c1
--- /dev/null
+++ b/package/opensc/0003-configure-add-option-to-disable-tests.patch
@@ -0,0 +1,67 @@
+From 3c3ed2ecbf31d41b6e5406da55971b9d9eaa3388 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 24 Jul 2023 22:28:11 +0200
+Subject: [PATCH] configure: add option to disable tests
+
+Upstream: https://github.com/OpenSC/OpenSC/pull/2822
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac    | 9 +++++++++
+ src/Makefile.am | 6 +++++-
+ 2 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0a90445b..9b7543da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -272,6 +272,13 @@ AC_ARG_ENABLE(
+ 	[enable_doc="no"]
+ )
+ 
++AC_ARG_ENABLE(
++	[tests],
++	[AS_HELP_STRING([--enable-tests],[enable tests @<:@enabled@:>@])],
++	,
++	[enable_tests="yes"]
++)
++
+ AC_ARG_ENABLE(
+ 	[dnie-ui],
+ 	[AS_HELP_STRING([--enable-dnie-ui],[enable use of external user interface program to request DNIe pin@<:@disabled@:>@])],
+@@ -1119,6 +1126,7 @@ AM_CONDITIONAL([ENABLE_NOTIFY], [test "${enable_notify}" = "yes"])
+ AM_CONDITIONAL([ENABLE_CRYPTOTOKENKIT], [test "${enable_cryptotokenkit}" = "yes"])
+ AM_CONDITIONAL([ENABLE_OPENCT], [test "${enable_openct}" = "yes"])
+ AM_CONDITIONAL([ENABLE_DOC], [test "${enable_doc}" = "yes"])
++AM_CONDITIONAL([ENABLE_TESTS], [test "${enable_tests}" = "yes"])
+ AM_CONDITIONAL([WIN32], [test "${WIN32}" = "yes"])
+ AM_CONDITIONAL([CYGWIN], [test "${CYGWIN}" = "yes"])
+ AM_CONDITIONAL([ENABLE_MINIDRIVER], [test "${enable_minidriver}" = "yes"])
+@@ -1213,6 +1221,7 @@ XSL stylesheets:         ${xslstylesheetsdir}
+ 
+ man support:             ${enable_man}
+ doc support:             ${enable_doc}
++tests:                   ${enable_tests}
+ thread locking support:  ${enable_thread_locking}
+ zlib support:            ${enable_zlib}
+ readline support:        ${enable_readline}
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3ce465bf..bf71b61f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -3,7 +3,11 @@ EXTRA_DIST = Makefile.mak
+ 
+ # Order IS important
+ SUBDIRS = common scconf ui pkcs15init sm \
+-		  libopensc pkcs11 tools minidriver tests
++		  libopensc pkcs11 tools minidriver
++
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
+ 
+ if ENABLE_SM
+ SUBDIRS += smm
+-- 
+2.39.2
+
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 253b6b26f8..32f0fdaa8b 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -9,8 +9,10 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VENDOR = opensc_project
+# 0003-configure-add-option-to-disable-tests.patch
+OPENSC_AUTORECONF = YES
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
-OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
+OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
 
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
