Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A10C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 08:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A53E403D6;
	Sat, 10 Jun 2023 08:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A53E403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMyEBafleDEL; Sat, 10 Jun 2023 08:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B22E40114;
	Sat, 10 Jun 2023 08:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B22E40114
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4027B1BF35E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19A3060BA1
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19A3060BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kA1dGj0zbdj for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 08:54:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA3060B71
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFA3060B71
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 08:54:46 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id 36A2321E3D;
 Sat, 10 Jun 2023 10:54:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7uMt-3TlcIL0; Sat, 10 Jun 2023 10:54:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50000)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7uMt-0004Ud-1V;
 Sat, 10 Jun 2023 10:54:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 10:54:43 +0200
Message-Id: <20230610085443.3241799-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686387283-43FF1266-F390D720/0/0 CLEAN NORMAL
X-TOI-MSGID: 543a6314-043c-4d4c-87f6-d99bb1fd48cf
Subject: [Buildroot] [PATCH 1/1] package/libcap: security bump version to
 2.69
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes
- CVE-2023-2602
  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=bc6b36682f188020ee4770fae1d41bde5b2c97bb
- CVE-2023-2603
  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=422bec25ae4a1ab03fd4d6f728695ed279173b18

Updated license hash due to an upstream commit which added a SPDX header:
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=70998415a87587f31063a26a1e52c6f7806b7834

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcap/libcap.hash | 4 ++--
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 5fc8173905..0f1501d31b 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd  libcap-2.65.tar.xz
+sha256  f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb  libcap-2.69.tar.xz
 
 # Hash for license file:
-sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
+sha256  68467e731f4744bd6e0bb69e8df9c3a994e09cd6b203d0c41327ac6d079c581d  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 728a6ba6cc..c9727c75c9 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.65
+LIBCAP_VERSION = 2.69
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
