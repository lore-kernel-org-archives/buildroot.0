Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA3AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06FFE60B74;
	Tue, 29 Nov 2022 16:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06FFE60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00WKFtRyScVL; Tue, 29 Nov 2022 16:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4181060FBD;
	Tue, 29 Nov 2022 16:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4181060FBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16A5A1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B2E404B9
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 16:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5B2E404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCrx1p6kW08y for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 16:40:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 668834015A
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 668834015A
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 16:40:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 03eepsQ7OwXp503eepE3gO; Tue, 29 Nov 2022 17:40:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 17:40:19 +0100
Message-Id: <20221129164019.546521-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAm9e7qYtdcB/YKsNmcNlVUf0NYyE1PUmR1Z03nINqlsG9N0fqxIucTBjnYH7Ge90n5zhCkaoWJuxhtCXdT7vgmFr6RzBtGH9hB+Vr3nXza5wlAGYrWb
 SWD/+hhHkdH4GdyJ5bNGuYPpXGNZsLu0DYNguoHf0Dqtwq6llLJcyyM3wdzf5iCjSoWIeDXOJK0YYQcvxwuHMRNoqZG/yXgD1ndUize4DZVZJSDys4BboqVs
 Z7/viV1ubeExtcgPdgqzwvajNJDrTrln0gQjnCnIc2nA0YiPV60Ln8ukHtN91q8hxxQw/NdetWmR58dQhcsmIw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669740020; bh=J6VP/jeC5x0tWKkql0Q6SAmLdcyJX8DOqa4cYPesOl4=;
 h=From:To:Subject:Date:MIME-Version;
 b=ieUPQOrkFf8H8ZjDSjeE1mXGm9nyL/kvAwA/l/JfrBhAPdGgbqkSOgcicTyEqpeNU
 H18ztCexDF8SUeWpZUTbzfuyQrOGtBvcUFO54NFq8M5rQZEh3OSugbbiLqXXZwU0fH
 r6MyBWDYi6nbGr4uZXLTjQpX2StU25PSlh3MP9rDn32XqUlXC044gJDzttZxA6Qqo8
 NzRAxhha6VQBxk35qabkG0V42XwqBJ0psvE+1nwyimMgQ00ZfYzEEtkZ2pAUwBacC4
 iNcqN/C+YcRGn28DFmdI6HvoER9G1Z8LIHkfY6DDqjCZAaW3kY1jNXZnTtlnuvjm8k
 cm8BTr/Fi741g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ieUPQOrk
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to latest version
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

Fixes:
http://autobuild.buildroot.net/results/4526cb70ce91bcd5fce60ebb4f704a63f1ecd249/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index a5d0c2d5d4..b19cb93bf6 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  302f37098c3ae018eebf8ca80bcd2ec8ffc46755daed811278321d0914758f41  rtl8821au-e0b443940471c166a5cc6280d3608f95228e017f.tar.gz
+sha256  9dfb2b12c52fe759e4978cbd7a0fb90f0605ae9146a6d0186f2869bbfb6d13fd  rtl8821au-0cab870ff635ba038705ab29363b0cbbedd5c258.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 65c0bc913d..6bb77de81f 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = e0b443940471c166a5cc6280d3608f95228e017f
+RTL8821AU_VERSION = 0cab870ff635ba038705ab29363b0cbbedd5c258
 RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
