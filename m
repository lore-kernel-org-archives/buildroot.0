Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DEDF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77EC740BEA;
	Mon, 23 Mar 2026 19:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiI2sLjS3TR6; Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CD4440BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295255;
	bh=0Nirvta+Oa+F/SP0U1j+68d3tD0lQ66/gwU7G9Xh678=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hSsMPhg0OPLO3P61v+5jbTUgCrzRvGH5KOGKT7DnKq17i2ObpCe6FQp6vvJNuO9YM
	 r6FUxhYvyFudVNMCLFNHxWxGeNkUlhd/5PD3PBnsXu59izf7xCLuk4//NCRktY3YlA
	 9Ppiuudgy68UR9qtX9kHZAPEvQ/sV2QzTnL6R5jW1+qDoHHv8V1jOqdkiUvs2FEG6e
	 58YiWAxcKEc1pBjQg7bnUXUK7CHPfbCQVoYxNpcn993s7jg4mfD6Aq9B7sYmZqF4eE
	 HaH8iSJgFLOSbFq6etkzrze/6ZDDR6xBfatvpnR9K8GxGHPK1qSn4BtHcGW8Y5QpcL
	 pA3KKSrGjX3Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD4440BF1;
	Mon, 23 Mar 2026 19:47:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 025C3353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5817406B3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJrZg4-cnVNf for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC9B40BC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AC9B40BC2
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D498F84BD0; Mon, 23 Mar 2026 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ec9080f997ef75835d5a8bffa1dbb02629ccf094
X-Git-Newrev: b7c4b154354354035533fe0adc0f66b65dddd060
X-Patchwork-Hint: ignore
Message-Id: <20260323194713.D498F84BD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nfs-utils: bump
 version to 2.8.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7c4b154354354035533fe0adc0f66b65dddd060
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release announce:
https://lore.kernel.org/linux-nfs/fdf3631f-e924-4e4c-bd9f-db5b40a90bfe@redhat.com/

With patch [1] option nfsv41 required to be renamed to blkmapd.

[1]: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=59e85671e59f7ccbf66dcf72ce7462bf4932cc78

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e7928fef42fc190d51864c4b14df618751325167)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index fb5c03d917..9aa9151ebb 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
-sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.5/sha256sums.asc
+sha256  b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb  nfs-utils-2.8.5.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e7d82b10ba..ba87ef813e 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.4
+NFS_UTILS_VERSION = 2.8.5
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -28,7 +28,7 @@ HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqli
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
 	--disable-nfsv4 \
-	--disable-nfsv41 \
+	--disable-blkmapd \
 	--disable-gss \
 	--disable-uuid \
 	--disable-ipv6 \
@@ -50,10 +50,10 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
 	usr/sbin/fsidd usr/lib/systemd/system/fsidd.service
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
-NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
+NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-blkmapd
 NFS_UTILS_DEPENDENCIES += keyutils lvm2
 else
-NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
+NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-blkmapd
 endif
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_GSS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
