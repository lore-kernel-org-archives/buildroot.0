Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD3CD343A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49C4812FB;
	Tue,  5 May 2026 10:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PllZC9DFwquq; Tue,  5 May 2026 10:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD614812EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777978306;
	bh=jtpBFGkGfjQ2HCuHSle43eRo1NTEWGboe6cDPxErVAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=clFr1u7JtNPoNP8v8QI2QE69V4km0rAsvJA9V1xIBiCQbhVAaCMB67W2Mto43hwO+
	 PZXDPWp0zAGToNH781Buq5UccOlx576KtfiafHvCM0jU9PLW8jkAIZdrTyYlWaBGPf
	 V7QzKwVdPp8D4H01oX/PKWYh7TgHhWd5eu089rhRN3sDitCaPUvTYA4lEdYqnXnGZO
	 0E8dWAqYn8fm4bfRdULgzlYKnNPeCpeveanifvsadAWHqXZcgOXQQwIhQCyjAOhnuA
	 +U5w5Bzy9/5sF0ZITdKTkQ+JCHxau/Dc6gU8pNF+PFLmkyqD1hhwzLiKQ1aDczwRQS
	 7UPf2Gww0q9+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD614812EA;
	Tue,  5 May 2026 10:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9BD22DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB904812D1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sg7pDQrEiaqG for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF76280BF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF76280BF1
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D847844F5; Tue,  5 May 2026 10:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 11:54:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6558eb3d65d2b71173e9f7ee1db6c79b4affd7fa
X-Git-Newrev: a063c89dc2d3af3f98d9679571a4972210e3390c
X-Patchwork-Hint: ignore
Message-Id: <20260505105143.1D847844F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: fix install with
 BR2_ROOTFS_MERGED_BIN=y
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a063c89dc2d3af3f98d9679571a4972210e3390c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Eudev install creates a symlink from $(sbindir)/udevadm to
$(bindir)/udevadm if sbindir and bindir are different [1].
Unfortunately the check considers only the configured values as
strings and does not resolve symlinks. This means that in a merged-bin
setup with sbindir=/sbin (symlink to /usr/sbin, which is a symlink to
/usr/bin) and bindir=/usr/bin the /usr/bin/udevadm binary gets
overwritten with a link to itself.

Set sbindir according to the merge setup to avoid the problem, bindir
defaults to /usr/bin in any case.

[1] https://github.com/eudev-project/eudev/blob/9e7c4e744b9e7813af9acee64b5e8549ea1fbaa3/src/udev/Makefile.am#L139-L140

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/eudev/eudev.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 1a56cfd2f0..3c22b13d86 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -12,7 +12,6 @@ EUDEV_INSTALL_STAGING = YES
 
 EUDEV_CONF_OPTS = \
 	--disable-manpages \
-	--sbindir=/sbin \
 	--libexecdir=/lib \
 	--enable-kmod \
 	--enable-blkid
@@ -21,8 +20,14 @@ EUDEV_CONF_OPTS = \
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
 EUDEV_PROVIDES = udev
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
-EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+EUDEV_CONF_OPTS += --sbindir=/usr/bin
+else
+EUDEV_CONF_OPTS += --sbindir=/usr/sbin
+endif
+else
+EUDEV_CONF_OPTS += --sbindir=/sbin --with-rootlibdir=/lib --enable-split-usr
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_MODULE_LOADING),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
