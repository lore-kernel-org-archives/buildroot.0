Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A5CC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D02AE41817;
	Mon,  4 Dec 2023 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02AE41817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSFXBubFHnmz; Mon,  4 Dec 2023 20:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD94417C7;
	Mon,  4 Dec 2023 20:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD94417C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 364B41BF97A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B4D82163
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B4D82163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nHfl_FXOCMl for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF2B80BDE
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AF2B80BDE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D92879BA; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 22:37:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32c90b6ad7e54e0a750feee33472777a4daef822
X-Git-Newrev: a382a7d55432918d2a1e47ae4cbe7ed50fa17a08
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.98D92879BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump to version
 2023-11-23
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

commit: https://git.buildroot.net/buildroot/commit/?id=a382a7d55432918d2a1e47ae4cbe7ed50fa17a08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch applied upstream:
https://github.com/espressif/esp-hosted/commit/12b0ca9c46094c86eb76b5f0eaa626f868efaec8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ng-host-fix-build-failure-when-CONFIG_PM-.patch | 33 ----------------------
 package/esp-hosted/esp-hosted.hash                 |  2 +-
 package/esp-hosted/esp-hosted.mk                   |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
deleted file mode 100644
index abbc64a434..0000000000
--- a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 56920e3ce04aa2eadb529a6787200789bf1c3925 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 9 Aug 2023 23:16:52 +0200
-Subject: [PATCH] esp_hosted_ng: host: fix build failure when CONFIG_PM is not
- defined
-
-wiphy->wowlan is not defined when CONFIG_PM is not enabled so let's
-guard the assignment to wiphy->wowlan according to option CONFIG_PM.
-
-Upstream: https://github.com/espressif/esp-hosted/pull/254
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- esp_hosted_ng/host/esp_cfg80211.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
-index 70fdbb9773..d3c4108c29 100644
---- a/esp_hosted_ng/host/esp_cfg80211.c
-+++ b/esp_hosted_ng/host/esp_cfg80211.c
-@@ -638,7 +638,9 @@ int esp_cfg80211_register(struct esp_adapter *adapter)
- 	wiphy->max_scan_ie_len = 1000;
- 	wiphy->max_sched_scan_ssids = 10;
- 	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
-+#ifdef CONFIG_PM
- 	wiphy->wowlan = &esp_wowlan_support;
-+#endif
- 
- 	/* Advertise SAE support */
- 	wiphy->features |= NL80211_FEATURE_SAE;
--- 
-2.34.1
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index c17fe262a1..b129bb42f9 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3310845b2324bda5774b91bcdd3f47621126f4a0011a0f61e31b0ad4a44db2f5  esp-hosted-11e90f185a5a9922343e73e44032816a0e3ddedb.tar.gz
+sha256  6e023c26355643f2aaf6d79d5910f64c49ea638063235d519075629643518a71  esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 7491c46512..578108c91d 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 11e90f185a5a9922343e73e44032816a0e3ddedb
+ESP_HOSTED_VERSION = ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
