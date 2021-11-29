Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FDCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11EA6080A;
	Mon, 29 Nov 2021 06:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MowPOygUTGuz; Mon, 29 Nov 2021 06:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9C0607B6;
	Mon, 29 Nov 2021 06:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20E9B1BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D3D8607B6
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCVZMDnyzZxq for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:39:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6D6C6071A
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:39:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u1so34294561wru.13
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjYC+H7F86t+zftaGAfgogLnZM6gOVKa3TRuekEcJ+4=;
 b=VD+d1CNI6c5X0T8dhtegVov9EXhc9v/57I8PSzIcD2LZF2zOMgf8xslmH2RM4492BY
 mvQtd5uzQJ6aemwKnZrYa4IcF9jKlQzQAcb+4o33ibjY/DaGqwutxbCSq6+bounBqtfb
 7sI2obMeP+Q8aLyCA5cHSMOR7/SXo+c/mJai7LrabxV4UPSpaoLSxdqr3Oub2edrd0PG
 QeUo+UMBU1vbWDvghIdjsZsVGVG5TaAgIVcVtsQvzE9YAWLMp0OUtNkqYXqFChfzD2CH
 AhyC+zZH6H/G3uhTaKiJijsUREAWljUUt7MFaB5IbvS7xSC3n10sfZw2uI1Q3qPFA8Kh
 APig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjYC+H7F86t+zftaGAfgogLnZM6gOVKa3TRuekEcJ+4=;
 b=UU0EvzmeC5m1rlvwSXejXzd8tT1fi3SW5qjO9qcMJ9+d6qvGLW395lVpAhdKPqME/a
 KAB40R/ZlFL/iZTdL+VsLhTt/Cde/2CwmNQeYe1t3IQ1wGBw8JLX7sZcyoS1IZXDvkWV
 VH3P/tsLhePoS/dY106DMy0iot5yv4cVCI7g13zKiuqdaP9wtDimqI1trJrWjTIpkjDh
 wJ/4ml5G8bf9JokrD8crnZ15kpo7Wru9gZk8JVdk9O7tMmbBKChbpqbR/hy2MgXuDn02
 Vh0I/hvONJGHRUMi5bsM8t/6E8XIJ77NE/zhQhFRiQbfqQfNrJFK2Ynrx9mw8OuPouEQ
 M4SA==
X-Gm-Message-State: AOAM532/z80+2eTPqCKLfKBwHxpCvJs3cvfnTnUcbeGvJXWXO1wS0ZLH
 TAfSHZ/h10FLHyBTY4/M6cOp5kQk4to=
X-Google-Smtp-Source: ABdhPJyp4T6Pdp3uwsKPk+coENB8BSQXD5YUJqyQCCO7cRDzaxjzufmgA+WLJSMfjs71noBdEAXQ7A==
X-Received: by 2002:adf:a444:: with SMTP id e4mr31680092wra.341.1638167985930; 
 Sun, 28 Nov 2021 22:39:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 138sm18745648wma.17.2021.11.28.22.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:39:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:37:13 +0100
Message-Id: <20211129063713.2174440-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sunxi-tools: drop spurious space
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
a2f6d8564dab4ed8d4319795b712334e4d1a7813

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sunxi-tools/sunxi-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index c2913ee8f7..59d1f3b5a0 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -38,7 +38,7 @@ endef
 define HOST_SUNXI_TOOLS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
 		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)"  -C $(@D) install-tools install-misc
+		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) install-tools install-misc
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
