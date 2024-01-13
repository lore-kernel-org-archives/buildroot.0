Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B59C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 14:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634024056A;
	Sat, 13 Jan 2024 14:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634024056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrY2DnwUWutj; Sat, 13 Jan 2024 14:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9527540301;
	Sat, 13 Jan 2024 14:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9527540301
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24D741BF2AB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AA17812AF
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 14:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA17812AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSxWJXzIk9Ly for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46330812B2
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46330812B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C2A85FCF; Sat, 13 Jan 2024 14:41:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 15:01:21 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: be5dd7cdfef5f9015329b7c7e410fe7480a23f8c
X-Git-Newrev: 28949d6684f9215af1e8b8c88df235ee3d1a4960
X-Patchwork-Hint: ignore
Message-Id: <20240113144144.31C2A85FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/go: bump to
 version 1.21.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=28949d6684f9215af1e8b8c88df235ee3d1a4960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

go1.21.6 (released 2024-01-09) includes fixes to the compiler, the runtime, and
the crypto/tls, maps, and runtime/pprof packages.

https://go.dev/doc/devel/release#go1.21.6

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 22393c93267ebfc1dd40292ecbd116519bb2828f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 34822b7537..bee10089a7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19  go1.21.5.src.tar.gz
+sha256  124926a62e45f78daabbaedb9c011d97633186a33c238ffc1e25320c02046248  go1.21.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f3747b6473..f9d31aacac 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.5
+GO_VERSION = 1.21.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
