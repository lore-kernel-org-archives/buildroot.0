Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDDAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDE4840129;
	Mon, 20 Dec 2021 22:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyEd2i2_f3PJ; Mon, 20 Dec 2021 22:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDDA44019D;
	Mon, 20 Dec 2021 22:44:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8B31BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 516368174C
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dtaFylSo2qb for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DACE481498
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D099E828B8; Mon, 20 Dec 2021 22:36:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:05:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a42caa7a23091919c01dacb84df8dd2301e6b0b1
X-Git-Newrev: 68c8c37d7d15a11d91b699f15dbaa00adcd4773e
X-Patchwork-Hint: ignore
Message-Id: <20211220223640.D099E828B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-dlna: bump to version 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=68c8c37d7d15a11d91b699f15dbaa00adcd4773e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- GStreamer 0.10 back-end has been dropped with
  https://gitlab.gnome.org/GNOME/gupnp-dlna/-/commit/af50a8ac988c3929cec1afc6f85458d98ce80485
- Switch to meson-package (to avoid autoreconf as no configure is
  shipped anymore)
- Update indention in hash file (two spaces)

https://gitlab.gnome.org/GNOME/gupnp-dlna/-/blob/gupnp-dlna-0.12.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gupnp-dlna/gupnp-dlna.hash |  6 +++---
 package/gupnp-dlna/gupnp-dlna.mk   | 16 +++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.hash b/package/gupnp-dlna/gupnp-dlna.hash
index 01c7489738..dd9f2e4e4f 100644
--- a/package/gupnp-dlna/gupnp-dlna.hash
+++ b/package/gupnp-dlna/gupnp-dlna.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.10/gupnp-dlna-0.10.5.sha256sum:
-sha256	123e368227c11d5c17fc1aa76cbdaffa345355eb51d172cd39fc74a5b468ff6a	gupnp-dlna-0.10.5.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.12/gupnp-dlna-0.12.0.sha256sum:
+sha256  3d53b96f85bc5628d33e367ec9bf2adb38ef2b34d7ad0434a6ba0cf4ad9048e6  gupnp-dlna-0.12.0.tar.xz
 
 # Locally computed:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index dd548e3e2d..4f75c9b527 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_DLNA_VERSION_MAJOR = 0.10
-GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).5
+GUPNP_DLNA_VERSION_MAJOR = 0.12
+GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).0
 GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
 GUPNP_DLNA_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
@@ -15,20 +15,18 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
 else
-GUPNP_DLNA_CONF_OPTS += --disable-introspection
+GUPNP_DLNA_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=enabled
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
