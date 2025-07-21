Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC32FC83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE703428D0;
	Mon, 21 Jul 2025 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FZmmdyfJoAv; Mon, 21 Jul 2025 21:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 844CA428B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844CA428B5;
	Mon, 21 Jul 2025 21:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C32B0462
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9FB240F95
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrDLcs_tVGD3 for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C073440275
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C073440275
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBAAB869C1; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 22:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 165b12299b911d1df689c01634c894295755bd50
X-Git-Newrev: d1fc513da70291c2af4fb413467b317dd59b86b9
X-Patchwork-Hint: ignore
Message-Id: <20250721210132.BBAAB869C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: fix build failure with
 Linux 6.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1fc513da70291c2af4fb413467b317dd59b86b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Benetti Engineering just took over Larry Finger(lwfinger)'s repository
rtl8723bu since Larry unfortunately passed away[0](RIP) and there are
pending PRs that will never be checked as stated here[1]. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://lwn.net/Articles/979419/
[1]: https://github.com/lwfinger/rtl8723bu/issues/206

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8723bu/Config.in      | 2 +-
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

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
diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 236b9a6726..c0216dd1eb 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215  rtl8723bu-af3a408d6399655b0db23c2c8720436ca725ca47.tar.gz
+sha256  e50ce66539a5216b91460b8278606874040f3c21ce8afbe1f5e84595dafa6868  rtl8723bu-523cb38e4c62bb181d6b95024884e938835cf8cf.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 0ce8b1afad..05447ecef9 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
-RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
+RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
+RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
