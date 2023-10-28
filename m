Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392E4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6BE54177E;
	Sat, 28 Oct 2023 19:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6BE54177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdN1mOwDoZ8i; Sat, 28 Oct 2023 19:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 094B8416E7;
	Sat, 28 Oct 2023 19:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 094B8416E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09AF41BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCEA142275
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEA142275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXLlxw6DqzuB for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF4FF42115
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4FF42115
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F9A85EFC; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:30:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2a590750f5bedcee48ce7beb8f35356b42eda11
X-Git-Newrev: 99d525028f969220719a4e6bcd694f7d9cfd5b67
X-Patchwork-Hint: ignore
Message-Id: <20231028193446.D4F9A85EFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aufs-util: use HTTPS for
 git.code.sf.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d525028f969220719a4e6bcd694f7d9cfd5b67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git.code.sf.net is available over HTTPS, so use that for security and
consistency with the other packages.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
