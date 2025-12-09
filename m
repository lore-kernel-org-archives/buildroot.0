Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD17D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02B4C80350;
	Fri, 12 Dec 2025 07:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN1S2QvLCl00; Fri, 12 Dec 2025 07:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF83842EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526334;
	bh=MpE7DXk6y7HSrFPHtPuCG3861LgWA0p+OEklJ0SHyI8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kIBk4qfXJ+1M5UMl7N3GcMWfaM3InUDDaFfVDM+1FlxDVb6h7sMIOKxjMfF7c5eby
	 ckIdoNpeaeHb4ZuvbLG251hn1KcABm2QD38/NCG27S8HL6bkdEOGNuT8DEfFcVbC2/
	 8193jaClxKRaRJ3ztTAY/yey+mEv3IwMveQ+0svwbWL59cT7WTr5jIHap9hiGTVyLE
	 +9z8EPqkYi7BnNyvnx21YS1GR6LpXWSULQ3BD0YSghR3Hfx0EaUSLgoKAUGFH70Cfh
	 SVgF1wYoSlo7IlQt7myZuuiwqKyOYOcavxkcavedtjg9RJ3x/SD0mrMgC4Mt+cj7FH
	 sr9yMckwowPlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF83842EC;
	Fri, 12 Dec 2025 07:58:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 529F7E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79E1641132
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEG6bYyUrb70 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C1341191
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2C1341191
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1ED685C4C; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca21d87300ea54217b262e06f295b816fb38eecb
X-Git-Newrev: b822976c6069d5d6296ac61bb848fc3de0900a99
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.D1ED685C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtksourceview: bump version to
 5.18.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b822976c6069d5d6296ac61bb848fc3de0900a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of the major releases:
https://download.gnome.org/sources/gtksourceview/4.0/gtksourceview-4.0.0.news

https://download.gnome.org/sources/gtksourceview/4.3/gtksourceview-4.3.1.news
"Ported to meson build system, autotools will be phased out by next release."

https://download.gnome.org/sources/gtksourceview/5.0/gtksourceview-5.0.0.news
"GtkSourceView 5.0 is the first stable release of GtkSourceView targeting the
 GTK 4 toolkit. It is the culmination of about a year of development."

https://download.gnome.org/sources/gtksourceview/5.18/gtksourceview-5.18.0.news

Switched to gtk4 and meson build system.
Disabled the build of the testsuite.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gtksourceview/Config.in          | 2 +-
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 9 +++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/gtksourceview/Config.in b/package/gtksourceview/Config.in
index e87969b15d..8f1f35c018 100644
--- a/package/gtksourceview/Config.in
+++ b/package/gtksourceview/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GTKSOURCEVIEW
 	bool "gtksourceview"
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_LIBXML2
 	help
 	  GtkSourceView is a portable C library that extends the
diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 7a9cf00655..9d74d2810b 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
-sha256  a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6  gtksourceview-3.24.7.tar.xz
+# Hash from: https://download.gnome.org/sources/gtksourceview/5.18/gtksourceview-5.18.0.sha256sum
+sha256  051a78fe38f793328047e5bcd6d855c6425c0b480c20d9432179e356742c6ac0  gtksourceview-5.18.0.tar.xz
 
 # Locally computed:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 3f5aaea4ae..052904cca0 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-GTKSOURCEVIEW_VERSION_MAJOR = 3.24
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).7
+GTKSOURCEVIEW_VERSION_MAJOR = 5.18
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).0
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	https://download.gnome.org/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
 GTKSOURCEVIEW_LICENSE = LGPL-2.1+
 GTKSOURCEVIEW_LICENSE_FILES = COPYING
 GTKSOURCEVIEW_INSTALL_STAGING = YES
-GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk3
+GTKSOURCEVIEW_DEPENDENCIES = host-pkgconf libglib2 libxml2 libgtk4
+GTKSOURCEVIEW_CONF_OPTS = -Dbuild-testsuite=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
