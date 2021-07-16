Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8688C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:10:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 656BA60FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 656BA60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 367E740651;
	Wed,  4 Aug 2021 00:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4tFmWigH3HW; Wed,  4 Aug 2021 00:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A42F40653;
	Wed,  4 Aug 2021 00:10:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3EB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3AE240EDD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWqonVihokLU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68FEC406B0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BF39E86A84; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:28:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0a59c6451ec5ac75c277f186de2655196a1fe6c
X-Git-Newrev: a7ee98cec7b94a8200e7a3a83119f457ce4b5a68
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.BF39E86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcr: bump to version
 3.40.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ee98cec7b94a8200e7a3a83119f457ce4b5a68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Switch to meson-package
- Update indention in hash file (two spaces)

https://gitlab.gnome.org/GNOME/gcr/-/blob/3.40.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcr/gcr.hash |  6 +++---
 package/gcr/gcr.mk   | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index 7d5786db9e..e6074a9991 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,3 +1,3 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.34/gcr-3.34.0.sha256sum
-sha256	29df50974a90987af694c0fb8926a6b366e68cacd8abd813817cfe1eb5d54524	gcr-3.34.0.tar.xz
-sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.40/gcr-3.40.0.sha256sum
+sha256  b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5  gcr-3.40.0.tar.xz
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 7f71614bca..d51e853f3f 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.34
+GCR_VERSION_MAJOR = 3.40
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
@@ -15,27 +15,27 @@ GCR_DEPENDENCIES = \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
-GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
 GCR_CONF_OPTS = \
-	--disable-gtk-doc \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+	-Dgpg_path=/usr/bin/gpg2 \
+	-Dgtk_doc=false
 # Even though COPYING is v2 the code states v2.1+
 GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
+GCR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GCR_DEPENDENCIES += gobject-introspection host-libxslt
-GCR_CONF_OPTS += --enable-introspection
+GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
+GCR_CONF_OPTS += -Dintrospection=true
 else
-GCR_CONF_OPTS += --disable-introspection
+GCR_CONF_OPTS += -Dintrospection=false
 endif
 
 # Only the X11 backend is supported for the simple GUI
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 GCR_DEPENDENCIES += libgtk3
-GCR_CONF_OPTS += --with-gtk
+GCR_CONF_OPTS += -Dgtk=true
 else
-GCR_CONF_OPTS += --without-gtk
+GCR_CONF_OPTS += -Dgtk=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
