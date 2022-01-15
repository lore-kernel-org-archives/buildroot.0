Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE34C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 14:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B38C4089F;
	Sat, 15 Jan 2022 14:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tw6AR_icYAHA; Sat, 15 Jan 2022 14:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0964089B;
	Sat, 15 Jan 2022 14:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE151BF293
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CAA34089D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 14:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d66s8MhL90rv for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 14:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90C8740325
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 14:33:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so13329995wmk.1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27r85YtS9T6Pgshj9jS7m8G6RfmaG4MXStIfnKDprx8=;
 b=oufsDgOO+/W2R1o03dq8/Ias/vxW2NczKfLlwT0uHq68Ta1Ma651wMtjG+a3Bu5s++
 Dx0jf0JZFioxABrrxzzjSFZjW6JVIiJAMBcygWhQGKC1VXEs6+QtKbinFWd1a/t+eyyH
 fmZdfq/t0QSz2CQZCdZdDIif8EOsE4aq3vlZdnSVu+LpR7qk25ploiqy8vpLXFBMwPWO
 XLu3ykUTwVlOoytNKyvf7AHsWVNLIBtYrBRqp746GC3xApK4WLVVdHWEQIuI2nCIOVPm
 kI5sAX3Biuu0kRiyxtoPyztKUZGnx9FBcf1eswRepLqmyzdh/GQcNltKh6OlKLFtMV0n
 K8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27r85YtS9T6Pgshj9jS7m8G6RfmaG4MXStIfnKDprx8=;
 b=UQ7AUE7tVONtynF2/bRj1ScV5PYtvnAjNvpw8D9MTUftZ0e18cG4vdbdHAh1Yz2vWw
 N27X7lSDoYB27in68eS9t3jiOf8NQf4vub23v3ZsER6xYHGi9lozXHop5Rdv0jglt1OZ
 BZxqOk1UA/wZVhugRI0z3pKvcxYlH+vDSPYusC0dtCD9Ex+6duPOEE1sbqRJS3dH+v6h
 iDlju8XTBgZzBu3NCFiwRNdVSAgn6SZMQtwS6OUU9oBv0F+TYFpYPxvmtlZJyrJCwhdm
 7ykCawZqfaPenKA2AB/KZc8uKOsyoAX4nZN6cyBv4vNBAm1/qLkWmy0siIqYCyW6lU8o
 8dWg==
X-Gm-Message-State: AOAM531t4RxrmG7wMo1VdLwIwnQxs/qrUEl/vn2EkKUhRwIUwn2Iiex2
 Jum/pw0RTNJ1euMUaknrlGmraKBbKvQ=
X-Google-Smtp-Source: ABdhPJye8kJh5ZGYvp2ho/ZU3un1nq+jPAzgvjafi2MtwJm0No6g7z7PWtHmO9ivjEy9b+r06Mo1wQ==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr12320301wrq.206.1642257227843; 
 Sat, 15 Jan 2022 06:33:47 -0800 (PST)
Received: from atlas.home (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr.
 [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id b6sm4754512wrd.17.2022.01.15.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 06:33:47 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 15:33:43 +0100
Message-Id: <20220115143344.12319-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] board/qemu/arm-vexpress-tz: use enable=on
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Qemu 6.0.0 [1], a warning appear in the log if a short-form
boolean option is used.

[1] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ccd3b3b8112b670fdccf8a392b8419b173ffccb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Cc: Dick Olsson <hi@senzilla.io>
---
 board/qemu/arm-vexpress-tz/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 7e62e943a6..3036dd54ca 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -16,7 +16,7 @@ from the image directory:
 	-smp 1 -s -m 1024 -d unimp \
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin # qemu_arm_vexpress_tz_defconfig
 
 The boot stage traces (if any) followed by the login prompt will appear
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
