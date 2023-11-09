Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C6C41535
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 444FD41732;
	Thu,  9 Nov 2023 17:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444FD41732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhxXP5S6WgOZ; Thu,  9 Nov 2023 17:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBACE416F3;
	Thu,  9 Nov 2023 17:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBACE416F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 928091BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A2E4416EA
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2E4416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vProml5ssdWx for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72F1B400AF
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72F1B400AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DAED86E17; Thu,  9 Nov 2023 17:25:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 18:18:23 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3434b72fabf3f7c2ed244bca840f418dadc05264
X-Git-Newrev: c6cd83c5fc20e710ae039bd483c62bf57d9c4208
X-Patchwork-Hint: ignore
Message-Id: <20231109172543.5DAED86E17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/traceroute: add
 TRACEROUTE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6cd83c5fc20e710ae039bd483c62bf57d9c4208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:buc:traceroute is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/399C82DE-9AC7-4C48-8E9B-57C480E95FF5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 707c2c70bcded1d2af51a764f6e2ab963d5705d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/traceroute/traceroute.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index a02982a6b5..155e134c68 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -9,6 +9,7 @@ TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/tracero
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
 TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
+TRACEROUTE_CPE_ID_VENDOR = buc
 
 define TRACEROUTE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) VPATH=$(STAGING_DIR)/usr/lib $(MAKE) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
