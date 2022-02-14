Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4014C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 11:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E7482725;
	Mon, 14 Feb 2022 11:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqdbAuYdxEkg; Mon, 14 Feb 2022 11:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58CE882716;
	Mon, 14 Feb 2022 11:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9503E1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D8440979
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkQp9ZnW_UMF for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 11:05:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 957C340913
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:05:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k1so26169063wrd.8
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gi4MxDK1+pbj4VNONGR18kMWky+SMcD1Bxl2yjAmvL8=;
 b=D28JtQjvmavBRrVOguLr5cOKulCnlVOPEcm8EtNzCsH6P7ekDzgxzcWbfLiJ8lVxeM
 zP1XtXHtasOAgrUIRfINYhCN1IBeMaOpwndVrGcGQI9MOXvOXeSjxKa+hNx9Q060BTyb
 DQxPm0/3h5CZncct05taoxmDzM6MNI2UYtKVK0eEp1JYNMCbybZzRUgAWzUCQdYt1DXY
 tXtqqxTKez1U9tXFInF+NgUKmvpKnfruuYxaeLMVIqU5KW/A8BLmlS+ZyVlYdZBgVgOJ
 sth4H55Bsr8Hpi+atdfxQs7YgkGGdHz2ryNmPealAc7B2lziHIkm3hpnCphd23g9HlKN
 w2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gi4MxDK1+pbj4VNONGR18kMWky+SMcD1Bxl2yjAmvL8=;
 b=I0ERxA/KfKLskHi5X/SqhXFBaA8ROmn0s8Zvi81je7sDr0aaBXlduA3kDRS1wuJ/Ju
 lEsSIxSpyg7/QAVf8jjxY7uDOoAmdROQG+mcrQOy6QBmtBWzrTiKKblXSku5XAMsgBmb
 p5sj7aFARaL5U38j4lhqSz7GDEH/Z1+nRrmChTEzqvIc5yUy4INd941aIwdhm6dLDPG8
 dj8H9lg77k08MpPJGeGjOixpJaHlHB6XYIPGp2/HmGAdo/l9lvfdRjmCBznAxzfQRph0
 apFSkOIpqvOAz0t3CJCt5W/Jrb2iX7z/GGrQ8fRdXOgdtrWJexzye6lXHFQ4n/eqvkh5
 ofrw==
X-Gm-Message-State: AOAM531fzYx6S8tGQZvYgtzeKJYvFMzkc4yycl9zhsNF+3Of2cWsTJDk
 3Apfr6Me8uCp0RM+scX5Y65X5xUOmMA=
X-Google-Smtp-Source: ABdhPJyliyCQjG3We3gdLROtEkY6m3CE51XLDhy73wOyhcWp/zysJpGAa2RU0hal4JzqVqM5MD52nQ==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr10659577wrs.129.1644836747644; 
 Mon, 14 Feb 2022 03:05:47 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id w3sm29925643wra.67.2022.02.14.03.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:05:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 12:05:59 +0100
Message-Id: <20220214110559.2176506-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: set
 BLUEZ5_UTILS_AUTORECONF
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 572d08ee4a731b203b2d3aaf720a48f622609371 forgot to set
BLUEZ5_UTILS_AUTORECONF resulting in the following build failure:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: gobex/gobex-packet.o: in function `g_obex_packet_set_data':
gobex-packet.c:(.text+0x698): undefined reference to `util_memdup'

It should be noted that previous commit didn't fix any build failure
with libglib >= 2.69. It only fixes the following warning:

profiles/battery/battery.c: In function 'read_initial_battery_level_cb':
profiles/battery/battery.c:162:2: warning: 'g_memdup' is deprecated (declared at /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/glib/gstrfuncs.h:257): Use 'g_memdup2' instead [-Wdeprecated-declarations]
  batt->initial_value = g_memdup(value, length);
  ^

So an other option would be to revert this commit.

The 'real' build error that previous commit tried to fix was raised
because rand was replaced by getrandom since
https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom
but getrandom is not available until glibc 2.25:

plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/46f7dbfe1d80c7622d670ba1ac957e9e6077eb9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez5_utils/bluez5_utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 49f6eaac13..7c2561b864 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,6 +13,8 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
+# We're patching Makefile.am
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
