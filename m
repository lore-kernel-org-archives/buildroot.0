Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B7DC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1DC81143;
	Fri, 17 Jul 2026 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XMaHMJwJPzy; Fri, 17 Jul 2026 15:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429618114A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303163;
	bh=Z0Alv0JQe+sPcGDljUW2lOACbEja8Hhw7rEnxZLvBkc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hoBn6PnWLc15vzXsZHOS6g7KkWpFQJ/nijbwyBdx96W4IxjDcULbGQhd94Yx9FABq
	 h6M8AynNX5z/rYyhjysPyfR4sY8knoqMJwuqGHiXvjW/aI2CCnA0eWOIHLoAkSlKPy
	 6mDaHIyD3dv5bMHk6xMPjPxdNSEgZk7iGZ3gikEOsG4uwvNe8afqREsxuW8t9sfcEY
	 C3IvGKRlXfDC9wAG3XwgiOw9AmBRgHugyfAXM6fOQ0S786mvJW6FopR7p0RPPnRM6A
	 T5U+o/G1cVkYS5eRjpSbivSmLwCPgWlhCGjYVnbG2qyoanLWWgFkMLqVmanszHXRYm
	 HkHO3SdDcfnrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429618114A;
	Fri, 17 Jul 2026 15:46:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAF5D36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D2C640626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0si69es_geo for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2784A40A4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2784A40A4B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8AC788E53; Fri, 17 Jul 2026 15:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:08:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4d16be6c2260ab22985a7783bf68e06a115b44ba
X-Git-Newrev: eb65ef12a2d5510731039a8441ad4b8f7631c255
X-Patchwork-Hint: ignore
Message-Id: <20260717154510.E8AC788E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/x11r7/xlib_libXfont2: security bump version to 2.0.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb65ef12a2d5510731039a8441ad4b8f7631c255
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://lists.x.org/archives/xorg-announce/2026-July/003715.html
https://lists.x.org/archives/xorg-announce/2026-July/003714.html

Fixes
- CVE-2026-56001: BitmapScaleBitmaps Integer Overflow Heap Buffer Overflow
- CVE-2026-56002: PCF Font Parsing Heap Buffer Overflow
- CVE-2026-56003: computeProps Property Buffer Heap Buffer Overflow

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c6e304f3835b6989c828c13c83c9b03b68b82dab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 4f50b2dbd2..86e972a0e8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
-sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
-sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
+sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
+sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index c95f6c6395..a881a4c55b 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.7
+XLIB_LIBXFONT2_VERSION = 2.0.8
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
