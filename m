Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAEBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 238B040374;
	Mon, 30 Oct 2023 17:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 238B040374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWHtpnz4NWj8; Mon, 30 Oct 2023 17:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15955403C7;
	Mon, 30 Oct 2023 17:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15955403C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4639D1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D1916080B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D1916080B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1oxsKf4GdxA for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2E660BAC
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2E660BAC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22EC3861C4; Mon, 30 Oct 2023 17:24:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:17:34 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 639b6ececb93af8b8c3d44a4f727f07e5dd96e43
X-Git-Newrev: 7aad5e1b433e4eb60a33c05474a6dcd2bffa8ce9
X-Patchwork-Hint: ignore
Message-Id: <20231030172428.22EC3861C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/aufs-util: use
 HTTPS for git.code.sf.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=7aad5e1b433e4eb60a33c05474a6dcd2bffa8ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

git.code.sf.net is available over HTTPS, so use that for security and
consistency with the other packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 99d525028f969220719a4e6bcd694f7d9cfd5b67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aufs-util/aufs-util.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
index d954f02958..32f3bca151 100644
--- a/package/aufs-util/aufs-util.mk
+++ b/package/aufs-util/aufs-util.mk
@@ -6,7 +6,7 @@
 
 # linux-headers
 AUFS_UTIL_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
-AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
+AUFS_UTIL_SITE = https://git.code.sf.net/p/aufs/aufs-util
 AUFS_UTIL_SITE_METHOD = git
 AUFS_UTIL_LICENSE = GPL-2.0
 AUFS_UTIL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
