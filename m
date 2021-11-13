Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBD7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803F461139
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 803F461139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2213A40017;
	Sat, 13 Nov 2021 12:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHBq_8bzrJ5i; Sat, 13 Nov 2021 12:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B38D40175;
	Sat, 13 Nov 2021 12:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C68B1BF31F
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B7240180
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_naTQxS24_I for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 12:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5888240175
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 12:56:25 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout12.t-online.de (Postfix) with SMTP id 3F1A610AE3;
 Sat, 13 Nov 2021 13:56:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlsZx-3wUg4H0; Sat, 13 Nov 2021 13:56:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57762)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlsZx-00028Q-5C;
 Sat, 13 Nov 2021 13:56:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 13:56:19 +0100
Message-Id: <20211113125620.1981211-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
References: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636808182-00001454-7B15EDEF/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e1f48aa-7c84-425d-bbdf-5e568c14b179
Subject: [Buildroot] [PATCH/next 4/5] package/x11r7/xlib_libxcvt: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for X.org xserver 21.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                      |  1 +
 package/x11r7/xlib_libxcvt/Config.in         |  6 ++++++
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash |  5 +++++
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/x11r7/xlib_libxcvt/Config.in
 create mode 100644 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
 create mode 100644 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b891fb42ce..63259e88da 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -52,6 +52,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXxf86vm/Config.in
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
+		source package/x11r7/xlib_libxcvt/Config.in
 		source package/x11r7/xlib_libxkbfile/Config.in
 		source package/x11r7/xlib_libxshmfence/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
diff --git a/package/x11r7/xlib_libxcvt/Config.in b/package/x11r7/xlib_libxcvt/Config.in
new file mode 100644
index 0000000000..b8ff361713
--- /dev/null
+++ b/package/x11r7/xlib_libxcvt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XLIB_LIBXCVT
+	bool "libxcvt"
+	help
+	  libxcvt is a library providing a standalone version of the X
+	  server implementation of the VESA CVT standard timing mode-
+	  lines generator.
diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
new file mode 100644
index 0000000000..71ae9170ac
--- /dev/null
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.hash
@@ -0,0 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2021-October/003114.html
+sha256  27ebce180d355f94c1992930bedb40a36f6d7312ee50bf7f0acbcd22f33e8c29  libxcvt-0.1.1.tar.xz
+sha512  50e9cd0283858823d4cfde75f06e23ffc42983272cb1f75408052fb5b76a4bb6f9de7d42d8ff9ec0dae6e95eefebc6273e03c919a92f237585db55eaf1a57005  libxcvt-0.1.1.tar.xz
+# Locally calculated
+sha256  4849851554bdeda9a2a85ce93946b786605e009685941b8b907a9a36b02ae068  COPYING
diff --git a/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
new file mode 100644
index 0000000000..33a55dfa20
--- /dev/null
+++ b/package/x11r7/xlib_libxcvt/xlib_libxcvt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xlib_libxcvt
+#
+################################################################################
+
+XLIB_LIBXCVT_VERSION = 0.1.1
+XLIB_LIBXCVT_SOURCE = libxcvt-$(XLIB_LIBXCVT_VERSION).tar.xz
+XLIB_LIBXCVT_SITE = https://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCVT_LICENSE = MIT
+XLIB_LIBXCVT_LICENSE_FILES = COPYING
+XLIB_LIBXCVT_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
