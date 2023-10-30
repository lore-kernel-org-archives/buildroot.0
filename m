Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3890DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E294036E;
	Mon, 30 Oct 2023 17:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4E294036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-ejR7qGTK-d; Mon, 30 Oct 2023 17:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76E7403E2;
	Mon, 30 Oct 2023 17:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A76E7403E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31D541BF3A0
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B7FB81971
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7FB81971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImK2hkoWmXW6 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3851881570
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3851881570
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 288F6861DA; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:17:40 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6d91519910b879607cce8501489bdb087872b3f6
X-Git-Newrev: 4c4115a45f2fb1a13154c41b5d4a4d302b08ce6f
X-Patchwork-Hint: ignore
Message-Id: <20231030172538.288F6861DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/aufs-util: use
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c4115a45f2fb1a13154c41b5d4a4d302b08ce6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
