Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBF606A32C
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pnzWmXQs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE33C80AB2;
	Sun,  1 Nov 2026 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ureqFA1s0P-Z; Sun,  1 Nov 2026 16:40:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BE0C80AC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793551200;
	b=DFcB53tOafGl9bbnHRXjRrt3mL+NXKncKF16y4JqZvsGYbj8btRHbWdJgxHdQtrAGuoa
	 ZULOgmRZZpqJKv/lmRsRJHLbAWEFMVPthEGFbXN2ehMGGKGE6NWYLdeeTrX3FYWE/f61G
	 sPo5JIHIicTKO8cYIlgFlJiKe3VnJvpo3HTiblUeOEkll7KGt3LTsNQYzDiXCVNSHzPMd
	 zNoFtUVeJaYFuFZC+fekYar8QUrtRJag2oDo8bce54XOxZZMCsWrTBLBShDkEyMx7IHEk
	 V2KwUSHDHwz48wktY9eUoUVN90GLUzRoHOcK8OPgVXLHCITWSO0oUntrWBr3543zBiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793551200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vB1O9j/E/SkfYm7Ref8tkXshjz8ZQWJG1iCjSJcWn+s=;
	b=qjnf32pSdLDDVvJtfOWUoTUF3RoEUXBOnA9SOdfx4X2NFjGFdIEUex1LvUreCgBGh0vM
	 Ovq99yg+T9X34lVe9Z8S/cgawK/myRta7zruVX5V7SG9fgJsaUeelQRTXX/WfrMjxprAr
	 TfSZBTvg+Q/JHl90I+S/u0mat5O4HeCK/kZCuHd6K9jWpmrldfKt8at6/pS66qPZeQgKV
	 iYrCC+5cFB9O9KamlgKXpufdiZbcl90N6I/b1YGPDLdsxAuIVsLA5DHezSPMrHChFWvwe
	 T1UEgDOgsGS7e+rNleUWl+AiO/qFN5clOurcYy4HYtl9FYtDHwP0HVTayp/JNg5Uf/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793551200;
	bh=vB1O9j/E/SkfYm7Ref8tkXshjz8ZQWJG1iCjSJcWn+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pnzWmXQs/EU+F802sp9dDWYPtk+ZdliwRXgpvlKJuR1BESX8ci30xJKmd4jLFd/vu
	 gGYFD0R+gPZLjpXSimpT4lwSql/KggyMFNIc9CcUiGhBatjSyAHMdbJ28Zpk5Mqpuz
	 +8VgP+0piOG4L9Rs5WRWqhFL85Ei2yj/YMXNlIWVguI7AzrL3QArtPuDINeltsAorA
	 CJOb4H38sYcDV+WVQGBrI2F5c31UKS7Dh2OxAHTpn831PfFWxepta52fvdTFz4+hCT
	 Lcsne0ADJKtVGIM4z2iJIB75E/g6n4pw/YCXwDAtj+spYDeyj6y9JA52YnRK1g//or
	 igH7mebE1RDHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE0C80AC2;
	Sun,  1 Nov 2026 16:40:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B20156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C28AD404EC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4oY71ud8Qlr for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:39:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 10CB64048A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793551198;
 b=UTUK/xgyFf0+dXDzUlkXJI/X6dgQ21zN2QnSOW9lyCaw8VeIIDhujrJ3jiMFRAVPlusL
 xdmcqedQsTCt7NFrYf0IqOubVxF3hMet2vmaPE/VeW0uScFbrrIxNMhIhhwp9k0rtEX55
 oWl4KtXx2baVD3V6jaaRaPOymeLw6yUAWiOml+RQTxqZnwmwEOwRDNAg3gtJQH9fqRZH8
 CDRTvlBi2l4j1yvXmsbAXmn6uYTFHkMtzKLt6+90uSE0s1q9fygISRTuKTiIxwEyMPH+W
 wbliifeTAZY0bHkQroBMFskLh6dysPyPOUJMtRHJs2VdUGqpvz4EigHG/oW0OCkJL7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793551198;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3MRcRffyfArTNvzs9QrLwCOSFt245q0h6Z418QfNeQ0=;
 b=E+7sQ6Vehd5jMr4/SliTy2ZMEqRnZiZRIV/KptcPnR8f7VRd7SHJJUm2Aw1KGUEsCian
 bXbBN2cIxKPMo4CmdWhsnZ8/MI5xfcgJKu6GzhsgliDMGE3wGA6LvrMFBO6NXUouwiNwe
 Kf/0xMXY6/5e4jEkUFXjCpzdH2BprkJ+TEk2Ew0l2XmQt9icTfsrWcB1XClukqM6kWJ+/
 MEYCfp6YSbFho9c2di7LdQzbn7jvCTxpG1YoTBjH2MLS7juW/NBFKO/oAlRK5FRBFRSKX
 5J6gb6zAbmSXZAYHhDgDod1PrWdFyxXdk/o2vbxFvF2h6FiWXC00OtOOfhfJfS2jz+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CB64048A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB82F9D4DB; Sun,  1 Nov 2026 16:38:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 17:38:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6934eb7af36f7993d5aba4ec124c3bb7446d4f98
X-Git-Newrev: fabeb8ac213ddbeb182644c8f4324d75b35ddf9a
X-Patchwork-Hint: ignore
Message-Id: <20261101163828.BB82F9D4DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: bump to version 2.90.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fabeb8ac213ddbeb182644c8f4324d75b35ddf9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.90.1/NEWS

- COPYING is now a symlink to LICENSES/LGPL-2.1-or-later.txt
- CVE-2026-58016 is fixed upstream, drop the patch

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pection-Fix-XML-parser-state-handling-for.patch | 42 ----------------------
 package/libglib2/libglib2.hash                     |  6 ++--
 package/libglib2/libglib2.mk                       |  9 ++---
 3 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
deleted file mode 100644
index 4582382f80..0000000000
--- a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
- element nesting
-
-The check for whether a `<node>` element in D-Bus introspection XML was
-nested correctly was broken. `<node>` elements can only be at the top
-level, or nested immediately within another `<node>` element.
-
-Fix the check and add some unit tests for it.
-
-Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
-uses example XML strings adapted from their report.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3932
-CVE: CVE-2026-58016
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop tests]
----
- gio/gdbusintrospection.c        |  2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 1138ba9d7..4df8e87db 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
-   /* ---------------------------------------------------------------------------------------------------- */
-   if (strcmp (element_name, "node") == 0)
-     {
--      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
-+      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
-         {
-           g_set_error_literal (error,
-                                G_MARKUP_ERROR,
--- 
-2.47.3
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 95bf4d3179..b6203dd027 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.88/glib-2.88.4.sha256sum
-sha256  25fd169f3b2f91fe2391ad297883ce0fcf30c69fc789ffd1c9672d1332b1c5a8  glib-2.88.4.tar.xz
+# https://download.gnome.org/sources/glib/2.90/glib-2.90.1.sha256sum
+sha256  93c941aa17d5eb1d53fe838365f29a8b4e539c222a256d974ec8f30fc413e396  glib-2.90.1.tar.xz
 # License files, locally calculated
-sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3770e8671a..23f6643f10 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.88
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.90
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-LIBGLIB2_LICENSE_FILES = COPYING
+LIBGLIB2_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
 LIBGLIB2_CPE_ID_VENDOR = gnome
 LIBGLIB2_CPE_ID_PRODUCT = glib
 LIBGLIB2_INSTALL_STAGING = YES
@@ -17,9 +17,6 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
-LIBGLIB2_IGNORE_CVES += CVE-2026-58016
-
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
