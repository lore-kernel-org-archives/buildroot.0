Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5589FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3E0D40339;
	Thu, 12 May 2022 19:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdQVafgcdxRh; Thu, 12 May 2022 19:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D751E40190;
	Thu, 12 May 2022 19:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6E01BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D2F5401FB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwiyIr3r0Lje for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:30:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34F5F40190
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7A95E85C11; Thu, 12 May 2022 19:19:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:28:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bff7a3f1f219aabf142cf3613039531fbc8e9072
X-Git-Newrev: 6a3379ad31d710b810c6b9817b7fc969a5897dfc
X-Patchwork-Hint: ignore
Message-Id: <20220512191919.7A95E85C11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: remove
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a3379ad31d710b810c6b9817b7fc969a5897dfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forgotten in commit e6f8c403fe6c9909d2d3f5fd897c3057b7677192 which
removed 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index 6a71761f4e..fb0bba879c 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -12,8 +12,6 @@ XLIB_LIBXFONT2_LICENSE_FILES = COPYING
 XLIB_LIBXFONT2_CPE_ID_VENDOR = x
 XLIB_LIBXFONT2_CPE_ID_PRODUCT = libxfont
 XLIB_LIBXFONT2_INSTALL_STAGING = YES
-# 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
-XLIB_LIBXFONT2_AUTORECONF = YES
 XLIB_LIBXFONT2_DEPENDENCIES = \
 	freetype \
 	xlib_libfontenc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
