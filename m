Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319F9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8207F607AE;
	Sun, 21 Nov 2021 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4fSsFXTg6sM; Sun, 21 Nov 2021 20:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8786069D;
	Sun, 21 Nov 2021 20:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDF21BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C55D6069D
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L60wvUleVLvr for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:48:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6987060673
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:48:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46C908DCA0; Sun, 21 Nov 2021 20:43:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:48:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 724bc9b83d48d8fc6849aff1e4740404dadbf81b
X-Git-Newrev: 7093957e9b52bb87a97249a276c0c4f86b7a410d
X-Patchwork-Hint: ignore
Message-Id: <20211121204358.46C908DCA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x265: enable parallel
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7093957e9b52bb87a97249a276c0c4f86b7a410d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Parallel builds were disabled in 2018:
https://git.buildroot.net/buildroot/commit/?id=03bfbc5ab26c9aed0c0cfce55341a1d1f05deca3

Build-testing the version bump to 3.5 showed no errors with 32 threads.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x265/x265.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 85c4ade768..51c39df4cd 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -12,7 +12,6 @@ X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
-X265_MAKE = $(MAKE1)
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-nasm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
