Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD33C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE4361241
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DE4361241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2939340166;
	Tue,  9 Nov 2021 22:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjG002PURCv1; Tue,  9 Nov 2021 22:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34352401B1;
	Tue,  9 Nov 2021 22:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04B621BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C33E2401B1
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFLz3mNYka6V for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5026403BD
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3CF0A8B82A; Tue,  9 Nov 2021 22:15:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 23:04:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 828daae9085c94414170fa037ab6e6a224a4ea0c
X-Git-Newrev: c89e0cd92288f3be352aae449ec42eee9f53bbfd
X-Patchwork-Hint: ignore
Message-Id: <20211109221516.3CF0A8B82A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: drop tidal option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c89e0cd92288f3be352aae449ec42eee9f53bbfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tidal option has been removed from mpd since version 0.22.10 and
https://github.com/MusicPlayerDaemon/MPD/commit/97c43954e8df3f772899cda951ad5a7dd4a24f25
resulting in the following build failure since bump of meson to version
0.60.1 in commit 78d3f2ea03dfba07a73fe0405c2aa4778f063ce3:

../output-1/build/mpd-0.22.11/meson.build:1:0: ERROR: Unknown options: "tidal"

Fixes:
 - http://autobuild.buildroot.org/results/b8c5879a02078f4962088dff5ae2ede1f0e6b805

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy      | 6 ++++++
 package/mpd/Config.in | 7 -------
 package/mpd/mpd.mk    | 7 -------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 40011a1890..5b48566f68 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -162,6 +162,12 @@ config BR2_OPENJDK_VERSION_LATEST
 	  OpenJDK 16.x is no longer mainted, so the option has been
 	  removed. Use OpenJDK 17.x instead.
 
+config BR2_PACKAGE_MPD_TIDAL
+	bool "mpd tidal option removed"
+	select BR2_LEGACY
+	help
+	  tidal has been removed from mpd since version 0.22.10.
+
 config BR2_PACKAGE_MROUTED_RSRR
 	bool "RSRR for RSVP removed in mrouted v4.4"
 	select BR2_LEGACY
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 7a2597558b..5e49e69442 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -58,13 +58,6 @@ config BR2_PACKAGE_MPD_SOUNDCLOUD
 	help
 	  Enable soundcloud.com playlist support.
 
-config BR2_PACKAGE_MPD_TIDAL
-	bool "tidal"
-	select BR2_PACKAGE_MPD_CURL
-	select BR2_PACKAGE_YAJL
-	help
-	  Play songs from the commercial streaming service TIDAL.
-
 comment "Converter plugins"
 
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index fe6b8d539b..e105352b80 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -277,13 +277,6 @@ ifneq ($(BR2_PACKAGE_MPD_TCP),y)
 MPD_CONF_OPTS += -Dtcp=true
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_TIDAL),y)
-MPD_DEPENDENCIES += yajl
-MPD_CONF_OPTS += -Dtidal=enabled
-else
-MPD_CONF_OPTS += -Dtidal=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
 MPD_DEPENDENCIES += tremor
 MPD_CONF_OPTS += -Dtremor=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
