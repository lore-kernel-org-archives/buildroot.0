Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91388C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64810403B1;
	Thu,  7 Aug 2025 17:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCO_v_rcl4B1; Thu,  7 Aug 2025 17:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E337403AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E337403AB;
	Thu,  7 Aug 2025 17:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 021BA31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3581E60603
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqHMmXytOMfO for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E820605EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E820605EF
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49C7E82AE0; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6881e2b41a84ef6621b7f9a87343475a3d189b4f
X-Git-Newrev: 6481d406c27b812fb80a1f9c43274cdcefa4cd59
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.49C7E82AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rtl8723ds: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=6481d406c27b812fb80a1f9c43274cdcefa4cd59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
rtl8723ds since Larry unfortunately passed away[1](RIP) and there are
pending PRs that will never be checked as stated here. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And let's drop local patches
that are now upstreamed as well. And of course let's update package's
URL due to the moving.

[0]: https://github.com/lwfinger/rtl8723ds/issues/53
[1]: https://lwn.net/Articles/979419/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 54ee4a71c0b3c775067dca517a3780f31cc7f257)
[thomas: only change the upstream]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8723ds/Config.in    | 2 +-
 package/rtl8723ds/rtl8723ds.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
index e5123a2aae..0921a55d37 100644
--- a/package/rtl8723ds/Config.in
+++ b/package/rtl8723ds/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723DS
 	help
 	  rtl8723bs wifi driver
 
-	  https://github.com/lwfinger/rtl8723ds
+	  https://github.com/benetti-engineering-sas/rtl8723ds
 
 comment "rtl8723ds needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 2536450d80..e35364aa67 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8723DS_VERSION = 52e593e8c889b68ba58bd51cbdbcad7fe71362e4
-RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_SITE = $(call github,benetti-engineering-sas,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
