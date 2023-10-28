Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E82C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A8842D5D;
	Sat, 28 Oct 2023 19:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A8842D5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvUefXo63V7o; Sat, 28 Oct 2023 19:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264834177E;
	Sat, 28 Oct 2023 19:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264834177E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE7F1BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC81E4223B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC81E4223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oy7gyKsiRE6H for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E597A420E5
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E597A420E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9C9285F05; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:30:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05296ced369bab8877efa624f3d9b4d201ba5b38
X-Git-Newrev: f2a590750f5bedcee48ce7beb8f35356b42eda11
X-Patchwork-Hint: ignore
Message-Id: <20231028193446.C9C9285F05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aufs: use HTTPS for git.code.sf.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2a590750f5bedcee48ce7beb8f35356b42eda11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git.code.sf.net is available over HTTPS, so use that for security and
consistency with the other packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/aufs/aufs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 4e95a350a0..d00e7a1a21 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -9,7 +9,7 @@ AUFS_LICENSE = GPL-2.0
 AUFS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
-AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_SITE = https://git.code.sf.net/p/aufs/aufs3-standalone
 AUFS_SITE_METHOD = git
 else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
 AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
