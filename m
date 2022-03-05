Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7204BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F292408F7;
	Sat,  5 Mar 2022 14:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ihZSEIehZEar; Sat,  5 Mar 2022 14:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 447D9408F5;
	Sat,  5 Mar 2022 14:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F12B1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB6B640438
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRfLbp872QAm for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 756BF40523
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D1A11826D4; Sat,  5 Mar 2022 14:46:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 15:09:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2baaf5bcd748521a3bfcc178c284bc2b302993ed
X-Git-Newrev: 10780e8d6df83d7a92b6dd3282e91fdc0ba369af
X-Patchwork-Hint: ignore
Message-Id: <20220305144636.D1A11826D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgee: bump to version 0.20.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=10780e8d6df83d7a92b6dd3282e91fdc0ba369af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so autoreconf

https://gitlab.gnome.org/GNOME/libgee/-/blob/0.20.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...akefile.am-include-Makefile.introspection.patch | 40 ----------------------
 package/libgee/libgee.hash                         |  4 +--
 package/libgee/libgee.mk                           |  4 +--
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
deleted file mode 100644
index 0906275ae3..0000000000
--- a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Nov 2021 23:57:33 +0100
-Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
-
-Include Makefile.introspection instead of using a custom rule which will
-result in the following build failure when cross-compiling on buildroot
-because of missing --includedir:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
-Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
-error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
-
-Fixes:
- - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
----
- gee/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gee/Makefile.am b/gee/Makefile.am
-index 5634bcb..e0d950e 100644
---- a/gee/Makefile.am
-+++ b/gee/Makefile.am
-@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
- 	-l $(libgee_dlname)
- Gee-0.8.gir: libgee_0_8_la_vala.stamp
- Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
--	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
-+
-+-include $(INTROSPECTION_MAKEFILE)
- endif
- 
- MOSTLYCLEANFILES = \
--- 
-2.33.0
-
diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 72d2c21ced..54a46f954c 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.4.sha256sum
-sha256  524c1bf390f9cdda4fbd9a47b269980dc64ab5280f0801b53bc69d782c72de0e  libgee-0.20.4.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.5.sha256sum
+sha256  31863a8957d5a727f9067495cabf0a0889fa5d3d44626e54094331188d5c1518  libgee-0.20.5.tar.xz
 
 # Hash for license file:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 64beef30df..7d8d3d4863 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).4
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).5
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
@@ -13,8 +13,6 @@ LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
 LIBGEE_CPE_ID_VENDOR = gnome
-# We're patching gee/Makefile.am
-LIBGEE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBGEE_CONF_OPTS += --enable-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
