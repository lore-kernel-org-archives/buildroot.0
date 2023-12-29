Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AEAC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CD2436E5;
	Fri, 29 Dec 2023 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CD2436E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRm6GyNLxzTR; Fri, 29 Dec 2023 21:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FB14436FC;
	Fri, 29 Dec 2023 21:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB14436FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB9BC1BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3B394194A
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B394194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AI7h0SnsRe0R for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF926417E9
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF926417E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB6FE8392A; Fri, 29 Dec 2023 21:24:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:20:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ec81b61db7a61e56be81c1f8e85bc776d171fac
X-Git-Newrev: 0cd1096eb067542070a991120c953811d6e5e4d1
X-Patchwork-Hint: ignore
Message-Id: <20231229212403.BB6FE8392A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gssdp: bump to version 1.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd1096eb067542070a991120c953811d6e5e4d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libsoup has been replaced by libsoup3 with
  https://gitlab.gnome.org/GNOME/gssdp/-/commit/e223e6f75e370c3d9b2b402586521fe005f1a0da
- Disable manpages which are enabled by default since their addition:
  https://gitlab.gnome.org/GNOME/gssdp/-/commit/1970906319eefa0bf48553e60ee67b5a75b9e1c5

https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.6.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: multiline assignment is entirely multiline]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gssdp/Config.in  |  8 ++++----
 package/gssdp/gssdp.hash |  4 ++--
 package/gssdp/gssdp.mk   | 12 ++++++++----
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
index 80c5edfffc..5a9317f486 100644
--- a/package/gssdp/Config.in
+++ b/package/gssdp/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_GSSDP
 	bool "gssdp"
-	depends on BR2_USE_WCHAR # glib2, libsoup
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup
-	depends on BR2_USE_MMU # glib2, libsoup
+	depends on BR2_USE_WCHAR # glib2, libsoup3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libsoup3
+	depends on BR2_USE_MMU # glib2, libsoup3
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	help
 	  GSSDP implements resource discovery and announcement over
 	  SSDP.
diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 34ccfa8044..06bf51090f 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
-sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gssdp/1.6/gssdp-1.6.3.sha256sum:
+sha256  2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446  gssdp-1.6.3.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index f7ebb44acd..3b446496ea 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -4,15 +4,19 @@
 #
 ################################################################################
 
-GSSDP_VERSION_MAJOR = 1.4
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
+GSSDP_VERSION_MAJOR = 1.6
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
-GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = -Dexamples=false -Dgtk_doc=false -Dsniffer=false
+GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup3
+GSSDP_CONF_OPTS = \
+	-Dexamples=false \
+	-Dgtk_doc=false \
+	-Dmanpages=false \
+	-Dsniffer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
