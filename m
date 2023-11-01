Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2781EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2EC84CE9;
	Wed,  1 Nov 2023 17:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2EC84CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGLJET--lKU4; Wed,  1 Nov 2023 17:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4DCF84CC1;
	Wed,  1 Nov 2023 17:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4DCF84CC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BAE81BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 049FB70458
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049FB70458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuMHVhoItjIJ for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:47:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74F5770452
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F5770452
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59904863DF; Wed,  1 Nov 2023 17:47:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e4b479f39c15ffdf307ec8395d856680c727204
X-Git-Newrev: 27fc59029f1f813f2a11e95cfcdccf14562cef51
X-Patchwork-Hint: ignore
Message-Id: <20231101174739.59904863DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=27fc59029f1f813f2a11e95cfcdccf14562cef51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes in decoder (flac, mad), mixer (wasapi),
libfmt, systemd detection

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.14/NEWS

Tested on:
	i386 (build, run)
	x86_64 (build)
	Aarch64 (build, run)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 8683b02e3b..4ee4967556 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a96b01e6fbbb7e8ab25eb7c15d5c811c62eb19b76d143a802f51674791f1d519  mpd-0.23.13.tar.xz
+sha256  85b9a67426d528ae9fb849eb3b10faf52d4b18d22b1fd71088e6d9a388b509d2  mpd-0.23.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f03a459b8c..4dbd7a6d1d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
