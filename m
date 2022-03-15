Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54350C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA0284295;
	Tue, 15 Mar 2022 20:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7d8zvhBeu-1; Tue, 15 Mar 2022 20:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2057E8428C;
	Tue, 15 Mar 2022 20:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1679F1BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 571214026E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZI5UlbdCO4F for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A6A3408BA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B196883F83; Tue, 15 Mar 2022 20:10:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 20:54:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e28156074d296f02b02b7f01767fda314365b890
X-Git-Newrev: 2106f02bae984e97bc151fe47de0a792b84919a7
X-Patchwork-Hint: ignore
Message-Id: <20220315201012.B196883F83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsecret: bump to version 0.20.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2106f02bae984e97bc151fe47de0a792b84919a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Add bash-completion and tpm2-tss optional dependencies

https://gitlab.gnome.org/GNOME/libsecret/-/tags/0.20.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsecret/libsecret.hash |  4 ++--
 package/libsecret/libsecret.mk   | 36 ++++++++++++++++++++++++------------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index 792ec838e3..4eb3d9b95c 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.4.sha256sum
-sha256  325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28  libsecret-0.20.4.tar.xz
+# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.5.sha256sum
+sha256  3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d  libsecret-0.20.5.tar.xz
 
 # Hash for license file:
 sha256  a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 4d14c231d7..82fe38ac1a 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,33 +5,45 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.20
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).4
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).5
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
 LIBSECRET_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+LIBSECRET_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 LIBSECRET_CONF_OPTS = \
-	--disable-manpages \
-	--disable-strict \
-	--disable-coverage \
-	--enable-vala=no
+	-Dgtk_doc=false \
+	-Dmanpage=false \
+	-Dvapi=false
 LIBSECRET_LICENSE = LGPL-2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBSECRET_CONF_OPTS += -Dbash_completion=enabled
+LIBSECRET_DEPENDENCIES += bash-completion
+else
+LIBSECRET_CONF_OPTS += -Dbash_completion=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSECRET_CONF_OPTS += --enable-introspection=yes
+LIBSECRET_CONF_OPTS += -Dintrospection=true
 LIBSECRET_DEPENDENCIES += gobject-introspection
 else
-LIBSECRET_CONF_OPTS += --enable-introspection=no
+LIBSECRET_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSECRET_DEPENDENCIES += libgcrypt
-LIBSECRET_CONF_OPTS += --enable-gcrypt \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBSECRET_CONF_OPTS += -Dgcrypt=true
+else
+LIBSECRET_CONF_OPTS += -Dgcrypt=false
+endif
+
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+LIBSECRET_CONF_OPTS += -Dtpm2=true
+LIBSECRET_DEPENDENCIES += tpm2-tss
 else
-LIBSECRET_CONF_OPTS += --disable-gcrypt
+LIBSECRET_CONF_OPTS += -Dtpm2=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
