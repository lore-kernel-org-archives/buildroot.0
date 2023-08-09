Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C6C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B359417A6;
	Wed,  9 Aug 2023 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B359417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LJXSDLJjNLx; Wed,  9 Aug 2023 21:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E35D4092F;
	Wed,  9 Aug 2023 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E35D4092F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBF831BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B303C4092F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B303C4092F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-ReztWXi06A for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:23:52 +0000 (UTC)
Received: from smtpdh18-su.aruba.it (smtpdh18-su.aruba.it [62.149.155.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE6704092D
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE6704092D
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Tqehqy2TUiRfoTqeiq1Ubc; Wed, 09 Aug 2023 23:23:48 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:23:45 +0200
Message-Id: <20230809212345.1338243-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDCvOYxWNaNQ/4O1cd9T3puhuwsRYYAjdGYPTVS+b+YOX2Fw04KlQMELu7NuhLjmiq4h4ngP1JVGTz0oTUQC8cswetxqCAUqSK/ORYRDV0sz4VCGH4Oa
 tAZ3YP9rN7Zy8XjAt7x9SSXXRtt/Qz+c24cYyj7nvXCwaLivkxHHnZSjRiHExxSl6IlaoR1on/HqHagIoUCdyMWMSvcUrIUHRZm/s7rLQIAwp+HnUgZcXIvg
 yGKuF1FduL3cKin1JK3Rc/2UcrIZysAxJzd823JE628=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691616228; bh=TIg2oZZF3KTShKLx/C9wqGt6/y4VuXvcG7NKqdS7EB8=;
 h=From:To:Subject:Date:MIME-Version;
 b=eSmeLuajq7To0iAbKWrgadcfYYlSdWnvjjQgYYalpQTh8YB0YgiVuzp0nx8wrsDwA
 OR6XCW/eqf4Ha/kMt5Y/ltjxp84NH6JlPlJ3OWrN0EXDrocvzR2CJ7fwPtIMYkDpD/
 xnhDOiPMHuPDE02YTH3HiliEMWEactdTCIDHlMKODPD84KXcEH1Zc3LLvwP53g4NFc
 H/TOzuDWt9glKVd99bq9oPYjVtBy+/0YpD+dKxKplU/uDN9a0PsvvRg3ybhJG0iqdS
 RSRQg0nX2NDgOtMKnhAx+C0BpPWFMfopWhxLg42nRQEqOmAGT6tjmLP4Q/UA2v7ZoC
 Z3Q5Gt3mbj0ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eSmeLuaj
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure when
 Linux CONFIG_PM is not defined
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

Add local patch pending upstream[1] to guard structure member wowlan that
is only present if CONFIG_PM is defined.

Fixes:
http://autobuild.buildroot.net/results/d47317640de39baabeefb8d9e04fa7f3e2dc873a

[1]: https://github.com/espressif/esp-hosted/pull/254

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...st-fix-build-failure-when-CONFIG_PM-.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch

diff --git a/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
new file mode 100644
index 0000000000..abbc64a434
--- /dev/null
+++ b/package/esp-hosted/0001-esp_hosted_ng-host-fix-build-failure-when-CONFIG_PM-.patch
@@ -0,0 +1,33 @@
+From 56920e3ce04aa2eadb529a6787200789bf1c3925 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 9 Aug 2023 23:16:52 +0200
+Subject: [PATCH] esp_hosted_ng: host: fix build failure when CONFIG_PM is not
+ defined
+
+wiphy->wowlan is not defined when CONFIG_PM is not enabled so let's
+guard the assignment to wiphy->wowlan according to option CONFIG_PM.
+
+Upstream: https://github.com/espressif/esp-hosted/pull/254
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/esp_cfg80211.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
+index 70fdbb9773..d3c4108c29 100644
+--- a/esp_hosted_ng/host/esp_cfg80211.c
++++ b/esp_hosted_ng/host/esp_cfg80211.c
+@@ -638,7 +638,9 @@ int esp_cfg80211_register(struct esp_adapter *adapter)
+ 	wiphy->max_scan_ie_len = 1000;
+ 	wiphy->max_sched_scan_ssids = 10;
+ 	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
++#ifdef CONFIG_PM
+ 	wiphy->wowlan = &esp_wowlan_support;
++#endif
+ 
+ 	/* Advertise SAE support */
+ 	wiphy->features |= NL80211_FEATURE_SAE;
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
