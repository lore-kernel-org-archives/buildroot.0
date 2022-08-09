Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BAEC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE1860E59;
	Tue,  9 Aug 2022 17:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EE1860E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hH4l5pq_kaIL; Tue,  9 Aug 2022 17:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63F260C12;
	Tue,  9 Aug 2022 17:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63F260C12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2D6B1BF859
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 17:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E251814BB
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 17:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E251814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6stYBtVXfNL for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 17:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E9A81BB0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6E9A81BB0
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 17:23:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 q1-20020a05600c040100b003a52db97fffso4272240wmb.4
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 10:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=o7abyAk7+48v4pRZeOvmTsL57PO0CG2rgXcU6Z0GuEU=;
 b=0b1A6eBen1hWSB4u21qoknZkMZxOKeTPao7qhTT7iMHFrV4NefRCWYwgweYzXuNXMY
 g8WPI+lWN+dosrmTbcjonbd6ZFT9nNULkHa/SeSBSfx7xOPyDTaZiIELsZ0dlHIWY0yQ
 fhgG4oPFCYKJE+YAJa6lv5ddV7L0H7kV50p/BBysoaQRdOCeMAN/a4hbA4Os+c0xnHqH
 DNcizVd6m7Dwg7hrD24lM1mvb/mlr4+vtbYZCVARcvGatCfEsdImYi3Ak2KbLyXzhXaZ
 EtJtc91dkXUkND0OBMjsiWa2FrNHPOuwm1IZ0i5MbGVQ3yGY17upTqttGjA8fIXULMGl
 5Kow==
X-Gm-Message-State: ACgBeo1h1sVnPI1LeB22oXHKfwaXQvrJYvtAQR0tLltNdz0GqaQqPFrB
 Z8QLtlcBLz/PLN8GJ02h5PQA8WQH90c=
X-Google-Smtp-Source: AA6agR6pNd8a3xeR3kXXQCF8Kv09uEhqP6fh6M4SuESvX6LZog0+gPWcX7rpu08w9hYwt3EpiMzO9g==
X-Received: by 2002:a05:600c:4e01:b0:3a3:342:5f55 with SMTP id
 b1-20020a05600c4e0100b003a303425f55mr16962562wmq.150.1660065787790; 
 Tue, 09 Aug 2022 10:23:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003a538a5ab0esm8369951wmm.25.2022.08.09.10.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 10:23:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 19:22:57 +0200
Message-Id: <20220809172257.2058928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=o7abyAk7+48v4pRZeOvmTsL57PO0CG2rgXcU6Z0GuEU=;
 b=kPzraKXVv15K5kL0AIe1HAg0SRrAqCKeLAy0oVk4l4+Y6JDnoCQQXgza9a/JxqMN+1
 VRYj9/r76I3/Dh0LV+Z885S/US+r1sOvCJMxShn5p5+kWBbQf3hlDIaxEaL4SziHICyN
 bxja/PVZUt4clNpg06yDd+zcVrrxiBU7wgbZk9UiPek/myszq1FMGzKff93ldxkjAsT1
 /MFU22Akz9wpWEHodqtNcwdQzMLn54XF84FAHGxk3jwrPO7r2hFcnf0mEXaK4RBoAMTG
 lMrrYCNzK38k9bXuhASA9Zr/MOIJa5fhXt1BtsBaVjjNqZ2CvItVZseS+99YBTDT0pPi
 w1pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kPzraKXV
Subject: [Buildroot] [PATCH 1/1] package/drbd-utils: fix build without
 threads
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 9.21.4 in commit e4c81885ed487ccb511c4a4c4f8a8c1aa5180f78:

CompactDisplay.cpp:13:14: fatal error: pthread.h: No such file or directory
   13 |     #include <pthread.h>
      |              ^~~~~~~~~~~

For an unknown reason, previously drbdmon (which unconditionally uses
threads) was always wrongly disabled:

configure:5846: checking whether /home/fabrice/buildroot/output/host/bin/arm-linux-g++ supports C++11 features by default
configure:6141: /home/fabrice/buildroot/output/host/bin/arm-linux-g++ -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp >&5
configure:6141: $? = 0
configure:6149: result: yes
configure:6824: WARNING: No C++11 compiler found, disabling drbdmon build.

The correct activation of drbdmon could be a side-effect of
https://github.com/LINBIT/drbd-utils/commit/b235e83409b0daf5a3454cdc83aec2e5b335d38e

Fixes:
 - http://autobuild.buildroot.org/results/2cc7d771176ccde7539cc93d83e9621d9ada8357

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/drbd-utils/drbd-utils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 3ab3246f49..c1035191f1 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -20,6 +20,12 @@ else
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+DRBD_UTILS_CONF_OPTS += --with-drbdmon
+else
+DRBD_UTILS_CONF_OPTS += --without-drbdmon
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DRBD_UTILS_CONF_OPTS += --with-udev=yes
 DRBD_UTILS_DEPENDENCIES += udev
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
