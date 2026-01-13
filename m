Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C083BD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 960A840CCE;
	Tue, 13 Jan 2026 20:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGqbOEgZTuDZ; Tue, 13 Jan 2026 20:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68BF40CDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337950;
	bh=rnGuaUbrRTyBQCtqC2/pFsOZ6FFdcB4kCnUMWTQmRUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D0KjKMjSDBFzS5NS4PzRnsHLOZnCaDKlKPemCBaoKoyA/GkanLCxc+JSSknp2v6kn
	 0LuetWh8XY+Fqmrbayf1nYlVuoESIcOfZejCkN9PmU+pa20D6yu6gjH4iJ9DqHSkEc
	 zPB3xUv4JpJnjooyaLIzpOdBizZXmz5UuenZzSDGvmCBaP6QJ5t3QoYFTTKvPMIIPb
	 QLmCS7G4373+yY5002jL9bTpUafExp524AdgxDlKdygFt+QVPZfGlRKedg4iwzMq7v
	 kc0/btWPBKLFtDsDDzxPG63x06mpkUwloNoFeAJGLbJyysmnRa32gbv2zzWNkEPeaY
	 vbW1RMhAPVQJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68BF40CDE;
	Tue, 13 Jan 2026 20:59:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F5532CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3976407A4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCsKoNYCAVm5 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE1B4075F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE1B4075F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC17B81094; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39cc6f9572a8ca154fcc333ed7f2da2bbbb27a8d
X-Git-Newrev: f65fd11d24f25e70f94803c107f3861f4f0b4446
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.CC17B81094@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-cursor: bump
 version to 0.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f65fd11d24f25e70f94803c107f3861f4f0b4446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-September/003625.html
https://lists.x.org/archives/xorg-announce/2023-October/003428.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 6 +++---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index ca316d3ce8..f105a301e5 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003230.html
-sha256  28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb  xcb-util-cursor-0.1.4.tar.xz
-sha512  d27dd59a4d7ded9994dca77774421dd9533e3ee823b880af35d3219bd7340c89fbc61d1d0fa10e2991de2cac9e6395e09497769d7b8728eedc691e76649107b1  xcb-util-cursor-0.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003625.html
+sha256  fdeb8bd127873519be5cc70dcd0d3b5d33b667877200f9925a59fdcad8f7a933  xcb-util-cursor-0.1.6.tar.xz
+sha512  5cdf2f942e3aad9662456cf6b5c2be2ff1837d73348046f6d8b72aeabf005c481a5f00ee169d9ccd18878697cb1744f0b274d0caa85955979c8e4f92d2cc3f72  xcb-util-cursor-0.1.6.tar.xz
 # Locally computed
 sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 0fb131693b..14cefede7a 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_CURSOR_VERSION = 0.1.4
+XCB_UTIL_CURSOR_VERSION = 0.1.6
 XCB_UTIL_CURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.xz
 XCB_UTIL_CURSOR_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
