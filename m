Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FFCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 07:00:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9084760F25
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 07:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9084760F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631A4404DF;
	Tue,  7 Sep 2021 07:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMZEXpZA-J_v; Tue,  7 Sep 2021 07:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C279F40270;
	Tue,  7 Sep 2021 07:00:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40BED1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 07:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C8F640294
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 07:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zqQ7khQX87u for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 07:00:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5810940237
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 07:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 39AEC8879C; Tue,  7 Sep 2021 06:58:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 08:57:06 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3631e0084e37377693fb15417bb69fc9d2bcf025
X-Git-Newrev: f9d63a74df5ee310bc73cb1f4d0eb88f599522c9
X-Patchwork-Hint: ignore
Message-Id: <20210907065853.39AEC8879C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: drop Maxime
 Hadjinlian
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9d63a74df5ee310bc73cb1f4d0eb88f599522c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Maxime has not been contributing to Buildroot for several years, so it
doesn't make sense to keep him in the DEVELOPERS file and make us
think that those packages are being maintained and to Cc: him on
patches affecting those packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a29124febfb0f59d6a97d2cdede95c853eaf87e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a15b76680..5c252845a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1824,36 +1824,6 @@ F:	arch/Config.in.xtensa
 N:	Maxim Kochetkov <fido_max@inbox.ru>
 F:	package/timescaledb/
 
-N:	Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-F:	package/babeld/
-F:	package/dante/
-F:	package/faifa/
-F:	package/initscripts/
-F:	package/intel-microcode/
-F:	package/iucode-tool/
-F:	package/jasper/
-F:	package/kodi/
-F:	package/libass/
-F:	package/libbluray/
-F:	package/libcdio/
-F:	package/libcofi/
-F:	package/libenca/
-F:	package/libmodplug/
-F:	package/libnfs/
-F:	package/libplist/
-F:	package/libshairplay/
-F:	package/linux-zigbee/
-F:	package/netcat-openbsd/
-F:	package/open-plc-utils/
-F:	package/rpi-firmware/
-F:	package/rpi-userland/
-F:	package/rtmpdump/
-F:	package/skeleton/
-F:	package/systemd/
-F:	package/systemd-bootchart/
-F:	package/tinyalsa/
-F:	package/tinyxml/
-
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
