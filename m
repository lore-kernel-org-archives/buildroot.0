Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80908C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31EEA40620;
	Wed, 27 Jul 2022 15:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31EEA40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjwMysh675UE; Wed, 27 Jul 2022 15:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D8EF4013D;
	Wed, 27 Jul 2022 15:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8EF4013D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 932521C1162
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6991D4012F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6991D4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xgEdrDPCs7K for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A0940119
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A0940119
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 33774866D1; Wed, 27 Jul 2022 14:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:00:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84fe8e694eb201b52e2911006ac87473376ce8e5
X-Git-Newrev: c3146e0a179b8f88512e3d0978f20a8667cd512a
X-Patchwork-Hint: ignore
Message-Id: <20220727144847.33774866D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-meson: drop csky reference in
 package infra
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3146e0a179b8f88512e3d0978f20a8667cd512a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-meson.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0835e08e3a..156b005fdd 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -36,8 +36,6 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 PKG_MESON_TARGET_CPU_FAMILY = aarch64
-else ifeq ($(BR2_csky),y)
-PKG_MESON_TARGET_CPU_FAMILY = csky
 else ifeq ($(BR2_i386),y)
 PKG_MESON_TARGET_CPU_FAMILY = x86
 else ifeq ($(BR2_m68k),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
