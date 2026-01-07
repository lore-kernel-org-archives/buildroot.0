Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB76CFD641
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D01A820F3;
	Wed,  7 Jan 2026 14:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdB7crUHWKm8; Wed,  7 Jan 2026 14:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1936381FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794937;
	bh=sQhr1NbpsBJ/rGLwAg2pIeytOhlKomReW0AbderHLq4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BL3afV+Nqn9hpK/bp3e2RZRntQyd+AU6aOL2C15qU9W2uo5r8zPlUVCF8zwJrYxrc
	 ht0CjqoTc8Pt/jSJ4+ixgbQL+E++xG8ZExXgbpylWoDk/4BPzRONy/akTWD3zTRIYd
	 ZXFYwIqCi1jp6/VnY0F82nmhd8J7Kh8VXdU6AFSkpQkbkhk9aiuAlY9lS+q4tua3Ip
	 3ZHUYVrbHv64b4YVNFvj0N4sl2NOAV+uQneVWqdj+hmtcso0wU6XpoPd+cVt7un9HO
	 DXWQq9E46wISn4/8zhGBQud2GDbK5+RJL9769BPifG6t7Nh5jWhICBdRcZdQfmrVz5
	 okILI8mcShLGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1936381FD6;
	Wed,  7 Jan 2026 14:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF99970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D0954099D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83rS4WIigb-w for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3C8409A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B3C8409A2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8413D883AF; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:03:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73772bc5ea4a39b4558226706907ee9a6d4dfc48
X-Git-Newrev: 9c3d4008166e52e13e774f5b21b40ce4f75429cb
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.8413D883AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: security bump to version
 3.0.23
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c3d4008166e52e13e774f5b21b40ce4f75429cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://code.videolan.org/videolan/vlc/-/blob/3.0.23/NEWS
"Security:
 * Fix null deref in libass, undefined shift in theora and cc-708,
   integer overflow in daala, Infinite loop in h264 parsing, buffer
   overflow in png and multiple format-overflows"

https://code.videolan.org/videolan/vlc/-/tags/3.0.23
"It also adds a small feature on audio codec information, and fixes extra
 security issues compared to the numerous we fixed in 3.0.22."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 6733a870b1..9634ba3f1f 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha256
-sha256  e2cc1cf0ae0902a09da5a37c249a8a4e4b5ec4dc095443b8e1493c6a7cc138ea  vlc-3.0.22.tar.xz
-# From https://get.videolan.org/vlc/3.0.22/vlc-3.0.22.tar.xz.sha1
-sha1  f9871439cdb281e18a78828c389cf7bf66d47d69  vlc-3.0.22.tar.xz
+# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha256
+sha256  e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0  vlc-3.0.23.tar.xz
+# From https://get.videolan.org/vlc/3.0.23/vlc-3.0.23.tar.xz.sha1
+sha1  7b8c00a9c5bb879a403d5328c99924eefe01739a  vlc-3.0.23.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9091a7e7fa..07aeefd193 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.22
+VLC_VERSION = 3.0.23
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
