Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ECEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C61060F46
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C61060F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE7640255;
	Sat, 13 Nov 2021 14:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bfs28yJUwwun; Sat, 13 Nov 2021 14:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59CCD40264;
	Sat, 13 Nov 2021 14:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85F571BF23C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 732DF40401
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9QwjkJRmHxe for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D2E40424
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C09868C9ED; Sat, 13 Nov 2021 14:34:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:37:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dfc468c4af354dbead36aec0c80b986415ac4be9
X-Git-Newrev: 39a796c21444196b2de8c3bb1ff0c12d2123afa8
X-Patchwork-Hint: ignore
Message-Id: <20211113143454.C09868C9ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libxcvt:
 new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39a796c21444196b2de8c3bb1ff0c12d2123afa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for X.org xserver 21.1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/Config.in                      |  1 +
 package/x11r7/xlib_libxcvt/Config.in         |  8 ++++++++
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash |  5 +++++
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

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
index 0000000000..4e51648de7
--- /dev/null
+++ b/package/x11r7/xlib_libxcvt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXCVT
+	bool "libxcvt"
+	help
+	  libxcvt is a library providing a standalone version of the X
+	  server implementation of the VESA CVT standard timing mode-
+	  lines generator.
+
+	  https://gitlab.freedesktop.org/xorg/lib/libxcvt
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
