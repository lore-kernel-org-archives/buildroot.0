Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBA8D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B6840C33;
	Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51CWFmvB-5ok; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E6340C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337927;
	bh=Zfn5uDq84NYod+fws9iyccSxZ8X/540P3E33FiSgjp0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N8s9JZ9OwFvkmVtxSAo0moGbymjbIaf3qU4kvRlnyGNlozNA91KAJGiTqlvadDx6v
	 2zPdU4vz2IJhiVff5c74CUaaLjplDtolR6mtn47YmnQTdD5vki4o4XG9tdbOkFGz9c
	 z71UUkjfwvAt86+PAFyx8o1AK4dOdZWxmroqTDh+785OgwOhEUsTduEzmwSm8uv5ps
	 vApAQ7f5iwA1WMF4Ruy6IYK5JqMHZuit/4feEFyIeBJHHdXkkMjAG5mC3WDtk0V4Vf
	 iye1ylWlKUihOtgLAq0+soS7v06z1EOUACNkCcXMyVP1DC0MABcZ0IB8ztTRI+lzqw
	 ZXDWqEtFY6MCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E6340C2A;
	Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55E3C1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46FDC40C2A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBDKYkg33Fll for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE4140C29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FE4140C29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E52D8857A; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e698969428cec2458d915db914fa1acc9e9aed41
X-Git-Newrev: 6c1af9e35e99ad5836107ca4264a5d79dc4e0937
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.9E52D8857A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXScrnSaver: bump
 version to 1.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c1af9e35e99ad5836107ca4264a5d79dc4e0937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-September/003629.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 6 +++---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index a32997e1fe..2a318d6690 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003279.html
-sha256  75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe  libXScrnSaver-1.2.4.tar.xz
-sha512  e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c  libXScrnSaver-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003629.html
+sha256  5057365f847253e0e275871441e10ff7846c8322a5d88e1e187d326de1cd8d00  libXScrnSaver-1.2.5.tar.xz
+sha512  1c0be0d15c5e7b50a3eb4a239e2c833c44b693b111c7f64c409f9abf8051356572acadebc8b295555683ff6bd4895acdbe32b15a538c971f15d8aa4e6b7fd51b  libXScrnSaver-1.2.5.tar.xz
 # Locally computed
 sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 55ae7a6801..3c6774a59b 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.4
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.5
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.xz
 XLIB_LIBXSCRNSAVER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
