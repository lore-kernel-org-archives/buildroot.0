Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13CD061881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13CD061881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B456640235;
	Sun,  7 Nov 2021 02:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iygAKY78GW9l; Sun,  7 Nov 2021 02:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1913E400EA;
	Sun,  7 Nov 2021 02:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44A7C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3296A4022F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCGnmnJgKl5r for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:40:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id C169C400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:40:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY6bmunjNFf01jY6bmqTO9; Sun, 07 Nov 2021 03:40:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252825; bh=EWIpNADmC/nRZV2ut6dwUV04McJOyIlXv9SETf/+dkg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ovs3gGW1MlHQbEIJiPjPf/I0t60GC1HEf425ce3coCGIt2r+bEfZvnA435/+JyF6V
 YvcPSfelcE+gaSSgw8bdySzCPR3hSrQVoSeauHqpt1j43nDCTnWaN491v0IAKZ9g8Z
 oGiX0OYUhKlcHGHgv6bHyTvQflJNbeKSdw17WG8dIEm3Z83qU0fB0JO9DZli6fCJt5
 p/hx0Q86WHvVv/QJXCoGbTB4Im9set8vHn7KzG7WsBpT3i0shPB6GpI+wW1Ow+jB1U
 K3CUlCCqM0EKdCa5p1dZ8CHudT+Lx98Gov8TnuFp8zJFibgsKQqnxEIBBrLvS651Lj
 mDX1e11W3GETQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:40:24 +0100
Message-Id: <20211107024024.3060843-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOSXAhtmw6NkRv1wquQ9Q1SYqoN1H9kAUfxCFbV+zWDF/q8OOpsLUAJKcId/9plk/xg3KPWzb7iV3CbXcq8PNHf2HlLgTZlzkfqHRVdTCCi6t9t9Pz9X
 TorFYgXeQUphye16xU1t1+Eq+aJh5VMgwa4b10Ec5Ka22m1djzFQqtEuNZWpPQ/sjPMrrVthNC+NGkCU7ygVBK1UouLDCgE+3Ppy5iXofkA+3VweviMqr4ek
 rxrghAASvdQXEj7RqOnZHj+Ai+pUbvIOXaZh+1NIugE=
Subject: [Buildroot] [PATCH 044/102] board/lemaker/bananapro/genimage.cfg:
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
 board/lemaker/bananapro/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/lemaker/bananapro/genimage.cfg b/board/lemaker/bananapro/genimage.cfg
index 190a4b1ff3..9d15f35e3a 100644
--- a/board/lemaker/bananapro/genimage.cfg
+++ b/board/lemaker/bananapro/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -19,8 +20,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
