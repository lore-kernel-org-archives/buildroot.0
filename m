Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66904C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 07:00:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCD560F21
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 07:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CCD560F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB4280E1F;
	Tue,  7 Sep 2021 07:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFmmhLWcKEBv; Tue,  7 Sep 2021 07:00:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45E6280DFE;
	Tue,  7 Sep 2021 07:00:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3026F1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 07:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FAB24027E
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 07:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFezC28q-EG0 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 07:00:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6951540580
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 07:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F8A9887A5; Tue,  7 Sep 2021 06:58:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 08:57:14 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: cab433a1424c84191537b66e5e026f7106d64c44
X-Git-Newrev: c422bbbbdd0484113b790a8f01af334b0387673f
X-Patchwork-Hint: ignore
Message-Id: <20210907065858.4F8A9887A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] DEVELOPERS: drop Maxime
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

commit: https://git.buildroot.net/buildroot/commit/?id=c422bbbbdd0484113b790a8f01af334b0387673f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
index 8b9023e984..241940ab03 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1842,36 +1842,6 @@ F:	package/postgis/
 F:	package/protozero/
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
