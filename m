Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D977BC8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8652614D5;
	Fri, 29 Aug 2025 07:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGhhRoJEDg6Y; Fri, 29 Aug 2025 07:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 435FE614BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 435FE614BB;
	Fri, 29 Aug 2025 07:12:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5C46C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F55741478
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKpkJcikCD0D for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38AE240242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AE240242
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38AE240242
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D4801C8F467
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 58FAA606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBFA31C22D663; 
 Fri, 29 Aug 2025 09:12:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 09:12:33 +0200
Message-ID: <20250829071234.695202-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829071234.695202-1-thomas.petazzoni@bootlin.com>
References: <20250829071234.695202-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756451558; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Z1Pw+8lS+KICOlvgXjE34CGBKhWZydqTQ2GtkojOaKQ=;
 b=td3vcsmxid+Eko+SIsO7N0vnO0keoiGN7j5aRSGqZMPBCbpomT8OBFoIsf5KEhQGy9jy1c
 gFzuR9tCVuU6cs7sOYP+soAmoLUHvPMPWkOHw9S4Wq+6RDUX7pHAJaVHIFfDvMyd7Mv+8c
 ESUmLDSzBqXUUDOiW8+TZKTlyLruz0VHdiUfl8GBH/GagEXMxgVGrZhvBW6RrNySNhGeQ0
 /x5InlEguIJQZW/UDzJyOiY4RWTt97j/HSN1UljLjRpa1X5IoB9X7aLZP8U5u3T6dR395I
 c8OphrBX83vs25+Reaos0UeTx/8HrR75fg1LnSrRrD+VA9F3HbtEzDPNVRVA7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=td3vcsmx
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xlib_libXt: bump to version
 1.3.1
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

Changes:

Alan Coopersmith (11):
      README.md: update & correct links to O'Reilly X Toolkit books
      unifdef ultrix
      unifdef sgi
      unifdef hpux
      unifdef __osf__
      unifdef AIXV3
      unifdef MOTOROLA
      unifdef USG
      unifdef VMS
      unifdef __EMX__
      unifdef AIXSHLIB & SUNSHLIB

Matt Turner (1):
      libXt 1.3.1

Mohamed Akram (1):
      Improve linking with widget libraries on macOS

Thomas E. Dickey (8):
      issue #17: avoid _Static_assert from c++
      issue #18: cross-build issue in util
      issue #19: include <process.h> on Windows for getpid()
      issue #20: c23 boolean conflict
      remove substitution for EXEEXT_FOR_BUILD, not defined in automake
      Add continue_to_dispatch parameter to _XtResourceConfigurationEH()
      eliminate an unnecessary cast
      quiet a couple of unused-parameter warnings

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-issue-20-c23-boolean-conflict.patch  | 32 -------------------
 package/x11r7/xlib_libXt/xlib_libXt.hash      |  6 ++--
 package/x11r7/xlib_libXt/xlib_libXt.mk        |  2 +-
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXt/0001-issue-20-c23-boolean-conflict.patch

diff --git a/package/x11r7/xlib_libXt/0001-issue-20-c23-boolean-conflict.patch b/package/x11r7/xlib_libXt/0001-issue-20-c23-boolean-conflict.patch
deleted file mode 100644
index a07b7b9647..0000000000
--- a/package/x11r7/xlib_libXt/0001-issue-20-c23-boolean-conflict.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f34a411f1795976c61b70f5a7198857d62ca4855 Mon Sep 17 00:00:00 2001
-From: "Thomas E. Dickey" <dickey@invisible-island.net>
-Date: Sun, 12 Nov 2023 05:33:05 -0500
-Subject: [PATCH] issue #20: c23 boolean conflict
-
-Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
-Upstream: 56875344b2a62845b8a494830bfb0a5f6ed2d3d6
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/Shell.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Shell.c b/src/Shell.c
-index 82616ef..78c44a1 100644
---- a/src/Shell.c
-+++ b/src/Shell.c
-@@ -1002,10 +1002,10 @@ _XtShellColormap(Widget widget, int closure, XrmValue *value)
- static void
- _XtShellAncestorSensitive(Widget widget, int closure, XrmValue *value)
- {
--    static Boolean true = True;
-+    static Boolean true_value = True;
- 
-     if (widget->core.parent == NULL)
--        value->addr = (XPointer) (&true);
-+        value->addr = (XPointer) (&true_value);
-     else
-         _XtCopyFromParent(widget, closure, value);
- }
--- 
-2.50.1
-
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 577896d38b..facb3e2168 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003383.html
-sha256  52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91  libXt-1.3.0.tar.xz
-sha512  64c5978655135b925c3aaad86b1aa6a3f3b57ad8b3592bf142be616b8aa339a02c2fc7badfab9564ea8076ea8f37acfe31709ed528f5a1d251f2d116aa074118  libXt-1.3.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003560.html
+sha256  e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288  libXt-1.3.1.tar.xz
+sha512  c220292f60b0f53134cf9364831a32bbaa9fa6bbb3a7143e917920957b7a48c616e946042747089f29ea9d8a18ecd64de620bcaf56d82462e7107de906f5db38  libXt-1.3.0.tar.xz
 # Locally calculated
 sha256  75c5574ca04731d739b1420f55f2b7b47f30df895817f1b03d0d7f5c1fbee534  COPYING
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index cca89145f8..7e639a7ced 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.3.0
+XLIB_LIBXT_VERSION = 1.3.1
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.xz
 XLIB_LIBXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXT_LICENSE = MIT
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
