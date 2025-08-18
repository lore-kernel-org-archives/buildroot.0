Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA45CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 08:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9FB41C31;
	Mon, 18 Aug 2025 08:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufTXZR3qxddt; Mon, 18 Aug 2025 08:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0054841C2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0054841C2E;
	Mon, 18 Aug 2025 08:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E797A75
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D40E9845E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QWsjC1O4cDR for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 08:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2FC6842E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2FC6842E0
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2FC6842E0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:50:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 93383C6B3A9
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:41:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 004AF606A6;
 Mon, 18 Aug 2025 08:42:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45E171C229670; 
 Mon, 18 Aug 2025 10:41:56 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon, 18 Aug 2025 10:41:53 +0200
Message-ID: <20250818084154.2771438-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755506524; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=v1RF+cLuHhKJurneSjoj4OzsYztSTG1e3l46Cd4vv14=;
 b=WtEvq8X/KQVeoDOOQc02gSSAaKK/65bAUcKpu3+0d0g9lShFM/OepmlPKpnfsFUuO/0L7K
 WBd8sAp/lqF4Sxok5zkHoa4P2SiOkTPukOT1K9/bUi9kJvOuEoq9FNgN8IE1Ah9jlO2uBI
 01TwsxG3GLzvDmESMTFWwFScmU5O5NYWeZiUp8jX4PR63RjM+Y7XHPL+abFg1V/UfVKzG+
 hYkO/bQyzXSfvu1GGDGWO6IMyXIy41uP5ULgm4rNBL8udt/66ucPSqFWW260ouY4xlHAls
 MbelHmnLGYNgsj/x00ztQI9TpNukM7iWrzwhzxHkB3CCFf0tw1aFAhoZLkqHwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WtEvq8X/
Subject: [Buildroot] [PATCH] package/binutils: never build readline to fix
 GCC 15.x build issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The binutils-gdb code base in Git does have a copy of readline that is
used by gdb.

The release tarballs of binutils do NOT contain readline as it's not
needed for binutils itself (only gdb).

However, when we build the ARC binutils, taken from Git, the readline/
folder is present, and therefore readline is built even if it is not
actually needed.

This causes build failures as the copy of readline in ARC binutils
2024.12 (based on binutils 2.43) does not build with GCC 15.x.

To work around this problem, we use a suggestion from Waldemar
Brodkorb: pass --with-system-readline. Indeed, this disables the build
of readline... but it does not actually check that we have a system
readline, since we're not building gdb.

Fixes:

  https://autobuild.buildroot.net/results/976243181f7000fe2790b3450bdae51e8c12769e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a9f03225da..c79f3414af 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -47,6 +47,13 @@ BINUTILS_DISABLE_GDB_CONF_OPTS = \
 	--disable-gdb
 
 # We need to specify host & target to avoid breaking ARM EABI
+#
+# --with-system-readline to never build readline, as binutils doesn't
+# need it (only gdb does). For binutils release tarballs, readline
+# is not shipped, but when we get it from git, it is present and
+# gets built which can cause build issues, so force skipping
+# it. Note: the configure script will not check for readline as it
+# doesn't need it.
 BINUTILS_CONF_OPTS = \
 	--disable-multilib \
 	--disable-werror \
@@ -58,7 +65,8 @@ BINUTILS_CONF_OPTS = \
 	--disable-gprofng \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
-	--without-zstd
+	--without-zstd \
+	--with-system-readline
 
 ifeq ($(BR2_STATIC_LIBS),y)
 BINUTILS_CONF_OPTS += --disable-plugins
@@ -82,6 +90,13 @@ endif
 
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
+#
+# --with-system-readline to never build readline, as binutils doesn't
+# need it (only gdb does). For binutils release tarballs, readline
+# is not shipped, but when we get it from git, it is present and
+# gets built which can cause build issues, so force skipping
+# it. Note: the configure script will not check for readline as it
+# doesn't need it.
 HOST_BINUTILS_CONF_OPTS = \
 	--disable-multilib \
 	--disable-werror \
@@ -95,7 +110,8 @@ HOST_BINUTILS_CONF_OPTS = \
 	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS) \
-	--without-zstd
+	--without-zstd \
+	--with-system-readline
 
 ifeq ($(BR2_BINUTILS_GPROFNG),y)
 HOST_BINUTILS_DEPENDENCIES += host-bison
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
