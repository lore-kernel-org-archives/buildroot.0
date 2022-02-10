Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64D7A40354;
	Thu, 10 Feb 2022 21:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdtmPkY-_Xou; Thu, 10 Feb 2022 21:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D00340911;
	Thu, 10 Feb 2022 21:38:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF001BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0FE4408BF
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOmPpHFEMdcM for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F06540122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C395082DE9; Thu, 10 Feb 2022 21:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:34:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
X-Git-Newrev: 99d3d6afe7a5df12552d0d305743f64abdd155c4
X-Patchwork-Hint: ignore
Message-Id: <20220210213036.C395082DE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump to
 version 3.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=99d3d6afe7a5df12552d0d305743f64abdd155c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libarchive 3.5.3 is a security release

Security Fixes:
 - extended fix for following symlinks when processing the fixup list
   (CVE-2021-31566)
 - fix invalid memory access and out of bounds read in RAR5 reader
   (CVE-2021-36976)

https://github.com/libarchive/libarchive/releases/tag/v3.5.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index d31e9f55f4..5dd8e5c167 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  f0b19ff39c3c9a5898a219497ababbadab99d8178acc980155c7e1271089b5a0  libarchive-3.5.2.tar.xz
+sha256  5cac725dd4be31c4a10b65d30f29dc957ea29ef3d758df6e46e8ae90a996a19a  libarchive-3.5.3.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index eec256ba75..cf16c27e67 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.5.2
+LIBARCHIVE_VERSION = 3.5.3
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
