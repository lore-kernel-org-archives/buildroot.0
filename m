Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68654C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 16:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E49EF8430F;
	Thu,  1 Jun 2023 16:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E49EF8430F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6sZb5cj9CN2; Thu,  1 Jun 2023 16:36:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321F1842F7;
	Thu,  1 Jun 2023 16:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321F1842F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6D441BF589
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 16:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A267400FC
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 16:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A267400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icTXu7IM-nA8 for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 16:36:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 392B4400C8
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 392B4400C8
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 16:36:05 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout07.t-online.de (Postfix) with SMTP id 2FBF437B26
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 18:36:03 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q4lHN-0cP4UL0; Thu, 1 Jun 2023 18:36:02 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:32944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q4lHN-00066E-1z
 for buildroot@buildroot.org; Thu, 01 Jun 2023 18:36:01 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  1 Jun 2023 18:36:01 +0200
Message-Id: <20230601163601.44832-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685637362-FB7F84D3-53F29806/0/0 CLEAN NORMAL
X-TOI-MSGID: e9ad7578-1003-46b3-b73e-ccd5e5c95f78
Subject: [Buildroot] [PATCH/next 1/1] package/busybox: bump version to 1.36.1
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/busybox/busybox.hash | 4 ++--
 package/busybox/busybox.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 6d1c36906d..6eba365ecc 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.35.0.tar.bz2.sha256
-sha256  542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5  busybox-1.36.0.tar.bz2
+# From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
+sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fd4f3c17c5..eb5e7ad922 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.36.0
+BUSYBOX_VERSION = 1.36.1
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
