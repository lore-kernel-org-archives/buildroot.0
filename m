Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D91C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6733C817C0;
	Mon, 29 Nov 2021 22:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5srE4rgyVLuo; Mon, 29 Nov 2021 22:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD8F81839;
	Mon, 29 Nov 2021 22:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40D0A1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C0D81839
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXx-Dinz2ybY for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:22:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8BFB81064
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:22:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s13so40077288wrb.3
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUlnP884hqRhYjQ+KYaeVoaXFhw7FNSUM4fAfkfPy9I=;
 b=Hn7RSQcZ1Cwzi6lXLYXRMUX0LuKv5GU9x/Sv4H4RAK/7V3LCDhRo58U/Puz4VAVYXh
 tLtIvu+kMBymUps35mAt36IrZPCG1jDiOp+lNcwJLCZ+TVYjUPFzASM6GFIfBlSNiLY1
 DkpaK3FxRYRRLZXvqc90Q6Q/Qz3nozu3zh41vwQd8TAmTAMDdrtVaCECLidplSvRaZqq
 SUDctqihn9/gxpb0zaqkQUGAZdqN3SbE5SeIiaBSDXIfWbwnwjkDa1Xx8VX7Ks1ZEjz7
 gwMJLA6kSa9g9DPl9/dT4akI5rI0C0IX4/6oEc/upDIoONWfNIXoCeujzfg5N79btq0Y
 FMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUlnP884hqRhYjQ+KYaeVoaXFhw7FNSUM4fAfkfPy9I=;
 b=WYmB4l5owQRH6cStLLByNvr2NEM/KLEOnHo2oWFAVNI2wXoNr7vWhV0EmozomIGBMN
 z3Gh5xQZz9flavxlEa7zZDOsMPerp7YGb2KAh8Zf94TweWdOW8gLtvbnC0iEBoE5y3GI
 gWPJGVvwMTRS5iZEvGOxYHmbuBhX2f0fSpU0umFrwNzRDucInXpCSbzVldFNtmud4Vne
 cdnVVqcDwEYEk8TawhDOX4H+olb8McoIapi0guosR+lDnEMLr3gHljhcQgivr4QIEuKD
 /ozgj6hM+TDu4/kq4dJX2UbBEyxdKaovRhYZ1MYuK9T7WSfOrMKJsWCTaBzfdrCjn0zM
 1s/Q==
X-Gm-Message-State: AOAM532w/ShlVeoLqbWiTLWnhtDdMgIDE2LOO5ve7EVvT4ZUa3kuJFi2
 4dYDi7OCIKsUOzhZgirbH5eBS6LLG2o=
X-Google-Smtp-Source: ABdhPJxLsYKB277Fz3hr3Zh89wncSWH1NEVnGfUNJWLe7GvBEFiiU1mJ4Tke89MN8IKZQOg7d3cOMw==
X-Received: by 2002:a5d:6a89:: with SMTP id s9mr37880443wru.123.1638224567040; 
 Mon, 29 Nov 2021 14:22:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j40sm571589wms.16.2021.11.29.14.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:22:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:20:12 +0100
Message-Id: <20211129222012.2183921-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qoriq-rcw: drop spurious space
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qoriq-rcw/qoriq-rcw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index ecc5ce5eb4..bad4a451d3 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -59,7 +59,7 @@ endif
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
 # could use a post image or SDK to build/install PBL files.
 define HOST_QORIQ_RCW_INSTALL_CMDS
-	mkdir -p  $(HOST_DIR)/share/rcw
+	mkdir -p $(HOST_DIR)/share/rcw
 	cp -a $(@D)/* $(HOST_DIR)/share/rcw
 	$(HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE)
 endef
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
