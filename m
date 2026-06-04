Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E539ECD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA46882039;
	Fri,  5 Jun 2026 12:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cLRP1NDlyFx; Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE5C382010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663139;
	bh=Wu75HOW2e7OgL8Kak4WkVYpJGohGQNp/bJvH7++em4o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pddLm/Tv9r82ihvJTx/LBB/Yoj2hisx9ss6jkT42aqH4aMgYoKN7kpuF6vydShew6
	 6FHZKcnvLisvxbu3BlG4cuFNnHm0cTskCaLxfRsbtb/Kire4nGUeRwQ4k0RXoOwpdU
	 0cWKL19d4EPSB68uDSNL6u6bq5P3X4tvhPNhXe1bad2SqxzvwOANe0JRc27vplEwjw
	 rlT1gv9J4MIV0p/vKZqSJe7+yZ2foE925gqmKPIJXN8Xvm25lAQv8DAahwFJR8b5im
	 u0fssFBAY2eTfvc/gWEjK1Z+0SOa4ykfhMwkR8OWhPJH8CPXQ0KlnwQOIqliGiFVJv
	 27jV9qio5O9lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5C382010;
	Fri,  5 Jun 2026 12:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F114388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8228B81ECC
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8c7VCMsFge8e for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8517881E74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8517881E74
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF42587B3F; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:44:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f55d4764f63223db159862bfdab592e5bb931924
X-Git-Newrev: 5c8f39dda82f833b95a3201a917de3c3c05838d3
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.AF42587B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: security
 bump version to 4.99.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c8f39dda82f833b95a3201a917de3c3c05838d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://seclists.org/oss-sec/2026/q2/491
https://exim.org/static/doc/security/EXIM-Security-2026-05-01.1/EXIM-Security-2026-05-01.1.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7774858c1156d6afb6ffb76b1bf5db6d20a34fdf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 745b9f0977..e95f7f5efe 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  25364f19988270d846965689dd29c662cf5de152639875d0d5352a69fd753a47  exim-4.99.2.tar.xz
+sha256  663e76d2a0d9b8fc5b373d0008e44ae044f10feb22bc9dbae8c7f21345ebfb3b  exim-4.99.3.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  e5c80a77dca642c132dda82166c919ba9f553436038b734ef66ae41666b8c9f5818e2cd6080e4c7c8b52e866f7f89d271233fb183c7e405feb15536d507098a3  exim-4.99.2.tar.xz
+sha512  7c4109f499497e2432b71ad3f3f1cac358e63b1b693a352047e6990619d7fd619d3a966ba585482c58e0b23b3fa4f385d15720c455fda29633411e35db1d2e7f  exim-4.99.3.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 7129e2ebf6..c72e25a2c4 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.2
+EXIM_VERSION = 4.99.3
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
