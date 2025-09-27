Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E09CAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 11:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9077641251;
	Sat, 27 Sep 2025 11:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 403LF-PWLMyQ; Sat, 27 Sep 2025 11:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B79041109
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B79041109;
	Sat, 27 Sep 2025 11:42:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8A1512D
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97B5360EF7
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSA6fxGyi1U3 for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 11:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F3760C27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F3760C27
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE80A864A8; Sat, 27 Sep 2025 11:42:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Sep 2025 13:28:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46a913126395aea64df4e39853d41e22430e286c
X-Git-Newrev: f5a99c4e91fcd6fc563e92d484b352d91aa9a98d
X-Patchwork-Hint: ignore
Message-Id: <20250927114202.BE80A864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: bump to version 1.67.00
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5a99c4e91fcd6fc563e92d484b352d91aa9a98d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:

https://xmlrpc-c.sourceforge.io/change.html

Since version 1.65, Libxml2 was made the default XML parser. Hence,
if libxml2 package is not selected, disable libxml2 support
explicitly.

Remove already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libxmlrpc/0001-Fix-boolean-definitions.patch   | 25 ----------------------
 package/libxmlrpc/libxmlrpc.hash                   |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     | 10 +++++++--
 3 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/package/libxmlrpc/0001-Fix-boolean-definitions.patch b/package/libxmlrpc/0001-Fix-boolean-definitions.patch
deleted file mode 100644
index 0fdfdf7f03..0000000000
--- a/package/libxmlrpc/0001-Fix-boolean-definitions.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: lib/util/include/bool.h
-===================================================================
-Don't define boolean macros for C23 standard as they are implemented
-as keywords.
-
-Upstream: https://sourceforge.net/p/xmlrpc-c/code/3318/
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
-diff --git a/lib/util/include/bool.h b/lib/util/include/bool.h
---- a/lib/util/include/bool.h	(revision 3316)
-+++ b/lib/util/include/bool.h	(working copy)
-@@ -5,7 +5,11 @@
-    collision.
- */
- 
--#ifndef __cplusplus
-+#ifdef __cplusplus
-+/* bool has always been part of the C++ language */
-+#elif __STDC_VERSION__ >= 202311L
-+/* bool is part of the C23 standard */
-+#else
- /* At least the GNU compiler defines __bool_true_false_are_defined */
- #ifndef __bool_true_false_are_defined
- #define __bool_true_false_are_defined
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index b9167ca5a0..00cef19b77 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7265be1a181e57106707b5278daf64b2a717b8a2a9e6ec8992d8c8084e64eaa2  libxmlrpc-r3176-svn5.tar.gz
+sha256  4a071da3204132585a40313e17e01699d428e0fc9b58d30fcd7e538037254668  libxmlrpc-r3335-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index dd09fa8f53..283914ca81 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# 1.60.01 (code/advanced@r3176)
-LIBXMLRPC_VERSION = r3176
+# 1.67.00 (code/advanced@r3335)
+LIBXMLRPC_VERSION = r3335
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
@@ -47,6 +47,12 @@ else
 LIBXMLRPC_CONF_OPTS += --disable-abyss-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBXMLRPC_DEPENDENCIES += libxml2
+else
+LIBXMLRPC_CONF_OPTS += --disable-libxml2-backend
+endif
+
 LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
 LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(STAGING_DIR) install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
