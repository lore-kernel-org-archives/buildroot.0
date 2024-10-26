Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E04D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DC481F74;
	Sat, 26 Oct 2024 11:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWcN7xCNcKG7; Sat, 26 Oct 2024 11:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7370281F77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7370281F77;
	Sat, 26 Oct 2024 11:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0C55C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CDEC40195
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihmvPKYu427c for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB91D4018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB91D4018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:49:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1954839BE; Sat, 26 Oct 2024 11:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8
X-Git-Newrev: 8e3ab0ab8852783ccb5f6251156da2044cb4972a
X-Patchwork-Hint: ignore
Message-Id: <20241026114959.A1954839BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: bump to version 0.8.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e3ab0ab8852783ccb5f6251156da2044cb4972a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch "0001-add-stack-protector-option.patch", which is included in
the release.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.8.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libdex/0001-add-stack-protector-option.patch   | 45 ----------------------
 package/libdex/libdex.hash                         |  4 +-
 package/libdex/libdex.mk                           |  5 ++-
 3 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/package/libdex/0001-add-stack-protector-option.patch b/package/libdex/0001-add-stack-protector-option.patch
deleted file mode 100644
index 9021831a39..0000000000
--- a/package/libdex/0001-add-stack-protector-option.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 107efb2f1a014c4475e122677faddbe0dbef1000 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 23 Jul 2024 14:54:59 +0200
-Subject: [PATCH] add stack-protector option
-
-Allow the user to disable stack-protector as it is not supported by all
-toolchains
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/libdex/-/commit/a65d33aebbe43024a046b3f3cc4a1c6c533838d0
----
- meson.build       | 2 +-
- meson_options.txt | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index d0ca81d..2f7aac2 100644
---- a/meson.build
-+++ b/meson.build
-@@ -126,7 +126,7 @@ test_c_args = [
-   ['-Werror=format-security', '-Werror=format=2'],
-   '-FImsvc_recommended_pragmas.h',
- ]
--if get_option('buildtype') != 'plain'
-+if get_option('buildtype') != 'plain' and get_option('stack-protector')
-   if host_machine.system() != 'windows'
-     test_c_args += '-fstack-protector-strong'
-   endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 519cd97..9e3364a 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -4,6 +4,9 @@ option('docs',
- option('examples',
-        type: 'boolean', value: true,
-        description: 'Build example programs')
-+option('stack-protector',
-+       type: 'boolean', value: true,
-+       description: 'Enable stack-protector')
- option('vapi',
-        type: 'boolean', value: true,
-        description: 'Generate vapi data (requires vapigen)')
--- 
-GitLab
-
diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index ec22f330d9..7e08676fe4 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.6/libdex-0.6.1.sha256sum
-sha256  d176de6578571e32a8c0b603b6a5a13fa5f87fb6b5442575b38ec5af16b17a92  libdex-0.6.1.tar.xz
+# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.0.sha256sum
+sha256  659ab5d0eb7f10bd36af0cde08055158987690b9714e7f5b001c788ec1d01a25  libdex-0.8.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 360b389255..0d27b35675 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBDEX_VERSION_MAJOR = 0.6
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+# The middle number is even for stable releases, odd for development ones.
+LIBDEX_VERSION_MAJOR = 0.8
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
