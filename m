Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57753C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 15:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BDF81F96;
	Wed,  7 Dec 2022 15:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01BDF81F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n1S03Am8Wpv; Wed,  7 Dec 2022 15:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 401A981F8D;
	Wed,  7 Dec 2022 15:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 401A981F8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1F01BF40E
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55DFA418A9
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 15:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DFA418A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwUE4Kpv7G15 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 15:09:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9870A418B3
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9870A418B3
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 15:09:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2w2hp2fvz5IbG2w2iplOrw; Wed, 07 Dec 2022 16:09:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  7 Dec 2022 16:09:03 +0100
Message-Id: <20221207150903.4053514-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfODV3SwUgdg4vAAKHGbnsTdie8XsfItlV2okck44IAVtPeBkqfwHShD9VYofUo8eALLXKnruSy8SnSsWlZaBUHMMvPSkugS9UVC8Zel5Q4+ZAHJO5fdx
 YDjzj5oFJnsuPQutIWSuUpkPhQTupxPXCSxhPW1DEAZiNAgPR3PVqhLEG6MM6kVcLvw25tviOu5tcq6U8EIn0J8AhpNtVvW+WyRuu8kQgtxyh4EUiKEN38+6
 gFHWW/iGBYIDuR0bYMzMHkYIIK1sJvIkU6LM8igY3PE0dwl9dYUBPJ4epZVyDkqDELZuW6WoE3dK/tJFApKQNg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670425744; bh=qduzDl0OAsokoJLUrku24/Fidwc0XWbzygF6m4nlEiM=;
 h=From:To:Subject:Date:MIME-Version;
 b=DJlEPQ53UGiKZQ576h+a/Xt5WCArWYCK7Sek7Yr3rsDrbGxpjtiFwj+J+yVqLk+sS
 2fIy1m31scERN+KO2I0K7kmVzQdYIkOw0tDGaflGnGXTxKder4ybgrzdZP+12M8zl3
 aoUvKsYtsArOTpd3WGtf9DNRY9XsUjwsOgkGvmJK6KtqB6dq0eDZQXwO5ll2tpHT41
 hTuNGESZtTP5rfcCEYtYZl1xFHwwRwEoIaPMbpjfkRdN5N+3ndAF+kHpED9M0mYWqx
 N78ZEcz3xkFQ6NjqdN473SbEvUeuzb8zqPY3OlHLfP+abLxUhs4BKl0B89LMsyfDbv
 2ZMnNMXyUkD8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DJlEPQ53
Subject: [Buildroot] [PATCH] package/rtl8189es: disable -Werror to fix build
 failure
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/349893c66fcfbbf0e0e10285299581894254c941/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 6b0673019c..c89849b1dc 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -11,7 +11,8 @@ RTL8189ES_LICENSE = GPL-2.0
 RTL8189ES_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189ES=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-Wno-error"
 
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
