Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C817C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0748460889;
	Sun,  4 Jan 2026 13:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WAHMlVFn36R; Sun,  4 Jan 2026 13:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B5960847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532004;
	bh=WmJZoYZ92xAja2XO++tHNxs1wLEA7Bx/xFB8wXLpY2U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W48ywKAve6HIK7qwu3QHxUyYS4HaCRkB0558AmR13HTi2apOmDwL3K6xfIFjluc8s
	 E20Ix828xuhTbYznWkdEHMFYSTLPIxAlmTqDTiJr3dcuQGA4PKoVUpnHZ7z7gqEc9Y
	 lCQyzLPMKoci8nI6u68PWFEz5tWeEqBhbl/6du7Z++ZVx4M7U5YnO0a16NL/ozglUz
	 dJrA39sUOsJsmvxd8zvhFCi5o1F3gUPppr1dNOVKq5Krp6Ah7VoOxnJ7JjNgSR/KFS
	 VbRrOD5KobzpH0QXpOELdmEKvOqDoz7zImL24hWZ21vcTDLsuyjaNZ74IOl+BFXukD
	 aTF2E/C2ZkNyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B5960847;
	Sun,  4 Jan 2026 13:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CD872DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D44D1405A6
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqZNRjjIUJK4 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC0B40500
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFC0B40500
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD68388244; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64a288e33c076300bacfdf1aa3e955a7da86ad65
X-Git-Newrev: 7d3d5c68a2a3783acdbe2eb6a19fa15760038e3d
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.BD68388244@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shairport-sync: propagate
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d3d5c68a2a3783acdbe2eb6a19fa15760038e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit
1abaf013dede73cb148a95d4ed708429776033f3 ("package/shairport-sync: add
support for AirPlay2"), a new option was added, selecting various
packages, without properly propagating their dependencies, causing
Config.in warnings such as:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBGCRYPT
  Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2 [=y] && BR2_PACKAGE_SHAIRPORT_SYNC [=y]

This commit fixes this mistake.

Fixes: 1abaf013dede73cb148a95d4ed708429776033f3 ("package/shairport-sync: add support for AirPlay2")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shairport-sync/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 89d9c9feb0..dad88e9982 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -28,6 +28,9 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
 
 config BR2_PACKAGE_SHAIRPORT_SYNC_AIRPLAY2
 	bool "AirPlay2 support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	depends on BR2_USE_MMU # nqptp
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
 	select BR2_PACKAGE_NQPTP # runtime
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSODIUM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
