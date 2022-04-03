Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C6C7403BE;
	Sun,  3 Apr 2022 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pv7O-MXdM3zB; Sun,  3 Apr 2022 20:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 949DD401AF;
	Sun,  3 Apr 2022 20:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03C621BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E753381769
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3AW5bCQyZKCF for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:23:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08BAB814BB
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:23:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d29so5634271wra.10
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9hC43CGw4EE0zzJf6qbW8skvo1vhrCmLNOsJT6hDCg=;
 b=KWgOw9dEc0TJmvp9ujVC65kL7hPYru9OqKF5qQRK+6jUj2AyY0XgAcowAYeh9X9FP3
 CFhnLLhB0l6n4lThWqP8zjWFahcQ8avrk4RVsfMKqnkR7JbdhX3r9DKjs2Yz7d5BYU34
 ol97he3CBRNeZ0c8jIl+GIgatsL4mwI8pvNZsR+xuzt4ttPBX9fMl0SMWhWFYdOBK772
 9J1Hz5CIea6CHj4UzijQjTQ/+Jcvnaz9G5VimE4Jobdxp845jemA2TjSm8mhSvfmjzOU
 pq8zGWOlteBRqrtY6dSCGcspYlTlJ7P34TDvLA9QC7+9SWZn+BCNYm4yYPF9iN1ZSd/Y
 lr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C9hC43CGw4EE0zzJf6qbW8skvo1vhrCmLNOsJT6hDCg=;
 b=Kq26vklyTdH5czMFWEmzpOTdqOgeZ7VXlxsHmQQ+DWA7DHwu6XlQZqwDn0JLlzYO5z
 /xn1eoPIQUOTCkEWaH32qrRxQQZhmsoWR0Lk5tDY1jLtHDln7VpTOu6iDSHS+2uFpx50
 0SpCu07+8Gc5BXmNFnhCwtsyFhEmJgD6KIos4RlJBMK7H6WracZJT7W+7966dMgJCq6g
 vkXUDvQED4PjyUrRGqWMQ+QQE8DbJAep40usrP4/EC3zpmQhdRfP/YSx9EsCvxEa3Y1T
 deNrZZIFDLJJC0jfJw8Hqqhwr2w7DcE8EAPNUrRWqoDrYkVF7WPvXVvC2RJPs/Qt4iXU
 yB2A==
X-Gm-Message-State: AOAM530sJtkrldFcG2mW45thoN9DOGP4CJVSKvjt0z6p11l9MCQTA3Fm
 X0mw9uRwDsBMAwDvZDPsZJkuxKFD7f4=
X-Google-Smtp-Source: ABdhPJzA5CLD0vfbI4HvcY+gZ722JX4+CMCQ+5gOB0l98H5bvOxw+2SOCw64yzeMCxUGsm73GiIoMA==
X-Received: by 2002:a05:6000:18ae:b0:204:62a:20f4 with SMTP id
 b14-20020a05600018ae00b00204062a20f4mr15586926wri.640.1649017423973; 
 Sun, 03 Apr 2022 13:23:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q66-20020a1c4345000000b0038e69dd940esm4224033wma.29.2022.04.03.13.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 13:23:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 22:22:02 +0200
Message-Id: <20220403202202.1583075-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/zlib-ng: fix build on powerpc
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

Handle WITH_POWER8 to fix the following build failure with powerpc and
libglib2 raised since bump to version 1.9.9-b1 in commit
1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and
https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/11.2.0/../../../../powerpc-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/powerpc-buildroot-linux-musl/sysroot/usr/lib/libz.a(adler32_power8.c.o): in function `adler32_power8':
/home/autobuild/autobuild/instance-9/output-1/build/zlib-ng-2.0.6/arch/power/adler32_power8.c:106: undefined reference to `vec_sumsu'

Fixes:
 - http://autobuild.buildroot.org/results/f864a0e2307e25342b45c90a5b4fb57a0f5c1c93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Don't unconditionally disable power8

 package/zlib-ng/zlib-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fb497b8c11..938acd4181 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -23,4 +23,10 @@ ifeq ($(BR2_arm),y)
 ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
 endif
 
+ifeq ($(BR2_powerpc_power8),y)
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
