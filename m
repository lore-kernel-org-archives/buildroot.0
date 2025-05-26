Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958A7C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DFD961774;
	Thu, 12 Jun 2025 08:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yy9JB8c01jQ7; Thu, 12 Jun 2025 08:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D20616B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D20616B5;
	Thu, 12 Jun 2025 08:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 578BE1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39279421AF
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LubzwrqdHy4s for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AAB142115
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AAB142115
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18483817E6; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 21:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae61cc15d92068ab5b56a0ee53518498cec04d6f
X-Git-Newrev: 48c5ae7395a5ca74dc77470098d873b0e4dfe987
X-Patchwork-Hint: ignore
Message-Id: <20250612083830.18483817E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusbgx: bump to version 0.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48c5ae7395a5ca74dc77470098d873b0e4dfe987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After a long time, upstream has made an actual release, which also
contains a number of bugfixes/improvements. Switch to it instead of
using a random git commit.

Changelog: https://github.com/linux-usb-gadgets/libusbgx/releases/tag/libusbgx-v0.3.0

Signed-off-by: Florian Larysch <larysch@fixme.gmbh>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libusbgx/libusbgx.hash | 2 +-
 package/libusbgx/libusbgx.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index b18258978f..724da27a57 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d0b483d8b190a75a1f9b52d6db229de5580c78b201077361a524cf32c5aad517  libusbgx-a5bfa81017a9b2064bc449cf74f5f9d106445f62.tar.gz
+sha256  23d72c415ffd80d752efccc9bb5a6afdece6a83a31975344ef31a4967d189e3c  libusbgx-0.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 03e8dff6bb..7a0e4c5e5b 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = a5bfa81017a9b2064bc449cf74f5f9d106445f62
-LIBUSBGX_SITE = $(call github,linux-usb-gadgets,libusbgx,$(LIBUSBGX_VERSION))
+LIBUSBGX_VERSION = 0.3.0
+LIBUSBGX_SITE = $(call github,linux-usb-gadgets,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
