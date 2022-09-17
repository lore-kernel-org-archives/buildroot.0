Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2699ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CCC6416FD;
	Sat, 17 Sep 2022 15:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCC6416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30m5IKy8K1M4; Sat, 17 Sep 2022 15:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671BC416F4;
	Sat, 17 Sep 2022 15:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671BC416F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A79B1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76446842A9
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76446842A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vX12JRIw8P7N for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8457484294
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8457484294
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D16F8448A; Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39ef6a1ebb9b5451c62acde5ffd0125386d22054
X-Git-Newrev: d4b915dc4f42514c2de635b2a3ff0b1d9fb96894
X-Patchwork-Hint: ignore
Message-Id: <20220917153906.6D16F8448A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: install to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4b915dc4f42514c2de635b2a3ff0b1d9fb96894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to install weston to staging so that applications like cog
can use weston-direct-display.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e6c54ee7aa..5e71473640 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,6 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 WESTON_CPE_ID_VENDOR = wayland
+WESTON_INSTALL_STAGING = YES
 
 WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng udev cairo libinput libdrm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
