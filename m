Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8C1C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11A342D24;
	Mon, 19 May 2025 10:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id So_Is9G1N3Dd; Mon, 19 May 2025 10:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0F442D22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0F442D22;
	Mon, 19 May 2025 10:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDF6193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CDE41706
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pden1tg-sxQ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED1C417B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BED1C417B0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD158725C; Mon, 19 May 2025 10:39:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 22:07:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b612b90238d729b9f74cdb52d8de3a9a2bd50194
X-Git-Newrev: 638fe82e8b1c4f6204b161fec325f99cf51c1572
X-Patchwork-Hint: ignore
Message-Id: <20250519103950.BCD158725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/c-periphery: bump to
 version 2.4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=638fe82e8b1c4f6204b161fec325f99cf51c1572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:

* v2.4.3 - 02/28/2025
    * Fix memory safety with some older `strerror_r()` implementations in error
      formatters for all modules.
    * Build
        * Fix character device GPIO support tests in Makefile for alternate
          shells and older versions of make.
        * Fix cross-compilation in Makefile from Windows.
        * Fix CMake minimum required version.
        * Add CMake package generation.
    * Contributors
        * Ryan Barnett, @rjbarnet - ec31b39
        * javalikescript, @javalikescript - 024a25d
        * HopeCollector, @HopeCollector - aca6815, b5e53e6

The hash of the license file has changed due to a copyright year
change:

- Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
+ Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/c-periphery/c-periphery.hash | 4 ++--
 package/c-periphery/c-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index f8f0654b4f..1914ad2255 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  24327bc2a22588444b2576fa1c9560619f6faad986c236c54f4b3f36b20dad56  c-periphery-2.4.2.tar.gz
-sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  LICENSE
+sha256  367b263a14f80eac19c738de56b4a730a4b5e40e05586479a9515612eaabaff3  c-periphery-2.4.3.tar.gz
+sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index e3745c4af6..38f1fa9fc6 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 2.4.2
+C_PERIPHERY_VERSION = 2.4.3
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
