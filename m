Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3561DC5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BA860A6C;
	Fri, 30 May 2025 19:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psY-Hmp-e6gy; Fri, 30 May 2025 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFBD60A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BFBD60A94;
	Fri, 30 May 2025 19:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28FED236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AAB0400A4
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFFrhh2yByCe for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697A9400A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 697A9400A0
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55AE08776E; Fri, 30 May 2025 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 21:35:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: de374e06d856dd5079fc792c883b06563af950b0
X-Git-Newrev: 4850405d8aa2b4f7aeb84a0db7cd3369a727d214
X-Patchwork-Hint: ignore
Message-Id: <20250530193619.55AE08776E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bootgen: bump to
 xilinx_v2025.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4850405d8aa2b4f7aeb84a0db7cd3369a727d214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump bootgen to xilinx_v2025.1 release.

With version 2025.1, bootgen executable is now in the build/bin dir, so
the install step is changed accordingly.

The LICENSE file hash has changed as it was converted from DOS end of
lines to Unix end of lines.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bootgen/bootgen.hash | 4 ++--
 package/bootgen/bootgen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
index d040a2e280..7670a5d1ee 100644
--- a/package/bootgen/bootgen.hash
+++ b/package/bootgen/bootgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
-sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
+sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
+sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
index 51eacde462..939872b29c 100644
--- a/package/bootgen/bootgen.mk
+++ b/package/bootgen/bootgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOTGEN_VERSION = xilinx_v2024.2
+BOOTGEN_VERSION = xilinx_v2025.1
 BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 BOOTGEN_LICENSE = Apache-2.0
@@ -19,7 +19,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 endef
 
 define HOST_BOOTGEN_INSTALL_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
+	$(INSTALL) -m 0755 -D $(@D)/build/bin/bootgen $(HOST_DIR)/bin/bootgen
 endef
 
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
