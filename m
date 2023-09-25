Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F8CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 14:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A3E81328;
	Mon, 25 Sep 2023 14:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A3E81328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlEoxj4BsyLw; Mon, 25 Sep 2023 14:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6F581F50;
	Mon, 25 Sep 2023 14:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA6F581F50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D15AF1BF5B4
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA38841974
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 14:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA38841974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBiHADYZ63TB for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE2E741966
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2E741966
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99C0187783; Mon, 25 Sep 2023 14:03:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 15:50:49 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 1c896ee8c81d31b1a39fad76dfe1bbfafb9bf831
X-Git-Newrev: 93921d96d53f17015c1d67f4d4f581194416c7c5
X-Patchwork-Hint: ignore
Message-Id: <20230925140304.99C0187783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/sysstat: drop
 CVE-2022-39377 from IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=93921d96d53f17015c1d67f4d4f581194416c7c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

As off 2022-11-22 CVE-2022-39377 is listed as affecting sysstat
< 2.16.1 instead of < 2.17.1. The text is not updated, but the CPE info
is.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6425e0b8482e53d5ab5ff2d655628ba7d4be3960)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index eaf505dc49..377396d986 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,9 +14,6 @@ SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_CPE_ID_VENDOR = sysstat_project
 SYSSTAT_SELINUX_MODULES = sysstat
 
-# NVD is not up-to-date; 12.6.1 includes c1e631eddc50, which fixes the issue
-SYSSTAT_IGNORE_CVES += CVE-2022-39377
-
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
 SYSSTAT_CONF_OPTS += --enable-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
