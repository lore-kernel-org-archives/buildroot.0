Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77377E784AB
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 03:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBEB60AE2;
	Mon,  2 Oct 2023 03:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBEB60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWiWbV-qR0jB; Mon,  2 Oct 2023 03:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CAA760675;
	Mon,  2 Oct 2023 03:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CAA760675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D45B1BF479
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 03:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63DD56061B
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 03:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DD56061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Icju5IUIAsN7 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 03:58:07 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAD5F60608
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 03:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD5F60608
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MGyxN-1qrEPx3v1f-00E95g for <buildroot@buildroot.org>; Mon, 02 Oct 2023
 05:58:03 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 05:57:32 +0200
Message-ID: <20231002035732.1395926-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9wdUouG1WrWxCcB6gtTyEyzkO22fsV3C4q5OZp3Goly5PLZJfg0
 FHocUCxMNnpIZ4KOlMafTX3T6PaABKCvs73m8ptFG7D39plIJKiOqrKgw9HaIcR/5ThbgGK
 wYHGiAwxK2LclF2S0/mRqjKRaEv80zN2hU97NkENfFTYnzzEPK1oGD3NLR7pJMj00o7LyCI
 GhZpD+eQ+CuxS6Dj6izkQ==
UI-OutboundReport: notjunk:1;M01:P0:pEATP/0Mo7Q=;P/lDAQMcrVHlE2JIlFCAOneT2n6
 5n1CuP7uFljT63RHWNF17nhB3fEEQKOAxlZnm0JWVqbkAf/iPHggNDZKhwm6xeOpPBIvkxhZY
 zkamlWnqigt8JGyX/76YYBb6bFHs6uCbV79IaOvSrN52mPKmwsKimsMPlJcwirBPAIqs+l8Th
 YesGdce/YLWO0m/gkslbqBFJhYiutKxdMznS5j6KigG1KUZgWqsuEgIt0MJy/FYoSq4Ba8QfP
 OOyqH6sEqsHIDpzT/WuQ7+qRTfYhFXC6/s3fP5kbjjJwsHZmGMf25dNo9RVfVZbaqIe1OdedP
 7iApuw74/XthUyBHB2Z7Q7Rxq0bIhZIn9UFsrN8DmgUXRAZGpwwOw3yTYv6h+OhV21b+THxRT
 IOMe7oTU0tls0SthkZ88qC3tdtwRNdnyI0NAHZOH8b6wTJI7pmKBFTuhNXzEDnq/ksN9PtCln
 CuWmfeV6S6wDg5Sb9mQNl219QsPyEJ+cJcjLB3zh/wswrKBih8JsejEPXJrZQ7rDhzWNNLwWl
 8o5qZGEWnrl3I10Aw34cXMUntGF9KQrl8sgMgVzB0mHSyZH7JZyl+W3mX+5wU5OQ16nJzKHU8
 4CLq4y7/RzxFSIOhqC0rjHZTpN8k6/aP78oWlsqbAZ3OsTGdt1PEf4V0SqrO+TFaQXH+o7B+U
 oSQjwkwCk4FoMtTmwyDyT5mkZKBIdYVs+LE4zG6lyuOlMN4bU7D4L19i4VcQJlU3J4XgYzUNf
 8dScDIuAvWcquEyBMZB+8gDTlV/9Y30iwZAlXtIOh8Vdo8JlogOkBJQ+iYiytY3OryXXNfpIf
 lfn3xNnVVlkRYxVxw4j+LD342VjrocUm6OsZZhbSxlpkYID9M4yQ7NZfqXyFmrye3TFT+Ubc5
 ljeHcwthwxY6XatIm1a5ymgPHBgxMsMjY9eaK4o9Y1IQAFmxStRrNutxM06ozHDj/Ga0QLkTv
 nkGbzMh/gLTU29LIsbL2pbMSfww=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696219083; x=1696823883; i=dalang@gmx.at;
 bh=UpEvOUdhd2W1lRothMePCj7yljGhsq/6YPb6iAC7FP4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=XJlXgdkqDYDb4i7BsqiTj14q3W9pwMWtDZ6cPBr3J2z5zamkLQHldxX0MSVlTtoimjEuB2IguMQ
 VE7eegGVnfFSE28/zLNG7wXu3TSoSmQ37wgz/ENd62jHhsXD1L+WmQ4h530GGkak7DpIRdtQprNU5
 lmrikQmC+2xK5i3jf6KlAOR9G4p3ebCl9vwWXYjTPf9q3BC5/ZziqzJwaNxGahncGCpbQfDYn1myA
 W1ogep1uwsoTMxmC1NjZ8bicQcMkfSi6eSpcA08wtPvYHgxGvP1KLjB/l/vcBQYaP9TnThZ1q4/lr
 mxXxhgJ4UK91/Yi8t8tQuIW+Xi5uXpLY4xuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=XJlXgdkq
Subject: [Buildroot] [PATCH] Makefile: drop gen-missing-cpe leftovers
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

In 6fa3a239 the gen-missing-cpe support script was removed together with
"make missing-cpe".
Remove the leftover path variable and drop it from "make clean".

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a12564ff96..6342470193 100644
--- a/Makefile
+++ b/Makefile
@@ -227,8 +227,6 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
-CPE_UPDATES_DIR = $(BASE_DIR)/cpe-updates
-
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -1103,8 +1101,7 @@ show-vars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR) \
-		$(O)/pkg-stats.*
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(O)/pkg-stats.*
 
 .PHONY: distclean
 distclean: clean
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
