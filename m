Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C0AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C6DD60AB7;
	Sat,  5 Feb 2022 20:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6Qft89HYcVd; Sat,  5 Feb 2022 20:19:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EBD60776;
	Sat,  5 Feb 2022 20:19:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB2D1BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9DE4057A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGVX3MTLeJrS for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9628440550
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:45 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id i62so11851402ioa.1
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUbnkX4SlRva4NA/U+/yRyA630jmUTAqxDKlksmApIk=;
 b=BK1PO3oRK3Bik/drWSAolZR+DEI8Ss1RNA7lFMk/kFXk+cWEZJTblHZFABfugK0qJJ
 l15L/Y8oA1tcqa8UziIKTn6VqmE8m07XlLDUMzsgOqsCfllwh/ZNpTUiQJ0qL0CbUU1w
 7Waaed+3dPQmA1oCd4iF7bQk0QiULYncsl9/jdWWDTQAa85bUWi85bHVUta1SHM/tvhK
 6vELdifqF1r2Rg7f+OqBC8Q6Vtp0hEjYmDoQka6OpaxID2hYEJDPGn4tCtLh2YopuUbB
 1Wl3/B0GNB3RNEPEGvkDv7f5qdjuKq7CeZaNFAMbpvP0fUJOiAsJydl7pPZArUvTEq8L
 M5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUbnkX4SlRva4NA/U+/yRyA630jmUTAqxDKlksmApIk=;
 b=PEVuEKoda7IvK2l1E5PrW6To3k6ieGt1FjKNIRSeWDOwb2200oB12tzoST9MxTluZw
 Qf8yaIL2x/N1F3U2sT/TxJzeBm/ekbqFooS43jAAeqR1sjpbkNELrrE4/GzoZCEn3M5a
 ngsscGNQJ5H81eXQdY1qrCcJpkqowWl1r8o36shlG2hhoiLXycJdc8sHwCgfrrHvTMkE
 0a6UbTiPjJ2GHrVd6wvWovrzEa17ykCnl35lPhPVFmBPGJW+i0zOLeTWuMf+uqtYiynb
 rmuLAKU1Tw12m/i7xl46Jp6YoGAWv/WPD+xVEdQdNAzIReY/kJPa1E2O6x88hL8m1wva
 WRiA==
X-Gm-Message-State: AOAM5304PAQJ50JZRm/HHjiFj4/W/AFWq8muXpcz5ufvQkMmSZmHrr48
 Xku8Ws9c6WY867p20yw1zt+MaMxlOlA=
X-Google-Smtp-Source: ABdhPJwi6Yug46w4xtAOYDqZUdAoP+YcXSLBsVph5XXv/3yf4MJXAjPKjFvFSbVp+/MNawHhFc0q3A==
X-Received: by 2002:a02:b087:: with SMTP id v7mr2616736jah.112.1644092324352; 
 Sat, 05 Feb 2022 12:18:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:33 -0700
Message-Id: <20220205201837.3324085-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/8] package/qt5/qt5base: enable ccache via
 configure option
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This should be cleaner than editing mkspecs/common/g++-base.conf.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d8a0bf1d16..4b7a2a937d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -289,10 +289,9 @@ endef
 endif
 
 # This allows to use ccache when available
-define QT5BASE_CONFIGURE_HOSTCC
-	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
-	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
-endef
+ifeq ($(BR2_CCACHE),y)
+QT5BASE_CONFIGURE_OPTS += -ccache
+endif
 
 # Must be last so can override all options set by Buildroot
 QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
