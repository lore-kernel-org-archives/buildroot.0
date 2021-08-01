Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3CEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:25:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C74610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C74610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06EE26070B;
	Sun,  1 Aug 2021 14:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2DRoNCA0ace; Sun,  1 Aug 2021 14:25:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3300B606D4;
	Sun,  1 Aug 2021 14:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7E2C1BF44A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0ECD40109
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2GuEkzC63y7 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 14:24:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95263400FC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 14:24:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 348ED8A48F; Sun,  1 Aug 2021 14:24:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 16:20:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb75c4b541fac144b53b63248e235f22ba1d25ad
X-Git-Newrev: 4634e84978a3e64e9050021d209a41cd88a1ad16
X-Patchwork-Hint: ignore
Message-Id: <20210801142456.348ED8A48F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4634e84978a3e64e9050021d209a41cd88a1ad16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rtl_433 (despite the name) is a generic data receiver, mainly for the
433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands.

https://github.com/merbanan/rtl_433

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: forcibly disable building docs and tests]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/rtl_433/Config.in    | 16 ++++++++++++++++
 package/rtl_433/rtl_433.hash |  4 ++++
 package/rtl_433/rtl_433.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e73f2dfd7a..1547ff123b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -912,6 +912,7 @@ F:	package/python-jedi/
 F:	package/python-parso/
 F:	package/python-yatl/
 F:	package/rocksdb/
+F:	package/rtl_433/
 F:	package/rygel/
 F:	package/safeclib/
 F:	package/snort3/
diff --git a/package/Config.in b/package/Config.in
index 2598565234..046c04e994 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2071,6 +2071,7 @@ menu "Miscellaneous"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
+	source "package/rtl_433/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/sunwait/Config.in"
 	source "package/taskd/Config.in"
diff --git a/package/rtl_433/Config.in b/package/rtl_433/Config.in
new file mode 100644
index 0000000000..5664227c82
--- /dev/null
+++ b/package/rtl_433/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RTL_433
+	bool "rtl_433"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
+	help
+	  rtl_433 (despite the name) is a generic data receiver, mainly
+	  for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915
+	  MHz ISM bands.
+
+	  https://github.com/merbanan/rtl_433
+
+comment "rtl_433 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
new file mode 100644
index 0000000000..9ace444b78
--- /dev/null
+++ b/package/rtl_433/rtl_433.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  d8b87535b4e65264018771b6b288259d81137482fc938d01e0c03ac071c03bd5  rtl_433-21.05.tar.gz
+# License file, locally calculated
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
new file mode 100644
index 0000000000..e6d28721fa
--- /dev/null
+++ b/package/rtl_433/rtl_433.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# rtl_433
+#
+################################################################################
+
+RTL_433_VERSION = 21.05
+RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
+RTL_433_LICENSE = GPL-2.0+
+RTL_433_LICENSE_FILES = COPYING
+
+RTL_433_CONF_OPTS = \
+	-DBUILD_DOCUMENTATION=OFF \
+	-DBUILD_TESTING=OFF \
+	-DBUILD_TESTING_ANALYZER=OFF \
+	-DENABLE_SOAPYSDR=OFF
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+RTL_433_DEPENDENCIES += librtlsdr
+RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
+else
+RTL_433_CONF_OPTS += -DENABLE_RTLSDR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RTL_433_DEPENDENCIES += openssl
+RTL_433_CONF_OPTS += -DENABLE_OPENSSL=ON
+else
+RTL_433_CONF_OPTS += -DENABLE_OPENSSL=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
