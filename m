Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5AAECD983
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B672E41237;
	Thu,  5 Feb 2026 16:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z836Mp3jRSAU; Thu,  5 Feb 2026 16:25:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FA341239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770308754;
	bh=WhRHnH7uaPcQ+567n7cga8hGuBiWrO6Y+YRuntRx3dE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LGRRxSfKryCz1TczcrtcIAtDarIYyQ8MzmBep4/IliARrh/oL/Su7L6AKcLcHh799
	 uOxUehQk4BENKPIvo2h+60HOnt2qZlAwfJe538dLXKMCVkgy53OrqRhQDNthtTWlLl
	 pEdP5sB15oAYNn/l+5+TZkrkfp8VL8ZpIfewC0Ri42a0YlVC90H1nTjfmxlE4G1NXS
	 YCY6ZKINUoSB1ZKSWpnAhf8QdwMUYqyKzA9WEAWdDVG90yPPAhovGql6qqasEf/AmO
	 8qdbTZqWTycelwRu3sSOzZsWsIhWhq5SfW7IcqT7kWRDxfDDyFMIDtSfyTfUkGOTuX
	 xQYwpak7LMw4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FA341239;
	Thu,  5 Feb 2026 16:25:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B5217A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AD6240824
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOazooOlELL5 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B2640823
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B2640823
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78ABD86A1B; Thu,  5 Feb 2026 16:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 17:19:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb0e63888bae4b79b20b9cfcfdf44cc256c532ff
X-Git-Newrev: 375ae3d82e69edcdd94738e695c592e9eb4bfdfa
X-Patchwork-Hint: ignore
Message-Id: <20260205162551.78ABD86A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.24.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/375ae3d82e69edcdd94738e695c592e9eb4bfdfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.musicpd.org/news/2026/01/mpd-0-24-8-released/
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.8/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Acked-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index afdb66324c..91995c5b4d 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  47c4f146f39a09979ca65d232063d7df566b101c5b36ca8895083f9f278b0460  mpd-0.24.7.tar.xz
+sha256  1868aded6aabe6a02a6427ef1d3856b11370612afc53d28184533db53991d2f7  mpd-0.24.8.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f54dd58cde..94decd8460 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).7
+MPD_VERSION = $(MPD_VERSION_MAJOR).8
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
