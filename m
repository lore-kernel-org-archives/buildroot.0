Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC712EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC2A417A3;
	Wed,  5 Jul 2023 16:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CC2A417A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkZZtnmo0uRF; Wed,  5 Jul 2023 16:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7512041799;
	Wed,  5 Jul 2023 16:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7512041799
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1790F1BF59F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E58B840529
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E58B840529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwlcPCUB9gtF for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:20:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ACC941453
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ACC941453
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:20:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E409A4C0C64;
 Wed,  5 Jul 2023 18:20:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40896)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qH5Ei-0006Mb-03;
 Wed, 05 Jul 2023 18:20:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:20:11 +0200
Message-Id: <20230705162011.1224688-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688574012;
 bh=lWQUurdIOIZ8PAKgTyw492yi3pjO6ept9kf1vam0GNQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aDFSNofzChXW0kh53y9TfMd7ZzEJvf5PjMZWmX5+9lbXpopmt8A/XT45tEWM9yXhC
 SKo+N/Q+aoUF78V+gcg2jiWSwgDXchB2BCiEJ3GgN/JlauMM4cSeGaSECjy5y4OBkh
 BNcOJyvDML+hyATyyj97MrVhbI5Ql8PpULKLytlagCFoGEGqK6CAi/MjIf3YUrwliC
 GamezkmE3yBD9+J60fG4KisoPu8iWtlyZriwv0JQoviNtahhyBLjmTGE5aNFMZueN3
 IuydSGmPUIur0MS82G4Ihh6zbJEFj3UGvf3kaGSKrMuc6nIqsqECqoMWNFu0VOPUgw
 +JXXPjAb0S7cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=aDFSNofz
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: force arm mode instead of
 Thumb mode
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:
/tmp/ccw5V2Ti.s: Assembler messages:
/tmp/ccw5V2Ti.s:2013: Error: selected processor does not support `itt gt' in Thumb mode
/tmp/ccw5V2Ti.s:2014: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2015: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2017: Error: selected processor does not support `it le' in Thumb mode
/tmp/ccw5V2Ti.s:2018: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2020: Error: selected processor does not support `it gt' in Thumb mode
/tmp/ccw5V2Ti.s:2021: Error: Thumb does not support conditional execution

Fixes:
http://autobuild.buildroot.net/results/3fc/3fc68f756cf1661673941c411c4a2477e901e361/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9d9209706a..ce285bcc60 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -554,6 +554,10 @@ FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+FFMPEG_CFLAGS += -marm
+endif
+
 FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
