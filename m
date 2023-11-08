Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05786C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 07:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC66940642;
	Wed,  8 Nov 2023 07:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC66940642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNyMcFpX84Z5; Wed,  8 Nov 2023 07:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E86E4074E;
	Wed,  8 Nov 2023 07:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E86E4074E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4361BF424
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6618A60759
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6618A60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Scqf16xbZzjc for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 07:07:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E36E60008
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 07:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E36E60008
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DAF886C6E; Wed,  8 Nov 2023 07:07:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 08:05:06 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 2b7b49c0652f4da88e43c925d635b15d4103247b
X-Git-Newrev: 8de47d6babe3edd1a40ce650e4f5cc6a006013d8
X-Patchwork-Hint: ignore
Message-Id: <20231108070746.7DAF886C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mpd: update to
 version 0.23.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=8de47d6babe3edd1a40ce650e4f5cc6a006013d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 27fc59029f1f813f2a11e95cfcdccf14562cef51)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
