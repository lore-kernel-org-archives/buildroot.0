Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C23C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:19:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1138361042
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1138361042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE49E60BB2;
	Fri, 13 Aug 2021 13:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hglpQlnZpB0Y; Fri, 13 Aug 2021 13:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6950A60BCA;
	Fri, 13 Aug 2021 13:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF9631BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7ED60BB2
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPApQ5bbyTnx for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37D2C60BCA
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB7117F89F; Fri, 13 Aug 2021 13:18:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:16:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4af8b52506a3653d494ea9b11980d89cb2ad1e51
X-Git-Newrev: 0b694a008de0ae06e2d0bb0283ebeb82ca272870
X-Patchwork-Hint: ignore
Message-Id: <20210813131834.BB7117F89F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wayland-protocols:
 bump to version 1.21
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0b694a008de0ae06e2d0bb0283ebeb82ca272870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to version 1.21, which is required by newer wlroots releases.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index 321fc62de5..fd6b9925eb 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041269.html
-md5  b0836533a3f2dc6585b1dae00341157f  wayland-protocols-1.20.tar.xz
-sha1  e78c739a3a85477ed524b81e8bb75efe7f8bf4df  wayland-protocols-1.20.tar.xz
-sha256  9782b7a1a863d82d7c92478497d13c758f52e7da4f197aa16443f73de77e4de7  wayland-protocols-1.20.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041815.html
+md5  8196416baac07cd833bcb86b69da41a7  wayland-protocols-1.21.tar.xz
+sha1  6e0e2a05edb43d32e3b2e3f681ef266a287a186e  wayland-protocols-1.21.tar.xz
+sha256  b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5  wayland-protocols-1.21.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 84028b97d5..3d7a0e472d 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.20
+WAYLAND_PROTOCOLS_VERSION = 1.21
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
