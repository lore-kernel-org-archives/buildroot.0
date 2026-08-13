Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950FEC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F7C40C66;
	Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SCVRrpB66EJ; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6157140C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713587;
	bh=+lke0+N0ZkvmCWyEjxHpyt+aYOhD6vxuoy9FnIfmSeg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AGEUBx+DjEr2FinymF7dSD61ber9b6T1dWKHjj1EjU6z/2gASOjFT8mBGdgq8tcss
	 FfkUHbjhZwvpNnjWuZDvf/Y7ZYszn79PLBGGdoieTN2LkioHrk10Nn9s05JAJ6XQ7t
	 WH+BByQJoey8TZ4suRhmrpAlBr+uIyM0e/3l3u4BxtR8RJ9nLsV8nyxWz4TqkrA1hN
	 1oxMkFqaCQT7RS4bDu1XeR9+klkrVEXPU/Z1lmKpaJIHTmqSwJNTmQR6RLWHkYzXVU
	 1oo7tWYrg/devp3blEKchxbzNIYB0xoyZfRgW69TMpkteiG7ueQzgmLT87d3D9JhMp
	 LjQUnc+856EaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6157140C34;
	Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C4B33B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B61340C52
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_BNQM83qNm3 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712BA409DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 712BA409DB
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 733578D66C; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:27:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cc822da5c5a0c9a87abce3bfa9ec4afa9c65b228
X-Git-Newrev: 0f3adb8ea03fd17b090066041c4b4abaab7f7e98
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.733578D66C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgtk4: enable
 introspection when gobject-introspection is enabled
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f3adb8ea03fd17b090066041c4b4abaab7f7e98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libgtk4 passes -Dintrospection=disabled unconditionally, so Gtk-4.0.gir is
never installed. webkitgtk depends on gobject-introspection and generates
WebKit-6.0.gir, which includes Gtk-4.0.gir, so building both fails:

  FAILED: WebKit-6.0.gir
  Couldn't find include 'Gtk-4.0.gir' (search path:
  '['.../usr/share/gir-1.0', ...]')

Tie the option to BR2_PACKAGE_GOBJECT_INTROSPECTION and add the dependency,
the way package/libgtk3 already does. Systems without introspection keep the
previous behaviour.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 8c5f7741726d7bb72b71e7a83088032bdecb9d44)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgtk4/libgtk4.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index f63e320629..ae7156db0c 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -33,11 +33,17 @@ LIBGTK4_CONF_OPTS = \
 	-Dsysprof=disabled \
 	-Dtracker=disabled \
 	-Dcolord=disabled \
-	-Dintrospection=disabled \
 	-Ddocumentation=false \
 	-Dscreenshots=false \
 	-Dman-pages=false
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGTK4_CONF_OPTS += -Dintrospection=enabled
+LIBGTK4_DEPENDENCIES += gobject-introspection
+else
+LIBGTK4_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
 LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
 LIBGTK4_CONF_OPTS += -Dx11-backend=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
