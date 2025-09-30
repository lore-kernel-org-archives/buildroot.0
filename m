Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDFFCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1DF4614C7;
	Wed,  1 Oct 2025 21:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FcAFRaqykVD; Wed,  1 Oct 2025 21:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F05561601
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F05561601;
	Wed,  1 Oct 2025 21:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DE51CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D0794148D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35P-nfCVeive for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F35141461
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F35141461
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D2E38285C; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:32:55 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: fde194f179008f3077b6a4df1d5fb37786de2364
X-Git-Newrev: 0317555103111636f2068c7e7a633457eb27ed25
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.8D2E38285C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/wlroots: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=0317555103111636f2068c7e7a633457eb27ed25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
