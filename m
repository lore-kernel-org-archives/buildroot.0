Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB40CD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74816607A6;
	Mon, 18 May 2026 20:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0xmfa8JQ3lV; Mon, 18 May 2026 20:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5804A607C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779134479;
	bh=dru6n05b8nhi+esXB4Y3bTlJlJxcWfJpUqy9H4wSsOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d6sBaS81UrYimVbcaYsWGypH4EjFXWMd1FqhPZkWmGqFnbZ6HLraX2OYO6/haTF00
	 S/6y7vhdVLTDnmwlKP7vr0PUvUqOVs/vMa/KNyWz+TQ2QpozmErEVK7ww0PRtM9bt9
	 MmREKlQLbWR8me9C4PUlk2Fm2AICvwGlZjxTZe2g55rQAFMygTMPa8N21ho5aya54R
	 xr56WaL1PtuAHyO88LsFznlrczH/wWtjH5GzWQHiqwL+wnuuPLlicC+KruZULGppkO
	 IXGDQGnetkuii2cUFrmZH7JiEahDXmEPA2wUtbC6gSlr4D4PftiTknsv5BP4lZAtPy
	 VRcfN5m2vkfwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5804A607C0;
	Mon, 18 May 2026 20:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06796282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE59381153
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWwvtEpEQTHG for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026E181184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 026E181184
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD775866EB; Mon, 18 May 2026 20:01:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:18:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7bb6e399d9d32c4305475e5d7f68e3029f1b1d97
X-Git-Newrev: 7a5b27453fb06bd25c5c78012ae1e5bcd7e2c07e
X-Patchwork-Hint: ignore
Message-Id: <20260518200106.AD775866EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: Disable sidplay
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a5b27453fb06bd25c5c78012ae1e5bcd7e2c07e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
---
 package/mpd/mpd.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ce7c44a9a8..e60eb23cfa 100644
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
