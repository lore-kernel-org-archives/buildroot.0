Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1D7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 00:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B67FF60A98;
	Fri,  4 Feb 2022 00:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-H--ze-T6AP; Fri,  4 Feb 2022 00:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03342608D8;
	Fri,  4 Feb 2022 00:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45FC41C1135
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 00:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E46D416E3
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 00:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0w3iLyGZ7kv for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 00:07:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E69416DE
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 00:07:02 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Fm7vntqLpI46dFm7vnx8rX; Fri, 04 Feb 2022 01:06:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643933219; bh=ooSuIKyLhviQNzXIq+DNF2xzkeYLlXqnMRBij5bbvCY=;
 h=From:To:Subject:Date:MIME-Version;
 b=c4sc/a1ky3KgKg/9sGyfagG3ljub0PpR1VC0IaGYiAyJ/SS+rcE6SZThzmuzNbD/E
 f8UKU0WsstgfEYNW0jzkuTAtYKG3qzNHBzJaGhVyy6NR4xFq09ZYurYeuVCderoF7l
 p/kENWjMcOqk+5TZgXaP6FX1dE8FN6VgHJo5F3iaVTBbhVhEv9R1jd+0eC0clmWSN2
 sUqg3jazQEpisy515XZUPFqVkL/UbCHs4Kkj0bRP2UFsZktbF58MD821476MVep8eF
 STyO+tCk9mC9AQElhhfDz8WAzVQj3isZAX1Mwa/WS8krVau5QV881hguhhDVdVAKP8
 JCy7XmqDO4ELA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 01:06:57 +0100
Message-Id: <20220204000657.747245-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHify++x7QxkNMkc5NPsgzZPU0DNjWW2HPwBFasqr6rr00i7mNTMx806Dd1x+rr5og9mDR2OsDYYV3olxkIbHAGXpEskay4ZenXdpQinHuj6YcosZw33
 2JKbg+Fx9VzGB7w9BFXaRVvqcEGm7k02VF02gjanFuIsJutTg8ChP8HYhVtC0BM5+GCodhxRlz9c83eDHjN7KYdGT6rOpH+0iEwnfiOgGDMd+j/LQGLUxCsV
 6RHgwmm0lMXt6aul1+sMWe19WZyXui+qUB7v84BrnV/gH8rgfYn+Heanz2tCz1KyZgB87xOagneVNLygqFoAmA==
Subject: [Buildroot] [PATCH] board/radxa/rockpi-n8:use partition-type-uuid
 for genimage-15
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

So let's use for EFI System partition:
'partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
and for Root partition (32-bit ARM):
'partition-type-uuid = 69DAD710-2CE4-4E3C-B16C-21A1D49ABED3'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717242

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-n8/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index 2e064d48c0..909a646499 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
