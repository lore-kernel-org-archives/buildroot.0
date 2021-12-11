Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B6BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F130440210;
	Sat, 11 Dec 2021 20:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qY0bkh7oF-82; Sat, 11 Dec 2021 20:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 276AB40173;
	Sat, 11 Dec 2021 20:54:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 346CD1BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E0C4040E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrN2KxfjJcro for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C44840605
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2C2E182964; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b89414ca8a2352d10cbc06b822874fa4529042a
X-Git-Newrev: 50c4fd9363c1e7ee864e3892e7c066ce4b38fdd4
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.2C2E182964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: add missing licenses
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

commit: https://git.buildroot.net/buildroot/commit/?id=50c4fd9363c1e7ee864e3892e7c066ce4b38fdd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some of the third party code is BSD-licensed. In addition, the roots.pem
certificate store is MPL-licensed.

This was probably already the case in earlier versions as well, but it
was only noticed while updating to 1.42.0 because the LICENSE file was
adapted for it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
