Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20265C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B861581D65;
	Tue, 16 Aug 2022 08:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B861581D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3_S8RuHwsHD; Tue, 16 Aug 2022 08:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8CDF81CFE;
	Tue, 16 Aug 2022 08:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8CDF81CFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 258FF1BF9C6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DCFA81B26
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DCFA81B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62r1carVUsq1 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4044881B48
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4044881B48
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 12E018773C; Tue, 16 Aug 2022 08:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:28:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 77c68719b7c02c7d49ce903c595baa20611a9a49
X-Git-Newrev: 64273340d024a9c2c70a501248e5961b5cff1dd6
X-Patchwork-Hint: ignore
Message-Id: <20220816082039.12E018773C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/xdg-dbus-proxy:
 bump to version 0.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=64273340d024a9c2c70a501248e5961b5cff1dd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

This version includes a few fixes, and a new Meson-based build system.
For now this only updates to the latest version, the switch to Meson is
left for a follow-up patch. Release notes can be found at:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9ad0000827dbe58d499ff8efc96158600e23edb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index b7aa9ac701..7bbea72b03 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3
-sha256  03b5d28ca879253ddbbce31098909becca1495ea811a6377a492e28f16c09b9b  xdg-dbus-proxy-0.1.3.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4
+sha256  1ec0eab53d1e49966d722352bcfd51ac402dce5190baedc749a8541e761670ab  xdg-dbus-proxy-0.1.4.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 9c4449c7bb..b07cf787ed 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.3
+XDG_DBUS_PROXY_VERSION = 0.1.4
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
