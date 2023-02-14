Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD27C6379F
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B475540B8A;
	Tue, 14 Feb 2023 17:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B475540B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAV9Q21zrDMU; Tue, 14 Feb 2023 17:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C4340BF7;
	Tue, 14 Feb 2023 17:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C4340BF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9442B1BF95C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5CF408D4
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5CF408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwwFh4_fLtff for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E2D408C1
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E2D408C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A78785E9E; Tue, 14 Feb 2023 17:16:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:11:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e648d399d8bd609697e78f13f7fa76be06d91a57
X-Git-Newrev: 86a3bd33c2d52b2d3e014913857abaa7f24f428c
X-Patchwork-Hint: ignore
Message-Id: <20230214171654.4A78785E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.23.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=86a3bd33c2d52b2d3e014913857abaa7f24f428c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

List of changes:
	decoder::mad: fix integer underflow with very small files
	input::curl: require CURL 7.55.0 or later
	output::pipewire: adjust to PipeWire 0.3.64 API change
	tags:: fix crash bug due to race condition
	fix build failures with GCC 13

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.12/NEWS

Commit:
	https://github.com/MusicPlayerDaemon/MPD/commit/b1422fb

Tested on:
	i386 (build)
	x86_64 (build, run)
	Aarch64 (build)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 8c488d0357..2521238f64 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  edb4e7a8f9dff238b5610f9e2461940ea98c727a5462fafb1cdf836304dfdca9  mpd-0.23.11.tar.xz
+sha256  b7fca62284ecc25a681ea6a07abc49200af5353be42cb5a31e3173be9d8702e7  mpd-0.23.12.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 449600eda2..6c25c9b46f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
