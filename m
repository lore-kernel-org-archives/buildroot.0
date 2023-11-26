Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B34C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 20:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6907404C6;
	Sun, 26 Nov 2023 20:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6907404C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4m4KRv7UQ6Gn; Sun, 26 Nov 2023 20:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C448403C5;
	Sun, 26 Nov 2023 20:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C448403C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFE531BF42D
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50E1D403AC
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 20:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50E1D403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMO3UbftkZe7 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 20:12:34 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40B244051E
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 20:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B244051E
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7LUTrVqNJiNRN7LUTrJdky; Sun, 26 Nov 2023 21:12:29 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 21:12:27 +0100
Message-Id: <20231126201227.15014-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH+y9PPIvay4ShYNU+dtXMMt+KDunK04BxEnOJ4K+JthGC+9hqSA9GVjbu2i6nSKOLbldK0x94EpfHstSf2t6QcLmWSGgOK07TPDxk9ZbKEPjtsf5k+h
 ks5qPXmITvhp/T3ThfdqWAiAfBc/SZk78WLNINqD+HjeUadIHr5OBomhTCmIphKa3OWq8FFyRIwj6WK6wVS7Ak9Ipz+Ry5ydxUxlOmoGR3G8NGA9kulM30eJ
 Z7IzSR8FcRoH3/JSKnn7BncNIAxafFJUg0bJmCmgrlU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701029549; bh=5qaHzvvcoSvLKdNB4jz3YQCwRUk7oFS/ywR9Vglgj/I=;
 h=From:To:Subject:Date:MIME-Version;
 b=dI7+iGoEHdoPxDlJGrFS0eoMIWFWM+puMuFzfyB44y4GZB6kWkRZm8XOYgJtl7nf8
 SpaOswhTgn0wqbs9XS0fArGWYNAHviu6Czwp6tPsO/Ni6BbtqZSSICm01n7Fa1zvLl
 T9WJdKTg9Wt7s1n8DxQdlU8VqVEjeZAV2Jkj56b+v61DuMB7zjEw87sFs331qVTKmB
 tDzAplk0J9zFgVqr/uFNijG8i0Ou9hIydLi2ghmjSCP60SiaR9dZdUtFttOaP+Ixsv
 NP8JUCG4CH6yCiBLZSdgePOaGItlqcNx76tF3vc27nAOHR+Gv/BVNIK4d5hHgqLZTM
 SNE0qusyRHehA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dI7+iGoE
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 2023-11-23
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch applied upstream:
https://github.com/espressif/esp-hosted/commit/12b0ca9c46094c86eb76b5f0eaa626f868efaec8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...st-fix-build-failure-when-CONFIG_PM-.patch | 33 -------------------
 package/esp-hosted/esp-hosted.hash            |  2 +-
 package/esp-hosted/esp-hosted.mk              |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
