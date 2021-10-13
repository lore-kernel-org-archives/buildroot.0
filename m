Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A7AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C40860C49
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C40860C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E972040753;
	Wed, 13 Oct 2021 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFMtbsZ9YNoi; Wed, 13 Oct 2021 18:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B7044075A;
	Wed, 13 Oct 2021 18:29:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30801BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E6E360D56
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC68IM9FtSRM for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7166C60C2F
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2BEE958EB; Wed, 13 Oct 2021 18:24:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efef1974c566b229bd8341a9e8cd3b4feeeb3e6c
X-Git-Newrev: 34a544cf9fbe65b9f90b805bf140d2cd21018cc2
X-Patchwork-Hint: ignore
Message-Id: <20211013182444.E2BEE958EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-util: bump version to 0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=34a544cf9fbe65b9f90b805bf140d2cd21018cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the ChangeLog (see git history for full details):
- Fix suffix check regression on Windows with Large File Support
- Skip setting alternate interface when not needed
- Only clamp transfer size on Linux
- Quirk for GD32 leave request
- Improve status and error messages and exit codes
- dfuse: Process all alternate interfaces in a DfuSe file
- dfuse-pack.py: Fix alternate settings if first is 0

Link: https://lists.osmocom.org/pipermail/dfu-util/2021-September/000014.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dfu-util/dfu-util.hash | 6 +++---
 package/dfu-util/dfu-util.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
index a99e67565d..4ca28a26c9 100644
--- a/package/dfu-util/dfu-util.hash
+++ b/package/dfu-util/dfu-util.hash
@@ -1,6 +1,6 @@
-# From http://dfu-util.sourceforge.net/releases/dfu-util-0.10.tar.gz.md5
-md5  8cf55663703cdc6b40f377f999eb8d3d  dfu-util-0.10.tar.gz
+# From http://dfu-util.sourceforge.net/releases/dfu-util-0.11.tar.gz.md5
+md5  31c983543a1fe8f03260ca4d56ad4f43  dfu-util-0.11.tar.gz
 
 # Locally computed
-sha256  a03dc58dfc79c056819c0544b2a5970537566460102b3d82cfb038c60e619b42  dfu-util-0.10.tar.gz
+sha256  b4b53ba21a82ef7e3d4c47df2952adf5fa494f499b6b0b57c58c5d04ae8ff19e  dfu-util-0.11.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 4c9c9662c6..638cb32f37 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DFU_UTIL_VERSION = 0.10
+DFU_UTIL_VERSION = 0.11
 DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPL-2.0+, LGPL-3.0
 DFU_UTIL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
