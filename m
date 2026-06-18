Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3EDCD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4587A860D5;
	Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjF51cXn5Vnw; Sat, 20 Jun 2026 09:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DBB386184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946394;
	bh=+lNl5CFyV0qOIN2Aw4k9bke53BMRfKu/uOD5fEPlEb4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iMNJpNQUgHbjY2pGkryL+73kxwTcAXyp5gfqOo71t141+Nq03sfQ8RNswrnQCYZAc
	 guOr6VuLApx9PG/xujz6OSrEgnbnjU17qGbSEAtOVRr2UTExUXgEY5K0RVMT2MVAfx
	 UlZb7NcqrFMiwnhNjnnm5hP2rB33XKbLJqBBe9t2nbJ6ZyNAUkJDOLgFzo+ZDZbD/m
	 emNQDLBnfPIDco+XHJUE5HUR65Xf6GTq3fMEF07q7ylBnF2dOUxrsYFr7VYwJUh/sl
	 IOkzdOTLLZhDI4SsHmoWJuXb6XpthG7eI5oMtBHwjZLcZeGpW+D2jHzc/yzwRVAoxX
	 Gul3jxMjnnBLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DBB386184;
	Sat, 20 Jun 2026 09:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0904C367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0689D6FAB1
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4Eqzs77Qak8 for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 103B56FA13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 103B56FA13
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B4FA81E43; Sat, 20 Jun 2026 09:06:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:44:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: abd2e88f62aa688a8d147ca2f19d5cb46ee2c0a6
X-Git-Newrev: 1836d7f6abe371a63261d9d03f4f68ce7dc96a00
X-Patchwork-Hint: ignore
Message-Id: <20260620090609.0B4FA81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rsync: bump
 version to 3.4.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1836d7f6abe371a63261d9d03f4f68ce7dc96a00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Bugfix release containing a number of fixes for regressions introduced in
the 3.4.3 release.

For details, see:
https://download.samba.org/pub/rsync/NEWS#3.4.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9f7f918e06c16b8afa27526b0908c08f488aead)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 666bb5cf99..2deaed0674 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
-sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
+sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b4345d036..5dd89a82d2 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.3
+RSYNC_VERSION = 3.4.4
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
