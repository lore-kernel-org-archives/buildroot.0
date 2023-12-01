Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEFFC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F25FD437C2;
	Fri,  1 Dec 2023 20:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F25FD437C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxjrZaZL5Etz; Fri,  1 Dec 2023 20:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C300E437B8;
	Fri,  1 Dec 2023 20:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C300E437B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7982A1BF997
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 532074211D
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532074211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ryjdZPz58Dt for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EFBF42118
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EFBF42118
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F3908774C; Fri,  1 Dec 2023 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:10:37 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: edac24ca2b045a0c2b515d1ae33c91c9a66a8c37
X-Git-Newrev: a6067ffa3492c13ca3d72522422c9b12d2f8eb2c
X-Patchwork-Hint: ignore
Message-Id: <20231201201359.6F3908774C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/zfs: bump version
 to 2.2.2
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
Content-Type: multipart/mixed; boundary="===============8895170522806270013=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8895170522806270013==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a6067ffa3492c13ca3d72522422c9b12d2f8eb2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This release contains an important fix for a data corruption
bug. Full details are in the issue [1] and bug fix [2].

1. https://github.com/openzfs/zfs/issues/15526
2. https://github.com/openzfs/zfs/pull/15571

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c068fc4fa08051653229455dde0034427113a577)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index b02c49234a..01c86f2bd6 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  42035fd059faa25a09cd511b24a57b8ad1285cb69127f2a0043b98562c5ec690  zfs-2.2.0.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.2.2/zfs-2.2.2.sha256.asc
+sha256  76bc0547d9ba31d4b0142e417aaaf9f969072c3cb3c1a5b10c8738f39ed12fc9  zfs-2.2.2.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index c044a10f41..4aa165fd4c 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.2.0
+ZFS_VERSION = 2.2.2
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT

--===============8895170522806270013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8895170522806270013==--
