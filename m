Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A22D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA366108E;
	Tue, 13 Jan 2026 21:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ym-GblBhPVAN; Tue, 13 Jan 2026 21:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D4861082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338040;
	bh=JKInXY+djFz7wQZXkoF+p2GHgG2xp96ZsyZMQlNrVKQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M9CfupX1ocjpJQoWJ52mi4NmwxZQ5Dkj7DNHK72+ZsaHBkujqfVdp/HYAy8TMHp8L
	 MtMf4wfQXxnwPCaPAP1clt7o/lEYSkR7s30vItPRV+E3ItKRU/HSkoC7XwZoWUTmno
	 7XqYUh6HA/5Y9sRMrEx1cwd4x992a+Jy9xIjdj6E78BgvkCPDEqsjXZ8JO9dsqnwAb
	 qGpahkc+BbMbGjfCO0Gu1hEm/zZx3NM6fPpnVKdTQoZZOLzp3UpmNn77jw4uxpnNmY
	 JBCq8pcRGmjXkfo9ktFlIYBMK48gefXjLHIr+stw7/Tp5xJMqKvYtO0TLi1g4riYTp
	 OZL4yFOBoGhiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D4861082;
	Tue, 13 Jan 2026 21:00:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C5D231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFE17407C0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl0L8dpVul1u for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 215224079E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 215224079E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F698868C5; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c727b801257263b412c2db673f8e942bd43d8c8e
X-Git-Newrev: e55fa544604e1a4ae7ac9f537056140e9a2751ac
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.1F698868C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxkbfile: bump
 version to 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e55fa544604e1a4ae7ac9f537056140e9a2751ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003455.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 6 +++---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 7e6199f16b..d8a1173925 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003286.html
-sha256  b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1  libxkbfile-1.1.2.tar.xz
-sha512  0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d  libxkbfile-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003455.html
+sha256  a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec  libxkbfile-1.1.3.tar.xz
+sha512  d80ac41f6fa3a1ffad77ea1f8f9d9542f0bd210d74b263802bc6e6c1594fe325b27f42b5454aeeb36352518963b1ed1fdbbad95d7db3690b2e36d54742b7c236  libxkbfile-1.1.3.tar.xz
 # Locally computed
 sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 2e7f82922f..23fddee97a 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.1.2
+XLIB_LIBXKBFILE_VERSION = 1.1.3
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.xz
-XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBFILE_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
