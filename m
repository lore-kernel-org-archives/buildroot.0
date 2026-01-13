Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F123D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA06540D51;
	Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzDPepcxENol; Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F37C40D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337983;
	bh=vkR97HNeQqNs2KtvsWsi4LJXsR2UB/etlMKYDBjPkm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BotpR6vtehmnlgYav0tx+qxhwEfFGu79FCCl1CHC9fmJ8enmGOV9ZrxZ5ryeo8eO9
	 8gZNaJ8EmsEVka8DSl3i683NJqHiVNGSGBzQ9dU1/pVesQcZ/Ov9CGHq2TaVVzMFbS
	 UI/gP0mBDBtsx1F54PgbKZteEWyKigQOA90/VQmZbuOT4fRxo8B/byoosIq+kWyYRb
	 WgEJPaK3e6Jaq+uomy2uAjYI8NxPVMv530QN+Di0klWDy1Pb5S/Hq/kSsLH6gLFSO3
	 PCi4AQGBOVEBc2eG8Tpz1ZbcnxZDvmBr1vaSzRJNfPbPA+8AThM+NCEtRy2neu5Q7y
	 lX9mhXZrIh37w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F37C40D64;
	Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B50FF1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 285384079A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLweEgeKIXP5 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB31D40757
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB31D40757
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A871C82242; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f01acb3cefdfcc3884e635a53fc644337797463
X-Git-Newrev: 101838aa38a5a8b669b2867897888e82c684698e
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.A871C82242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xbacklight: bump
 version to 1.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=101838aa38a5a8b669b2867897888e82c684698e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003550.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash | 8 +++-----
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
index bda5c32cde..999945d160 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003008.html
-md5  5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
-sha1  f0a6163738143ec23542b459aef567309a119e0c  xbacklight-1.2.3.tar.bz2
-sha256  3a27f324777ae99fee476cfb2f064576fb8cba4eb77f97cda37adda1c1d39ade  xbacklight-1.2.3.tar.bz2
-sha512  717c87ce24634892fc4ac54fc59dcc0a5bc8f206aaf1d13410f95f7e4fe6e3dbc7ff8d951bcd8ea8c5e955357a00fea6ceadd4559e60b1a632e40f71290e12c7  xbacklight-1.2.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003550.html
+sha256  d4c30b0e6f18c82f387585a737ee3b72d468c927892b08a898c41bc12248e8ee  xbacklight-1.2.4.tar.xz
+sha512  6aa39d8f4430b2b9da92afff462aebbd0f3fdef50bf6a4fc3e5c08e45ae18156dc2017b8a46cd3185b2e4b1b836d2bd7379821a6591afa3d6db395247c8193e3  xbacklight-1.2.4.tar.xz
 # Locally computed
 sha256  c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04  COPYING
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index d52d562ceb..91aa1d09da 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.2.3
-XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
+XAPP_XBACKLIGHT_VERSION = 1.2.4
+XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.xz
 XAPP_XBACKLIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBACKLIGHT_LICENSE = MIT
 XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
