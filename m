Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6569C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2092A4029B;
	Mon, 12 Dec 2022 20:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2092A4029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEost72hRXqE; Mon, 12 Dec 2022 20:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7C0340277;
	Mon, 12 Dec 2022 20:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7C0340277
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B86C1BF37B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FA6A40277
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA6A40277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVDxo_XIAffx for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 20:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8444640260
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8444640260
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 20:27:35 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout05.t-online.de (Postfix) with SMTP id C8F821709E;
 Mon, 12 Dec 2022 21:27:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4pOa-4Pr3pp0; Mon, 12 Dec 2022 21:27:28 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56274)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4pOa-00065W-1X;
 Mon, 12 Dec 2022 21:27:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 21:27:27 +0100
Message-Id: <20221212202728.1531746-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670876848-61A0C2DC-39426554/0/0 CLEAN NORMAL
X-TOI-MSGID: 5717087d-ff63-4b4c-a39c-b5d2e55698f0
Subject: [Buildroot] [PATCH 1/2] package/libunibreak: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduced as optional dependency with libass 0.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig

BR2_PACKAGE_LIBUNIBREAK=y

                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: OK
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: OK
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: OK
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: OK
                      br-arm-full-static [29/44]: OK
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libunibreak/Config.in        |  8 ++++++++
 package/libunibreak/libunibreak.hash |  3 +++
 package/libunibreak/libunibreak.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/libunibreak/Config.in
 create mode 100644 package/libunibreak/libunibreak.hash
 create mode 100644 package/libunibreak/libunibreak.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 60ccdd8419..ad7f3f4b91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -399,6 +399,7 @@ F:	package/libsndfile/
 F:	package/libsoundtouch/
 F:	package/libsquish/
 F:	package/libudfread/
+F:	package/libunibreak/
 F:	package/liburiparser/
 F:	package/libutp/
 F:	package/libva/
diff --git a/package/Config.in b/package/Config.in
index 5cd6bb9b7f..d66bc2e84c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2143,6 +2143,7 @@ menu "Text and terminal handling"
 	source "package/libestr/Config.in"
 	source "package/libfribidi/Config.in"
 	source "package/libiconv/Config.in"
+	source "package/libunibreak/Config.in"
 	source "package/libunistring/Config.in"
 	source "package/linenoise/Config.in"
 	source "package/ncurses/Config.in"
diff --git a/package/libunibreak/Config.in b/package/libunibreak/Config.in
new file mode 100644
index 0000000000..101d621fd6
--- /dev/null
+++ b/package/libunibreak/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUNIBREAK
+	bool "libunibreak"
+	help
+	  libunibreak is an implementation of the line breaking and word
+	  breaking algorithms as described in Unicode Standard Annex 14
+	  and Unicode Standard Annex 29.
+
+	  https://github.com/adah1972/libunibreak
diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
new file mode 100644
index 0000000000..bb85f21cdc
--- /dev/null
+++ b/package/libunibreak/libunibreak.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dd1a92d4c5646aa0e457ff41d89812ec5243863be6c20bbcb5ee380f3dd78377  libunibreak-5.1.tar.gz
+sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
new file mode 100644
index 0000000000..fa52116c1f
--- /dev/null
+++ b/package/libunibreak/libunibreak.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libunibreak
+#
+################################################################################
+
+LIBUNIBREAK_VERSION = 5.1
+LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
+LIBUNIBREAK_INSTALL_STAGING = YES
+LIBUNIBREAK_LICENSE = Zlib
+LIBUNIBREAK_LICENSE_FILES = LICENCE
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
