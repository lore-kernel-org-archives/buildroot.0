Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5737C7618E
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 10:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5083E81951;
	Wed, 26 Apr 2023 10:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5083E81951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYf_rovvQSVC; Wed, 26 Apr 2023 10:48:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C3C2817C3;
	Wed, 26 Apr 2023 10:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C3C2817C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC7C1BF5DE
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 10:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7DDE815CF
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 10:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DDE815CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKpSBSN5FTVV for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 10:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88EB2819B8
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88EB2819B8
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 10:48:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 07242CB1A1
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 10:41:29 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 95B0BFF80A;
 Wed, 26 Apr 2023 10:41:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 12:41:02 +0200
Message-Id: <20230426104102.1211757-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1682505685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mM5EHtB8aQ7CsQBQl8CvG2GbWlvrSvUc3U+lyGLg44E=;
 b=TfEzQdx07DdlSGTkkRDUfwL4nNgKu7wuy/+TFGQ1iAj9kYjYwpr+vdBHR/+vvHmfs41kqr
 tMVCXlmJOXNZnZGKfz+OeriIW41Hck01FtgkXC4D3Wz3QW4SiNLXqIIEmF3XD/i+3tTMOC
 3B2a1xWF0FpNesCJMRthNmKL2N3aETMyQmGXFKoNkM7WGBV04s3OH+y60HyBgbuvGTvWIv
 t2fvzF/XwZ9NUxLOJsVR/LmPcBKLeQACCBU1J6MdWgvhcTM7kVBH80LyuSrmhnHo+9vGuI
 LGWWJg0tKVXDtzZ0akqxjVQZS2AHfb196ikevE+fgaR8b8QPUJVSIp3w3EEPlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TfEzQdx0
Subject: [Buildroot] [PATCH] boot/uboot: document that the zynqmp pmufw can
 be in ELF format
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This feature was added in commit d07e6b7071cf ("boot/uboot/uboot.mk: add
pmufw.elf support"), document it in kconfig.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 boot/uboot/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f5c20f51688e..085397d03d0c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -492,6 +492,8 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 	  (e.g. http://...), and it will be downloaded and used from
 	  the download directory.
 
+	  The PMU firmware binary can be either in ELF or BIN format.
+
 	  If empty, the generated boot.bin will not contain a PMU
 	  firmware.
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
