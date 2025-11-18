Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FB1CF2561
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 22:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B236284702;
	Tue, 18 Nov 2025 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyVVrsEM4PmA; Tue, 18 Nov 2025 22:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70AE84707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70AE84707;
	Tue, 18 Nov 2025 22:03:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 480EE37D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EBEC41B95
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEK0Y-1HAU22 for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 22:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700C641B8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 700C641B8B
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 22:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A07D82695; Tue, 18 Nov 2025 22:03:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 22:13:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2549e2b4feb2555d8e9e4c011c296f6fa87d9a89
X-Git-Newrev: 6ff1bd328a0c835ee802567d3e30af882ea8bc58
X-Patchwork-Hint: ignore
Message-Id: <20251118220334.5A07D82695@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.3.5
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
Content-Type: multipart/mixed; boundary="===============6403308000751712695=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6403308000751712695==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ff1bd328a0c835ee802567d3e30af882ea8bc58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.3.5

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 0f309155ae..6ebcfb7a3d 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.4/zfs-2.3.4.sha256.asc
-sha256  9ec397cf360133161a1180035f3e7d6962186ed2b3457953a28d45aa883fa495  zfs-2.3.4.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.5/zfs-2.3.5.sha256.asc
+sha256  326ae0cba8a615afa42c6891640e76acc4bd230f6d6ddec120c11e30b1392067  zfs-2.3.5.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index a48f89922b..712f2afb54 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.4
+ZFS_VERSION = 2.3.5
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============6403308000751712695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6403308000751712695==--
