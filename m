Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00DFC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DDC04075F;
	Mon, 25 Mar 2024 18:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtbIRKWXsVl4; Mon, 25 Mar 2024 18:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4400E4077D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4400E4077D;
	Mon, 25 Mar 2024 18:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150411BF955
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BF9819FC
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMDD4ygaN7iv for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5943C81975
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5943C81975
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 476D383FDF; Mon, 25 Mar 2024 18:17:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:05:40 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0cea473c1842ca3041a291a5818a94e29be95cd0
X-Git-Newrev: 69cc76cb0dcc2e0587c9f8d0a33133298f93159c
X-Patchwork-Hint: ignore
Message-Id: <20240325181756.476D383FDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libunwind: drop
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=69cc76cb0dcc2e0587c9f8d0a33133298f93159c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 67d87bf7d255cd05f84fab3e3625e073b5bfccf8 forgot to drop autoreconf

Fixes: 67d87bf7d255cd05f84fab3e3625e073b5bfccf8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4eba5e002c1e71b1d8decba101f9b8f945a9cd3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/libunwind.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 9cd587d0a3..14a7a1fcda 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -10,7 +10,6 @@ LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_CPE_ID_VENDOR = libunwind_project
-LIBUNWIND_AUTORECONF = YES
 
 LIBUNWIND_CONF_OPTS = \
 	--disable-tests \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
