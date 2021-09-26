Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4DAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE5F60F9B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEE5F60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5184029D;
	Sun, 26 Sep 2021 19:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zlihRJkO8V8; Sun, 26 Sep 2021 19:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21F1440281;
	Sun, 26 Sep 2021 19:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BECA1BF97D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F33ED402A5
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrWz9bOkUSnw for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B54402D4
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 383C08D25D; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9a26b3c231221dffabb4a00365f229c9440b0c
X-Git-Newrev: f46f080d64318680bdf6c9fe1f4280ec57e7abe1
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.383C08D25D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-fishbmc: add
 dependency to glm
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

commit: https://git.buildroot.net/buildroot/commit/?id=f46f080d64318680bdf6c9fe1f4280ec57e7abe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The glm dependency was added upstream in 2019:
https://github.com/xbmc/visualization.fishbmc/commit/31eda216bc9f2f3883217471cfd01afde153c3eb

and was not added when this package was bumped to version 6.3.0:
https://git.buildroot.net/buildroot/commit/?id=7ad1e18bfb93cce3d397b3a2afc3ad418b828e01

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
index 1008e6f6f1..8e0fcabff9 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -8,6 +8,6 @@ KODI_VISUALISATION_FISHBMC_VERSION = 19.0.0-Matrix
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
