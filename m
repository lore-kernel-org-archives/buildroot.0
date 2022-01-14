Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51204C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA57D40223;
	Fri, 14 Jan 2022 16:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oO4KDEmj15b4; Fri, 14 Jan 2022 16:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0608140176;
	Fri, 14 Jan 2022 16:56:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4022E1BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F1240176
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y7v-d-E1Gk34 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 449E9400F3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 120818356B; Fri, 14 Jan 2022 16:50:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:51:28 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3b950f813282b65de014ea3042c569500eee3687
X-Git-Newrev: 4fea34dddc967e7fc3377dee8f17bd32615a1523
X-Patchwork-Hint: ignore
Message-Id: <20220114165012.120818356B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/grpc: add missing
 licenses
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fea34dddc967e7fc3377dee8f17bd32615a1523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Some of the third party code is BSD-licensed. In addition, the roots.pem
certificate store is MPL-licensed.

This was probably already the case in earlier versions as well, but it
was only noticed while updating to 1.42.0 because the LICENSE file was
adapted for it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 50c4fd9363c1e7ee864e3892e7c066ce4b38fdd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/grpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 1bb4bd2b98..110e5e640a 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -6,7 +6,7 @@
 
 GRPC_VERSION = 1.41.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
-GRPC_LICENSE = Apache-2.0
+GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
 GRPC_CPE_ID_VENDOR = grpc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
