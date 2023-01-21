Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19137C27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90BA82C84;
	Sat, 21 Jan 2023 13:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90BA82C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHjC7H4nTx0j; Sat, 21 Jan 2023 13:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBEB82CA3;
	Sat, 21 Jan 2023 13:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBEB82CA3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1CE41BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CDF241CE8
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDF241CE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsMQhMG89Rjn for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 323EE41CD1
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323EE41CD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E92D86946; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 500f40bbc7a7657393dd308490afec3effee6dea
X-Git-Newrev: 03255ca62792681c03620df0008a496273fe8801
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.2E92D86946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglade: switch to https download
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03255ca62792681c03620df0008a496273fe8801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglade/Config.in     | 2 +-
 package/libglade/libglade.hash | 2 +-
 package/libglade/libglade.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index e269a07548..c97c9becd2 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBGLADE
 	  at runtime. It doesn't require GLADE to be used, but GLADE is
 	  by far the easiest way to create the interface files.
 
-	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
+	  https://download.gnome.org/sources/libglade/
 
 comment "libglade needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
index d01c83be25..b04087e286 100644
--- a/package/libglade/libglade.hash
+++ b/package/libglade/libglade.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.sha256sum
+# From https://download.gnome.org/sources/libglade/2.6/libglade-2.6.4.sha256sum
 sha256  64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec  libglade-2.6.4.tar.bz2
 
 # Hash for license file:
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 32fa595f5a..21aed60605 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -7,7 +7,7 @@
 LIBGLADE_VERSION_MAJOR = 2.6
 LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
+LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
