Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FB2D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA9560F19;
	Tue, 13 Jan 2026 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTpkUXQAiymu; Tue, 13 Jan 2026 20:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8138160D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337977;
	bh=jHY43xQiz6TCUGAb5nl9AdVoBlSSdoauPUdk0xJGifU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZGUbblNsUZwCQ5FHhFQ6PtoyhYjX6W1vTJeNBOJsn6mse5pgidMprg+HRy26LBcjT
	 jtBLBd5bwnUz5j5qs4r2BZmVVf2hPc/UpzvErt01Dnxr6li/h9cpNm1RgeUyweBQ0n
	 KQUOLUNsYp4g/FhESJVHOvR0/hEWPa2ae2iiRy2JIR8CCMssriPDgFWRY9SelK7KnF
	 3bXzKKCOzIvXvHGQ/kSKSjf+HaB+hpUzmQds9mhn9sFnKNPNWAZ9s76vD3w20uz/IF
	 ay1VSxorXr/QETKXBH+H/2IZSwEz7jPHX+59UBhV/YndNh0gaw57ncMiXyvdnwT/p7
	 Azwvcfv8fx71w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8138160D8C;
	Tue, 13 Jan 2026 20:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C84E21CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7513407DA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW2CHtP1p3B7 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 422AC40798
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 422AC40798
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4033887F77; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f821b293e1380760ac23a6e6f8ab80ba726cd6b
X-Git-Newrev: e5c9aa07184953a677144941cbf726ac10900934
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.4033887F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXrender: bump
 version to 0.9.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5c9aa07184953a677144941cbf726ac10900934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003567.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash | 6 +++---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index 015fa0af21..c30dc4a2f3 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003239.html
-sha256  bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24  libXrender-0.9.11.tar.xz
-sha512  2327cc1b530382d81df29b8d579f801f1f990202107cc84506986bcf5d15010d414e9418987b200e3f222d188afce46f0d7754febcdca62a5fc1e541b3bb82de  libXrender-0.9.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003567.html
+sha256  b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97  libXrender-0.9.12.tar.xz
+sha512  3d24a6877b500608e3e2a393532a99d4fd54fc343375d8fb51dfbb1b50cedf002c7722f771cf7776f93cb6e0421ca5966ce45435cb402d5f12a398f9ea743474  libXrender-0.9.12.tar.xz
 # Locally calculated
 sha256  bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index fd97c83cf6..5365d03d5f 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.11
+XLIB_LIBXRENDER_VERSION = 0.9.12
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.xz
 XLIB_LIBXRENDER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
