Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8BCCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F42141477;
	Wed,  1 Oct 2025 20:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj6Oo2Yi5QtV; Wed,  1 Oct 2025 20:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B0E441459
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B0E441459;
	Wed,  1 Oct 2025 20:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134B272
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE77F41438
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKJI1fg1mSY0 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 426744074C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 426744074C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4050786701; Wed,  1 Oct 2025 20:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:13:20 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: cbd25b5b4d662a9c7e8766c64bff472d304a9ba6
X-Git-Newrev: 417c9309ce0dd4a3bb0e43a8b1702fd9c38f574c
X-Patchwork-Hint: ignore
Message-Id: <20251001205233.4050786701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/wlroots: add
 missing dependency to libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=417c9309ce0dd4a3bb0e43a8b1702fd9c38f574c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

If the render gles2 is enabled then libgbm is required (see [1]).
Therefore, add the dependency to wlroots.

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/0.19/render/meson.build?ref_type=heads#L44

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 00fb3a57cbaedb8df43f75f0e891423c1ef7d8c6)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wlroots/Config.in  | 3 ++-
 package/wlroots/wlroots.mk | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 02bd54c999..6d2992cf2c 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -1,4 +1,4 @@
-comment "wlroots needs udev, EGL and OpenGL ES support"
+comment "wlroots needs udev, EGL, OpenGL ES and GBM support"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!BR2_PACKAGE_HAS_LIBGLES || \
@@ -15,6 +15,7 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDISPLAY_INFO
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 81f76fcdc7..e0f1e1053e 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -19,6 +19,7 @@ WLROOTS_DEPENDENCIES = \
 	libxkbcommon \
 	libegl \
 	libgles \
+	libgbm \
 	pixman \
 	seatd \
 	udev \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
