Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D931FD3B98E
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEE94612A4;
	Tue,  9 Dec 2025 18:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRkwddKBHubG; Tue,  9 Dec 2025 18:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC41D612B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304909;
	bh=TaNofCvcdUeQVdRJzTZ7XSYPPRCvUv2FURmSwuW/IcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HQZpeOceU6X7mqEHU9oaxzADU4WyBg10BjYR8TsbIvhLlCk6e49/fYjQhodQm2G2R
	 m9m4uGWCx8KvYBM5WPKfwOKeGbbZ42n/j9rTrdkCdejlG444w5KW+61hbPNw3Ex3Nu
	 IeXCECYPBfKPNPxH+QPYhg98TOJWLAINxnjaxio6hPUgpijOoxOo0mTpOeOYBUvICq
	 LlflQfKY65fs5Hsnh39wC4CWGopwCJ2QR8SJkVRhL9+WPJwgiOaIA63ZrBcdyfA+MC
	 n6czUMz3zJpU73tC1Grp//T6ioTsmsOo6/8xJZcuE6+eIHGrGZNTAnob0c08I1iWyu
	 BIL9QEB3axdgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC41D612B2;
	Tue,  9 Dec 2025 18:28:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E742C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73BEC84373
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIfrFzGGJyYi for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B346A84365
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B346A84365
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFBAD86964; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b822976c6069d5d6296ac61bb848fc3de0900a99
X-Git-Newrev: a644ea1e2d8c48e84cf9bb770abe71765949c1da
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.AFBAD86964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gupnp-tools: bump
 version to 0.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a644ea1e2d8c48e84cf9bb770abe71765949c1da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed two patches which are included in this release and added one
patch to fix build with libxml 2.15.1.

For release notes, see:
https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.12.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-Remove-Werror-deprecated-declarations.patch | 27 ++++++++++++++++++
 ...1-common-Drop-deprecated-xmlRecoverMemory.patch | 33 ----------------------
 ...ommon-Fix-compatibility-with-libxml2-2-12.patch | 28 ------------------
 package/gupnp-tools/gupnp-tools.hash               |  4 +--
 package/gupnp-tools/gupnp-tools.mk                 |  2 +-
 5 files changed, 30 insertions(+), 64 deletions(-)

diff --git a/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch b/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..ef76f01f66
--- /dev/null
+++ b/package/gupnp-tools/0001-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,27 @@
+From cb4ddac12977fd1abd88a1feacbab090d9ad5ecb Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 3 Dec 2025 20:06:22 +0100
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/issues/29
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c92a833..64a0513 100644
+--- a/meson.build
++++ b/meson.build
+@@ -44,7 +44,6 @@ conf.set('HAVE_GTK_SOURCEVIEW', gtksourceview.found())
+ conf.set('GETTEXT_PACKAGE', '"@0@"'.format(meson.project_name()))
+ conf.set('LOCALEDIR', '"@0@"'.format(localedir))
+ cc = meson.get_compiler('c')
+-add_project_arguments(cc.get_supported_arguments('-Werror=deprecated-declarations'), language: 'c')
+ conf.set('GLIB_VERSION_MIN_REQUIRED', 'GLIB_VERSION_@0@'.format(glib_version.underscorify()))
+ conf.set('GLIB_VERSION_MAX_ALLOWED', 'GLIB_VERSION_@0@'.format(glib_version.underscorify()))
+ 
+-- 
+2.47.3
+
diff --git a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch b/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
deleted file mode 100644
index c81d1b01fe..0000000000
--- a/package/gupnp-tools/0001-common-Drop-deprecated-xmlRecoverMemory.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Thu, 3 Aug 2023 23:44:15 +0200
-Subject: [PATCH] common: Drop deprecated xmlRecoverMemory
-
-Fixes #27
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/f675ac7e0afe67a86f3f1191d3274d6ffbd4e5d7
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/common/pretty-print.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
-index c692664..c8ebc9a 100644
---- a/src/common/pretty-print.c
-+++ b/src/common/pretty-print.c
-@@ -34,7 +34,11 @@ pretty_print_xml (const char *xml)
-         char *text;
-         int length;
- 
--        doc = xmlRecoverMemory (xml, strlen (xml));
-+        doc = xmlReadMemory (xml,
-+                             strlen (xml),
-+                             NULL,
-+                             NULL,
-+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
- 
-         if (!doc)
-                 return NULL;
--- 
-GitLab
-
diff --git a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch b/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
deleted file mode 100644
index c76d440b5d..0000000000
--- a/package/gupnp-tools/0002-common-Fix-compatibility-with-libxml2-2-12.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4e06104df81fba2cda06d4747b33e75f4cade458 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Fri, 24 Nov 2023 18:12:50 +0100
-Subject: [PATCH] common: Fix compatibility with libxml2 2.12
-
-Fixes #28
-
-Upstream: https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/4e06104df81fba2cda06d4747b33e75f4cade458
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/common/pretty-print.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/pretty-print.c b/src/common/pretty-print.c
-index c8ebc9a..1519cb0 100644
---- a/src/common/pretty-print.c
-+++ b/src/common/pretty-print.c
-@@ -22,6 +22,7 @@
- 
- #include "pretty-print.h"
- 
-+#include <libxml/globals.h>
- #include <libxml/xmlreader.h>
- 
- #include <string.h>
--- 
-GitLab
-
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 28e2661360..6dc8bd74f2 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.1.sha256sum:
-sha256  53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba  gupnp-tools-0.12.1.tar.xz
+# Hash from: https://download.gnome.org/sources/gupnp-tools/0.12/gupnp-tools-0.12.2.sha256sum
+sha256  4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c  gupnp-tools-0.12.2.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 99fdf54f13..910a157816 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.12
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).1
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	https://download.gnome.org/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
