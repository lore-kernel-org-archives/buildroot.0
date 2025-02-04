Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B90BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B20F703F1;
	Fri, 28 Feb 2025 17:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I89rKk_udABo; Fri, 28 Feb 2025 17:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF2470B1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF2470B1E;
	Fri, 28 Feb 2025 17:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1276068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9478342538
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8Irb1bVG_nd for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC2D742526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC2D742526
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B91E980042; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 91e51e267906f41cad530b93879ff3c157f3200d
X-Git-Newrev: 7f6d8881050558b768bce014f6b313e17f587f7e
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.B91E980042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/json-glib: bump to
 version 1.10.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f6d8881050558b768bce014f6b313e17f587f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Required to build with gobject-introspection >= 1.82.0, to be bumped
in a later commit.

License information has been restructured according to REUSE
guidelines, see [1]. Update hashes and license information
accordingly.

[1] https://gitlab.gnome.org/GNOME/json-glib/-/commit/a06d43db36545aff10eb384d62548d96a7cf6020

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Thomas: do not list .reuse/dep5 in license files]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-glib/json-glib.hash | 12 ++++++++----
 package/json-glib/json-glib.mk   | 11 +++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b78d708391..c4381fc0d7 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,9 @@
-# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
-sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
+sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
 
-# Hash for license file:
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+# Hashes for license files
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+# symlink to LICENSES/LGPL-2.1-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index e216af20b1..9595c17274 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.8
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
+JSON_GLIB_VERSION_MAJOR = 1.10
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
-JSON_GLIB_LICENSE = LGPL-2.1+
-JSON_GLIB_LICENSE_FILES = COPYING
+JSON_GLIB_LICENSE = LGPL-2.1+, MIT (conformance test data), CC0-1.0 (parts of build system, metadata, translations)
+JSON_GLIB_LICENSE_FILES = LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	COPYING
 JSON_GLIB_INSTALL_STAGING = YES
 JSON_GLIB_CONF_OPTS = -Dgtk_doc=disabled -Dtests=false
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
