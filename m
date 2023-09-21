Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC97E7D0A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 18:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8F6483C86;
	Thu, 21 Sep 2023 18:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F6483C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EcpzBdVcydX; Thu, 21 Sep 2023 18:37:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BFF083C87;
	Thu, 21 Sep 2023 18:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BFF083C87
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBAD01BF98E
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A520E40930
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 18:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A520E40930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2f-qNcX76yz for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 18:37:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3EB340235
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 18:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3EB340235
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0AE3874B0; Thu, 21 Sep 2023 18:37:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 20:30:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b764a7d1e6961cb7baa0b3a74de1167bf47a6dd
X-Git-Newrev: 6425e0b8482e53d5ab5ff2d655628ba7d4be3960
X-Patchwork-Hint: ignore
Message-Id: <20230921183721.C0AE3874B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysstat: drop CVE-2022-39377 from
 IGNORE_CVES
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6425e0b8482e53d5ab5ff2d655628ba7d4be3960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As off 2022-11-22 CVE-2022-39377 is listed as affecting sysstat
< 2.16.1 instead of < 2.17.1. The text is not updated, but the CPE info
is.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
