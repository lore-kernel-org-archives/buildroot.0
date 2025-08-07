Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D1C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C777606A3;
	Thu,  7 Aug 2025 17:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FLqueqgkXCM; Thu,  7 Aug 2025 17:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FCEA60667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FCEA60667;
	Thu,  7 Aug 2025 17:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02ACC767
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E2480C41
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFZoTwUSJBsC for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E9B80BD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E9B80BD7
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2220D82AE0; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f8e603bceca4ffcfefa4657fe0a962aefd858dd0
X-Git-Newrev: 3a7e10b452ad9088cdf399db684c565da20da274
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.2220D82AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rtl8188eu: move
 upstream to Benetti Engineering Github
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a7e10b452ad9088cdf399db684c565da20da274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Benetti Engineering just took over Larry Finger(lwfinger)'s repository
rtl8188eu since Larry unfortunately passed away[0](RIP) and there are
pending PRs that will never be checked as stated here[1]. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And let's drop local patches
that are now upstreamed as well. Let's also drop obsolete Config.in
informations since as stated here[2]: "This driver is under development
and has a limited feature set. In particular it does not yet support 40MHz
channels and power management". At the same time drop other suggestions
like enabling CONFIG_WIRELESS_EXT or "this package needs a firmware loading
mechanism to load the binary blob for the chip to work" since they are now
part of the package. And of course let's update package's URL due to the
moving.

[0]: https://lwn.net/Articles/979419/
[1]: https://github.com/lwfinger/rtl8188eu/pull/464

Fixes:
https://autobuild.buildroot.org/results/d59537da8eb27d737718885dc81ec257a2791455/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9c5dc024a0717b68b22a352f960d9dac099f73f)
[Thomas: only change upstream]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8188eu/Config.in    | 11 +----------
 package/rtl8188eu/rtl8188eu.mk |  2 +-
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 76d9085297..5acef3cd32 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,17 +4,8 @@ config BR2_PACKAGE_RTL8188EU
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
-	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a
-	  similar codebase.
 
-	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
-	  config option enabled.
-
-	  Note: this package needs a firmware loading mechanism to load
-	  the binary blob for the chip to work.
-
-	  https://github.com/lwfinger/rtl8188eu
+	  https://github.com/benetti-engineering-sas/rtl8188eu
 
 comment "rtl8188eu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index eca0fb8007..98ee757425 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
-RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
+RTL8188EU_SITE = $(call github,benetti-engineering-sas,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
