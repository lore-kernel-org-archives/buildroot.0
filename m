Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633A3C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E89D60692;
	Thu,  7 Aug 2025 17:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjgwGQh-3RUe; Thu,  7 Aug 2025 17:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F37560732
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F37560732;
	Thu,  7 Aug 2025 17:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8AF4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2EC6400AB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4ADhNfc28ab for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7753C40093
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7753C40093
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7505D80FCA; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:49 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a9df497204283d5cf744b2b7de58778641bdd701
X-Git-Newrev: 23cc7bde082973d019bbc1f5ecb92325165ba9d9
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.7505D80FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/rtl8821au: update
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23cc7bde082973d019bbc1f5ecb92325165ba9d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
rtl8821au since Larry unfortunately passed away[1](RIP) and there are
pending PRs that will never be checked as stated here. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://github.com/lwfinger/rtl8812au/issues/32
[1]: https://lwn.net/Articles/979419/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2dd7a4a374a0e585777422f2900d893a6cfcbc42)
[thomas: only change the upstream]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rtl8821au/Config.in    | 2 +-
 package/rtl8821au/rtl8821au.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 3d7bbf643d..66e7334148 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
 	help
 	  rtl8821au wifi driver
 
-	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
+	  https://github.com/benetti-engineering-sas/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 9a92696437..875079703f 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
-RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
+RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
