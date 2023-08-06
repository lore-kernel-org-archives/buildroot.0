Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76FC04A6A
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB35481699;
	Sun,  6 Aug 2023 11:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB35481699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETiwa3oLav8F; Sun,  6 Aug 2023 11:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2261081756;
	Sun,  6 Aug 2023 11:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2261081756
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 895601BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88B740192
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A88B740192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flopBHMIes7I for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:48:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7C28400DD
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C28400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A944C842E2; Sun,  6 Aug 2023 11:48:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:48:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2616272339073834c262bc46fdf995fdaa91acf7
X-Git-Newrev: e4f053c7b0582251c8441def72619bbe18bb78ea
X-Patchwork-Hint: ignore
Message-Id: <20230806114836.A944C842E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: add LSOF_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4f053c7b0582251c8441def72619bbe18bb78ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:lsof_project:lsof is a valid CPE identifier for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alsof_project%3Alsof

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsof/lsof.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 66911dddb9..8d9c1b60e3 100644
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
