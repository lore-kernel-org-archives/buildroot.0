Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A37CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 21:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC89941688;
	Thu, 23 Dec 2021 21:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gU43XKeMP8nE; Thu, 23 Dec 2021 21:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2254B41680;
	Thu, 23 Dec 2021 21:30:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8ACA1BF400
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 340DB40A9A
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 21:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuzuGxgcpz79 for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 21:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 037A94000B
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 21:30:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so13793113wrg.11
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 13:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqrsnDeT1tFLStzLMAoPg6RtXElOP0l9nyHCg4cRT7c=;
 b=hqEzXttGHwoBym8mP/fFC7l8gtwR+pB8WluN4NYjHGwLwZXEjFBj4JcMX0oaeHjkB1
 JERUry1EE8Vgdfg32P1G5kLxJS94dyqTWioih8ac9nxewOw8bueJJ5p+/78bbgFDCwbO
 R5za+PfxN/OzqDCEvZlC891jitK3afBCUllR+Dp61TuP5OrIQqYu8/PRbaIGDg+RcE8H
 PNoCJ5N7Q2b43DoYuLnzzQykiH19PbkLkTW3Fmf6V0KIeMhKjIdypcMNps3DZ4uy9uS3
 GuaW22cgjqz6KDWDgNJHSXH1N7LANJZSorR2qxQWfmp9PM1K2zjTAYM3xdV1VBEX+IFQ
 HmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqrsnDeT1tFLStzLMAoPg6RtXElOP0l9nyHCg4cRT7c=;
 b=rWoYfOR3jZYisk02MaTvuV4rjAKPL7DdiSmPT16PszFFN6CC8mS3+wX0M7qjouiw+0
 MWhJ19cb6kLVvQMPgtLrFb/4B2GmbpIxEhBebV0FCKeWv3AiIkFaKLY6b2XsLPxSNKn/
 ctAdnA+5D9iOcp9cMsHfGnujCtjo001hOTYMOGMPRmAiZIpIGdRywQK2ijwbK7HVswGa
 PjtnxCSoOQl8RHYT6nFgCbCDOlbjRN0Ba5X4YH/+Jt0wrjFoWJaXzrus5MQ+jPKEbuHN
 7CyPjSuF7ec2ic+h+pMy9siSpL7nGOPr5gjBdoZRktaFH9/mbRxAsgbj6FEt7MkB2KTf
 UdiA==
X-Gm-Message-State: AOAM530SOY7Hgh9QaFUAJmbTjKBqbtd1oTmQ1jawwSXW1TAHPuw8HWrC
 cQZN9VPWrgJnOKabzSylTsfbkKliczNsAQ==
X-Google-Smtp-Source: ABdhPJwOIPpL9lsrbeqnmRe67TNCzaC1bhxKadOn4inG1rT30MscTmOf2pN0/zm5VTXSvKRg4QtTAw==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr3007604wru.256.1640295042169; 
 Thu, 23 Dec 2021 13:30:42 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id d2sm5603749wmb.31.2021.12.23.13.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 13:30:41 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 22:30:33 +0100
Message-Id: <20211223213034.229582-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/lttng-libust: bump to version 2.13.1
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to disable building tests, building the tests can
fail unless the package is reconfigured.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1 -> v2
*   recreated patch using git-formatpatch
    now it is adding a configure option which we use
---
 .../0001-configure.ac-add-disable-tests.patch | 59 +++++++++++++++++++
 package/lttng-libust/lttng-libust.hash        |  4 +-
 package/lttng-libust/lttng-libust.mk          |  4 +-
 3 files changed, 64 insertions(+), 3 deletions(-)
 create mode 100644 package/lttng-libust/0001-configure.ac-add-disable-tests.patch

diff --git a/package/lttng-libust/0001-configure.ac-add-disable-tests.patch b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..bb962000b4
--- /dev/null
+++ b/package/lttng-libust/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,59 @@
+From a1f8509283ad29b5144bda6f6dba9f5eb7165adc Mon Sep 17 00:00:00 2001
+From: Norbert Lange <nolange79@gmail.com>
+Date: Thu, 23 Dec 2021 21:56:46 +0100
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Add configure option to disable tests.
+Upstream is not likely to accept it, see lttng-tools package.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9ab93ccd..8a1c1dca 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,9 +7,12 @@ SUBDIRS = \
+ 	src \
+ 	tools \
+ 	doc \
+-	tests \
+ 	extras
+ 
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
++
+ dist_doc_DATA = \
+ 	ChangeLog \
+ 	LICENSE \
+diff --git a/configure.ac b/configure.ac
+index b6254228..fe5f2700 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -360,6 +360,11 @@ AE_FEATURE([python-agent],[build the LTTng UST Python agent])
+ AE_FEATURE_DEFAULT_ENABLE
+ AE_FEATURE([examples],[Do not build and install examples])
+ 
++# Build the tests
++# Enabled by default
++AE_FEATURE_DEFAULT_ENABLE
++AE_FEATURE([tests],[Do not build tests])
++
+ # Man pages
+ # Enabled by default
+ AE_FEATURE_DEFAULT_ENABLE
+@@ -525,6 +530,7 @@ AC_DEFINE([LTTNG_UST_CTL_LIB_SONAME_MAJOR], [ust_ctl_lib_version_current], [Majo
+ ##                                                                          ##
+ 
+ AM_CONDITIONAL([ENABLE_EXAMPLES], AE_IS_FEATURE_ENABLED([examples]))
++AM_CONDITIONAL([ENABLE_TESTS], AE_IS_FEATURE_ENABLED([tests]))
+ AM_CONDITIONAL([ENABLE_GEN_TP_EXAMPLES], [test "x$PYTHON" != "x"])
+ AM_CONDITIONAL([ENABLE_JAVA_AGENT], AE_IS_FEATURE_ENABLED([java-agent-jul]) || AE_IS_FEATURE_ENABLED([java-agent-log4j]))
+ AM_CONDITIONAL([ENABLE_JAVA_AGENT_WITH_JUL], AE_IS_FEATURE_ENABLED([java-agent-jul]))
+-- 
+2.34.1
+
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 40bd870e86..23839e42cc 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.12.1.tar.bz2.sha256
-sha256  48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051  lttng-ust-2.12.1.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
+sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
 
 # Hash for license file
 sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 608e8781b1..e3e1cdebf2 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.12.1
+LTTNG_LIBUST_VERSION = 2.13.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
@@ -14,7 +14,9 @@ LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS = \
 	--disable-man-pages \
 	--disable-examples \
+	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
+LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
