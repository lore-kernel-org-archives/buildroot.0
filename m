Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CA8D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3680180972;
	Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_ch_KgVOLPL; Tue, 13 Jan 2026 20:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A5F80920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337962;
	bh=m2DBzdT2KFvF6EE+/LMupbuZqfGEQLbZ2+ve5T/KN2o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mw7C8Mr0wzfJIgNV/S1qXrALs4wJuO9jE5Iivk9fcyTFMqecnlcpMGssWDPeiUlDc
	 SOptRH2yBSQZxZtUq/PLrr8uTeG5gH50E/fm6iLuMR00eZd9SgMBWmrCG0/B0TA/t0
	 REUVN6Vx1sgIkxMOrnHe/+JWbg9l0qMAWdgwvflnzr63LR3vh4WzMalFU5yjB+lDcs
	 6BrL6Rg9XtP+yQmo8c/8qsd3Wh3aixKvcwDoiQpZpY4mbsjExzrTUXiY3BoIku/A6K
	 tV9r/cp/P6JAUL7WimiVMgHFW6qEaaNDyALBLBOlE/5SgTxb3d3p+S3Bg3dsnkfehJ
	 S9kCPtUhwiOKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A5F80920;
	Tue, 13 Jan 2026 20:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E2D231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0358B40783
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJbmoco8T6ZL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215D14077C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 215D14077C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EC0E819E3; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cb3e09f4dfad9162578c131bc17b41576379bd1
X-Git-Newrev: bed191965f1685ea05d99625b9906c233048a990
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.1EC0E819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfsinfo: bump version
 to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=bed191965f1685ea05d99625b9906c233048a990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003619.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash | 6 +++---
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
index 7d5976473d..1904dcf145 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003238.html
-sha256  92f3ca451cba7717eed15f80de3c123aa56c82a1ee7d6e9116ba513021b98874  xfsinfo-1.0.7.tar.xz
-sha512  1914916bf995c08a520bd009ddfa57c7e4a997a829380232d359f9bf68852c67650efb8f1fe3cc8a11889b2ec067f50ac38df711ffaf4536802a0b530dc1789c  xfsinfo-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003619.html
+sha256  ae80592b6063da928e3d0c81023709b2fa29a04fcda49f6c363ac579d97f23a2  xfsinfo-1.0.8.tar.xz
+sha512  fdba207b6fbce0f9335b712a2b25bc3be973fe1ff712373b0d1a688c130299e9ea870f34a44f24757e73e88c59bdea03d67e96efbc455030f71ef81ab4668c98  xfsinfo-1.0.8.tar.xz
 # Locally computed
 sha256  bae01fa08f30f21f9cfb75e8339d081b34e5e03d12677177f85a55b0ca41d0db  COPYING
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 29e9fc75c4..4fcacf599a 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFSINFO_VERSION = 1.0.7
+XAPP_XFSINFO_VERSION = 1.0.8
 XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.xz
 XAPP_XFSINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFSINFO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
