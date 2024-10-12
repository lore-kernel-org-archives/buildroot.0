Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CCBCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB60A60A6B;
	Sat, 12 Oct 2024 15:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jB_W3XLi-U9; Sat, 12 Oct 2024 15:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69FE60845
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69FE60845;
	Sat, 12 Oct 2024 15:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AAF51BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89BD780C97
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLkUka7OJPIy for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F5380C73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5F5380C73
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:19:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A022685EE0; Sat, 12 Oct 2024 15:19:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:14:28 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b42f1ddcc7827d7df8e9f281539d3746beabd07b
X-Git-Newrev: 615ab9a6c150aba4081a14eb4e58e62e22308eef
X-Patchwork-Hint: ignore
Message-Id: <20241012151935.A022685EE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/pure-ftpd: bump
 version to 1.0.52
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=615ab9a6c150aba4081a14eb4e58e62e22308eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

This version fixes an out-of-bound reads in the MLSD command, so upgrading is recommended.
It also improves compatibility with various systems.

Update the COPYING hash because of a change in copyright year

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5271e90a6a2cc7633f3f917391865d2f9df54142)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 4cbbfa15ad..2c7a1849ff 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  622360b86c60b563abe0e994f0a86cfe5ccfde597b29a14b0a79b6e5aa05a304  pure-ftpd-1.0.51.tar.bz2
-sha256  88c813191c1a59213c641e322cf4562618ab0116ddd7c8341c419f8863b8b0a9  COPYING
+sha256  b3b879468275e0344555458c8e62465dcf525205ecf9ad78c3f208557d0c1947  pure-ftpd-1.0.52.tar.bz2
+sha256  1ec531b1bc4035019545d6a83e260a5a56d3a6bec52895393e9f25965e608e85  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 2c01bc8804..fb247f51ca 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.51
+PURE_FTPD_VERSION = 1.0.52
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
