Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6490CD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3972A40CC4;
	Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cfC5rWmq6ZN; Tue, 13 Jan 2026 21:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2D140DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338021;
	bh=U8YQd5QIPpBzSHbKMDE1dTGvnN724KYvWg99uaH8dsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RluYr7tUgi7MOH8rwduLqN+yAv580eTi4nyfAt660WaFR2Q8q2AjIhs3igooElDfo
	 tHaAjPCfTAqYVH3x4b3YkQ2J6Lkn0IIFx8QvqYmhiuspevkJ2l27ziB2T0hNi50leD
	 71bz0nsAsgLL+IGuo+s3NeWHQpmZ0oTzlcD+KrR9Ztl9j0uK/oxiHzd0uCYo0GH6UI
	 sjjZiGZn7L/jhQTqRBI56ZuGKbyHzF6Fsl4TPQgy+qI1Bx5OzAYE3jUP4ZycxMmQuJ
	 t9AaNznZwVp+9344P8XNuP8PdhINHBYa0s1/3b5IFlAR3VgM0nz1djJbIah5QlVOzL
	 pVQgSG/LhJh7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B2D140DF9;
	Tue, 13 Jan 2026 21:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 395E61CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D733407A5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPsDFKGPwWeH for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EE4407CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EE4407CE
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D6D81124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dd99a016349a9085825e30e7eb9d6365a849f2c
X-Git-Newrev: c727b801257263b412c2db673f8e942bd43d8c8e
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.12D6D81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libfontenc: bump
 version to 1.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c727b801257263b412c2db673f8e942bd43d8c8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003462.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash | 6 +++---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index a061ca4a4b..36ba578c13 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003285.html
-sha256  c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2  libfontenc-1.1.7.tar.xz
-sha512  fd8578a81090fa938dd75ad9081ab62c6c54fa2535d1c6291afd799ac8dc7c344a43f07cea5cd4433af16df0d926c22e7c169877bc8b13d92584e7dec173d701  libfontenc-1.1.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003462.html
+sha256  7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6  libfontenc-1.1.8.tar.xz
+sha512  c9ddea9c0c6c6f4933b5b8ed2044e3dc259a9edbb3070a32f0335a6ad4d47b1858cefc01fa2dff9f29808bee311e9c677b05861200d2f2c4552c92b33fe027e2  libfontenc-1.1.8.tar.xz
 # Locally computed
 sha256  a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index e12086b125..d419a4ac8a 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.7
+XLIB_LIBFONTENC_VERSION = 1.1.8
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.xz
-XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFONTENC_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
 XLIB_LIBFONTENC_LICENSE_FILES = COPYING
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
