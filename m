Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA7FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 878B140569;
	Sun, 11 Dec 2022 20:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 878B140569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48SQJxczH6mN; Sun, 11 Dec 2022 20:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD5E940530;
	Sun, 11 Dec 2022 20:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5E940530
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFB7F1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9E0E4087E
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E0E4087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_bH1XGz3ZOw for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:22:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB48E40861
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB48E40861
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 955C7865AB; Sun, 11 Dec 2022 20:22:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:21:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ba57676c52a41f9f2efa311f101eb637c39897b
X-Git-Newrev: 54fc7aa2be7adc170d30f6f0ec64e34951e52ddd
X-Patchwork-Hint: ignore
Message-Id: <20221211202218.955C7865AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=54fc7aa2be7adc170d30f6f0ec64e34951e52ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mostly fixes for build and runtime failures; no new features.

Standard directory for default database and cache changed from ~/.cache to
~/.cache/mpd.

Full change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.11/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index fca0ee8539..8c488d0357 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  2becaba980402e8dc7972ccc3476e493b7ae2eeb720d31fa6712472ed48e9f2d  mpd-0.23.9.tar.xz
+sha256  edb4e7a8f9dff238b5610f9e2461940ea98c727a5462fafb1cdf836304dfdca9  mpd-0.23.11.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 5c15953984..449600eda2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).9
+MPD_VERSION = $(MPD_VERSION_MAJOR).11
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
