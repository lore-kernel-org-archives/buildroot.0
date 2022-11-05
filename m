Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26095C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C051081E5D;
	Sat,  5 Nov 2022 21:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C051081E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhwctjBPiiGj; Sat,  5 Nov 2022 21:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02BE181E2D;
	Sat,  5 Nov 2022 21:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02BE181E2D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 439631BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F08740204
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F08740204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STBTBOIlf5hV for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2590C40286
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2590C40286
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FB6387E77; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:36:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a48664f5d02f220b863342ba67b52c99484d3f97
X-Git-Newrev: c5fdb46077fb57eb7529b378c443dffb3f223e45
X-Patchwork-Hint: ignore
Message-Id: <20221105214007.1FB6387E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: security bump
 to version 1.18.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5fdb46077fb57eb7529b378c443dffb3f223e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

go1.18.7 (released 2022-10-04) includes security fixes to the archive/tar,
net/http/httputil, and regexp packages, as well as bug fixes to the
compiler, the linker, and the go/types package.

go1.18.8 (released 2022-11-01) includes security fixes to the os/exec and
syscall packages, as well as bug fixes to the runtime.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f4bb3730fa58fc17bcd05a530e0f38c81180f7ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 959387cb6a..5edda2e600 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  a7f1d50424355dabce66d1112b1cae439b6ee5e4f15edba6f104c0a4b173e895  go1.18.6.src.tar.gz
+sha256  1f79802305015479e77d8c641530bc54ec994657d5c5271e0172eb7118346a12  go1.18.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f4025618c3..5dda357e4a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.6
+GO_VERSION = 1.18.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
