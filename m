Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB1EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 09:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EB960864;
	Sun,  9 Jul 2023 09:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16EB960864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNAzKzRM3qgV; Sun,  9 Jul 2023 09:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D3960AC1;
	Sun,  9 Jul 2023 09:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D3960AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 283AF1BF57F
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F17414D1
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 09:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F17414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldPNcKBEHM7x for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 09:51:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B852E414CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B852E414CD
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 09:51:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0DFFA4C0A7B;
 Sun,  9 Jul 2023 11:50:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60236)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIR4E-0006nw-1t;
 Sun, 09 Jul 2023 11:50:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 11:50:58 +0200
Message-Id: <20230709095058.1547133-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709095058.1547133-1-bernd@kuhls.net>
References: <20230709095058.1547133-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688896258;
 bh=fsANk3EnCz84Qt3LyF8gfgJdBzB/Jp9s8xouJ6RpwDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5HKkIhEAIW730UOJtxWVUMOCeIGjuOk0tBkgsGjPOfAN7kLUuBWVKVQFnsGWQLkD
 6F7YR0H/qnoJHGroFtcZmcC6QDChPj+9rzpUO3uYRdZWqudaqoUXuc+9wieEHTl0VR
 8nbKhgY5gqDRCI5Nbn0g3kQngbVQ/KqqoWX/1XWeXnAOF58kdEXUCJFRzraBPuE1np
 k9zBVyAJDu2CaEDFo98BvzSiasJzUtA4G2nsbuLaA1XOmOp3yW6Pnx4runWaRKMKVB
 xadHDFl4nk06pfFDjjoorWTwk6k6PPL6WZCzYxyCBkp5RJebL0m2XTdLSblutDm7cd
 Xxka7gsvqMqsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=R5HKkIhE
Subject: [Buildroot] [PATCH 2/2] package/fwts: bump version to 23.07.00
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
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes

Updated license hash due to copyright year bump and formatting changes:
https://git.launchpad.net/fwts/commit/debian/copyright?id=64d2ea181d887d877104cd08defbd3427015070a
https://git.launchpad.net/fwts/commit/debian/copyright?id=88edd4da5885e182a339c57c4d70768f6fab695b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 612bc768dd..8525d47ecb 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  fee1c323fb9725c2b99c348c434d63196391cad66566d34b42707e55d14d7f25  fwts-V22.09.00.tar.gz
+sha256  a15e11c42856e9dfcf7ac23ed370618d2777eb996dd7843accf12d45b21b551c  fwts-V23.07.00.tar.gz
 
 # Hash for license file
-sha256  fbbea748555635dd8c7e6e2f99cddd778f5ee3f9e3510775183bf9799076e5e5  debian/copyright
+sha256  b9e44b1f9f65178e037a59a31b051b51dbd6a531d27c8775d3438a6ce53fc874  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 3af54a1afd..f06609777d 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 22.09.00
+FWTS_VERSION = 23.07.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
