Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD636CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D256F544;
	Sat, 30 May 2026 13:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxukHGr9FBTT; Sat, 30 May 2026 13:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F696F55C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780147289;
	bh=XVg35lxWq1Kf4IQ2CvcCkFN7l31L4ukfcOkXk4XKhEw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Os58uL1URyssV7fKGz0UaewZWLrzjuLsE/L5tpyrU4o5N/aXcs3TUdmZ7nVlfoo2P
	 BpIP+rJShVQ6MPw8N+Vojn7TMuSxA4+tk0bDMuTnW2GAllSRNAjpvkfGDO0k+wKLA2
	 KmTdpzsDEqGC5XN5EXCnMLHdyVMT7RqztzcnRGb2QIfvAkpBaFBhaqJwOlS/soPAiE
	 lKF1fekhnwo3NKJ4UOPC8KUD+F+4Leu1sSqSC8mwQJvQSl9JnWJ1EEU1tYjcnzejkW
	 yGYhbwq0G2ilWoSDNrtPpexN9W0tpxGlcIraCctr4WnV5Oy4Y9oL0iT0Zmvx0U9bKS
	 xFxMkMENSAkRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F696F55C;
	Sat, 30 May 2026 13:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7CA9F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8F3F408F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RbvCrtTGO8A for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE55640909
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE55640909
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C76D987500; Sat, 30 May 2026 13:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:20:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b854bce8b00b879c6cae3a6c5ad0d96cb3d6b05a
X-Git-Newrev: cf2cb9f77408de8c7bbcd9163c68f2589ce453eb
X-Patchwork-Hint: ignore
Message-Id: <20260530132114.C76D987500@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nv: bump
 version to 2.1.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf2cb9f77408de8c7bbcd9163c68f2589ce453eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-April/003694.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash | 6 +++---
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index 4154efb612..f51e039c37 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-March/003489.html
-sha256  c68dbda431f3d47000606f8173b977b811c76ba9dda1a5d2e3ee122bbbb98aca  xf86-video-nv-2.1.23.tar.xz
-sha512  ce09f37bd29bbe588a8788d643240c9b0324654ea37b8e7f0f127494999f24b3048ca0c7ea91b33ef94efd12b570bfb73c8a5e20bf63749b01cbdc5669136b9e  xf86-video-nv-2.1.23.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003694.html
+sha256  2fb667de9d10bfa7ecddbb951f93020a2c0e42757b000a3d6f400bd54845df23  xf86-video-nv-2.1.24.tar.xz
+sha512  38e866f44f6233508f40002013e98fbc7f4e090a44b89a7116342aacc4cdc390a54a5a3d34c821150130386e47f2203c678e44861a1631f2e406f98aaa7c42de  xf86-video-nv-2.1.24.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index cec2101d3c..fb021ae20e 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.23
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.24
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
