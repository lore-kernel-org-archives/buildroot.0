Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D126AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 15:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4412843F3;
	Sat,  8 Jun 2024 15:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwBTIFojjnGD; Sat,  8 Jun 2024 15:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4095A84441
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4095A84441;
	Sat,  8 Jun 2024 15:30:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5991BF417
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE8F84319
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKxuXbwFmfC3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C63418436D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C63418436D
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD8FB856C3; Sat,  8 Jun 2024 15:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 17:28:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 135d6d198e284e9b2b8316948819b2699beebed7
X-Git-Newrev: f5a4cc44ac1b45cdad3d88cce6836d4bbfd0fe93
X-Patchwork-Hint: ignore
Message-Id: <20240608152958.BD8FB856C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zfs: bump version
 to 2.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5a4cc44ac1b45cdad3d88cce6836d4bbfd0fe93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5746b8b37148f553a5b907735e9f3237cb682ed9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 01c86f2bd6..9c8d4cec85 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha256.asc
-sha256  76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9  zfs-2.2.2.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.sha256.asc
+sha256  9790905f7683d41759418e1ef3432828c31116654ff040e91356ff1c21c31ec0  zfs-2.2.4.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 59cdd31942..fa6d282f8c 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.2.2
+ZFS_VERSION = 2.2.4
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
