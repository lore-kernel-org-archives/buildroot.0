Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E69C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C38419A0;
	Thu, 21 Apr 2022 19:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obBSUqITFNam; Thu, 21 Apr 2022 19:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A584192E;
	Thu, 21 Apr 2022 19:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC8E81BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA63484397
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9H-EX3_ritC for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:42:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C1A78438D
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:42:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC83F84033; Thu, 21 Apr 2022 19:32:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 21:41:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 786f96627cd6e4b4ee5297782e9abbed9453cfd9
X-Git-Newrev: add69bdec274192ff571330a37e1549ac20db543
X-Patchwork-Hint: ignore
Message-Id: <20220421193211.DC83F84033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump to version 1.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=add69bdec274192ff571330a37e1549ac20db543
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest Go release, version 1.18, is a significant release, including changes
to the language, implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.18

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 507887eaaa..37c34b8b64 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  763ad4bafb80a9204458c5fa2b8e7327fa971aee454252c0e362c11236156813  go1.17.9.src.tar.gz
+sha256  efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088  go1.18.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 41c9a8648f..cf90ac8765 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.9
+GO_VERSION = 1.18.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
