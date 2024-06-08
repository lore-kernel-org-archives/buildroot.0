Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6199DC27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 15:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A4F843B3;
	Sat,  8 Jun 2024 15:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynrt4wiwS--S; Sat,  8 Jun 2024 15:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3561E843C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3561E843C1;
	Sat,  8 Jun 2024 15:30:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72E3E1BF417
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71D15842C2
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb09e7tyku_A for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EE784319
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5EE784319
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F51A81454; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 17:26:17 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 25c23920ffd49f2a6c752488167e93bf87e89b89
X-Git-Newrev: 4ae077510c7322b87a42d08456b75b10c30d7c4f
X-Patchwork-Hint: ignore
Message-Id: <20240608152958.9F51A81454@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/weston: fix
 xcb-util-cursor dependency for xwayland
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ae077510c7322b87a42d08456b75b10c30d7c4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

../../br-test-pkg/bootlin-armv7-glibc/build/weston-13.0.0/tests/meson.build:340:2: ERROR: Problem encountered: xcb and xcb-cursor required for running xwayland tests

Fixes:
 - https://bugs.busybox.net/show_bug.cgi?id=15766

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb952e1116dc4f02d9d64402d05b55280d5da178)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in | 1 +
 package/weston/weston.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index db6a78ee8a..385f712a40 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -133,6 +133,7 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_CURSOR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XWAYLAND
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b07e798765..b2d54b71b4 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -108,7 +108,7 @@ WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += -Dxwayland=true
-WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xcb-util-cursor xlib_libX11 xlib_libXcursor xwayland
 else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
