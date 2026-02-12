Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE666EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37A384797;
	Fri, 13 Feb 2026 19:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D35xsUkVfVRn; Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59FEF847A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011498;
	bh=jX4lTIYWV+Pf0DuEGJCwFMKXtDkfxUXX5r8mONy4nAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n2m/s0uM+ZnG+ewfLjiUTOFRtNTOMr0tFYjdpJ7a+1EiWdnh9L231jYHQjZKEGGl4
	 fri7eGfoJ4r0r7j/ONU+djUHYDjhsOaepotwz8WiGM0GIkuJKoRtKHYTD5qDKD1K68
	 Bn4Jzjmh38TegnAYSloEvr1X7gzDH6sSZcE2FoHrycd2d1DZyjm4TIm1A2ccUIn3UB
	 0DpoL9GE5ybEKKu9C0/B0TB08yiXfi4bGUzm/vblWdBhlMdd56O9kv1KZ5ouubUACR
	 mRk2v9EHTXwKh1Nztf7YFmRuOxLg+3PoOuCMCe0OK+TVPz44vHkvFJQg98RGHCoL+z
	 Wrh7+7WR5pvRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59FEF847A1;
	Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F34EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F12413F6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7GHzXxwx77P for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C8D41300
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C8D41300
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F1C582A80; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:56:15 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 41fbe94c7073973d1d0ee1c9ca6390e16921fbf3
X-Git-Newrev: faa3db1e32b48d2b2950c346821f46572f45ffd6
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.2F1C582A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mpg123: add sdl2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/faa3db1e32b48d2b2950c346821f46572f45ffd6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
index 5e55d33b72..5e5ca579ac 100644
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
