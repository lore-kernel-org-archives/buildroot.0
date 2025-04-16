Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EA9C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730A042446;
	Wed, 16 Apr 2025 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzSZq4kE3fDu; Wed, 16 Apr 2025 20:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B01B4243E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B01B4243E;
	Wed, 16 Apr 2025 20:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A028159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD4980E16
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVM6QpDhQOiF for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1932480BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1932480BBA
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1932480BBA
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:05:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 590uu1lb2zl8E590uuDuur; Wed, 16 Apr 2025 22:05:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 16 Apr 2025 22:05:39 +0200
Message-Id: <20250416200539.3277268-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHrD0CG6Hv9E20zYXZdR4ctC+fUFoIh/Ohvc10PqN1USfqB4GzL8nX24sFOYciUR+1n1FM1VV12QkPnn51AvVGDf6i9hU5hoO31jhp69Pp3nCHVL34rd
 /v/WU/ihpgHQko/ScPtrvKSV1hfZbWh+lXq3RYJbElVjOqP2s8OFpFsN7LR8QPmZBx2Pkn3hEM+DDQbvTMgmlACbxQT3KIy4fit+tFWSmv9fehZilVin1pMF
 XmPEokJCtXCfJg87pu4Ce3Q12QlPiFwhoKA5sbqW8uadOqFBw+H3zuJ3ClP4lz7MkbdVvhPr/1/fyqUUnFw0mQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744833940; bh=DzJQK1M0dYVFAbjADx25Xhe8ZI0WOttXzVnprpP9YrE=;
 h=From:To:Subject:Date:MIME-Version;
 b=SZ9b86NEomG8ZPU5r4fYtatjUS5ME9hr1MuVC0LZR5XHUwX5p85dCvG25csAeu58x
 ZxI81/kPJnJc81sSLLxv0NJas92iN30gTOeeAuoC8vxXinyJ047MHANhXPe9g3WDsh
 QAXoJQpms1ea9gWD+tgmClq5vUa396cnsl+NS4HNvzu6M4QqXxIivoRDD4NSkV2Ha0
 VxK3Uzj4PLZ/IdVSUapI7jZKcesDZ9V52Yf0cItUZiYJVi+VV0a7XtOLhxP1b+7EBv
 6AiBviObOkLGuAUHqD12REPdv3i54wOgWC+V/pL2IJTv0lIuJEpyw4F8zgGgAlpDNS
 eCHT4ai+LDd/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SZ9b86NE
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix build failure with Linux
 6.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream to fix build failure with Linux 6.13

Fixes:
https://autobuild.buildroot.org/results/940e7f95fff017b8c7cffb778911ae0386980fa3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-with-Linux-6.13.patch      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch

diff --git a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..2350dc2e5e
--- /dev/null
+++ b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From d71ab09447d9c3043203b5c3b5868e99bc4e0ca8 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Apr 2025 22:00:59 +0200
+Subject: [PATCH] Fix build with Linux 6.13
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
+adds struct net_device *dev as argument to set_monitor_channel(), so let's
+add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8723ds/pull/51
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 53ccef4..75391e7 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -4520,7 +4520,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
+ }
+ 
+ static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
++	, struct net_device *dev
++	, struct cfg80211_chan_def *chandef
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	, struct cfg80211_chan_def *chandef
+ #else
+ 	, struct ieee80211_channel *chan
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
