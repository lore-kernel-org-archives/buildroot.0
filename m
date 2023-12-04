Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E490C10DC1
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00B71419F1;
	Mon,  4 Dec 2023 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B71419F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZf7GCoT4WA7; Mon,  4 Dec 2023 21:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDDE6419E0;
	Mon,  4 Dec 2023 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDDE6419E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CCDF1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76B3540983
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B3540983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICPS-V-mQj_s for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:18:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 958644096D
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958644096D
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDC70A4C042A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:18:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44770)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGKg-0007TW-1o
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:18:26 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:26 +0100
Message-Id: <20231204211826.12768-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724706;
 bh=lRy/eva+LX71cW/QE7C49xO3QHPjXOrgK33BphZ82HA=;
 h=From:To:Subject:Date:From;
 b=zcJh5C7O2DtYySBLNZMjeWaWDVu89hOHMzN9OJoLi99tXZhDXLkVyeHXV/OCVgNWR
 7vwopRwdhWTFkgwqYwehqRSdZWvu7i+OsnApEpxAIIgJClMoVxrKsNVaessMaskLt5
 cebTupTQLvoZs9yn3L381tylaFH9jNGeggy2iaoRjmnvENgA0mQTwRs6SZJY02Uyus
 M0xNBAkU3GugdnovVGHg6JhPskKmZRYEJ+UCcZI3eP8XCH1uKYcpQQMfLdTWM3DDC1
 tAgG3zwk3N2hHAdacygQufM975XjgBbyOfYl8ZxmMC9fWOF8Na9BSfndbOlj9D14P1
 bZOifEyk722pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=zcJh5C7O
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.21.0
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

Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index eab24a7eab..3a54d66ce4 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  86c62eb6db83981b21ac1faac69c28fee2952cbbc207ea7476707d4f1799633f  xmrig-6.20.0.tar.gz
+sha256  4b197c71fa06030216b641b4ea57f7a3d977a17df1b55bd13759d4705dbf5941  xmrig-6.21.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 982ccc8c5d..35cd1d8d82 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.20.0
+XMRIG_VERSION = 6.21.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
