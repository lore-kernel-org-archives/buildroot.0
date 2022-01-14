Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A96C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E260812E1;
	Fri, 14 Jan 2022 16:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EOQRR4RnhI2; Fri, 14 Jan 2022 16:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E631B812AF;
	Fri, 14 Jan 2022 16:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B37CA1BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00CE81253
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldNLfpqpFb0E for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:56:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17EAA80C04
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D74698356B; Fri, 14 Jan 2022 16:50:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:51:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 22c4abd1449880ef1557101308aec84321990371
X-Git-Newrev: 352f8567909a7fde994b4eca4366a90be7ad7d71
X-Patchwork-Hint: ignore
Message-Id: <20220114165000.D74698356B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/grpc: add missing
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

commit: https://git.buildroot.net/buildroot/commit/?id=352f8567909a7fde994b4eca4366a90be7ad7d71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index f7a704dcd1..3094a77ade 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -6,7 +6,7 @@
 
 GRPC_VERSION = 1.35.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
-GRPC_LICENSE = Apache-2.0
+GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
 GRPC_CPE_ID_VENDOR = grpc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
