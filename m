Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E93C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 17:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6C560F1E;
	Wed,  2 Mar 2022 17:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMT9atmdSWen; Wed,  2 Mar 2022 17:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ADE760F13;
	Wed,  2 Mar 2022 17:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA481BF842
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 17:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285EE8138D
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 17:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RspTU3mYoghl for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 17:45:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EBB18138B
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 17:45:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b5so3997027wrr.2
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jwvv9L1F6RT48YklHd1EmarRwPlfW1aHzMB+trfHumQ=;
 b=mvoh+xBcZJaW9HrRFELnuDNUjM/OZ1nZPwt/itdiAcIc3JKkm1Z3Zw1+hvUUrTuCFn
 EYMyEd1xuayBeyiPHC9ugD1nBNMJ7ZP9SiefGwARITdqyUfEKVBT1ZOH1W8xgivqecNP
 MEgURcIhUEphuBPGHRxJWn2fkblYPXnot46wybcxFCZnV4QJZTFKFT9WezAaMadJzOwC
 5ViNdQwKB6gyuw1jRugk08SGL1rW+bYTVKhFYoF53TSex2eN4E1ySbxOpQycp1Bebm0U
 nj4T0vLBhAMOed7UUwviUK6ZD5LqkD2+lrAR6HaDHDb4KI9tqNicDmqXuaqxtUx+z3cQ
 kItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jwvv9L1F6RT48YklHd1EmarRwPlfW1aHzMB+trfHumQ=;
 b=OK7vpck8owXbAs9TVhnNQK/QjvEnwYPLuaIxYKnmlGFTldMhBzys3fmtA5gz1eEO8E
 qZ+kLSN5Vg1ra8hC00W1FRF9GTf2hCzEWcM8uNZP8vEJekUJxKQ0MP1UuzAE9BSffBy2
 WojSwlYWl0Y9vXXW2k/9Rmkxa0abZagSRhm9wxABpCmeTud7L0ZogrgqdshzeUH3WXHe
 Yb2s9y4nmJamh7DrB3+Has7hjcNrrmx1LUA4QfcknwASAIUMN6Ixz3AMJCBvoU/CwAKm
 Fcrxw2g6FGGXwGdCCnSrf3pLeV1kOY1oDCibS3Rw7Xo6sl1IEcGA0nkkVYmWVPZh66WF
 joEw==
X-Gm-Message-State: AOAM533vlpbz21GxCD+xVUd7qkjky/CdTSbvzvrt83Pcs6jYBh6Vvg6q
 +KGdi1C3yQ2LL6HdD1iISE9dS6TJngs=
X-Google-Smtp-Source: ABdhPJzVwwmntQJV431rLxxGYAJlmKYXKo5VSWD1f0P5Ylt9inelDU4uIem3ZOKMo9psxP0LEbagIg==
X-Received: by 2002:a5d:47c8:0:b0:1ef:8e97:2b8c with SMTP id
 o8-20020a5d47c8000000b001ef8e972b8cmr15973765wrc.545.1646243131915; 
 Wed, 02 Mar 2022 09:45:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm8473347wmq.4.2022.03.02.09.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:45:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 18:44:55 +0100
Message-Id: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/gdk-pixbuf-xlib: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Deprecated Xlib integration for GdkPixbuf.

gdk-pixbuf-xlib has been deprecated and split off of gdk-pixbuf since
version 2.42.0 and
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/3362e94c2595440f322798dc4d15f1ed24a4c52c
resulting in the following "hidden" warnings with xscreensaver since
commit a7b51ed3013c919b293deb95299e33363fb9df70:

   Warning: GTK version 2.24.33 was found, but at least one supporting
            library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
            Perhaps some of the development packages are not installed?

   Warning: The GTK libraries do not seem to be available; the
            `xscreensaver-demo' program requires them.

   Warning: The GDK-Pixbuf library was not found.

            The PNG library is being used instead.

            Some of the demos will not use images as much as they could.
            You should consider installing GDK-Pixbuf and re-running
            configure.

https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/gdk-pixbuf-xlib/Config.in            | 17 +++++++++++++++++
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash |  5 +++++
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk   | 16 ++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/gdk-pixbuf-xlib/Config.in
 create mode 100644 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
 create mode 100644 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2b2cb8c357..897a4dcfee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
 F:	package/freeipmi/
+F:	package/gdk-pixbuf-xlib/
 F:	package/gerbera/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index fb0595377e..85fa91190e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1492,6 +1492,7 @@ menu "Graphics"
 	source "package/freetype/Config.in"
 	source "package/gd/Config.in"
 	source "package/gdk-pixbuf/Config.in"
+	source "package/gdk-pixbuf-xlib/Config.in"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/granite/Config.in"
diff --git a/package/gdk-pixbuf-xlib/Config.in b/package/gdk-pixbuf-xlib/Config.in
new file mode 100644
index 0000000000..2efc5d4d66
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GDK_PIXBUF_XLIB
+	bool "gdk-pixbuf-xlib"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # gdk-pixbuf -> glib2
+	depends on BR2_USE_WCHAR # gdk-pixbuf -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> glib2
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Deprecated Xlib integration for GdkPixbuf.
+
+	  https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib
+
+comment "gdk-pixbuf-xlib needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
new file mode 100644
index 0000000000..e7f74e2b4b
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
@@ -0,0 +1,5 @@
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
+sha256  8b8e1c270ec16a06f665ea841f8e4e167eaa0118d0cbfeeade43745f09198ff7  gdk-pixbuf-xlib-2.40.2.tar.xz
+
+# Hash for license file
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
new file mode 100644
index 0000000000..3e61373b3a
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gdk-pixbuf-xlib
+#
+################################################################################
+
+GDK_PIXBUF_XLIB_VERSION_MAJOR = 2.40
+GDK_PIXBUF_XLIB_VERSION = $(GDK_PIXBUF_XLIB_VERSION_MAJOR).2
+GDK_PIXBUF_XLIB_SOURCE = gdk-pixbuf-xlib-$(GDK_PIXBUF_XLIB_VERSION).tar.xz
+GDK_PIXBUF_XLIB_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
+GDK_PIXBUF_XLIB_LICENSE = LGPL-2.1+
+GDK_PIXBUF_XLIB_LICENSE_FILES = COPYING
+GDK_PIXBUF_XLIB_INSTALL_STAGING = YES
+GDK_PIXBUF_XLIB_DEPENDENCIES = gdk-pixbuf xlib_libX11
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
