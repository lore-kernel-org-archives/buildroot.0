Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C5C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAEEB60E71;
	Tue, 13 Dec 2022 21:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEEB60E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7UYU-0TCiwA; Tue, 13 Dec 2022 21:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D5E960B1A;
	Tue, 13 Dec 2022 21:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5E960B1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD3191BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9545D60B1A
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9545D60B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rf7j7W6t_Pw3 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:13:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB0160803
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DB0160803
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:13:15 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5CaPpoviJpLT85CaQpX1of; Tue, 13 Dec 2022 22:13:14 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 22:13:13 +0100
Message-Id: <20221213211313.735422-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN2uX7vHmyQVkehIq7NGA0mnX0C3j2LadHQmQgC4/OPuoJk7WkH5n44ejmWQL8Ucmzt7aafCWdJxIfktkeilGk4MAtgRPlVqZZn3Ka1Z1EYSifVOp0mo
 tbeMSCdV/Br4o7QtV0qfwtCddT1m3yAzUTw2w319g7GIVgRiM5YpTlO38j7Z/L+pOJOUDyP+EwNaib1jQjmzg4YtWXkAwjujcztdjFbnbTyUfnd3YY5HofF/
 IhWr9YUMkXaXitH6w3vyp0lqzqdzfJ0E8kx2uKZNBAWUiY3IZHARz38vdIxNjfSlv77vXmMjOdQBrgGoVwKo1/3lzV6SJb4Qws5Bf+K9OIzI2dSescdeOF61
 B/1uzW2N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670965994; bh=A8XwKAwKgyKjNXbgkjJWiwv387weGUzhN+Y/CMP0Gk8=;
 h=From:To:Subject:Date:MIME-Version;
 b=TcGcJyVzD4UIQPdcSOcBk/l2huYc80jz8LdNAKVUmKVSdbSvSTKDvKrQVupOdDtIE
 8HirItEKcRy33gqD53Dl+H5IaEkRBZ+QSqY1i+1CXXbhlA/ByrUyXOO2eKpylPZTsO
 KBXnB7BKIlTDotEYY1BNRMPnQSMjRvYJos5QHTnFW+HQQfFsVnGzQFrtPLx9POe5jt
 jcLSF4nZNaioMo9m9nyoXJZi+30bNxdOmnwcnEJJ1cjcO155bffHl2DSavas33lV5l
 PMnl5VI8mvHwHgRqS3mFHOURdLGzCSLTioCzvETqX2P0AtFINC7R6tVHqBMe/nBKaa
 HgxQZQZLG8xiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TcGcJyVz
Subject: [Buildroot] [PATCH] package/rtl8723ds: change CFLAGS approach
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of undefine endiannes CFLAGS let's change approach.
Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
involving the endianness to be set to little. This way we can set the
CFLAGS according to architecture with some default define like:
-DCONFIG_IOCTL_CFG80211
-DRTW_USE_CFG80211_STA_EVENT
-Wno-error

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 7e27fa75ea..8a7674e5b6 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -8,12 +8,13 @@ RTL8723DS_VERSION = a638cc8639015b8b9390af3350fab0366b6c87e7
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
-# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
-RTL8723DS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
-# Set endianness
-RTL8723DS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+RTL8723DS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+			      -DCONFIG_IOCTL_CFG80211 \
+			      -DRTW_USE_CFG80211_STA_EVENT \
+			      -Wno-error
 
 RTL8723DS_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
