Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C883C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6405160B41;
	Sun,  9 Jan 2022 11:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zfr8PCW3ZVm; Sun,  9 Jan 2022 11:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF46460B37;
	Sun,  9 Jan 2022 11:10:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 477E11BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A5B60B27
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6gT_V1Mby4H for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:10:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 899A660B35
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:10:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q8so21059565wra.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXR3ApZMUPvi15nguo6rC0xsYO/UxL+5/tZJkSO6/EQ=;
 b=eD3sAnzVYtWC2IF4ZYxyCQk2Se1ixecV1IIXoLw99sPg2C9Vras4HDVTw2DxHv7nAU
 Wc7fwNn2ha3i9yC8WOeBkA8dWl8AArwF9XRxGnFC7zgcWYu7PXQXlArlTi3mB6Dut7M8
 Zl9Wc7ZckNV871gonwnslLEvBgYA7jmRbrngr5TjU2KHfx1bmPmGkmz2b7e26lT7dcmM
 fGeFe8Dco1JXdsXKoHtCZnFQlde4p77reWaZT0d47wUxg1Ja/Sps/vcla588ot0jBvvS
 BFsyJ6G7TGP1SGczz2vE+OF1Ycha/HYc+it08Leluae2cpGWeErI9t9XQit6DDu4YzdA
 5vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXR3ApZMUPvi15nguo6rC0xsYO/UxL+5/tZJkSO6/EQ=;
 b=YdHUUBOH5zy2kSWHHmJpftlf8z5qcwFVyCtJ4ZQz+g4nFnb7Q+FTAWm1pcADFTIWRd
 qWTJ/rPAZUb7gUu+33DDw8obHAMHoCGKivNxMMLWcTFxUROkPe9D2V+KEpjblhrf/w1N
 iycxtve4IL/Kb/YbvqxbetELmGV7zxDaEd2Ml8rWviZL4gLu/kazN+DntjHXFAVblHmZ
 s0EfpBIAHOLSMP25q1uLjZQtPrWwlSFy7jh0cBoX2Bt3dVH3dCixGNm+SJ7omrgu0MwG
 SPH5LF1iIux+vkDjZeXoQTRcgjS8gO5SxSjrd1KSAAYs6cvjvoLNZifomCtP7bLM31yG
 kKKA==
X-Gm-Message-State: AOAM532icOqMQc5fZPnMZeHvKP+/pI5kDemQ0XvcajS8q294Q11B6edB
 tng/CKrgzoTEJLwNF2wOsV8QYKIdqHQ=
X-Google-Smtp-Source: ABdhPJyo07YV3omOaBpBRZ9Y7FTiooxddScRunPIFiNIUMsV8crFO2zbwAvOVOvV+almVtw5bcQAAQ==
X-Received: by 2002:a05:6000:15c2:: with SMTP id
 y2mr16361663wry.74.1641726605855; 
 Sun, 09 Jan 2022 03:10:05 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id p5sm3888097wma.16.2022.01.09.03.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:10:05 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:09:58 +0100
Message-Id: <20220109110958.4251-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109110958.4251-1-nolange79@gmail.com>
References: <20220109110958.4251-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: fix pre-create directories for
 coredump
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a copy-pasta bug

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e136229c8e..13520126d6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -414,7 +414,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
-SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
+SYSTEMD_COREDUMP_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
@@ -575,6 +575,7 @@ define SYSTEMD_PERMISSIONS
 	$(SYSTEMD_LOGIND_PERMISSIONS)
 	$(SYSTEMD_MACHINED_PERMISSIONS)
 	$(SYSTEMD_HOMED_PERMISSIONS)
+	$(SYSTEMD_COREDUMP_PERMISSIONS)
 	$(SYSTEMD_PSTORE_PERMISSIONS)
 	$(SYSTEMD_TIMESYNCD_PERMISSIONS)
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
