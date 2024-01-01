Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFCFC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F8960BD2;
	Mon,  1 Jan 2024 20:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F8960BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21I4pEJATLgR; Mon,  1 Jan 2024 20:18:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A15C60BB8;
	Mon,  1 Jan 2024 20:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A15C60BB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C637C1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6F5F40166
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F5F40166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hh9IPiK2RTlN for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:17:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D33040104
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D33040104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4920483A7D; Mon,  1 Jan 2024 20:17:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:17:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6a587b537cd5827d73529da7d71932b3fcf0333
X-Git-Newrev: 27e35b95ca1c7cd5156201935b8d1c11fa921581
X-Patchwork-Hint: ignore
Message-Id: <20240101201758.4920483A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-av: bump to version 0.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=27e35b95ca1c7cd5156201935b8d1c11fa921581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix build with libxml2 2.12

https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xml-Fix-compatibility-with-libxml2-2-12-x.patch | 26 ++++++++++++++++++++++
 package/gupnp-av/gupnp-av.hash                     |  4 ++--
 package/gupnp-av/gupnp-av.mk                       |  2 +-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
new file mode 100644
index 0000000000..358098fbc4
--- /dev/null
+++ b/package/gupnp-av/0002-xml-Fix-compatibility-with-libxml2-2-12-x.patch
@@ -0,0 +1,26 @@
+From 1e10a41fcef6ae0d3e89958db89bc22398f3b4f1 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sat, 25 Nov 2023 17:58:49 +0100
+Subject: [PATCH] xml: Fix compatibility with libxml2 2.12.x
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-av/-/commit/1e10a41fcef6ae0d3e89958db89bc22398f3b4f1
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libgupnp-av/xml-util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libgupnp-av/xml-util.h b/libgupnp-av/xml-util.h
+index e0e49f7..0bbe0f8 100644
+--- a/libgupnp-av/xml-util.h
++++ b/libgupnp-av/xml-util.h
+@@ -16,6 +16,7 @@
+ 
+ #include <glib.h>
+ #include <libxml/tree.h>
++#include <libxml/parser.h>
+ #include <stdarg.h>
+ #include <glib-object.h>
+ 
+-- 
+GitLab
+
diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index ab1739aaa4..c8ed0db2a4 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
-sha256  20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156  gupnp-av-0.14.0.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-av/0.14/gupnp-av-0.14.1.sha256sum:
+sha256  b79ce0cc4b0c66d9c54bc22183a10e5709a0011d2af272025948efcab33a3e4f  gupnp-av-0.14.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index e83aa57bda..3821c4e170 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_AV_VERSION_MAJOR = 0.14
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).1
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = https://download.gnome.org/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
