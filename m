Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956C1C7EE2C
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 22:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038C44010D;
	Fri,  2 Jun 2023 22:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038C44010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUW8ujK20aUx; Fri,  2 Jun 2023 22:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FCC428CA;
	Fri,  2 Jun 2023 22:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4FCC428CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67DA91BF5DD
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 419E960F3E
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 22:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419E960F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJxpQ4qe7CD1 for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 22:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8EF60EFC
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 22:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8EF60EFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5406F86BEB; Fri,  2 Jun 2023 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 00:27:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bab89b35f018a332c7d42ed6e6cb8d72fdeac4b2
X-Git-Newrev: 502dcf46af1be88a4ac5973efc9f8eb95c461bf6
X-Patchwork-Hint: ignore
Message-Id: <20230602222807.5406F86BEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=502dcf46af1be88a4ac5973efc9f8eb95c461bf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bug fixes in input, archive/zzip, database/simple, decoder,
  output/pipewire, process termination
- determine systemd unit directories via pkg-config
- support libfmt 10

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.13/NEWS

Commit:
	https://github.com/MusicPlayerDaemon/MPD/commit/9027e5c

Tested on:
	i386 (build, run)
	Aarch64 (build, run)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 2521238f64..8683b02e3b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b7fca62284ecc25a681ea6a07abc49200af5353be42cb5a31e3173be9d8702e7  mpd-0.23.12.tar.xz
+sha256  a96b01e6fbbb7e8ab25eb7c15d5c811c62eb19b76d143a802f51674791f1d519  mpd-0.23.13.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6c25c9b46f..d73072a439 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).12
+MPD_VERSION = $(MPD_VERSION_MAJOR).13
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
