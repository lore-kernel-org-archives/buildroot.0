Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E17AC8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AE4840A1;
	Fri, 29 Aug 2025 08:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQhkFoBL4JxY; Fri, 29 Aug 2025 08:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1EE1840D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1EE1840D1;
	Fri, 29 Aug 2025 08:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 643A36C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 563F6414BA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2apBkjel3xJx for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B6C40335
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B6C40335
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 856F687CFC; Fri, 29 Aug 2025 08:36:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 10:32:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2313c2324207a36415e1163bddda175b717ce8a7
X-Git-Newrev: ba24015307567f9d899861ee12b84e63cd49483c
X-Patchwork-Hint: ignore
Message-Id: <20250829083622.856F687CFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXt: bump to 1.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba24015307567f9d899861ee12b84e63cd49483c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/40e2022a57170fd32fe9de1fdc042abb948288af/

For gcc-15 / C23 compatibility:

https://lists.freedesktop.org/archives/xorg-announce/2024-November/003560.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Peter: add autobuilder ref, announcement, correct .hash file]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXt/xlib_libXt.hash | 6 +++---
 package/x11r7/xlib_libXt/xlib_libXt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 577896d38b..5a27b2db4e 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003383.html
-sha256  52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91  libXt-1.3.0.tar.xz
-sha512  64c5978655135b925c3aaad86b1aa6a3f3b57ad8b3592bf142be616b8aa339a02c2fc7badfab9564ea8076ea8f37acfe31709ed528f5a1d251f2d116aa074118  libXt-1.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/xorg-announce/2024-November/003560.html
+sha256  e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288  libXt-1.3.1.tar.xz
+sha512  c220292f60b0f53134cf9364831a32bbaa9fa6bbb3a7143e917920957b7a48c616e946042747089f29ea9d8a18ecd64de620bcaf56d82462e7107de906f5db38  libXt-1.3.1.tar.xz
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
