Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8154BEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC9A41F49;
	Wed, 12 Jul 2023 19:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC9A41F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nG4Sf9n3R-V; Wed, 12 Jul 2023 19:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A8FD41F19;
	Wed, 12 Jul 2023 19:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8FD41F19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02341BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C774182640
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C774182640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkISre0UmZ6z for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71FDA8226A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FDA8226A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E62586F1D; Wed, 12 Jul 2023 19:51:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3bb5d03060e2a818d8ee7c32490c09a38d41e29
X-Git-Newrev: fc957ece11e585f1980c51764aafc56fde5b0e15
X-Patchwork-Hint: ignore
Message-Id: <20230712195146.5E62586F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version
 1.19.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc957ece11e585f1980c51764aafc56fde5b0e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.19.11 (released 2023-07-11) includes a security fix to the net/http package,
as well as bug fixes to cgo, the cover tool, the go command, the runtime, and
the go/printer package.

CVE-2023-29406 and Go issue https://go.dev/issue/60374

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
