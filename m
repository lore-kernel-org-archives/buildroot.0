Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFADC5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 08:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B7C880EEA;
	Sat, 15 Aug 2026 08:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLHhhpeSGHtg; Sat, 15 Aug 2026 08:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C09980EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786784210;
	bh=2Ttq+QNhTGqFkESY20mi2EwePnzvgoYcdl64gzM9r64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2XCeaoQUavipRGrNSKvXt1EjJnsi7KxZtjJle3zRGy/CBFYW0G4EhF0Z3CrPa1rl
	 6FW+BlNT0ox0anQIRHFZtz+YliJa+/Ia3nG/RGAeRwAw87liKXxtvQKl5Lxi3gEK+t
	 3gNeu4zdKMUmS0o5JNFR/hUZza3RdJIJF3wVloA7A+fYfnJntDWUG380XPTXv/yMUU
	 KY4p44k30/dO0H7718kgg8oYNW85KFUXPXSpDqUSWDDJ1v+jKjXGXhttJvFIOG+BjJ
	 uZElj0Jo3fUKbhEKqjceg1jxZkdZc1onfLvdrKM6MBzXfXxj7w0jgBOuLeemz4KlUn
	 /BUgomO590EsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C09980EBA;
	Sat, 15 Aug 2026 08:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37AA4194
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 08:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29BEA4005A
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 08:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvzS-1r-oKbj for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 08:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85FA4004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D85FA4004E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 08:56:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66CE688460; Sat, 15 Aug 2026 08:55:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 10:27:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4146368857526dea1255355ea9beff81aaa42d09
X-Git-Newrev: 2722eb1216697dd1f36fb2879a6fa1c0dca551fb
X-Patchwork-Hint: ignore
Message-Id: <20260815085556.66CE688460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: security bump to version
 3.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2722eb1216697dd1f36fb2879a6fa1c0dca551fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.samba.org/pub/rsync/NEWS#3.5.0

Fixes CVE-2026-53802, CVE-2026-53803, CVE-2026-53785, CVE-2026-53784,
CVE-2026-53793, CVE-2026-53795, CVE-2026-53796, CVE-2026-53797,
CVE-2026-53799, CVE-2026-53800, CVE-2026-53801, CVE-2026-53783,
CVE-2026-53786, CVE-2026-53798, CVE-2026-53788, CVE-2026-53789,
CVE-2026-53791, CVE-2026-53790, CVE-2026-53792, CVE-2026-53794,
CVE-2026-70461, CVE-2026-70458, CVE-2026-70456, CVE-2026-70457,
CVE-2026-70459, CVE-2026-70464, CVE-2026-70455, CVE-2026-70453,
CVE-2026-70452, CVE-2026-70463, CVE-2026-70460, CVE-2026-70462 &
CVE-2026-70454.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 2deaed0674..84cdaf680b 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
-sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.5.0.tar.gz.asc
+sha256  c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33  rsync-3.5.0.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5dd89a82d2..391659a33d 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.4
+RSYNC_VERSION = 3.5.0
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
