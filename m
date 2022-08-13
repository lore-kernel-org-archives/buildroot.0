Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2AAC25B0D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 08:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC6183E50;
	Sat, 13 Aug 2022 08:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AC6183E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ46Qf8K6CwS; Sat, 13 Aug 2022 08:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D26583E19;
	Sat, 13 Aug 2022 08:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D26583E19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74B961BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F36660A47
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F36660A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzPJ1tlbOI8d for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 08:35:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8947E60AC2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8947E60AC2
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 08:35:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8D9EF240007;
 Sat, 13 Aug 2022 08:35:26 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 13 Aug 2022 10:35:20 +0200
Message-Id: <20220813083521.1382565-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
References: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660379726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1zQDPleGtHsfhO32GKbvINP0mM97eOGF/wwnvdANIA=;
 b=TW50oK6VZfmm1X87p1kJznlnosx740WKoZVGnLnRetWHTMixthHu6E7rpifq3XpYe3Idg9
 9u0Tby//OHAb9xYllH75DK7X/7e4X9htOBlhK49YjMh7IJWCNTuUqxiNx3NuR/feGeS83J
 HehiNEMZuoCAzpyHq6UX0MCchrdaKWd7NJIXfYtW+pNCejeB1mXeQjiyZAzA5N1Ss54i/z
 VSYLLTN1pLpGOEzt49Yu7fhcLrpiIwKRQCW8+IfKRbzqfimjryBGgA5ysmabahEu/1fexz
 roLwt1R7sMTg5JH7Rxqo1XSShjE0qO2IiKirGXIvHxcxgpDeOWW60/f7RG0AmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TW50oK6V
Subject: [Buildroot] [PATCH 4/4] package/gdb: remove BR2_PACKAGE_GDB_TOPLEVEL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option was needed to build versions of GDB < 10.x. As we just
dropped support for GDB 9.x, this logic can now be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 11 -----------
 package/gdb/gdb.mk         | 13 ++-----------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 33ffc632ee..a88c8affb3 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,14 +67,3 @@ config BR2_GDB_VERSION
 	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
 	default "12.1"     if BR2_GDB_VERSION_12
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-
-# recent gdb versions (>= 10) have gdbserver moved at the top-level,
-# which requires a different build logic.
-config BR2_PACKAGE_GDB_TOPLEVEL
-	bool
-	default y if BR2_arc
-	default y if BR2_GDB_VERSION_10
-	default y if BR2_GDB_VERSION_11
-	default y if BR2_GDB_VERSION_12
-	default y if !BR2_PACKAGE_HOST_GDB
-	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d2bbfcb290..45ce126bab 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -18,23 +18,14 @@ GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
 
-# On gdb < 10, if you want to build only gdbserver, you need to
-# configure only gdb/gdbserver.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(BR2_PACKAGE_GDB_TOPLEVEL),)
-GDB_SUBDIR = gdb/gdbserver
-
-# When we want to build the full gdb, or for very recent versions of
-# gdb with gdbserver at the top-level, out of tree build is mandatory,
-# so we create a 'build' subdirectory in the gdb sources, and build
-# from there.
-else
+# Out of tree build is mandatory, so we create a 'build' subdirectory
+# in the gdb sources, and build from there.
 GDB_SUBDIR = build
 define GDB_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/$(GDB_SUBDIR)
 	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
-endif
 
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
