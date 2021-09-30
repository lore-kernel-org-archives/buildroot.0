Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA34C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FD561A65
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 23:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69FD561A65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36FD940376;
	Thu, 30 Sep 2021 23:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZ02hgApbgzi; Thu, 30 Sep 2021 23:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FA7240375;
	Thu, 30 Sep 2021 23:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD31D1BF352
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA02B82E9D
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 23:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOrTWc7Hm-Fp for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 23:14:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59E068276B
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 23:14:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W5FwmerLwnxSqW5FwmqyHL; Fri, 01 Oct 2021 01:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633043664; bh=+BWmwsr4m5qnLaYYrDY8p/MbSpc2i6M+smILkBoXcJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bMWvxYx7P77QsSSAWTVDc1JdI5kyBLVoUJfdf0rGBdO8nOidT8rIpd1vx0hVB6yMU
 CIzDce0HpNk0o+kd5RYAeXHQEgSAVH271ZtxZGQAs5GRu1rSsDa3Ge+YoJ6SHSYaKw
 /0LWDdn/4nAhyWSCkRkZG9eArP160zA8hYpCwzq17i03pvhJ747OTg8E+JdkDg0tri
 aq2Wxi4qH+0SShdTd2YfT2QYNYrV99iOFTcbz7n4UUeBHAel3FiB6WITIL398WdhVb
 Qhlvu+juGDXfvgvbB5ffdOvUM1yC8iu1wna5pu8QgJG5MOANJ+GB8g3XucwqjSlTQE
 HD02bmYrrgVeA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 01:14:24 +0200
Message-Id: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJVkUO71uSwmgxFabRTAOCgkTR5NgE0W1ND9eBVzU9ofD5mkqHb3o+KV96CTayteDQzycCetaMKc2/96ApfX7R6fv/6yoBvf005oZlDT1RXjPis/XO37
 12U87RmNRs+2NSl+jiz7C60f8xVD57BY7zUW7fztiBXzMAijbVvV/mFFNv+bb1anYVQ/CBLUAoAZNOR0/heN40Wn7iDfhq99M2o6IW6tnUg9jYe46eQPwCml
 00y/YYylHuBGtT/eXZsp9Yk8rjPcVXsLZvhCfrQRcIQ=
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
