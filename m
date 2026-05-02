Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4317ACD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 09:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0DA411C6;
	Sat,  2 May 2026 09:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBsX9BNlsD_5; Sat,  2 May 2026 09:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7AFE410D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777714853;
	bh=aGOcr6PaPZoqbdwzrN7H2DnNNQJ6gj/TVtfcEvuw1L0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d8EWSuKEVbYGM0IAlLD8i4ReNyDuv5uaib+GAnJhAfO72doWf4niI6lanUIfZnndt
	 FJdnnVgMTuJD9UNbq9zduukGkHGzzdJyX+g5F3ZxlGweiIRR0b2bLaJ5tf3aignyXO
	 hnp6VMi9BvUqzAue0UxCEwxJkwLvQW5pm9RdAWu1ng7zHNK23UtlZmg5EhC0Y7Ey27
	 ru553aS0i9Fn+wTkZ8HWxxed7QKUQ0ECHyERr9MJkKl/cn19l0FsCu45WD/jWhaHoK
	 cXy+esFrPfqcXk32g9NLaZBtXHh2DqqUR2CCBSLf8NyuNTWCQsmX+oudsVxERrKJI7
	 3TvL0XcTHO94Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7AFE410D5;
	Sat,  2 May 2026 09:40:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 871CE204
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D65040783
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id co4uuTnJhTtv for <buildroot@buildroot.org>;
 Sat,  2 May 2026 09:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB484077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DB484077F
 for <buildroot@buildroot.org>; Sat,  2 May 2026 09:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFF4B7FB56; Sat,  2 May 2026 09:40:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 11:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7653e616f96241b04586ecb4b612a219885d52dd
X-Git-Newrev: 2f9fff2234506cbe975d69ac315fdd15737ca2e2
X-Patchwork-Hint: ignore
Message-Id: <20260502094050.EFF4B7FB56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: security bump version to
 3.4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f9fff2234506cbe975d69ac315fdd15737ca2e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.samba.org/pub/rsync/NEWS#3.4.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 5feacd0663..933d330323 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.1.tar.gz.asc
-sha256  2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52  rsync-3.4.1.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
+sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e4c02a756f..3282a759c6 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.1
+RSYNC_VERSION = 3.4.2
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
