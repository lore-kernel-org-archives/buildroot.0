Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BD4CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F4F612FC;
	Wed, 18 Oct 2023 09:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F4F612FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3yJaWukBffU; Wed, 18 Oct 2023 09:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F0D60BA5;
	Wed, 18 Oct 2023 09:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F0D60BA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCDBD1BF98E
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94F4F402E6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F4F402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oT4QuqnzdY0G for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F3B40148
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F3B40148
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5220185D5A; Wed, 18 Oct 2023 09:42:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Oct 2023 11:36:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f45fa3b4059373c7287eafeb6466cc491734b958
X-Git-Newrev: 487761a5b294ae1806030b935faa97c1f1fd1820
X-Patchwork-Hint: ignore
Message-Id: <20231018094228.5220185D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xdg-dbus-proxy: bump to version
 0.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=487761a5b294ae1806030b935faa97c1f1fd1820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.1.5 mainly fixes handling of paths with more than 255
characters. Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 7bbea72b03..37f1790c9b 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.4
-sha256  1ec0eab53d1e49966d722352bcfd51ac402dce5190baedc749a8541e761670ab  xdg-dbus-proxy-0.1.4.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5
+sha256  061dcfaf8a0650e5fd9d5432dfe88bda749ea0d079dc136304bfecfbce0661fb  xdg-dbus-proxy-0.1.4.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 48f49dba2a..2e8c054386 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.4
+XDG_DBUS_PROXY_VERSION = 0.1.5
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
