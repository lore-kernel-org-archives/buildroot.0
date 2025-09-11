Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB8CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419A74119D;
	Thu, 11 Sep 2025 20:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxMrTVrcFnJn; Thu, 11 Sep 2025 20:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A62421F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A62421F9;
	Thu, 11 Sep 2025 20:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 200C492E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 070C261667
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjR1SNByf4KZ for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C53D616FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C53D616FD
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C5C98447A; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:26:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7480c610137f59532b8f2bcacbb31cd6b3c36ce
X-Git-Newrev: 02369c8bbb6f3d1588ac2cab10710c975d46bd43
X-Patchwork-Hint: ignore
Message-Id: <20250911202824.2C5C98447A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sylpheed: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02369c8bbb6f3d1588ac2cab10710c975d46bd43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the libgtk2 package, we must first remove
sylpheed which requires libgtk2.

Even though there has been some upstream activity as recent as three
years ago, the package hasn't been updated for libgtk3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 ...arden-link-checker-before-accepting-click.patch | 39 ----------------------
 package/sylpheed/Config.in                         |  7 ----
 package/sylpheed/sylpheed.hash                     |  4 ---
 package/sylpheed/sylpheed.mk                       | 37 --------------------
 7 files changed, 7 insertions(+), 89 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 050994c2d2..a1f87db79a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1053,7 +1053,6 @@ package/supervisor/S99supervisord lib_sysv.Variables
 package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch lib_patch.Upstream
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
-package/sylpheed/0001-harden-link-checker-before-accepting-click.patch lib_patch.Upstream
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch lib_patch.Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/targetcli-fb/S50target Shellcheck lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index a177ad30f7..b60b1a8845 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_SYLPHEED
+	bool "sylpheed has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the sylpheed package has been
+	  removed.
+
 config BR2_PACKAGE_PINENTRY_GTK2
 	bool "gtk2 backend of pinentry has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index e039a181eb..85928509f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2387,7 +2387,6 @@ menu "Mail"
 	source "package/libesmtp/Config.in"
 	source "package/msmtp/Config.in"
 	source "package/mutt/Config.in"
-	source "package/sylpheed/Config.in"
 endmenu
 
 menu "Miscellaneous"
diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
deleted file mode 100644
index 46b4505837..0000000000
--- a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 876c54b2927e48ab6900e5e6b9395742f75e840e Mon Sep 17 00:00:00 2001
-From: Paul <paul@claws-mail.org>
-Date: Sun, 23 May 2021 12:16:40 +0100
-Subject: [PATCH] harden link checker before accepting click
-
-[Retrieved from:
-https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: rebased patch on version 3.7.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- src/textview.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/textview.c b/src/textview.c
-index e55eea9..6fbb8a1 100644
---- a/src/textview.c
-+++ b/src/textview.c
-@@ -2689,7 +2689,7 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
- 	gboolean retval = TRUE;
- 
- 	if (is_uri_string(uri->uri) == FALSE)
--		return TRUE;
-+		return FALSE;
- 
- 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview->text));
- 	gtk_text_buffer_get_iter_at_offset(buffer, &start_iter, uri->start);
-@@ -2725,6 +2725,8 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
- 		if (aval == G_ALERTDEFAULT)
- 			retval = TRUE;
- 	}
-+	if (strlen(uri->uri) > get_uri_len(uri->uri))
-+		retval = FALSE;
- 
- 	g_free(visible_str);
- 
--- 
-2.45.2
-
diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
deleted file mode 100644
index f03ae87706..0000000000
--- a/package/sylpheed/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_SYLPHEED
-	bool "sylpheed"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  lightweight and user-friendly e-mail client.
-
-	  http://sylpheed.sraoss.jp/en/
diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
deleted file mode 100644
index 39fa76612d..0000000000
--- a/package/sylpheed/sylpheed.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  0d6bc5eb46f5d0a463757c62bc80b00d219b294b3c3662840e4540f6db2e3e49  sylpheed-3.7.0.tar.xz
-sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
deleted file mode 100644
index fc419e2867..0000000000
--- a/package/sylpheed/sylpheed.mk
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# sylpheed
-#
-################################################################################
-
-SYLPHEED_VERSION_MAJOR = 3.7
-SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
-SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.xz
-SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
-SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
-SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
-SYLPHEED_CPE_ID_VALID = YES
-SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
-SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
-
-# 0001-harden-link-checker-before-accepting-click.patch
-SYLPHEED_IGNORE_CVES += CVE-2021-37746
-
-# Remove the -I$(includedir) from the Makefiles
-# because it refers to the host /usr/include.
-define SYLPHEED_PRECONFIGURE
-	for i in $$(find $(@D) -name "Makefile*"); do \
-		sed -i 's:-I$$(includedir)::g' $$i; \
-	done
-endef
-
-SYLPHEED_PRE_CONFIGURE_HOOKS += SYLPHEED_PRECONFIGURE
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYLPHEED_DEPENDENCIES += openssl
-SYLPHEED_CONF_OPTS += --enable-ssl
-else
-SYLPHEED_CONF_OPTS += --disable-ssl
-endif
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
