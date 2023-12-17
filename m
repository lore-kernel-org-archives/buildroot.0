Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C3BC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 17:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B76410BA;
	Sun, 17 Dec 2023 17:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B76410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_XOXwjW2Acf; Sun, 17 Dec 2023 17:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BDE4109F;
	Sun, 17 Dec 2023 17:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86BDE4109F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43AF91BF422
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 162ED81E4A
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162ED81E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bri2rtLqexmu for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 17:22:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B81081E49
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 17:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B81081E49
Received: from fli4l.lan.fli4l (p5b3a0598.dip0.t-ipconnect.de [91.58.5.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEE67A4C0334
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 18:22:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53262)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rEuqN-0005yG-2G
 for buildroot@buildroot.org; Sun, 17 Dec 2023 18:22:23 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 18:22:23 +0100
Message-Id: <20231217172223.1895985-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1702833743;
 bh=HPiDdeZozwnp9STsrYDjaTkWBXZjhX+FnYsN4iFN5Cs=;
 h=From:To:Subject:Date:From;
 b=tFxnnT3F1dXQoplyNCAMqa7TtzE2zOPWqGpYQoGRZNbr5PAVU9kNFwOceduUKpIB0
 lfugrof/4TiDQrA83AESPZycDHJlTdV1a0a571wbC7qQfOl42JU0Lm4QvWbb5PwHJ2
 RiyRiqDR2zSZ9ZblIp0yaKTfgvZc7ShSRVLXcFAhMFragPupJRHymTxDXpF6uFITP+
 1eB4r45mKGJVX96cWoT4em65yk8y2VUMF4pATeZ/XohzGbOaa6uBmmF4dKpLOUeGcT
 6vWXRPvUSsDg3ZWWaGwIqHXBAMtyJOHyoFKAshq5pu5V7m8FSPbSCePQcXrTUnRq/Q
 gt7qS3BUS7KfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=tFxnnT3F
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/security-release-0-4-8-10/10536

Fixes TROVE-2023-007.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dafa6d43d8..8cc8eb435f 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.9.tar.gz.sha256sum
-sha256  59bb7d8890f6131b4ce5344f3dcea5deb2182b7f4f10ff0cb4e4d81f11b2cf65  tor-0.4.8.9.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.10.tar.gz.sha256sum
+sha256  e628b4fab70edb4727715b23cf2931375a9f7685ac08f2c59ea498a178463a86  tor-0.4.8.10.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 455ba2b551..12dcf3f07c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.9
+TOR_VERSION = 0.4.8.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
