Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A591EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36753405F4;
	Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36753405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAPf6C1FLAiT; Sun, 10 Sep 2023 21:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E1E1409B5;
	Sun, 10 Sep 2023 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E1E1409B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651651BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADCA4013F
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADCA4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Z2PAqRFMTt6 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69705400F4
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69705400F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56B1786BC3; Sun, 10 Sep 2023 21:43:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:33:39 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f2a10a4f0d6831136ddfd812545533eebf2225e3
X-Git-Newrev: 5a7695bf97555e104d7722225487ff1c2bc16bad
X-Patchwork-Hint: ignore
Message-Id: <20230910214330.56B1786BC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/lsof: add
 LSOF_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a7695bf97555e104d7722225487ff1c2bc16bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:lsof_project:lsof is a valid CPE identifier for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alsof_project%3Alsof

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4f053c7b0582251c8441def72619bbe18bb78ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsof/lsof.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fd5887141b..f318950ded 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -10,6 +10,7 @@ LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
 LSOF_LICENSE_FILES = dialects/linux/dproto.h
+LSOF_CPE_ID_VENDOR = lsof_project
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LSOF_DEPENDENCIES += libtirpc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
