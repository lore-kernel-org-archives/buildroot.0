Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EAD5416F3;
	Thu,  9 Nov 2023 17:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EAD5416F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwMregUZZRhz; Thu,  9 Nov 2023 17:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9538416EA;
	Thu,  9 Nov 2023 17:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9538416EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6721BF2B6
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2C4827A0
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2C4827A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbG4iYr7vCGN for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ABF782798
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABF782798
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AAAF86E2B; Thu,  9 Nov 2023 17:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 18:18:37 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 84fe0a157c3da75ba78a49b63086385fbd4bb9f3
X-Git-Newrev: be438a4eaea24ced11a508f12e300e58e8755362
X-Patchwork-Hint: ignore
Message-Id: <20231109172655.0AAAF86E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/traceroute: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=be438a4eaea24ced11a508f12e300e58e8755362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
