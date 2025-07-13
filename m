Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C511AC83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 10:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3321F813D8;
	Sun, 13 Jul 2025 10:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtIPlnQ5v5id; Sun, 13 Jul 2025 10:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C61B81A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C61B81A73;
	Sun, 13 Jul 2025 10:31:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB3B2106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD4D440851
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRbxBHPrma6M for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 10:31:40 +0000 (UTC)
X-Greylist: delayed 87701 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 13 Jul 2025 10:31:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E905D4083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E905D4083F
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E905D4083F
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 10:31:39 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 3F25DBDE404F;
 Sun, 13 Jul 2025 12:31:35 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Andreas Ziegler <br015@umbiko.net>
Date: Sun, 13 Jul 2025 12:30:47 +0200
Message-ID: <20250713103047.1826080-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1752402695; bh=jPEKtOFqK/mzEj0StldpqKWfHJqr0I6HiJIp/Fx+hSY=;
 h=From:To:Cc:Subject:Date;
 b=aCkZLVNqx87wZnv7bmMomiC344fjXiFhkARpdXYw5YfgZB+o9Z8v/12CEZ8kDP7lP
 TNZsdMlNh4byRRXE7mkuBByVLjVMuR0QIa5uM8+f9EgtiziNW2O4cJLFsZBUsVO0iS
 +/z0jasoduMa+WfU/M6xQd8V+Faz4y16Ma/zZFKw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=aCkZLVNq
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: update version to 2.23
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/libmpdclient/libmpdclient.hash | 2 +-
 package/libmpdclient/libmpdclient.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
index 626c383402..f963421efc 100644
--- a/package/libmpdclient/libmpdclient.hash
+++ b/package/libmpdclient/libmpdclient.hash
@@ -1,5 +1,5 @@
 # Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.22.tar.xz.sig, sha256 locally computed
-sha256  eac15b82b5ba5ed0648af580221eb74657394f7fe768e966d9e9ebb27435429f  libmpdclient-2.22.tar.xz
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
