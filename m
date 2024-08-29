Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F0AC83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 869C481F22;
	Thu, 29 Aug 2024 16:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBsyWshERSks; Thu, 29 Aug 2024 16:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC97A84086
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC97A84086;
	Thu, 29 Aug 2024 16:18:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99A5F1BF84C
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87002419EC
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5T_4ZNM_Tqh for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B53E419D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B53E419D5
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88CD8866E2; Thu, 29 Aug 2024 16:18:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 18:13:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: af77cafb8ca077eb61c57a4bbf1b8d0032d33570
X-Git-Newrev: 4186350b9daab4b73d85597238851d45d32dd2c1
X-Patchwork-Hint: ignore
Message-Id: <20240829161812.88CD8866E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/apr-util: needs
 engine support when built with libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=4186350b9daab4b73d85597238851d45d32dd2c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
http://autobuild.buildroot.net/results/e472618ca9ff4a3cf460f607a8dfa317832ca622/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d46d9760b97f1782f0f1f617682c18864b5e2b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr-util/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index c1a967bdec..f7c119db48 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  The utility library for the apache runtime project
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
