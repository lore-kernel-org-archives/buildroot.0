Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2C1C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D1C61353
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5D1C61353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B3240249;
	Sun,  7 Nov 2021 02:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9_OQbNRYt55; Sun,  7 Nov 2021 02:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52A91400EA;
	Sun,  7 Nov 2021 02:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A43091BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94344401FF
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxlmWYTicq9r for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07AA402C4
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAZmR7YJ; Sun, 07 Nov 2021 03:44:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253071; bh=oQxHgNq4IxSU+iNMO0RmpwnmI0ts+rG9LVgpdMRl/Os=;
 h=From:To:Subject:Date:MIME-Version;
 b=byrgF14Lgsj3PMIxa7cNTValootuauprViVl15u8Q7O9aNtiY0Dk9Mi+ccIRA0Gp/
 huUaqkAFop8YSr/jMH15iA0ckeAy2ohW98lYNag+je03nxr+FtHx1qXbBnt9movYW3
 aDLrD9PSGau3A3HJbyD+dIh17UmSxFHMzjSVF+tTqRUG3BLVGsKfW68oMsbkX4tSJJ
 ivSU4CEdJUqyxBy0M6FcuM4GH4td6iz9Uv4V+Cuf8rFxngal3JVPdvNWxB7BMjQgiJ
 OGg137mEZFXNmQl00iHlCY+N/ykm4uvEbmPRhAJOazOrnSTfJT+Zf3gVnPVGIm/53Q
 R/p2Sxl542Aig==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:06 +0100
Message-Id: <20211107024330.3061378-19-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFGpBRkStOYVBxrjk5IpGuQdUeZR3VuqK8V3SngId6553UTxDUF9LMXWM4nzuo7ycJzkou6qJz1hMTZLJ8ntc5ZE3veW7Od5MXwGMUgLACffBxbQtVg9
 1iNAUZFPmWP60+4tlToSG85MqSJ0JSe1ML9YO0e3xZkOxZogvCyhA6OF33Lxij0OJCw4wBTTPugKnm3TVwKY5Rs3SlaehLTSKj3XOleQ9EJCF/eTm7fxOKIn
 WzyWWxKsxH/pjnZxCdEXSOGpLuMO2kJf5xCYI9/0jf8=
Subject: [Buildroot] [PATCH 078/102] board/radxa/rockpi-4/genimage.cfg:
 beautify file
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

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-4/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
index 88986df34d..197968320e 100644
--- a/board/radxa/rockpi-4/genimage.cfg
+++ b/board/radxa/rockpi-4/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 112M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
