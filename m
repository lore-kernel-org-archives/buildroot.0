Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06688C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 18:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4971E812F8;
	Sat,  5 Feb 2022 18:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzJlCLYL2up8; Sat,  5 Feb 2022 18:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2FB813CC;
	Sat,  5 Feb 2022 18:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE4E1BF41B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C39D81260
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1A4v-c9SoQN3 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 18:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6034B80F5C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 18:08:32 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout04.t-online.de (Postfix) with SMTP id 3636B3808;
 Sat,  5 Feb 2022 19:08:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nGPTu-2YuLIn0; Sat, 5 Feb 2022 19:08:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44586)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nGPTt-0002vI-Pl;
 Sat, 05 Feb 2022 19:08:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 19:08:17 +0100
Message-Id: <20220205180817.2103343-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
References: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644084498-0000B7AB-DB880748/0/0 CLEAN NORMAL
X-TOI-MSGID: d479779b-079b-4f1e-84c7-5589f7b57258
Subject: [Buildroot] [PATCH 3/3] package/libutp: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for upcoming version bump of transmission.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build test using this defconfig

BR2_PACKAGE_LIBUTP=y

was successful:

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: OK
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: OK
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libutp/Config.in   | 10 ++++++++++
 package/libutp/libutp.hash |  3 +++
 package/libutp/libutp.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/libutp/Config.in
 create mode 100644 package/libutp/libutp.hash
 create mode 100644 package/libutp/libutp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4084c5545..c1e486a175 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -398,6 +398,7 @@ F:	package/libsoundtouch/
 F:	package/libsquish/
 F:	package/libudfread/
 F:	package/liburiparser/
+F:	package/libutp/
 F:	package/libva/
 F:	package/libva-intel-driver/
 F:	package/libva-utils/
diff --git a/package/Config.in b/package/Config.in
index 990ee19665..03fd6c04dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1881,6 +1881,7 @@ menu "Networking"
 	source "package/libupnp/Config.in"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
+	source "package/libutp/Config.in"
 	source "package/libuwsc/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsock/Config.in"
diff --git a/package/libutp/Config.in b/package/libutp/Config.in
new file mode 100644
index 0000000000..6382913103
--- /dev/null
+++ b/package/libutp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBUTP
+	bool "libutp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  uTorrent Transport Protocol library
+
+	  https://github.com/bittorrent/libutp
+
+comment "libutp support needs a toolchain with C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
new file mode 100644
index 0000000000..38d46b0ae5
--- /dev/null
+++ b/package/libutp/libutp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c515e6f9add47d3d202389e8a62feb765f0ae41d6398cc238e44028be520774e  libutp-fda9f4b3db97ccb243fcbed2ce280eb4135d705b.tar.gz
+sha256  4441418beb8e352b6e2aa09083b4c51a86814a49878dbb1a81936b466cd5badd  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
new file mode 100644
index 0000000000..c926c290d2
--- /dev/null
+++ b/package/libutp/libutp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libutp
+#
+################################################################################
+
+LIBUTP_VERSION = fda9f4b3db97ccb243fcbed2ce280eb4135d705b
+LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
+LIBUTP_LICENSE = MIT
+LIBUTP_LICENSE_FILES = LICENSE
+LIBUTP_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
