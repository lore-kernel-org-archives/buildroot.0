Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69004D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B69960DB7;
	Tue, 13 Jan 2026 21:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8znC3WyhAbUs; Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582B160F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337999;
	bh=PCEcPCMl7V8B9ogFLoDbprH0Q2TZWKjhR4KIVyXvZx0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B6loux9oKwtjye+hwlYHSQZS2SUfyis8QIx8c5jkSVzIWbIy6Cp1xhaNbFfoB4YHu
	 9S5oR+SJk+z+OBGPlTJOxtbcKz+Yi+3fpsvxOTEwU+EdTRuNIyEQXLRV+le7uHaEfB
	 6Hk9x1biLprJxBpwjdnY+YzJNncldXHLFTI2Je7Ey+IEhtgokxsNnV31ZPWsSn1CmZ
	 vcLL9OmNsN88wFdwAt12kGOkq398BbC2zPcCGEqP827FZZmvlCH/RiYWTjJ5h1vWY6
	 ENVdh2btgMtYhlVELuU051tSK0X304JQ+M0/ygdGmG/gtofIYkmDg0BrX7fa2k1GwM
	 RGATgXyIAKALQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582B160F9A;
	Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8785231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E834079B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY2I__zZb9ME for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC3B4407B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3B4407B6
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAC6381382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43329222f5412e00a63d94f72b89428287e42257
X-Git-Newrev: 509fa5fd553eeb0cb77afed72bbf5cd1b50d3274
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.EAC6381382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_appres: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=509fa5fd553eeb0cb77afed72bbf5cd1b50d3274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-June/003517.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_appres/xapp_appres.hash | 6 +++---
 package/x11r7/xapp_appres/xapp_appres.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.hash b/package/x11r7/xapp_appres/xapp_appres.hash
index 17190e60e7..cf36ff9bca 100644
--- a/package/x11r7/xapp_appres/xapp_appres.hash
+++ b/package/x11r7/xapp_appres/xapp_appres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003141.html
-sha256  8b2257e2a0a1ad8330323aec23f07c333075d7fe4e6efd88e0c18fba8223590b  appres-1.0.6.tar.xz
-sha512  6d14f6a2ad5c83a4d42d4c51ec9a9f32652dfe7624881f1f41c0b1f4946904e7e5ca81a2fd9f4f4824488ce1bd2a4047f92320626bf33b0f1afc5e6b89d3e2b9  appres-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-June/003517.html
+sha256  1114b189239fd87a8d1db433edcb4486346d29912132b91eaeee5667f13b819f  appres-1.0.7.tar.xz
+sha512  5948f869124dd7160ffe109b0fc7ccdca45c3b3f551a382a0bcf2c2af9e3832b0d4451e2868ca93a38de8e8e2caf1946ac72936b3256e99a32437d0ddd937a60  appres-1.0.7.tar.xz
 # Locally computed
 sha256  5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 9beada295c..be0a041f62 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.6
+XAPP_APPRES_VERSION = 1.0.7
 XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.xz
-XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_APPRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_APPRES_LICENSE = MIT
 XAPP_APPRES_LICENSE_FILES = COPYING
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
