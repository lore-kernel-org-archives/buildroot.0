Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC2CEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 14:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D96581A39;
	Sun, 16 Jul 2023 14:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D96581A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttCBuN34J8DG; Sun, 16 Jul 2023 14:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FBA881A24;
	Sun, 16 Jul 2023 14:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBA881A24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D773D1BF30F
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDCBC60B09
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCBC60B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p87T4K8r4CPA for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 14:50:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7983D60ABF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7983D60ABF
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 14:50:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C062A4C0B20;
 Sun, 16 Jul 2023 16:50:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36036)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL34V-0004tP-0j;
 Sun, 16 Jul 2023 16:50:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 16:50:03 +0200
Message-Id: <20230716145003.339645-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230716145003.339645-1-bernd@kuhls.net>
References: <20230716145003.339645-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689519003;
 bh=f+NK2k+cD+vDrS68S4lMz8gPzBe8/0iAXI0pVnydhx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S4YssG0Jc+rpc3VJtkOuRZAKqExapuO91nkqsqFhDaVP9GUFxOYX0DOyqHvQgczzk
 lqms47zMEppOUXITkx5CYEmBiVylFQLkTMwGPW4r1LTHTsmXUbzCo63pKTYAlzzyfL
 3D+5Z+vHQQexdL97XNzChPIbEQdA7fMyu5QvzS30NFe65f+Rc9gWyxtxScphAibaZN
 XE0NBqw3BIrBvwqH5ZZsl6MHwkDbrzco6scbFT9kY8W5ECxGCZJmpk5H8dZhfPcb3l
 l98dibOO/nlZgxNPwVyQBLeVE0k6KCEhvroXcXVZaIL/D33YEFD2aR/6auFY7aOusG
 Izuk8HZpgICcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=S4YssG0J
Subject: [Buildroot] [PATCH 2/2] package/mesa3d-demos: add optional
 dependencies for wayland support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libdecor cannot be selected due to a circular dependency:

package/wayland/Config.in:1:error: recursive dependency detected!
package/wayland/Config.in:1: symbol BR2_PACKAGE_WAYLAND is selected by BR2_PACKAGE_LIBDECOR
package/libdecor/Config.in:1: symbol BR2_PACKAGE_LIBDECOR is selected by BR2_PACKAGE_MESA3D_DEMOS
package/mesa3d-demos/Config.in:1: symbol BR2_PACKAGE_MESA3D_DEMOS is selected by BR2_PACKAGE_PIGLIT
package/piglit/Config.in:1: symbol BR2_PACKAGE_PIGLIT depends on BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
package/waffle/Config.in:7: symbol BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND depends on BR2_PACKAGE_WAYLAND

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-demos/Config.in       | 1 +
 package/mesa3d-demos/mesa3d-demos.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index 7848bb6faf..1761494c3a 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MESA3D_DEMOS
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	help
 	  OpenGL demos from the Mesa 3D project.
 
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 29cb00bb8a..8acba9270a 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -62,8 +62,8 @@ else
 MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MESA3D_DEMOS_DEPENDENCIES += wayland
+ifeq ($(BR2_PACKAGE_LIBDECOR)$(BR2_PACKAGE_WAYLAND),yy)
+MESA3D_DEMOS_DEPENDENCIES += libdecor libxkbcommon wayland
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=enabled
 else
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
