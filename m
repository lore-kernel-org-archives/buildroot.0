Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA614C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 18:50:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D789761058
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 18:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D789761058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836C3404D6;
	Mon, 27 Sep 2021 18:50:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yllcJ6QW4Zjf; Mon, 27 Sep 2021 18:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F74404A7;
	Mon, 27 Sep 2021 18:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBA631BF484
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 18:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6CF404A5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 18:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdw9uLzeY6hM for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 18:50:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50B674049F
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 18:50:23 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UvhkmzpcSKBZzUvhkmk9wh; Mon, 27 Sep 2021 20:50:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632768620; bh=+BWmwsr4m5qnLaYYrDY8p/MbSpc2i6M+smILkBoXcJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=iE206QPwrY8zt9Pi5Ys8qtaRiXC18gzAitJ8qapOhKh0eViG4RYBO7kBUtu6e/Ja4
 qVBDTXa/vjinTCL/XOnF3AQeWZHzejGzScqTnLe6AO1btrK5VcTwlD8nBVrFQATXp/
 ZAGrnVG7+uaU8aGnmuNtHXNLV5tumR68Ollve2/Cr8Y7AFNljxXtTrXoFl51Ul7YsJ
 EomVcFbkXdJJaz5oFwQdCgEGuwaEmLHgUKNvSRkskmVp9jFASFMOOwrk6r5qTmP9fF
 yFndB3JbgJAcC2cedPCw4kHOZFMG2FhjzvTgP4GVMtP7d3Qx7zQWtdpP1kp7SPZVKQ
 aQnZEbFrsqBFw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 20:50:19 +0200
Message-Id: <20210927185019.1938346-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPWB7fH5tFN5FwWejbcKaF+dFJylgfXj3lFhm9PgwgxJmtRtyC0pbGL+dodhwTcQCHwrXa16I2cYIYOKsiZ6otZJP/1sMtfF0m1sE7F77aa7IpahSRUi
 KcVmzwG6j5lrVuWhqDqrVVeir9aRHh7n4B9XQjXiIUOdPc12sz4kUsrT+QPQ89chzImRpUBRzXTXp2ILL+Kmh5/IOaH9pIsyFxn18foP0PJNMiA7v3jK/sND
 dFEe0np1+S8yIx4ERuNrTW0DFRDkyuUhW3AWDe4hlgI=
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
