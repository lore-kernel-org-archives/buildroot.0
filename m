Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAE5EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9D2613C7;
	Fri, 13 Feb 2026 19:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0jDRbvEWiWO; Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E52F61386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011349;
	bh=XWHc/pbIDHfle/fwSUZfPLCHSwCBN4Yj+flLdxCvc1U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Txc4+Vy5rSGOW+z1PGjESW8LRSH/L/Vswqfi+MA/5ByEzjzAcUH04l78azX2PR1Ys
	 YM/ZJUNlnDa68csztBJOoD58CtUG75LEFUSE63OgMPiWJspK2PTsF7JJklh14f3Del
	 WmNBGgGertXl7p7ohzB+Y3iGWVFWCNRJ5+8TmRpCSU/bLYT0PO84WcJYRb92tLZc/P
	 EsH/DRuHwJXTZ/BZj7MpB1D3ajb23TYJH3DONmFJKi2pb/D80hULXc7hSTnm3+AJyF
	 L0GtoixDusj11scKjNJ6B+esPtWOPUtZtHpV2qM9hxyogG+7yYKcYbissVhaTW+IJ9
	 +YSf7BX1U0C3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E52F61386;
	Fri, 13 Feb 2026 19:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A64BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB3164129A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZC3e6saZBQP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C9FE403B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9FE403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01C1E818C3; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:56:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2bd9fe40609559b0a1cf66ce0ffe6f53f0555a3d
X-Git-Newrev: 6f7e4d998d0a301b68b2750e2399ed99d699753b
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.01C1E818C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpg123: add sdl2
 support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f7e4d998d0a301b68b2750e2399ed99d699753b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

mpg123 supports (and prefers) SDL2 as well for the sdl backends since 1.26.9
with:

https://github.com/madebr/mpg123/commit/792615f6512a0908081b5a2e98ca61f8677ed452

So support that here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53c2c0903dcddc364cd231648af36122c09c0b3f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpg123/mpg123.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2020fa55e8..7debbe7feb 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -64,10 +64,10 @@ MPG123_DEPENDENCIES += portaudio
 MPG123_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0`"
 endif
 
-ifeq ($(BR2_PACKAGE_SDL),y)
+ifneq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL2),)
 MPG123_AUDIO += sdl
 MPG123_CONF_OPTS += --with-default-audio=sdl
-MPG123_DEPENDENCIES += sdl
+MPG123_DEPENDENCIES += $(if $(BR2_PACKAGE_SDL2),sdl2,sdl)
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
