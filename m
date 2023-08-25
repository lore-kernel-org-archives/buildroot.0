Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A9FC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F0FC83B9D;
	Fri, 25 Aug 2023 16:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0FC83B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmMTsxUBfK4q; Fri, 25 Aug 2023 16:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2336832D8;
	Fri, 25 Aug 2023 16:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2336832D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657D81BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF8B41EA0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF8B41EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROpps8VDH_hO for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:11:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3998A41C3A
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3998A41C3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27D6B86338; Fri, 25 Aug 2023 16:11:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:05:33 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1bd74ab101725a06b4998fa717f307e3c191626d
X-Git-Newrev: 11dea30f52b69fad19f84dd0f8364ec6411c8b47
X-Patchwork-Hint: ignore
Message-Id: <20230825161110.27D6B86338@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/go: security bump
 to version 1.19.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=11dea30f52b69fad19f84dd0f8364ec6411c8b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

go1.19.11 (released 2023-07-11) includes a security fix to the net/http package,
as well as bug fixes to cgo, the cover tool, the go command, the runtime, and
the go/printer package.

CVE-2023-29406 and Go issue https://go.dev/issue/60374

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc957ece11e585f1980c51764aafc56fde5b0e15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 874737ea2d..6d4c718a40 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  13755bcce529747d5f2930dee034730c86d02bd3e521ab3e2bbede548d3b953f  go1.19.10.src.tar.gz
+sha256  e25c9ab72d811142b7f41ff6da5165fec2d1be5feec3ef2c66bc0bdecb431489  go1.19.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 545d2117b7..22b8161e05 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.10
+GO_VERSION = 1.19.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
