Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DC3C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 821AB40354;
	Mon, 30 Oct 2023 17:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 821AB40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiOc8f1mzx71; Mon, 30 Oct 2023 17:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79C1840383;
	Mon, 30 Oct 2023 17:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C1840383
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48EEC1BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F1214037C
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F1214037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bz7e-RprcLxH for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB1C40386
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FB1C40386
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EDB9861D9; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:17:25 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 47a5fa5cf36b1efa3ec6154e655635bf2a033a21
X-Git-Newrev: 6d91519910b879607cce8501489bdb087872b3f6
X-Patchwork-Hint: ignore
Message-Id: <20231030172538.1EDB9861D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/aufs: use HTTPS
 for git.code.sf.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d91519910b879607cce8501489bdb087872b3f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

git.code.sf.net is available over HTTPS, so use that for security and
consistency with the other packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f2a590750f5bedcee48ce7beb8f35356b42eda11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
