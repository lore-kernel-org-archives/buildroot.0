Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB87C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B283E80B1B;
	Sun, 12 Mar 2023 09:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B283E80B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXZiqJEkGFic; Sun, 12 Mar 2023 09:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEC2813AD;
	Sun, 12 Mar 2023 09:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEC2813AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97CDE1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C914813AD
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C914813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omOCFYdjXCZp for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2428480B1B
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2428480B1B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:32:54 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout02.t-online.de (Postfix) with SMTP id 36E3E2B1F6
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 10:32:51 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.131]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pbI4P-1KEztB0; Sun, 12 Mar 2023 10:32:49 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pbI4P-0001ZT-0x
 for buildroot@buildroot.org; Sun, 12 Mar 2023 10:32:49 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:32:49 +0100
Message-Id: <20230312093249.256425-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678613569-437ECC4D-0020F2C5/0/0 CLEAN NORMAL
X-TOI-MSGID: d6fef37d-a317-4d29-b6eb-f00831503e03
Subject: [Buildroot] [PATCH 1/1] package/rsync: link with -latomic if needed
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

Fixes:
http://autobuild.buildroot.net/results/9eb9a92871622472b8f9eb3797aadd3651fc78a4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsync/rsync.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index d2fa47d39a..3fd2ef257e 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -20,6 +20,10 @@ RSYNC_CONF_OPTS = \
 	--disable-roll-simd \
 	--disable-md5-asm
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+RSYNC_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
