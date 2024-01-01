Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F37C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DAC60BC1;
	Mon,  1 Jan 2024 20:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DAC60BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpjBqC4vIve3; Mon,  1 Jan 2024 20:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D50260671;
	Mon,  1 Jan 2024 20:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D50260671
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 185B11BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F21C560671
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21C560671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VW1aPw-v6M4S for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:19:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B3BB600B6
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B3BB600B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF9583A8F; Mon,  1 Jan 2024 20:19:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:18:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27e35b95ca1c7cd5156201935b8d1c11fa921581
X-Git-Newrev: 498925bc0ee318d6093d44668ad7d6b74849c837
X-Patchwork-Hint: ignore
Message-Id: <20240101201939.DDF9583A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-tools: bump to version 0.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=498925bc0ee318d6093d44668ad7d6b74849c837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libsoup has been replaced by libsoup3
- Add patches to fix build with libxml2 2.12

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.12.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-common-Drop-deprecated-xmlRecoverMemory.patch | 33 ++++++++++++++++++++++
 ...ommon-Fix-compatibility-with-libxml2-2-12.patch | 28 ++++++++++++++++++
 package/gupnp-tools/Config.in                      |  4 +--
 package/gupnp-tools/gupnp-tools.hash               |  4 +--
 package/gupnp-tools/gupnp-tools.mk                 |  6 ++--
 5 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
new file mode 100644
index 0000000000..c81d1b01fe
--- /dev/null
+++ b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
@@ -0,0 +1,33 @@
+From f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Thu, 3 Aug 2023 23:44:15 +0200
+Subject: [PATCH] common: Drop deprecated xmlRecoverMemory
+
+Fixes #27
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/common/pretty-print.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
+index c692664..c8ebc9a 100644
+--- a/src/common/pretty-print.c
++++ b/src/common/pretty-print.c
+@@ -34,7 +34,11 @@ pretty_print_xml (const char *xml)
+         char *text;
+         int length;
+ 
+-        doc = xmlRecoverMemory (xml, strlen (xml));
++        doc = xmlReadMemory (xml,
++                             strlen (xml),
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+ 
+         if (!doc)
+                 return NULL;
+-- 
+GitLab
+
diff --git a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
new file mode 100644
index 0000000000..c76d440b5d
--- /dev/null
+++ b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
@@ -0,0 +1,28 @@
+From 4e06104df81fba2cda06d4747b33e75f4cade458 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Fri, 24 Nov 2023 18:12:50 +0100
+Subject: [PATCH] common: Fix compatibility with libxml2 2.12
+
+Fixes #28
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/4e06104df81fba2cda06d4747b33e75f4cade458
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/common/pretty-print.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
+index c8ebc9a..1519cb0 100644
+--- a/src/common/pretty-print.c
++++ b/src/common/pretty-print.c
+@@ -22,6 +22,7 @@
+ 
+ #include "pretty-print.h"
+ 
++#include <libxml/globals.h>
+ #include <libxml/xmlreader.h>
+ 
+ #include <string.h>
+-- 
+GitLab
+
diff --git a/package/gupnp-tools/Config.in b/package/gupnp-tools/Config.in
index af662417c2..5bce5cabeb 100644
--- a/package/gupnp-tools/Config.in
+++ b/package/gupnp-tools/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_GUPNP_TOOLS
 	bool "gupnp-tools"
 	depends on BR2_PACKAGE_LIBGTK3
-	# gssdp, gupnp, libsoup all select on libglib2, so they have
+	# gssdp, gupnp, libsoup3 all select on libglib2, so they have
 	# the same dependencies as libgtk3, which we depend on. So for
 	# the same of simplicity, we don't replicate all those
 	# (complex) dependencies.
 	select BR2_PACKAGE_GSSDP
 	select BR2_PACKAGE_GUPNP
-	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP3
 	select BR2_PACKAGE_LIBXML2
 	help
 	  GUPnP Tools are free replacements of Intel UPnP tools that
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index c3808de6e2..28e2661360 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-tools/0.10/gupnp-tools-0.10.3.sha256sum:
-sha256  457f4d923935b078415cd2ba88d78db60079b725926b7ee106e4565efe3204de  gupnp-tools-0.10.3.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.1.sha256sum:
+sha256  53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba  gupnp-tools-0.12.1.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index f87e98ef03..99fdf54f13 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).3
+GUPNP_TOOLS_VERSION_MAJOR = 0.12
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).1
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	https://download.gnome.org/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
@@ -18,7 +18,7 @@ GUPNP_TOOLS_DEPENDENCIES = \
 	libxml2 \
 	gssdp \
 	gupnp \
-	libsoup \
+	libsoup3 \
 	libgtk3 \
 	$(TARGET_NLS_DEPENDENCIES)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
