Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC299CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A9240F74;
	Sun, 19 Oct 2025 19:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TphmeaQu-5t2; Sun, 19 Oct 2025 19:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEE3F40F54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE3F40F54;
	Sun, 19 Oct 2025 19:08:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD571CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38ED983FC1
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2arVXlZDfdZ for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F49F83FAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F49F83FAA
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E87B87612; Sun, 19 Oct 2025 19:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 20:59:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3980698ecea3db1d8154940acd61fda9e16c578d
X-Git-Newrev: 209adc30631230f47d008ef38d44ff3626a2052f
X-Patchwork-Hint: ignore
Message-Id: <20251019190829.4E87B87612@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp: bump to version 1.6.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=209adc30631230f47d008ef38d44ff3626a2052f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patch has been merged in version 1.6.7.

Release notes:
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.7/NEWS
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.8/NEWS
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.9/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...all-Fix-compatibility-with-libxml2-2-12-x.patch | 84 ----------------------
 package/gupnp/gupnp.hash                           |  4 +-
 package/gupnp/gupnp.mk                             |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)

diff --git a/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch b/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
deleted file mode 100644
index 14f696ca80..0000000000
--- a/package/gupnp/0001-all-Fix-compatibility-with-libxml2-2-12-x.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 00514fb62ebd341803fa44e26a6482a8c25dbd34 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sat, 25 Nov 2023 17:56:02 +0100
-Subject: [PATCH] all: Fix compatibility with libxml2 2.12.x
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/00514fb62ebd341803fa44e26a6482a8c25dbd34
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libgupnp/gupnp-control-point.c        | 2 ++
- libgupnp/gupnp-service-proxy-action.c | 2 ++
- libgupnp/gupnp-service-proxy.c        | 2 ++
- libgupnp/gupnp-xml-doc.c              | 3 +++
- libgupnp/xml-util.h                   | 2 ++
- 5 files changed, 11 insertions(+)
-
-diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
-index d4b44721..4374f726 100644
---- a/libgupnp/gupnp-control-point.c
-+++ b/libgupnp/gupnp-control-point.c
-@@ -27,6 +27,8 @@
- #include <config.h>
- #include <string.h>
- 
-+#include <libxml/parser.h>
-+
- #include "gupnp-control-point.h"
- #include "gupnp-context-private.h"
- #include "gupnp-resource-factory-private.h"
-diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
-index b241d86c..6ea241ad 100644
---- a/libgupnp/gupnp-service-proxy-action.c
-+++ b/libgupnp/gupnp-service-proxy-action.c
-@@ -9,6 +9,8 @@
- 
- #include <config.h>
- 
-+#include <libxml/parser.h>
-+
- #include "gupnp-error.h"
- #include "gupnp-service-proxy.h"
- #include "gvalue-util.h"
-diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
-index adba5ab0..3f1a4454 100644
---- a/libgupnp/gupnp-service-proxy.c
-+++ b/libgupnp/gupnp-service-proxy.c
-@@ -16,6 +16,8 @@
- #include <locale.h>
- #include <errno.h>
- 
-+#include <libxml/globals.h>
-+
- #include "gena-protocol.h"
- #include "gupnp-context-private.h"
- #include "gupnp-error-private.h"
-diff --git a/libgupnp/gupnp-xml-doc.c b/libgupnp/gupnp-xml-doc.c
-index 627f1a28..66f9b3dd 100644
---- a/libgupnp/gupnp-xml-doc.c
-+++ b/libgupnp/gupnp-xml-doc.c
-@@ -15,6 +15,9 @@
- #include <config.h>
- #include <string.h>
- #include <gio/gio.h>
-+
-+#include <libxml/parser.h>
-+
- #include "gupnp-xml-doc.h"
- #include "gupnp-error.h"
- 
-diff --git a/libgupnp/xml-util.h b/libgupnp/xml-util.h
-index a02eb3d4..d0dcaeba 100644
---- a/libgupnp/xml-util.h
-+++ b/libgupnp/xml-util.h
-@@ -10,6 +10,8 @@
- #define GUPNP_XML_UTIL_H
- 
- #include <libxml/tree.h>
-+#include <libxml/parser.h>
-+
- #include <stdarg.h>
- #include <glib-object.h>
- 
--- 
-GitLab
-
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index b8a3fa082e..61cdd19e5f 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp/1.6/gupnp-1.6.6.sha256sum:
-sha256  c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3dae2891e311a993a574f5a04f  gupnp-1.6.6.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp/1.6/gupnp-1.6.9.sha256sum:
+sha256  2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b  gupnp-1.6.9.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index cfcc114189..7ace1dc25b 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.6
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).9
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
