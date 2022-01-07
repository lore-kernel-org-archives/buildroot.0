Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2DDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9A5429B5;
	Fri,  7 Jan 2022 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdTpLJRUEhH5; Fri,  7 Jan 2022 17:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A411E429C4;
	Fri,  7 Jan 2022 17:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52A9F1BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F8CC400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSEIpxX-zaE3 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:55:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED2740002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:55:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E089B82B9C; Fri,  7 Jan 2022 17:49:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:55:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 170f42eb6b891e06fd500483c92a5e00f77d1dc6
X-Git-Newrev: 8b39532a1624b19ba66cadebd71cd51ef218f72f
X-Patchwork-Hint: ignore
Message-Id: <20220107174948.E089B82B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/go: security bump
 to version 1.16.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b39532a1624b19ba66cadebd71cd51ef218f72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

go1.16.11 (released 2021-12-02) includes fixes to the compiler, runtime, and the
net/http, net/http/httptest, and time packages.

go1.16.12 (released 2021-12-09) includes security fixes to the syscall and
net/http packages.

go1.16.13 (released 2022-01-06) includes fixes to the compiler, linker, runtime,
and the net/http package.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 10bbb741e0..7071fcd99d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5  go1.16.10.src.tar.gz
+sha256  b0926654eaeb01ef43816638f42d7b1681f2d3f41b9559f07735522b7afad41a  go1.16.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8a65e20380..cac83c65ff 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.10
+GO_VERSION = 1.16.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
