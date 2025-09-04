Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A98CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DFA8404F7;
	Thu,  4 Sep 2025 16:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cldlmBD1DGXx; Thu,  4 Sep 2025 16:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E73C404E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E73C404E4;
	Thu,  4 Sep 2025 16:15:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 244BAAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB0FF807A6
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWaFzdM9p4XN for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2A0C807A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A0C807A0
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0F3387F46; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b1be77a1e838973deb561a1c22ca0dacaaa36a4f
X-Git-Newrev: 9fe028b53dfba870306a449864c4d3f33b6cf812
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.F0F3387F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ipmitool: move to
 codeberg
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fe028b53dfba870306a449864c4d3f33b6cf812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The github repo was deleted and moved to codeberg, so use that instead:

https://lwn.net/Articles/926101/

It is unclear if the auto generated tarballs from codeberg are reproducible,
so instead fetch through git.

[Peter: set _CPE_ID_VERSION to the correct value]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7af01f47a8aea701d4c8a755d07fb97f1e793af)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ipmitool/Config.in     | 2 +-
 package/ipmitool/ipmitool.hash | 2 +-
 package/ipmitool/ipmitool.mk   | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index dd2b0e6b6d..f759caa08f 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_IPMITOOL
 	  it can be provided by the iana-assignment package or by a
 	  rootfs overlay.
 
-	  https://github.com/ipmitool/ipmitool/
+	  https://codeberg.org/IPMITool/ipmitool/
 
 if BR2_PACKAGE_IPMITOOL
 
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index c3b298e3ba..c65fdb0342 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
+sha256  78bc6fdbb0487652a3d0220072b9428d4ab6dfc198de2f28e8493932e6b893af  ipmitool-IPMITOOL_1_8_19-git4.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 159bb7c8b6..15765ed63f 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-IPMITOOL_VERSION = 1_8_19
-IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
+IPMITOOL_VERSION_UPSTREAM = 1.8.19
+IPMITOOL_VERSION = IPMITOOL_$(subst .,_,$(IPMITOOL_VERSION_UPSTREAM))
+IPMITOOL_SITE = https://codeberg.org/IPMITool/ipmitool.git
+IPMITOOL_SITE_METHOD = git
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
-IPMITOOL_CPE_ID_VALID = YES
+IPMITOOL_CPE_ID_VERSION = $(IPMITOOL_VERSION_UPSTREAM)
 # From git
 IPMITOOL_AUTORECONF = YES
 IPMITOOL_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
