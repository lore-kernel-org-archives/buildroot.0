Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50585409FA;
	Mon,  9 May 2022 06:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMW5kLRxyspG; Mon,  9 May 2022 06:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A14240A07;
	Mon,  9 May 2022 06:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83381BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9922740875
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CKj06XFneU9 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F9B40873
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:21:07 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id n6so6743304ili.7
 for <buildroot@buildroot.org>; Sun, 08 May 2022 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzJ+gb3Io2iyAZk8sCvusTBQufrDyq3NuG9I3Inn8YE=;
 b=HOQXAgLmcQhBeHuc0yHauPwnkdEVx3pJ4ahw5mkJb/kuO3dq/UdqBAP7CzMVlkCXuQ
 YlwgBlG1PC8WxcD7vG+ivpUOUwpQRziD8fLgpZEso7WAqo73gOdUAXlyEiyvvwRNU4n8
 7FRCkPceyuiBm0Oao6yTmJmMlDZunXSiljzynZeU1MVecAiRuHymkaL82NAPJmqMdV3J
 s5Xvlsbr8HooTS2BCCXN+0ex0Dhp8SWzjS4FbMF2PnWxnAznU2Up0WTsknVajXoXJ5Vb
 7rYlfnOfdFGlPE5iBENQ4X+ERTeyp79ntKvBUVYS9wpB7z2B9YjnE1k9W8RPFuMxypLD
 YqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzJ+gb3Io2iyAZk8sCvusTBQufrDyq3NuG9I3Inn8YE=;
 b=Zu1S/O6ZWwPyZR0mySuPHpXQtiz/Ura5DBN4dHNDVmpQk/LotmY/3qhC6vxrN4tZl6
 sdFWf3uOf85NzYjFqb2bxXwMy7FrP3rWeM/HBinPfCfpspRgmCJ2VjWPj5nQoMUf0FBH
 HUQTYGhBmESveyjVeGNqHrtpJfMNGT7cqpvlTkyB8Y0KrGfmBHqH6vvLr417kT9fMqMG
 12jD56eCjdDT7D0obuqKmB/XnFJZaalRtGh9YTzf2V3Ci4JQakWlzU3AJPbPzhXuH8nz
 Jv0oTsXLkFB1EUB5UA6fDFU1cLqWa+mG7jhsa+pfGIoZiTkVhUIzXFVj8vdNj5WR6hrD
 pCPw==
X-Gm-Message-State: AOAM533qpMxLkvCwAXwaLFKW7a4vB2suYmseKcxDepKJVLaHWxesHDHK
 WlEaBZXxYJ3vHV91NfTVXrzCMaJcODk=
X-Google-Smtp-Source: ABdhPJyNURPFKFy6bfS4jqtiN3E1s+0WDZHbNgFfZaB6JytJhl7u0cwhldE3tcQzJste62uyiC3yLA==
X-Received: by 2002:a05:6e02:18c8:b0:2cf:5266:ccf2 with SMTP id
 s8-20020a056e0218c800b002cf5266ccf2mr6001259ilu.207.1652077266386; 
 Sun, 08 May 2022 23:21:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 z28-20020a05660217dc00b0065abb700feasm2840125iox.26.2022.05.08.23.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:21:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 00:21:00 -0600
Message-Id: <20220509062100.3969630-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: do not pass
 -j$(PARALLEL_JOBS) to ninja
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we are using ninja with jobserver support we should not pass
-j$(PARALLEL_JOBS) to ninja.

Fixes:
ninja: warning: -jN forced on command line; ignoring GNU make jobserver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 9987fb73bb..0835e08e3a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -27,7 +27,7 @@
 #
 MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
 NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
-NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+NINJA_OPTS	= $(if $(VERBOSE),-v)
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
 ifeq ($(BR2_arcle)$(BR2_arceb),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
