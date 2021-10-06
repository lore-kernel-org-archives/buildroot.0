Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E6CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C778561151
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C778561151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C079403F9;
	Wed,  6 Oct 2021 06:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15XvDYJiSjh6; Wed,  6 Oct 2021 06:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D914640445;
	Wed,  6 Oct 2021 06:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8EE1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569C683AD8
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TS2fVwakIT2r for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:04:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99EBB839DD
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:04:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5874A9190B; Wed,  6 Oct 2021 06:01:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 07:49:41 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: b33c2d23d31018630b49dedba16dca64f772f563
X-Git-Newrev: 4587069cbe5e9e524e35e1e1f00f66baacfe204d
X-Patchwork-Hint: ignore
Message-Id: <20211006060134.5874A9190B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 package/kodi-visualisation-fishbmc: add dependency to glm
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

commit: https://git.buildroot.net/buildroot/commit/?id=4587069cbe5e9e524e35e1e1f00f66baacfe204d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The glm dependency was added upstream in 2019:
https://github.com/xbmc/visualization.fishbmc/commit/31eda216bc9f2f3883217471cfd01afde153c3eb

and was not added when this package was bumped to version 6.3.0:
https://git.buildroot.net/buildroot/commit/?id=7ad1e18bfb93cce3d397b3a2afc3ad418b828e01

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(cherry picked from commit f46f080d64318680bdf6c9fe1f4280ec57e7abe1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-visualisation-fishbmc/Config.in                     | 1 +
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
index 66c1565bd7..4d86d8234b 100644
--- a/package/kodi-visualisation-fishbmc/Config.in
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
 	bool "kodi-visualisation-fishbmc"
+	select BR2_PACKAGE_GLM
 	help
 	  Fische visualiser for Kodi
 
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index ecb118e52b..31bb4900c2 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -8,6 +8,6 @@ KODI_VISUALISATION_FISHBMC_VERSION = 6.3.0-Matrix
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
-KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
+KODI_VISUALISATION_FISHBMC_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
