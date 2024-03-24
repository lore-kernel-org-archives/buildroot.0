Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4950DC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167A4406DB;
	Sun, 24 Mar 2024 15:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBwynSdbNkYm; Sun, 24 Mar 2024 15:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570F140718
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570F140718;
	Sun, 24 Mar 2024 15:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE1B1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D2481E21
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaQsChJtp_C0 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E041181E23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E041181E23
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE4CF83AE9; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:03:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eda991ab095a1adc95d25bd85ed88669ed364e1e
X-Git-Newrev: 9efeb7e91440c20aea6cb0e07027081dbba4604d
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.CE4CF83AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: bump to version 3.0.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9efeb7e91440c20aea6cb0e07027081dbba4604d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For commit logs, see:
https://sourceforge.net/p/gnu-efi/code/ci/3.0.18/log/

This bump is motivated by riscv64 improvements.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gnu-efi/gnu-efi.hash | 6 +++---
 package/gnu-efi/gnu-efi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 7d98650991..e059da867e 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  832496719182e7d6a4b12bc7c0b534d2  gnu-efi-3.0.17.tar.bz2
-sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
+md5  0b93ad70dff96991dd87978fc4275bd1  gnu-efi-3.0.18.tar.bz2
+sha1  4f12dc4ab3e7940070c87affea17bf8a6209957a  gnu-efi-3.0.18.tar.bz2
 # Locally computed
-sha256  7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4  gnu-efi-3.0.17.tar.bz2
+sha256  7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c  gnu-efi-3.0.18.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 8b9a6aa4c6..96caaeb933 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.17
+GNU_EFI_VERSION = 3.0.18
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
