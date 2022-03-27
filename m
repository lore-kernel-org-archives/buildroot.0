Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72152C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCA882F80;
	Sun, 27 Mar 2022 16:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhG-bkkZUzO0; Sun, 27 Mar 2022 16:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F3282AC8;
	Sun, 27 Mar 2022 16:00:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196941BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 567B440149
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZrK9Y88lGDQ for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 872BB4098B
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3087585DB8; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:55:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 328516a5add9e6f260d3a8e0d372c474ae30b2c1
X-Git-Newrev: a960dbc5d5f68c7ffdded79e34f6739b0d90940e
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.3087585DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-glib: bump to version 1.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a960dbc5d5f68c7ffdded79e34f6739b0d90940e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update introspection option:
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/461edcc8cd6dc1c4efeb09aaaba02459293546f2
- Disable docs (enabled by default since
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/8d6176451f9d7cd4d6660185c679733aee3b57ea)
- Disable tests (added by:
  https://gitlab.gnome.org/GNOME/json-glib/-/commit/8e835f8ed2299ad68032432eaf6491b2da8d532b)
- Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/json-glib/-/blob/1.6.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/json-glib/json-glib.hash | 6 +++---
 package/json-glib/json-glib.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b68794db37..680d404a4b 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.4.sha256sum
-sha256 720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47  json-glib-1.4.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
+sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
 
 # Hash for license file:
-sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index accdb4f888..52ca47e906 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.4
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).4
+JSON_GLIB_VERSION_MAJOR = 1.6
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
 JSON_GLIB_INSTALL_STAGING = YES
+JSON_GLIB_CONF_OPTS = -Dgtk_doc=disabled -Dtests=false
 
 JSON_GLIB_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
@@ -18,10 +19,10 @@ JSON_GLIB_DEPENDENCIES = \
 	libglib2
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-JSON_GLIB_CONF_OPTS += -Dintrospection=true
+JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
 else
-JSON_GLIB_CONF_OPTS += -Dintrospection=false
+JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
 endif
 
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
