Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DB1C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C948233D;
	Thu, 21 Mar 2024 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nl1FyzH_l58F; Thu, 21 Mar 2024 21:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCB68233A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCB68233A;
	Thu, 21 Mar 2024 21:03:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24D411BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79DD6400C1
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKIxLz4dRWIb for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD52E409C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD52E409C4
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EBBA836A8; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:51:05 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 79428d7ff3da405a2fd91476764435a210dd0645
X-Git-Newrev: 3c80acd0576cd7968549ebf5cbc17c7a6cb53e3c
X-Patchwork-Hint: ignore
Message-Id: <20240321210221.9EBBA836A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libnfs: fix
 pthread option
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c80acd0576cd7968549ebf5cbc17c7a6cb53e3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix typo added by commit f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6

Fixes: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9a5160ed5abded9d2b843a2422a48d4964cff42e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnfs/libnfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index eb919406f3..e5e302a4f8 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -17,9 +17,9 @@ LIBNFS_DEPENDENCIES += libtirpc
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBNFS_CONF_OPTS += --enable-threads
+LIBNFS_CONF_OPTS += --enable-pthread
 else
-LIBNFS_CONF_OPTS += --disable-threads
+LIBNFS_CONF_OPTS += --disable-pthread
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
