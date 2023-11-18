Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10DDC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6856A60D75;
	Sat, 18 Nov 2023 20:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6856A60D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4Pw0ui_AosG; Sat, 18 Nov 2023 20:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB94260AC1;
	Sat, 18 Nov 2023 20:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB94260AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A874F1BF277
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 20:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE85417D7
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 20:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE85417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmXL-9rW9naC for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 20:13:48 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA15D417C7
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 20:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA15D417C7
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 4RhIruXXJKAXe4RhIrJhm7; Sat, 18 Nov 2023 21:13:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 21:13:43 +0100
Message-Id: <20231118201343.3351692-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD7RmT3jVZevx1Z0hScouv6dgkpTakoQqsYaCL53udlpfzTssA9Nbg5V7S3TWp6puyYGpnjg8Yq4exUXba//SZfWDr63vp4aiZHqMGQLtFmeicGH4RjH
 ssJPT5FlwfPHvJd+X6SygABTY25LhLm8KtaIRAb//17rKJFmqgP2OzYFx5OJgemCLTAD1Se3hEeiyyUh0oHMLwKtXxzdNTv+JrG0DBwRKePWdRbhQ/8L0W0c
 9ijbnYRxK5Jsqo/PySiQ22zh7qDNMh08ciKs7t357BI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700338424; bh=u37CNfFn5mzXvtIf7Z3fjBJwLcxkP2VMI5934swpgOg=;
 h=From:To:Subject:Date:MIME-Version;
 b=WZxUgtPbktpMkKH/tG6bi9EwV+ZCVIhprEFV8WrfcYD4LJ4H9RMTdMEa9c9pTnzOL
 30ysvncnNfpEMxLQ7pmGTCA3WVblyO5QZd7F85nqZzu8J8pnzzxSetnEyAvPQSQ7N4
 EUGavLa2Gx6XJVkYSaCoYMt+CoXDhdqD+tqRmt/o31VavF2rWQqGA+8S1wvInpiWrK
 k3xo1AMqlesS0KmaCPGumJ+Vz1bUcw9oDQbFJ1BwjmW+soUcnyASVDpS3TRAXVXCmm
 MRZgcqxc0S53CdLshIfJSeMnlUzwLqrvkTfCVbuD28FrK1vEzn2TaADpm9cwHrEpa5
 QAs65GMBKoJsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WZxUgtPb
Subject: [Buildroot] [for-next] package/esp-hosted: bump to version
 2023-11-10
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
index c17fe262a1..fa8c216a74 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3310845b2324bda5774b91bcdd3f47621126f4a0011a0f61e31b0ad4a44db2f5  esp-hosted-11e90f185a5a9922343e73e44032816a0e3ddedb.tar.gz
+sha256  b238a83d98dd77b123ca0ce879febe003098a64220ff25c297d272df7018f337  esp-hosted-63f12ead9c4a77d372b24f3420c85e9018bec80b.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 7491c46512..a11ce47636 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 11e90f185a5a9922343e73e44032816a0e3ddedb
+ESP_HOSTED_VERSION = 63f12ead9c4a77d372b24f3420c85e9018bec80b
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
