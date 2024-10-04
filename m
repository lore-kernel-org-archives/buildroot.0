Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B03CF8853
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 17:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82B53400E7;
	Fri,  4 Oct 2024 17:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MU3nKezGCnHB; Fri,  4 Oct 2024 17:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8F540154
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D8F540154;
	Fri,  4 Oct 2024 17:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 446521BF390
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E9B7400E7
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 17:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3hxPwZrG4bH for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 17:27:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 025034021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025034021C
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 025034021C
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 17:27:11 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82d24e18dfcso94197139f.3
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 10:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728062831; x=1728667631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQ+aed7moRXwvribyBZgInGcJkaLKzzZWMghWbjj8ZM=;
 b=nIFNjsoKMKwC/MfxBVzAxTAD46bFKRp3/gXj0Zbdk/28mPTVLVkX7UJM3w81QNgSy8
 eGDJyt1+eX57HWjVmH36kANRPkFua4WRK3A3aQmqVVbvLp+17cPnXNdMvIzpFZHTRxWY
 6Lwr1uub5C8VBxV2kuetWd14cisBr45lvlrHTrJ0dOM5e11jEushKQSn5PPbUlLA5acx
 AGZPmwkOdMN/GbiA+jloDqswdAFeUtthhgWS6ZMYwo/UZHHMsKJUEy50K0boxEroNIGZ
 Yr27sp5jRxJUGlbgFW1QzF+WDQp2bDq9CB2ShMaS64WApXk//oYchdSKUC1YE8T7Dz1H
 NMCw==
X-Gm-Message-State: AOJu0YyqHpVwawG9bV1a2N4PX9UbpNr8wFwF+rlom3HKrl3VORxpTWUR
 Puz5Oj7nNsxs4g8lJOiWTuC+rnQZJP6wi+ioQ+qZlqEthu/PNvLJgudulVPK
X-Google-Smtp-Source: AGHT+IH0UZZOdty35cWhWml9lC12mk1CjW/Crxm2lv1t5IxN4wjv4qEPI8dPbPBVxaiJaQfhGwo+Xw==
X-Received: by 2002:a05:6602:14c1:b0:82a:2143:8 with SMTP id
 ca18e2360f4ac-834f7d65974mr501958839f.10.1728062830524; 
 Fri, 04 Oct 2024 10:27:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6ebf09easm58313173.102.2024.10.04.10.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 10:27:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Oct 2024 11:27:07 -0600
Message-Id: <20241004172707.3662311-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728062831; x=1728667631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EQ+aed7moRXwvribyBZgInGcJkaLKzzZWMghWbjj8ZM=;
 b=KHdUn5d9unGOKrbWsx2wLxG0YQeyGZvuvzYCMDpR7AgZVq7s2ZMcjNaGGl0uF4pc7l
 uClU7ZYibBHdckCWqYHcoj6a2lQf51xLas5nLwZBDKo521IK+LwhLjJAGCRFoAFEFlTQ
 9hvOW6ms/cClFLglDpLLbUHvOgNhFF4fhl4bJOHbGtG3eJiriR9Zi5SeK9kviUQcoxk7
 IwUG05r3ROqErWZaTzSY01DliWX+PEatXvHhc3sLErCV2+9UOSe8n3TxQqyU6GBaxxX9
 A3gLluVPk72JQjuXYxgcOENYrgT02wObMOtgmfS6cDNK60nzKti0hwNbkzKWeLNGoAbK
 6/pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KHdUn5d9
Subject: [Buildroot] [PATCH v2 1/1] package/bluez5_utils: enable asha/bass
 when building audio plugins
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
Cc: Frank TEO <frank128@ymail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Symbols from the asha plugin are required when building a2dp
support as part of the audio plugins, so always enable asha
when audio plugins are selected.

Symbols from the bass plugin are required when building bap
support as part of the audio plugins, so always enable bass
when audio plugins are selected.

This issue appeared during an attempt to fix a related issue in
ce4e5fd129b557ac0411d0a0704be43717310d6d.

Fixes:
 - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
 - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Frank TEO <frank128@ymail.com>
---
Changes v1 -> v2:
  - also enable/disable bass plugin
---
 package/bluez5_utils/bluez5_utils.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 13a8ce2f0b..717c10e870 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,6 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--disable-asha \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
@@ -68,15 +67,19 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
 BLUEZ5_UTILS_CONF_OPTS += \
 	--enable-a2dp \
+	--enable-asha \
 	--enable-avrcp \
 	--enable-bap \
+	--enable-bass \
 	--enable-mcp \
 	--enable-vcp
 else
 BLUEZ5_UTILS_CONF_OPTS += \
 	--disable-a2dp \
+	--disable-asha \
 	--disable-avrcp \
 	--disable-bap \
+	--disable-bass \
 	--disable-mcp \
 	--disable-vcp
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
