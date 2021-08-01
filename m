Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212D0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:02:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB11260EE9
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB11260EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA95084424;
	Wed,  4 Aug 2021 01:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZlUzRHNY6vm; Wed,  4 Aug 2021 01:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078AF84412;
	Wed,  4 Aug 2021 01:02:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3127B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E75441460
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5OaHeGJVels for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB1E414B9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 72C558750D; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 11:36:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 278072520c76bae03916cdcd2f5d3324f4626c5f
X-Git-Newrev: 33c8cb0204ff44cb507ba6b8b4aa3476d668b873
X-Patchwork-Hint: ignore
Message-Id: <20210803211025.72C558750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vdr: bump to version
 2.5.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=33c8cb0204ff44cb507ba6b8b4aa3476d668b873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Use github mirror to get latest release
- This bump will fix a build failure with gcc 11 thanks to
  http://autobuild.buildroot.org/results/3dda387a765f7980c0bb567aeb0f0d86328ae876

https://github.com/vdr-projects/vdr/blob/2.5.6/HISTORY

Fixes:
 - http://autobuild.buildroot.org/results/3dda387a765f7980c0bb567aeb0f0d86328ae876

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vdr/vdr.hash | 4 +---
 package/vdr/vdr.mk   | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 3d0dc443e2..3776296aa5 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,5 +1,3 @@
-# From https://www.linuxtv.org/pipermail/vdr/2020-December/029578.html
-md5  aa91614159ae2db45655d35918e2c24e  vdr-2.4.6.tar.bz2
 # Locally computed
-sha256  c8993babf2a878a0fba84558de1e35f042c3c66f7c1ec569eea00a3af1014e4b  vdr-2.4.6.tar.bz2
+sha256  27026b78a663758211d15c83a21555e28d91ab640c6d4f6cdd860f2abf1cae84  vdr-2.5.6.tar.gz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index eac13bfff4..251ffb9f04 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.4.6
-VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
-VDR_SITE = ftp://ftp.tvdr.de/vdr
+VDR_VERSION = 2.5.6
+VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
 VDR_CPE_ID_VENDOR = tvdr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
