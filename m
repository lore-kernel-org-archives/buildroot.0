Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9E5CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9F6B617B1;
	Fri, 29 May 2026 21:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3YUZOkA2L3l; Fri, 29 May 2026 21:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05648617B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780088915;
	bh=s9ShGOi6whNxWdW3QGSFmWi6vm6rCHYCELc9Ejj6h48=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Btc/GMLg905FFoNNSJI2nZp048H0ult/3/y8gEj0fA0thfDh2IL48cGduBt3zlK5g
	 xX+r+s97WQyZJ/U7/eroUZOg8UbTcfZThIZBUkMU4gYjxQ5p8j8pdEivju+6V5C2qH
	 iXz7AjL9qqqnztu2CAlFZu55QhnOLe060KYcyYINoz+Xb1I2utuj0vrIt5X2rghO4b
	 imr/d6Zx5m8AEYVJsqnIYPPqhpoQe7AorVAdounIouvlLTkmdMof9ZH89mjibOJhdh
	 o1BK7uBZ7XziScf3f7EIteWct2oRTTyIKMNQTUTZ+LVFunsIN205wimc8ad4dZPzV7
	 xC5nKDScxcSug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05648617B2;
	Fri, 29 May 2026 21:08:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC60D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F13E940252
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LX-pyH5bRn5n for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5ABC40781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5ABC40781
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 035348748B; Fri, 29 May 2026 21:08:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:04:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a966f5cde5beef557fed3a271895089e62649f6b
X-Git-Newrev: 020d575bcc9c78ca47cd1ff5fb46caff472ddb36
X-Patchwork-Hint: ignore
Message-Id: <20260529210819.035348748B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: Disable sidplay support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/020d575bcc9c78ca47cd1ff5fb46caff472ddb36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 25af5a3b3aa3 ("package/mpd: update version to 0.24") from March 2025
bumped mpd to a version that dropped support for the libsidplay2 library in
favor of libsidplayfp. [1]

Since libsidplayfp is not provided by buildroot and no one has complained
yet the sidplay feature is likely unused, as enabling it breaks the build.

Drop support. If someone needs it it can be re-added along with the
dependency.

Link: https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS [1]
Cc: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7a5b27453fb06bd25c5c78012ae1e5bcd7e2c07e)

Fixes: https://autobuild.buildroot.org/results/c72d11535857a447acae806397c451b167e00b13
---
 package/mpd/mpd.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e94858897a..65cd390ff9 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -24,6 +24,7 @@ MPD_CONF_OPTS = \
 	-Dmpcdec=disabled \
 	-Dopenmpt=disabled \
 	-Dpipewire=disabled \
+	-Dsidplay=disabled \
 	-Dsnapcast=false
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
@@ -284,13 +285,6 @@ else
 MPD_CONF_OPTS += -Dshout=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
-MPD_DEPENDENCIES += libsidplay2
-MPD_CONF_OPTS += -Dsidplay=enabled
-else
-MPD_CONF_OPTS += -Dsidplay=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
 MPD_CONF_OPTS += -Dsqlite=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
