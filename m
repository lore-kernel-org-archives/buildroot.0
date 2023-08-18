Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FF0C001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 06:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F2CC40490;
	Fri, 18 Aug 2023 06:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F2CC40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3o5hEndPzuH; Fri, 18 Aug 2023 06:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751F7403A2;
	Fri, 18 Aug 2023 06:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751F7403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A87351BF2B4
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 06:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E37D60E5B
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 06:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E37D60E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31ZRUZvfFC-2 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 06:35:25 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6C4C60E39
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 06:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6C4C60E39
X-Virus-Scanned: by amavisd-new using ClamAV (2)
Received: from bartekk-pc.lan (ip-194.4.61.77.edial.pl [194.4.61.77])
 by server220076.nazwa.pl (Postfix) with ESMTP id A64C11BC35B;
 Fri, 18 Aug 2023 08:35:22 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 08:35:21 +0200
Message-ID: <20230818063521.6191-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/host-gdb: disable source-highlight
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the follow-up commit to the 4de60e4 which disables
sourcehighlight dependency for the target GDB package.
Do the same for the host variant to be sure that this
won't be picked up from the host system.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/gdb/gdb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index cee7b37bcd..d9bfb39a41 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -255,7 +255,8 @@ HOST_GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--with-curses \
 	--without-mpfr \
-	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
+	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
+	--disable-source-highlight
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
 HOST_GDB_CONF_OPTS += --enable-tui
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
