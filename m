Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D90CCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6011D40552;
	Thu,  4 Sep 2025 16:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZsWzoYX4OU9; Thu,  4 Sep 2025 16:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FB740548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FB740548;
	Thu,  4 Sep 2025 16:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A07F0AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21EAB40081
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHw_8abTi1t4 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7861400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7861400B5
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5D1E87EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:22:53 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 94e51dce9c09b25a60787c10c61b07f95f8c83cc
X-Git-Newrev: ba69338ce4ea19fd8f227f80f2fe4fa0298121b2
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.B5D1E87EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ipmitool: move to
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba69338ce4ea19fd8f227f80f2fe4fa0298121b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
