Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70599C4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE66A61550;
	Wed,  6 Dec 2023 20:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE66A61550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stzxsysHz7gI; Wed,  6 Dec 2023 20:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 498D260B38;
	Wed,  6 Dec 2023 20:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 498D260B38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDC081BF364
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 20:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F2D60B38
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 20:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F2D60B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScO4_h7YSB6x for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 20:41:13 +0000 (UTC)
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1842B60ACE
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 20:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1842B60ACE
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AyhirItm10L7VAyhir3EYy; Wed, 06 Dec 2023 21:41:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 21:41:04 +0100
Message-Id: <20231206204104.3703677-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI73oKwu4MM46pI9GiKI2yPeagiaJ3q/XkEb9M6Bz7yRMT899tP2BwsIx0kpxfZaj0W7WmGlgRfIioABwAtlm2wo3Gzve2NNmYxok1ktPJ2p68b8kCT3
 U0u5RjdN0eJ1oZ4pGUw5YqgNlTO55fZJbgnyGJFIeyFOSp3zJrkFyaLwR6Pf4IzOiva21iIkKtB0H9tYNxD1U8Jaar4GagPcEQcJtavbnaNo7oZa3zTBoz13
 g02iyWlA0KRPYZAJ6s8/yhM8BCHBkB1o5Uwkxul7tLk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701895270; bh=7ueRbPIkhhU4cnPGvNvgS3pnSy3p4cWZWT0nqbdIA4k=;
 h=From:To:Subject:Date:MIME-Version;
 b=e2tGQm49PzVrZBSZTVo0dwatajqVKrzGBCqfOCEu4/QcwePsOwKWgHC415R1celta
 Rp59XYFB84N8U5w46BfHIY21EZuYOoeilVRkqKSyVuoqrp6+0JUnmYanibOyiqhR4U
 9ryslANH2DJeTtSsKKqoYumcU01pCkCRVkLCvwCI2KiusLY9P+V9g+JAxwSr2m2jks
 6XOioCjTNxQOmW8cGAK02jI8Y+QNjGx3N/U2upkyRHgTKlKQog3Nvl/hZk4eihTClg
 G9WD0UjoiCowegEjYcLZKI1sfHS/DPXKoyyi6PBK32dIDUsG7a8iOfAF77FhLIMRcc
 advxCCEu//x6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=e2tGQm49
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2023-12-04 version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index bc3b8fc727..66efdaf771 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  d0db523f256795d8f3284fa2ec03855f231747ede8337e878bc096325b965654  rtl8723bu-92c19318cb54ef96c2cfb4a22b2c98eb512812d8.tar.gz
+sha256  a36511894a612a9a05254e5938dafcc32b5ca46b8912582ccca84708e0f82cf9  rtl8723bu-49cb04d796d44debe965c1597f397f34ae277dbc.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index ad9bb9a462..7796def113 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 92c19318cb54ef96c2cfb4a22b2c98eb512812d8
+RTL8723BU_VERSION = 49cb04d796d44debe965c1597f397f34ae277dbc
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
