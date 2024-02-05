Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040EDC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F8A4032D;
	Mon,  5 Feb 2024 15:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F8A4032D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jog-Hzp8_ROD; Mon,  5 Feb 2024 15:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F2841938;
	Mon,  5 Feb 2024 15:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F2841938
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5871BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C4B81EAC
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65C4B81EAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5SwWgqVEJVLb for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:38:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F3FD81EAB
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F3FD81EAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F3F86D43; Mon,  5 Feb 2024 15:38:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:36:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5524c00656c314626862e54b2cd38865486cf55
X-Git-Newrev: b50bb982208011841fe0a9a7e4309808085cf493
X-Patchwork-Hint: ignore
Message-Id: <20240205153822.75F3F86D43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqrtr-glib: bump version to 1.2.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b50bb982208011841fe0a9a7e4309808085cf493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Project switched to meson.
Use gitlab.freedesktop.org for download (previous URL did not work for
meson), thus moving to tar.gz archive.

Disable gtkdocize (not only to follow Buildroot approach, but also to avoid
build failure: ERROR: Program 'gtkdoc-scan' not found or not executable).

License file got renamed:
https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/commit/974e4231eaf4a3bf087c1df54e77df8cac935e15

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqrtr-glib/libqrtr-glib.hash |  4 ++--
 package/libqrtr-glib/libqrtr-glib.mk   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libqrtr-glib/libqrtr-glib.hash b/package/libqrtr-glib/libqrtr-glib.hash
index e00dd0cb94..38543f7de9 100644
--- a/package/libqrtr-glib/libqrtr-glib.hash
+++ b/package/libqrtr-glib/libqrtr-glib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  30d879b2ade6f8f461def3a677755db5c0238babf688d5c83c03b3e6abe35cee  libqrtr-glib-1.0.0.tar.xz
+sha256  c5cdf5ea91cbd2cf2758b2896064c7b1dfe7156063267df905f957ac69b6b763  libqrtr-glib-1.2.2.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index 6ab8335417..c3df76dc84 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-LIBQRTR_GLIB_VERSION = 1.0.0
-LIBQRTR_GLIB_SITE = http://www.freedesktop.org/software/libqmi
-LIBQRTR_GLIB_SOURCE = libqrtr-glib-$(LIBQRTR_GLIB_VERSION).tar.xz
+LIBQRTR_GLIB_VERSION = 1.2.2
+LIBQRTR_GLIB_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/archive/$(LIBQRTR_GLIB_VERSION)
 LIBQRTR_GLIB_LICENSE = LGPL-2.1+
-LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
+LIBQRTR_GLIB_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
 LIBQRTR_GLIB_INSTALL_STAGING = YES
 LIBQRTR_GLIB_DEPENDENCIES = libglib2
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBQRTR_GLIB_CONF_OPTS += --enable-introspection
+LIBQRTR_GLIB_CONF_OPTS += -Dintrospection=true
 LIBQRTR_GLIB_DEPENDENCIES += gobject-introspection
 else
-LIBQRTR_GLIB_CONF_OPTS += --disable-introspection
+LIBQRTR_GLIB_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+# disable gtkdocize
+LIBQRTR_GLIB_CONF_OPTS += -Dgtk_doc=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
