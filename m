Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0415DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C195F60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C195F60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91EFD8437A;
	Wed,  4 Aug 2021 00:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTdremV7MK-B; Wed,  4 Aug 2021 00:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435E68437F;
	Wed,  4 Aug 2021 00:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE1C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E8640EC3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GjZZOW-hRvG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7583B40F3B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CCCD182BC5; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:23:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6fd393d38889ea3fa20e0a95d93d21ad4b58db9
X-Git-Newrev: 7c8641e5a97b89c14aebd730772e9cc037de6ccc
X-Patchwork-Hint: ignore
Message-Id: <20210803211015.CCCD182BC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/daq3: fix build
 without threads
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7c8641e5a97b89c14aebd730772e9cc037de6ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pcap module and example unconditionally uses pthread.h

Fixes:
 - http://autobuild.buildroot.org/results/b618bcca1a83704f7f15e76cd1e7f1117cbbd464

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/daq3/0001-add-disable-example.patch | 49 +++++++++++++++++++++++++++++
 package/daq3/daq3.mk                        |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/package/daq3/0001-add-disable-example.patch b/package/daq3/0001-add-disable-example.patch
new file mode 100644
index 0000000000..c126e32859
--- /dev/null
+++ b/package/daq3/0001-add-disable-example.patch
@@ -0,0 +1,49 @@
+From 1d7031dde8da39cd2151f87d68dddea91f304603 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Jun 2021 11:31:35 +0200
+Subject: [PATCH] add --disable-example
+
+Add --disable-example to be able to build daq on toolchains without
+threads support
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/snort3/libdaq/pull/13]
+---
+ Makefile.am  | 5 ++++-
+ configure.ac | 5 +++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dcba62b..0a79319 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,6 +7,9 @@ pkgconfig_DATA = libdaq.pc
+ if BUILD_MODULES
+     MODULES_DIR = modules
+ endif
+-SUBDIRS = api $(MODULES_DIR) example test
++SUBDIRS = api $(MODULES_DIR) test
++if BUILD_EXAMPLE
++    SUBDIRS += example
++endif
+ 
+ ACLOCAL_AMFLAGS = -I m4
+diff --git a/configure.ac b/configure.ac
+index 23b38a2..36a09ee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -274,6 +274,11 @@ AM_CONDITIONAL([BUILD_MODULES], [test "$enable_afpacket_module" = yes -o \
+ 
+ LIBS=${save_LIBS}
+ 
++AC_ARG_ENABLE(example,
++              AS_HELP_STRING([--disable-example],[do not build the example]),
++              [enable_example="$enableval"], [enable_example=yes])
++AM_CONDITIONAL([BUILD_EXAMPLE], [test "$enable_example" = yes])
++
+ AC_CHECK_LIB([dl], [dlopen], [LIBDL="-ldl"])
+ 
+ AM_CONDITIONAL([BUILD_SHARED_MODULES], [ test "$enable_shared" = yes ])
+-- 
+2.30.2
+
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index a0493031d8..50e0eaccba 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -12,6 +12,7 @@ DAQ3_INSTALL_STAGING = YES
 DAQ3_DEPENDENCIES = host-pkgconf
 # From git
 DAQ3_AUTORECONF = YES
+DAQ3_CONF_OPTS = --disable-example
 
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 DAQ3_DEPENDENCIES += libnetfilter_queue
@@ -20,7 +21,7 @@ else
 DAQ3_CONF_OPTS += --disable-nfq-module
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+ifeq ($(BR2_PACKAGE_LIBPCAP)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 DAQ3_DEPENDENCIES += libpcap
 DAQ3_CONF_OPTS += --enable-pcap-module
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
