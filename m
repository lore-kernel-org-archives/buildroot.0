Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37F8CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23AA414B7;
	Thu, 19 Sep 2024 09:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvPIkJPW_-zp; Thu, 19 Sep 2024 09:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47D941789
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47D941789;
	Thu, 19 Sep 2024 09:16:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13A681BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40EEF84709
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwwM8nE4hc_S for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3259684916
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3259684916
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E75F83C4D; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:33 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1395e6cedcc1263077eeb8501d0348c3e915090a
X-Git-Newrev: e9fe4e6cb9f4cdb6a37964c2e3934703c746a558
X-Patchwork-Hint: ignore
Message-Id: <20240919091453.2E75F83C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/gerbera: fix
 guaranteed typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9fe4e6cb9f4cdb6a37964c2e3934703c746a558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4a66a2af64abbf1e501fd3c7d79bd41cea36a244)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gerbera/gerbera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 6616a83e74..f3f05b364d 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -80,7 +80,7 @@ else
 GERBERA_CONF_OPTS += -DWITH_MATROSKA=OFF
 endif
 
-# Either libupnp or libnpupnp are guranteed to be enabled
+# Either libupnp or libnpupnp are guaranteed to be enabled
 ifeq ($(BR2_PACKAGE_LIBNPUPNP),y)
 GERBERA_DEPENDENCIES += libnpupnp
 GERBERA_CONF_OPTS += -DWITH_NPUPNP=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
