Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C337FC83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D90404C3;
	Sun, 13 Jul 2025 11:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQQ7EMwE2IWe; Sun, 13 Jul 2025 11:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9974010A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B9974010A;
	Sun, 13 Jul 2025 11:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D014DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4357860A6C
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwRhK205BLMu for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 639C560A69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 639C560A69
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 527458648B; Sun, 13 Jul 2025 11:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 13:36:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c61d7d61b1e3fe143569938f7c63b01a24169830
X-Git-Newrev: ec477e79661235e6da30ee5c6fcb3970a0b5b789
X-Patchwork-Hint: ignore
Message-Id: <20250713114450.527458648B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmpdclient: update version to
 2.23
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec477e79661235e6da30ee5c6fcb3970a0b5b789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.23 change log:

* support MPD protocol 0.24.0
  - allow window for listplaylist and listplaylistinfo
  - command "playlistlength", "protocol", "stickertypes",
            "stickernamestypes", "searchplaylist"
  - tag "ShowMovement"
  - new sticker find api
  - new subcommands for "tagtypes": "available", "reset"
* Support open end for mpd_search_add_window
* format floating-point numbers with the POSIX localew

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Tested-by: Andreas Ziegler <br015@umbiko.net>
[Julien: update signature link in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmpdclient/libmpdclient.hash | 4 ++--
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 626c383402..849eeea344 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,5 +1,5 @@
-# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.22.tar.xz.sig, sha256 locally computed
-sha256  eac15b82b5ba5ed0648af580221eb74657394f7fe768e966d9e9ebb27435429f  libmpdclient-2.22.tar.xz
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.23.tar.xz.sig, sha256 locally computed
+sha256  4a1b6c7f783d8cac3d3b8e4cbe9ad021c45491e383de3b893ea4eedefbc71607  libmpdclient-2.23.tar.xz
 
 # Hash for license files:
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 371bc20dbf..85e42eb44d 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).22
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).23
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
