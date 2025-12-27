Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC63E92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3F980AA8;
	Sat, 27 Dec 2025 18:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5U0uPt4U7CQd; Sat, 27 Dec 2025 18:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C72F80AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766860901;
	bh=fNZwqVpiWQTdOdJ0pY4hFJcynuDWEBq59bo2ssSTATU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RkFPde0ViBJhHni2LnHzCcelCEGKg6kcaV0G4YqcDnQl/twkxzaC3SFLiY/3ZmPZ/
	 ySlYuLsNFOEejynixD+kFVbwk8JZFFliqkfuV3/mnAEnSLac1qE2SrLfpFRzTG7rA2
	 qTcN76tjI2qdzzSfD+GoYDDEwH75hbd9iB3cK4yyKaIKQFBW7tXIBCin1QgWPQEHwt
	 IHAilPIV0aE+1glyzxmEkwTvX9nqH9s1jC7u5a0GY0d+3kdtkRuacHULRU9TgoM1DW
	 X4xFP05vaiRpDh2vMhQn7JN971M3yXTpTGQ4jTOZ6PkH6G/6BS4OkoFPnPOGCpRtQU
	 ei9RSm36t2W3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C72F80AAC;
	Sat, 27 Dec 2025 18:41:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46CDF30D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E36580A7A
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eZbZE2ubAtm for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE1380A76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DE1380A76
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:41:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFFFD877D2; Sat, 27 Dec 2025 18:41:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 19:21:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d582de683880df17bd80d07b4bda0a8d9b970a70
X-Git-Newrev: 5a9e80a8c9a0c9aecd8ec7a91b0d780a3aaa32cb
X-Patchwork-Hint: ignore
Message-Id: <20251227184137.EFFFD877D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.15.1
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
Content-Type: multipart/mixed; boundary="===============6805384953198401462=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6805384953198401462==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5a9e80a8c9a0c9aecd8ec7a91b0d780a3aaa32cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-lib
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#alsa-lib

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch | 7 +++----
 package/alsa-lib/alsa-lib.hash                                | 2 +-
 package/alsa-lib/alsa-lib.mk                                  | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
index 87add9ff56..5c41d79275 100644
--- a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
+++ b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
@@ -10,11 +10,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Jörg: update patch for 1.1.6]
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
 Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141376.html
-[Bernd: update patch for 1.2.4 & 1.2.7]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: update patch for 1.2.15.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
 ---
  configure.ac         |  2 ++
  src/pcm/pcm_direct.c | 10 +++++++++-
@@ -41,7 +40,7 @@ index e53e59238119..cf94c7c1dbf0 100644
  		close(dmix->server_fd);
  		return ret;
  	}
--	
+-
 +
 +#ifdef HAVE_FORK
  	ret = fork();
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 26d54b6e1b..8892ebdb0e 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32  alsa-lib-1.2.14.tar.bz2
+sha256  7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c  alsa-lib-1.2.15.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 34c1688e98..a4713edf0a 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.14
+ALSA_LIB_VERSION = 1.2.15.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)

--===============6805384953198401462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6805384953198401462==--
