Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C469C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 23:26:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A16610A2
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 23:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01A16610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE8E823E3;
	Sun, 26 Sep 2021 23:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMt8sZvReZJI; Sun, 26 Sep 2021 23:26:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC079823A0;
	Sun, 26 Sep 2021 23:26:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237C21BF30D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 23:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1293260769
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 23:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17TPCeFyiWsD for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 23:26:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97D2260764
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:26:36 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UdXVmcG5UyP2eUdXWm46YM; Mon, 27 Sep 2021 01:26:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632698794; bh=+BWmwsr4m5qnLaYYrDY8p/MbSpc2i6M+smILkBoXcJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=UEacHUORZXe+PKax52l4a+BeTkeeNNl7Bbs8DtfZ866woG2uGLK6zoSHw3feIbK9r
 6lftItpgrSB/B3QtElmPqupVecZt5wkEfTe8jGp+E8ClWA9A9B1cHgOZdYDWlBDMbN
 2/d5yERKamH2TSJVx6ehvLTCvEiCKLhOdOSRTds+VDXbAJPfEVLZLsCcxQZcH6zn+R
 kgkzZK00LG5CwiksEGx3PuNhlHITjO340H6IysHqF4iLPnh+YPjF4/4gj32L/gdyB9
 P3LzvD40eqjW1o0ktyM/YA4iAmoRMssDuBQRbmS8watKrX1lXrC0bxaF9+hGZRIdYn
 ih7qXQMKWfmiw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 01:26:33 +0200
Message-Id: <20210926232633.360345-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEsg5v8cbFvFsKCsZeAXrWibc2vUEzSB0/VBf1p8YAb/1qrL+LAfNg3SW055HTKM15aLwZt1XbJ22HwDGj9M5eAno7h17qbkEuHYT12VVJq5PsGZ0U+d
 0mm8e9wAmKa1tJqhAeDDuK+56LFV8Jdn0dG9l6udZ1wKrtCQ5wkj0nTYmVNFrM0/EdHa981p4wUte/zC8T34yuyPZndmSDCRc/feEkyyXjiadQvrEF5Scbvg
 JFQ+Bf9+bD71wKANlGth2fjcPzcGMQpEna9lQTYTWio=
Subject: [Buildroot] [buildroot-test] scripts/autobuild-run: extend timeout
 from 120 to 180 minutes
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

During the last months some package started to timeout, but this is not due
to toolchain infinite loop. I think it's due to the increase of the source
code files' length and to complexity of toolchains or even slow compiling
time. For example python-uvloop and python-lxml only take long time to
build with -Os optimization and this makes it seem a TIMEOUT but it's not.
So let's extend timeout setting from 120 to 180 minutes to avoid false
TIMEOUTs.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 346928f..0636368 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -176,7 +176,7 @@ else:
 
 # A number of packages can take > 60mins of build time (e.g
 # gst-ffmpeg, qt5webkit, mimic)
-HUNG_BUILD_TIMEOUT = 120 # mins
+HUNG_BUILD_TIMEOUT = 180 # mins
 VERSION = 1
 
 def rm_ro(f, p, _):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
