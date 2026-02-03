Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F41DE6E7FA
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1623D81102;
	Tue,  3 Feb 2026 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcPzOTu6SdXR; Tue,  3 Feb 2026 10:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B702581115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115478;
	bh=pa6ne0Ar8Q86+gZiwISesKfpMGmKsHtD+e2rFcHj5Mc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WS+xbmbU2x/0tdxXoVMJQ7LROpE9poXm8jOiELixiJXE+zZBXoQu2ov3cFKZbg2JM
	 s6GIG219Tyl8wXRf2OzJqJ2VKDNvKYJ1TAIWsCi4wjrLdywEnwTafj3xm3tnRKhEPU
	 mHMWtGlIsOzLxcmojM4mujH8RnwyUi4S0b1ILfXad05KRkmUurfSFlkr5/TFwnOcDN
	 tJcS73Z+9prj/fYFpQC7rK57CxRF0DXxMYCACGn41aaVmXpHTfk5p2nKq53wNO9AMy
	 7s8tGxnwcWD5BHAslCQYjOJF52EEP8jjjQLoTIl7tQkKRUp2JhoHYBf6rCKsaC7ASm
	 uQ2X0pK8j23DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B702581115;
	Tue,  3 Feb 2026 10:44:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B777CF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3C0C8144C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5iPx19eigmm for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEE383AEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFEE383AEF
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA41786616; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 11:37:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc2d04f30ddcabaa624479319f6dd54421f8767d
X-Git-Newrev: 53c2c0903dcddc364cd231648af36122c09c0b3f
X-Patchwork-Hint: ignore
Message-Id: <20260203104423.DA41786616@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: add sdl2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=53c2c0903dcddc364cd231648af36122c09c0b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpg123 supports (and prefers) SDL2 as well for the sdl backends since 1.26.9
with:

https://github.com/madebr/mpg123/commit/792615f6512a0908081b5a2e98ca61f8677ed452

So support that here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/mpg123.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2f04e0f979..23e061614d 100644
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
