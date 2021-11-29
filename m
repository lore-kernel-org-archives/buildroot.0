Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5861C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70815403D3;
	Mon, 29 Nov 2021 22:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-P3N6NUAXoD; Mon, 29 Nov 2021 22:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93E3740332;
	Mon, 29 Nov 2021 22:33:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D231C1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA89540332
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDERU-iIkmxG for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:33:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCA18402E9
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:33:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j3so40093218wrp.1
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Td7TkmQSCsrx7RTziHmjIUTAwKbt1KJe09Bgb2uPCCA=;
 b=BD4XIW4yLUKJCWi4twcj7TpTNwk4ILSGgj03nGYXY6Btwr/iEv4IjPQbjIfxupqH+U
 GxKC4xpd4irpexw4XEN5H8rs3dGY0gFG5Tei9mS+jfBfxa5zDgGXV0ogucA2mYFoGUaQ
 unlWdNDJ7X2Sfk6zuB+l4dONONH3DfeY0x/2Iqa6UCLaqQPiUaqpsF/2zoluZOjrKa/z
 zDAAIPHqZmC6SxiOJ6a5FvQ1zyI3Wz8OQymrej2yEA4htaWhLgLERVluzFK+hFl3zb3U
 ybfoesSizS0wOtpVQUmE/jJBXeUcXmTrMUER7eubQSR7SOgDW490MuKY3L0UBpe170aX
 DMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Td7TkmQSCsrx7RTziHmjIUTAwKbt1KJe09Bgb2uPCCA=;
 b=wzQ5/+2MYIha3gDNMVNGisEbBlJBWHufa6aawhRr8ry+udBggVqrgVY/fOqVcdm290
 3tSiRq4OVgr4PMXHNDN0H42ONFOtnV58rembllUF+NENHCL+zx8ro+LlCvYOIYJeZa2F
 +DD2As9c8BAJG7vUwIaqQEtPe6YEOQuGGNFTNO0uPTVqmtS7HCgmSf1PMxU5c41bYrCH
 U/pdpzxMcIOIpeTitw4USbYsocmN7s8FPeAAa4RpVDjTN2K2NlaHuMOoynHqJrABXYFY
 T5FxUvHnpvX3sfKzCaY33HMCMGSR0SFZ4jKhrgRZ0IHZMY8hpM4HJXH1aJgUpd8pkbR2
 KLYw==
X-Gm-Message-State: AOAM530qlB7v4O6We2bQHOQauwy9/jcimHzzRwrCuR7/9dg+przehxW+
 yiOkAaXiUd2uX2mea7HNaVXZWRXpFbA=
X-Google-Smtp-Source: ABdhPJzMQYCu+dWDFMjFd+Wa/E73w78lf91xqW5uJFqDk3N+JtIa3Wfs1+3YYKWSC5kuyuov3k3DFA==
X-Received: by 2002:adf:eb81:: with SMTP id t1mr38611112wrn.604.1638225217926; 
 Mon, 29 Nov 2021 14:33:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id p14sm503934wms.29.2021.11.29.14.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:33:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:31:03 +0100
Message-Id: <20211129223103.2186171-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/initscripts: drop spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
89d39fc7a392530be043bac541ade0bef746edb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/initscripts/initscripts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index cfee155570..2e997dcd6f 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 define INITSCRIPTS_INSTALL_TARGET_CMDS
-	mkdir -p  $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
