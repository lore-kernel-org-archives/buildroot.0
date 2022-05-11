Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82319C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 00:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F9D831B0;
	Wed, 11 May 2022 00:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJdxcYrbhlb1; Wed, 11 May 2022 00:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0265831A7;
	Wed, 11 May 2022 00:40:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 999411BF9B2
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804D960FDB
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZeHWK-rf4un for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 00:40:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82CEA60B59
 for <buildroot@buildroot.org>; Wed, 11 May 2022 00:40:12 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id c11so318817plg.13
 for <buildroot@buildroot.org>; Tue, 10 May 2022 17:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YsrjfNM2dVMkbIKWSWMQ4pdroJluAYiTCvzmCoRkN2g=;
 b=wyDNSwAv2JjLIw4vVjE8t9AFmLyKizdbhdDAkQWa8nk46G0GnC8ZUUI0yQ2HI1dlH0
 i+2N6/sCTHkyqi754N8l+6ekUt/ui08n95/Dsy89Xmsb0uQxXlH4t54L9EfA0Mg1C9eU
 yKYMmXxxB6M4u3lh93a4Gn5VvYzgwC0/Q1D/tT4mG+kLA4PpRRx4RejkWB6GPnYa0JAv
 qoAitguEbM+oRq+vgn4ebHLR8u0vT8+jRyGoaNQRAq0AcaPwGjFtcYfQ4j8eQPrCYOav
 6VZD3Jl/29556Aa18lDEWaRE+DUku0wYfz8Q5XcXZYXURBluX1eTHcwo7inDk5xirUxE
 7pQg==
X-Gm-Message-State: AOAM530i7HvxSF3MoqPbPC5T+FBRNzXAqK/XMgvqIgZobTQMpq+R3V02
 SOL3gIu42BdrIQyfDOF0enIGEh7du864Sw==
X-Google-Smtp-Source: ABdhPJzrf1ZR2FCYZaVrCfvnF9NX1o4Te9nAoQQ+2vDekh31ub2rJxlBiI4GtVtNvC+QY3Jc6gOv6Q==
X-Received: by 2002:a17:902:7296:b0:151:62b1:e2b0 with SMTP id
 d22-20020a170902729600b0015162b1e2b0mr22481266pll.165.1652229611426; 
 Tue, 10 May 2022 17:40:11 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 g1-20020aa79dc1000000b0050dc76281e1sm144875pfq.187.2022.05.10.17.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 17:40:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 17:40:06 -0700
Message-Id: <20220511004007.3630-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: add symlink to target
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
index 9c2b819174..1bcffc2340 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -400,6 +400,12 @@ define HOST_QEMU_INSTALL_CMDS
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
