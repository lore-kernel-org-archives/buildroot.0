Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070ACCDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C313D401F6;
	Wed, 18 Sep 2024 20:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKw9ppWyIP_i; Wed, 18 Sep 2024 20:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F43140364
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F43140364;
	Wed, 18 Sep 2024 20:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9994D1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D9AD84959
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufBNuKCvNcjo for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F87848F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11F87848F8
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2D9E83BDD; Wed, 18 Sep 2024 20:34:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:14:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f12d22ceae7f77135bac45622943c504c897a4b2
X-Git-Newrev: 0643531972fbd8a889820e42000abd148f3b3f30
X-Patchwork-Hint: ignore
Message-Id: <20240918203457.F2D9E83BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/szip: update
 SZIP_SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=0643531972fbd8a889820e42000abd148f3b3f30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix broken link.

While at it, use $(SZIP_VERSION) inside SZIP_SITE instead of
duplicating the version.

Fixes:

 http://autobuild.buildroot.org/results/35d/35d08103bbd0da22a5e111f1f86f28aba7062ee6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 180216631a64d5319ab0420cf7b37acb4fa0799c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/szip/szip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/szip/szip.mk b/package/szip/szip.mk
index 7a8a5a82e6..869fc9c358 100644
--- a/package/szip/szip.mk
+++ b/package/szip/szip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SZIP_VERSION = 2.1.1
-SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1.1/src
+SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/$(SZIP_VERSION)/src
 SZIP_LICENSE = szip license
 SZIP_LICENSE_FILES = COPYING
 SZIP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
