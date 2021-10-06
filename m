Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDB0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9FA61151
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 06:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A9FA61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0E640443;
	Wed,  6 Oct 2021 06:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STN5gFYZ805W; Wed,  6 Oct 2021 06:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4932D403FE;
	Wed,  6 Oct 2021 06:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0A241BF869
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDCCD6066F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5FP3ugR4hP9 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34C706064C
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 06:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E9A4C91AB8; Wed,  6 Oct 2021 06:01:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 07:49:27 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: be55d05d5ed3ff6ce6b03625cdd26aac5acff319
X-Git-Newrev: 87a49efa962240cd8af856e3dcaf52bea0cfe0bf
X-Patchwork-Hint: ignore
Message-Id: <20211006060140.E9A4C91AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=87a49efa962240cd8af856e3dcaf52bea0cfe0bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
