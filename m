Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7262F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDF1405AA;
	Mon, 23 Mar 2026 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xznfDivaP8S8; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F27406A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295238;
	bh=iZkOKdCjFSLG75couHKkv9XMJ8C81ricLm2SQkvLA/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gKboXKPxlSPlKTYkBiqRHA1vV4wsItauUvkWuwALJn/NRPYEdOXlMpIT1yqboyPNc
	 6Iu7o/PDCZRcC9crFJF1qQ9glB1MHlpx+thWthupRif+TQGksbPcQoZwAIIZtN/GQ/
	 fSHeWH1+yDl1Y6kTvfLZ4QxQfnbHHqegKBGGAT/h8oinxpsCXtjFZGTYehyXTR2cjI
	 aVxW5HNHJ8rg0uVDzn232xc67lHx7yY0W7HVHFmjHI/OHnfVE6WJeYfzyYcwKgmBr7
	 zl2VyVGxWmaiErEB6bw0/fPo9U9OCRdZKJK+c2aFPdCbGg/+i5DSxMyTPj/bm3b4Yn
	 S54hluVUfQMDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F27406A8;
	Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A28353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD2BE81CEF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCCfS84mrSQJ for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A5F381546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A5F381546
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C403084BCC; Mon, 23 Mar 2026 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:48 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 041e9d289ebaf14d7a7a4f60da9c97e3d78c4cca
X-Git-Newrev: ec9080f997ef75835d5a8bffa1dbb02629ccf094
X-Patchwork-Hint: ignore
Message-Id: <20260323194713.C403084BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nfs-utils: bump
 version to 2.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec9080f997ef75835d5a8bffa1dbb02629ccf094
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release announce:
https://lore.kernel.org/linux-nfs/6f271c01-cd4b-456b-80ac-77a96b99a1fe@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 438042c6fc5f0a3ffa568867d6e4776ce2c18709)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index af5fc8bd73..fb5c03d917 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.3/sha256sums.asc
-sha256  11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725  nfs-utils-2.8.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.4/sha256sums.asc
+sha256  11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5  nfs-utils-2.8.4.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 0af0254d3f..e7d82b10ba 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.3
+NFS_UTILS_VERSION = 2.8.4
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
