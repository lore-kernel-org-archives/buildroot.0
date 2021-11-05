Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AE7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5873F60551
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5873F60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232C36F933;
	Fri,  5 Nov 2021 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9jvVPvFmSmh; Fri,  5 Nov 2021 22:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971FA616F4;
	Fri,  5 Nov 2021 22:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5791C1135
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86C474023F
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUEX5yVLB4XR for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC6C4021E
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:18:05 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j7X7mGJ7s5cjnj7XAm4SQo; Fri, 05 Nov 2021 23:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636150684; bh=13aVh6EtMwpasFgraATAX9OdjrId2icrnevxd8KUWjs=;
 h=From:To:Subject:Date:MIME-Version;
 b=bzWYS9D6sbZrzo7ebyd0Zv3NCCpaAcZE8j7nEOlURzdpo8mDEf5DbJ7PbOom0Sq72
 RWolCAHI2Gz3dXd4mS5Qnp0kEE/FfzKq7BUahW2lzzkmZh0NuNMOX17r1YbEso3Rsl
 f8n2MosfGXWnicQU0mAgXperTvtlu8Sc0fKw4uqLmB0Bp8dwW4DPIguyee9iOo/mSZ
 tlGMg2V/wkW5r51XxO3S3UTkfYWB5JIyTmyrvjRId0/K9e8mx3Ff41PeMB2uwoq9Kp
 ll1TCF/BNzNWRoP7MZSTO6ci5ImdFhM+NG5JpRmlzrLemopb0Q83nqsIVWXeDqgEHB
 W/r9rDOCZpzlA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 23:17:58 +0100
Message-Id: <20211105221800.1451167-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOuHqB/AsrfbwSp/Jg8IIzGkqmseWPG9j7e87EzLP2qtofVhdrXaU/SY46oywQAvOrh2c42YkEjMvZxox0WQq7Ww9AIFUbChcMg+EEQwe5jZAA6OTOjU
 7ahzxEeitwkGTfdB+sXuaiUSIWCKyN1EBenDiB2/sjGC/4S9YIzGm4fhCoL8kHKN6NJGh/o6M5evrje7/CSfUUAzL2T1Ifuvo2wWks4vFvsENKP9yVPCDNsL
 oIY9tAESptIeZc5mts8B7CiXW37jCN3Y8jAuG3tPfxX0UEPdt9k2mdCaVi5+bgA2aQ5hY6x07qDb1f0zmQROzIK4ePU4aibF/SzjOBTeSpobTs80dY26IPjT
 YYSx6LAbUCPcVCAvj1LL1GxO6LL/sp1O8LLlGMCodtOZArYPgXtMDn+ffHaaPPIoWqnY4k9MbQezz4zixytq4K8GgXqotlRhi4P923hQFiQTx3iLHgS1FITk
 hCZNIQ0wNerQ7aA+Xtkl0MvPQvPjRqGxKEvxu0Nx8SPcyUnmpa+x73BuMA8=
Subject: [Buildroot] [PATCH v2 3/5] board/olimex/a20_olinuxino: add
 linux-disable-lima.fragment
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This Linux defconfig fragment is needed to disable Lima driver in favour of
Mali(if enabled). This because Lima is enabled by default in Linux's
sunxi_defconfig and if we enable Mali driver in Buildroot it will fail to
load. So let's set CONFIG_DRM_LIMA=n. Of course this fragment is only used
by Buildroot defconfigs that enable Mali driver.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/olimex/a20_olinuxino/linux-disable-lima.fragment | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 board/olimex/a20_olinuxino/linux-disable-lima.fragment

diff --git a/board/olimex/a20_olinuxino/linux-disable-lima.fragment b/board/olimex/a20_olinuxino/linux-disable-lima.fragment
new file mode 100644
index 0000000000..a992902dda
--- /dev/null
+++ b/board/olimex/a20_olinuxino/linux-disable-lima.fragment
@@ -0,0 +1,2 @@
+# Disable LIMA in favour of Mali
+CONFIG_DRM_LIMA=n
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
