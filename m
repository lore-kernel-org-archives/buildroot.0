Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F145C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C744102A;
	Mon, 18 Apr 2022 21:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZMKbZZQ1yQ3; Mon, 18 Apr 2022 21:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E5AF4102C;
	Mon, 18 Apr 2022 21:00:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 207BC1BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DDC460E1A
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kly4cxg38o1k for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 21:00:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F85360C1F
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:00:51 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r83so853059pgr.2
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYu23FVsGK0DTHW7huIdoPgaJ1W7kFg1OVRtIlROvHE=;
 b=S/rScEv+NJY7eQ2Z6folnEomnSLrVD5d/rv+itCZ35qDwckdVCb2HAO8EybPqWM3eI
 o13PuqzR2OrvzrLcWaQN7H9oag3mYci0cf75WwbU+IHZDY9SeVpJwdsR7fJy/+G31SXV
 aZWKD7236/Xor0JUneKH089kJnJTiOjFZLBQaxQ0pIhsa4k5VyIBjr9vElg9w9Y07zSY
 s+4g6zAVTNZOBlmkZyj0PrLWJXbRlQsV6Wx3W0X0RUQwmDtvt2VWZHtGc8SJrUIuKb0C
 zKAgMEEwY3CvS88sQ/1SE93+pcs+6ptEBuajXLOtv0ElnoPVnxyHVSnRZ1ZXegltXXIO
 DgiQ==
X-Gm-Message-State: AOAM533lw1g9sPuGc0kOYLH5fiJ8kbmukwXY0FDSktK2PR8MDU4fXZy2
 Szl6nhUbir/fS8pi83VWY+NkCS13wr+B/w==
X-Google-Smtp-Source: ABdhPJyOuchdDp3b2D8lazIzVz4HDNEky0P0GymUEr6L87J6WvntRAQ0HOkeVs8vG923wfuh4ygP5A==
X-Received: by 2002:a63:5756:0:b0:36c:67bc:7f3f with SMTP id
 h22-20020a635756000000b0036c67bc7f3fmr11734018pgm.389.1650315650512; 
 Mon, 18 Apr 2022 14:00:50 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm13383696pfo.2.2022.04.18.14.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:00:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 14:00:46 -0700
Message-Id: <20220418210046.3061780-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/qemu: add symlink to target
 qemu-system
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Scripts which use the buildroot host system to execute a qemu for the compiled
buildroot output can use the symlink at host/bin/qemu-system to execute the
appropriate qemu-system for the target, for example qemu-system-riscv64.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/qemu/qemu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e69e813059..1fcb949ab3 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -399,6 +399,12 @@ define HOST_QEMU_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+# install symlink to qemu-system
+define HOST_QEMU_POST_INSTALL_SYMLINK
+	ln -sf ./qemu-system-$(HOST_QEMU_ARCH) $(HOST_DIR)/bin/qemu-system
+endef
+HOST_QEMU_POST_INSTALL_HOOKS += HOST_QEMU_POST_INSTALL_SYMLINK
+
 $(eval $(host-generic-package))
 
 # variable used by other packages
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
