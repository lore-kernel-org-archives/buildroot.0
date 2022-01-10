Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0433C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 08:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1733060BBD;
	Mon, 10 Jan 2022 08:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EBkGHLag-WN; Mon, 10 Jan 2022 08:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6230160B4C;
	Mon, 10 Jan 2022 08:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6A2E1BF20B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4E3260B4C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 08:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2I6yNr7XBA3 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 08:59:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB8E960ACB
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 08:59:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so50699644edc.4
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 00:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H5v+RZ4SohatKCqbOEllFW/KfeFstgjAIMBE2p/QKrw=;
 b=gKNyVXAGWoMO/d6BFCIXToZVgWefNHR6/dfj4y/7Zgk6XRr/pbhSCF19Rwkc2JvZn+
 CtfwsF6bCEzC29ec+Rh0fVzN8Z3J/EWWgVvejKLGf17KIm3cqIPAanBiwi8ZWBEF2zFI
 NUPWZkMgvQ3/3mUejOlKi9PfD5A2MBqJCg3n3pkl9e5sa/XLQC4DWV1OoJ2a/xPw+xeF
 rdjrhUEWReGTPkMx6gKZztdjfRLqETiwtrjQM1LXTquTygLs8nLX3dIuwX9/oRciBZST
 0rlgKBkmcrAJSHC9qs6QHHm6IIIj53lN74hHm8jv4/YBrp5rmNrTilzTdfhQtflYShoA
 JVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H5v+RZ4SohatKCqbOEllFW/KfeFstgjAIMBE2p/QKrw=;
 b=s0mPzT9rzyLiEU0h2SAjyy/A/81dV6eFf0yC8aI+gSrO66DBpnul55NnMsQCil+dhk
 F5dEyVc8N+w9sJG38xKe7rd5kcSqG+EJIBl4ectKKkYZnd1Ze8bOSbOY8qRBQm8w8Juu
 Z569zad8oYCAhc/ch9jg7d0ysic3tJ3p4UqKVkzbiZxpf2Yxnf0DrmFnUQWi5K50QRUS
 u0OjXC5qVunpUKTxYtNMRzaKcft2z6RAo1+3CIVH9v0FmArs6oZXmDB4QnKdO76RRDPW
 1rQTN2PLR7uwyXsRTcwswAddjpxH21X8TDIMesFbjezfGD2D5WR5LFl3co/I1wuylId8
 HZAg==
X-Gm-Message-State: AOAM5334iy2mvU80DKZ3UFs9i3fA0kcnhScd6EqJQd8IisKMmYVstpvh
 c+PKdI2t00/auTBM+SdKRBa8LYjDzPA=
X-Google-Smtp-Source: ABdhPJyU3DP70snm8AvTz9OcjdOCCcCXMgYw2cp0t14nihYxEDlwz5RdPu0SBzegjz8FqqptUSGmqg==
X-Received: by 2002:a17:907:a07a:: with SMTP id
 ia26mr8790927ejc.266.1641805140055; 
 Mon, 10 Jan 2022 00:59:00 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id u11sm2552077edt.97.2022.01.10.00.58.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:58:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 09:58:50 +0100
Message-Id: <20220110085850.11095-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220110085850.11095-1-yegorslists@googlemail.com>
References: <20220110085850.11095-1-yegorslists@googlemail.com>
Subject: [Buildroot] [PATCH 2/2] package/avrdude: add support for Linux
 sysfs GPIO interface
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/avrdude/Config.in  | 3 +++
 package/avrdude/avrdude.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
index 89558a5ff5..57a8df66ea 100644
--- a/package/avrdude/Config.in
+++ b/package/avrdude/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_AVRDUDE
 
 if BR2_PACKAGE_AVRDUDE
 
+config BR2_PACKAGE_AVRDUDE_LINUXGPIO
+	bool "Linux sysfs GPIO interface support"
+
 config BR2_PACKAGE_AVRDUDE_SPI
 	bool "SPI support"
 	default y # Backward compatibility
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index accd92c1d5..3ccba80d8e 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -16,6 +16,12 @@ AVRDUDE_CONF_OPTS = --enable-linuxgpio
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
+ifeq ($(BR2_PACKAGE_AVRDUDE_LINUXGPIO),y)
+AVRDUDE_CONF_OPTS += --enable-linuxgpio
+else
+AVRDUDE_CONF_OPTS += --disable-linuxgpio
+endif
+
 ifeq ($(BR2_PACKAGE_AVRDUDE_SPI),y)
 AVRDUDE_CONF_OPTS += --enable-linuxspi
 else
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
