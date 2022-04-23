Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DEBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 17:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C84D60BC8;
	Sat, 23 Apr 2022 17:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AW7WfIk0OxU; Sat, 23 Apr 2022 17:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EE060B5C;
	Sat, 23 Apr 2022 17:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDA871BF34F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA82581951
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBeyee1p3oxZ for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 17:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB89681D5A
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 17:51:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso9953850wme.5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MwGEWqu1522x//RFeSBV1FjCtRGGa933IJx0hngNpA=;
 b=ZL8VfGOquXwRhlvPLZAER8bIi1QasHFZekKx75ybKOYuinmVwkRZmdkGT4s2pBS7Bl
 U+Xs88LzzL1npJCa70PX/jI3HtwYOSdU5b3mfbSr0EreHqW5p5/4MFpjlwCpHakohZWT
 9xw68zqu+1GO7t9NN1Fft5UaGbhg5CdOXfipWWX6Di5JOkYoyfHCJUknVhLOrQB3COxZ
 UZW1VrvK7LNB8K15sD0P7uJ5O5+XlN2JkZX4peUn5whyM+LEd/aCcrUJlqNMYpACsfqD
 SXtfw+Alav7MB/kMJZOwbuYB6r28bvQ90qO55WtpeWn0qYIC8KUXsFBD/ATys4IHGl8t
 Yi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MwGEWqu1522x//RFeSBV1FjCtRGGa933IJx0hngNpA=;
 b=E8mtNtD/WOy+1v5qXWPXS2O+YWXufrUDGVOZz97arks0J1SHKGSp4jhPcXzibwsgR9
 iRO3G1yxoQLcduZs8rH8MywnlMFC/7Ww4LbnY5hELslTALEfgmOuhKq/ztUJyFMIsXWa
 V320e3AcpuYpwkV3VMWYtz9hd2JXP82toSkVBbqjlV4lWlQ97kL7KeCAzHi/7aM8D+2/
 6WgSGtzM9c2JdGNP3g1zeezRHyqi5edRGRH9w06b8b1wK+V2K2Qjwl761OwSLT3A0uSu
 73A0bHp5rIQRp+ssj/XxBxCeOUxpzsAvq2KP2PDq/T0Fo5v5e8CQiyxPoWwCV07mbgz/
 TfMA==
X-Gm-Message-State: AOAM531vtq4/ZBGSttkhEQKnCEfrjwegc4sTGJcTS+5DnKQlZnVLCbKz
 qT04TL4J97Z3FWIrlFx5WZxOw0c0A9s=
X-Google-Smtp-Source: ABdhPJzmy4jd3yVoIxHape9jNyhRrcKVeNqZ/dNH/rztyjIQzomrTFhvNxLmDEsbfJmxvnw/ySP/Bw==
X-Received: by 2002:a7b:ce8d:0:b0:392:ad99:edbd with SMTP id
 q13-20020a7bce8d000000b00392ad99edbdmr16626719wmj.167.1650736273849; 
 Sat, 23 Apr 2022 10:51:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h206-20020a1c21d7000000b003925bfba0e3sm4702379wmh.25.2022.04.23.10.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 10:51:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 19:48:58 +0200
Message-Id: <20220423174858.2445604-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: fix libxml2 build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass ac_cv_path_xmlconfig to fix the following build failure with
libxml2 raised since bump to version 0.102.0 in commit
007f49962a961f96ff87795217758ec3786d03ac and
https://github.com/Cisco-Talos/clamav/commit/083ca38727b0ebd3979cf1ebc7b31148f6d5e7f7:

aarch64-none-linux-gnu-gcc: WARNING: unsafe header/library path used in cross-compilation: '-I/usr/include/libxml2'
In file included from /usr/include/libxml2/libxml/parser.h:810,
                 from others.c:62:
/usr/include/libxml2/libxml/encoding.h:31:10: fatal error: unicode/ucnv.h: No such file or directory
   31 | #include <unicode/ucnv.h>
      |          ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5bb3bea6d13ac8d497f6862374d65a59bea7ed09

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/clamav.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index cd2d06e6b3..e2ee99d02b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -69,6 +69,7 @@ CLAMAV_CONF_OPTS += --without-libjson
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
+CLAMAV_CONF_ENV += ac_cv_path_xmlconfig=$(STAGING_DIR)/usr/bin/xml2-config
 CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
 CLAMAV_DEPENDENCIES += libxml2
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
