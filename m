Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B0FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7984156D;
	Mon, 19 May 2025 10:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yiieiy6J8Bwk; Mon, 19 May 2025 10:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 755D5419E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755D5419E4;
	Mon, 19 May 2025 10:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6DA193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AFD78138E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I_EbErr41ub for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777C381E8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777C381E8A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75943873D4; Mon, 19 May 2025 10:39:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 22:46:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 356c70677cd71fbe790b89a6391f41a5bebc4686
X-Git-Newrev: 84ab3e3d6e37ee4572888a143f3a04c53260ef6e
X-Patchwork-Hint: ignore
Message-Id: <20250519103945.75943873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wayland-protocols:
 bump to 1.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=84ab3e3d6e37ee4572888a143f3a04c53260ef6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Announce:
 - https://lists.freedesktop.org/archives/wayland-devel/2025-January/043966.html
 - https://lists.freedesktop.org/archives/wayland-devel/2025-February/043980.html
 - https://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 645d6d8f25..c6fca6cd25 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-December/043920.html
-sha256  e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa  wayland-protocols-1.39.tar.xz
-sha512  480a195ec0846400d93160e3d0a7ba12948ed841835ee4661f54b0101ae0027affd9c0f660a73244786fecd70e4f609830489a6b95e00d750cf2379734aacbe0  wayland-protocols-1.39.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2025-March/044027.html
+sha256  23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa  wayland-protocols-1.42.tar.xz
+sha512  ce85fecbe886264eaeb34c7992d4e493295f57f6213d5a2ec04b3471daee04a4225b1a7e77a27ccf39306074780553ec1383c55af30cc2c78942b40cc5777c1b  wayland-protocols-1.42.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index b04693978d..b7c5b118e6 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.39
+WAYLAND_PROTOCOLS_VERSION = 1.42
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
