Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF86C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 775A680C4B;
	Thu,  7 Aug 2025 17:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV8c08M1PNzc; Thu,  7 Aug 2025 17:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 992DE80CB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 992DE80CB2;
	Thu,  7 Aug 2025 17:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 040BB233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED6E680C42
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nevsfvjFtk1a for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4711E80C05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4711E80C05
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3910480DA8; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a7e10b452ad9088cdf399db684c565da20da274
X-Git-Newrev: 6881e2b41a84ef6621b7f9a87343475a3d189b4f
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.3910480DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rtl8723bu: update
 upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=6881e2b41a84ef6621b7f9a87343475a3d189b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Benetti Engineering just took over Larry Finger(lwfinger)'s repository
rtl8723bu since Larry unfortunately passed away[0](RIP) and there are
pending PRs that will never be checked as stated here[1]. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://lwn.net/Articles/979419/
[1]: https://github.com/lwfinger/rtl8723bu/issues/206

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d1fc513da70291c2af4fb413467b317dd59b86b9)
[thomas: only change the upstream]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8723bu/Config.in    | 2 +-
 package/rtl8723bu/rtl8723bu.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
index 7c624fc4d4..70d597d23e 100644
--- a/package/rtl8723bu/Config.in
+++ b/package/rtl8723bu/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723BU
 	help
 	  rtl8723bu wifi driver
 
-	  https://github.com/lwfinger/rtl8723bu
+	  https://github.com/benetti-engineering-sas/rtl8723bu
 
 comment "rtl8723bu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 0ce8b1afad..6b9580643d 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
-RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
+RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
