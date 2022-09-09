Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D6FECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 22:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13AB4842E9;
	Fri,  9 Sep 2022 22:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AB4842E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8I2Bm1i9obOW; Fri,  9 Sep 2022 22:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35188842DC;
	Fri,  9 Sep 2022 22:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35188842DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B39E91BF300
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 22:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C9F960BD4
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 22:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9F960BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIIljiMzajW6 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 22:23:06 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1202B60F2F
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1202B60F2F
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 22:23:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WmI3oLW0hy85RWmI4okpN1; Sat, 10 Sep 2022 00:16:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 10 Sep 2022 00:15:59 +0200
Message-Id: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCXA5o+S6wQIfhqORRyiO2n95jW1BAy/xFSQjKBTU4yJqOWvDLn9qU5svtXvbmOZ2yOBZqwmnCGwiaVqtMJQOCmNTs07uLHuL1uwnYydDo558sSOx7xN
 2u4iQKefIMksfNMOsxm5xtk75/hpXQQfQUP4vSHAGMI38+xSVzzJLGPRNnAs2bMrwLzPOT6SOOVfzJcJpRTqkbsCNhr9wTnYsAOKXqQ0mAxd4jXEzMT31+cX
 Ra6mz9vD+4aO3hqY4SH8n2dRzSF7qjFPewAfmspBmaJqFY847IlghRgR3DjbNjSk
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662761760; bh=eUM4cZnGr/57v06LxyzQoK3LPpUQbOsPy1JRXjGNBuc=;
 h=From:To:Subject:Date:MIME-Version;
 b=bbTcJzxdRhXDdBhu7pJK0YAa/nVDB2IU9zB1Tztl7qVDrwbAoAD3X88RBzg68z41t
 MXJ7uN++TVsdQcQp6he1XDAwrWQUWzm6Qwi/ZWjz/BZFgUDifkzRdVmpZjSlpotvMT
 JzZRQwCxkprW4cclnb/Ee18b5S4xrL01/kMqsywDhn/j3YfqMdNX2zEHIvvq0knD9k
 CpSJJ5/i2KVIoaOFgbF+To0VjmN/KK0cst37zbCKGO5NpgO7CWOMijjF8BdoAeTQTH
 5z5eRkCtfCR4P2qzvY2WYTbT4ZsUc6DWT1LJQr69kbzXhdZ9w+Ygb5t1MT4SCt373O
 lo/xk55bqzGQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bbTcJzxd
Subject: [Buildroot] [PATCH] package/sox: work around gcc bug 68485
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

With Microblaze Gcc version <= 12.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building sox with optimization but not when building with -O0. To work
around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sox/sox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 1896437ad4..d0329bf50d 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -26,6 +26,14 @@ SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
 	--disable-stack-protector
 
+SOX_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+SOX_CFLAGS += -O0
+endif
+
+SOX_CONF_ENV += CFLAGS="$(SOX_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
 SOX_CONF_OPTS += --enable-alsa
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
