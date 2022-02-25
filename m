Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2FEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF41408EE;
	Fri, 25 Feb 2022 17:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bQO-VPNG2oo; Fri, 25 Feb 2022 17:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93EA40338;
	Fri, 25 Feb 2022 17:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F25A1BF31D
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 17:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E217160B98
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SlfhYIN4ZbvR for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 17:11:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FE0260B58
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 17:11:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d3so5535109wrf.1
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/VhOZ106DTEyhLg9lGHt/oeJLuMgJNexwSOe7AbFss=;
 b=RGXy69Kah624IWp5s6ZLNas9W4lhVT7rlISQZ5GPDwbrWguWB/AjoPfnyZFCIbuaaH
 4TvpFWcPhMHnMYnI+OlLoZvA2VQS/HIZvEn+XOi+G5cjz9xfDdPXN3sIYaL1OqUbiNgR
 fxl0pYEriqRBxKagDk1q4nFzKB0Mt1Sewo19Pzd8T6/JDa40hBnNVHd2sntEY51/VOMO
 A8iy3jG+5N3leLO211lT9BW7XYxDKHTGC+GNXQNN2w31anpTam7lVrqtE9YEd8Scq6pi
 Zt+9n2lG3BIDAKcJMrBgCT4rbs9mbbv5SZLs52PTcxzjcpu9aMizHtLqmsUNS3Kn45jB
 qNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/VhOZ106DTEyhLg9lGHt/oeJLuMgJNexwSOe7AbFss=;
 b=2rjX9+RnXIyjs3rNeajF7IoAQiCYH1BVqf8T/XIOSfTFxlokOUPxHgYnYJ+uot6/k6
 8bzQxZU0rn8xC+cV+hmHKvNH7yZkBkqLnGl9iBm9Pyk+Qt8YgFBLWmvwepu5ZJJNG1n+
 nPp67cBYdh6fGfXLOGDnhIUQTH3xHFsJxXWLeOGs1rV/UkeQdPnrnm7u67vagy+iIRzU
 qnwKHhnMORTd0W5+lQtNw2LVkDopLqZsMV41DIchOU3x8EHAzfvzbShh/ol5wEOKNGkJ
 saF6kaWJGDUPOoMd15ANV/gf0+AqQ/Nl1LCPvvgA4hYsTNu5J9RIKwlswIFMpxEX9kkH
 +ddw==
X-Gm-Message-State: AOAM530Lq+/xsCJbfZ/NFD/qnnHmAF8XCmN5wp0C/12t7z+XoweWdnOw
 uaq5+FQpsnlasCAL/vochFe6aKa8NE8=
X-Google-Smtp-Source: ABdhPJzBzCplLpCKLAdWz0upRApx6xTwrjdGddUct0yYC/2jMtBuLhs7wVbzfxbNbx7zbNtoNN61fA==
X-Received: by 2002:a5d:438e:0:b0:1ed:b9a6:c669 with SMTP id
 i14-20020a5d438e000000b001edb9a6c669mr7203699wrq.580.1645809111570; 
 Fri, 25 Feb 2022 09:11:51 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm3085764wma.21.2022.02.25.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:11:51 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 18:11:48 +0100
Message-Id: <20220225171148.701977-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/Makefile.in: year2038 makes time_t
 64-bit for glibc toolchains
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To use time_t 64-bit for glibc >= 2.34 toolchains we have to set both
_FILE_OFFSET_BITS=64 and _TIME_BITS=64 for glibc toolchains. Buildroot
already define _FILE_OFFSET_BITS=64 since 2008 [1] before the first
release tag 2009.02.

_TIME_BITS is not needed for musl libc since it already year2038
ready [2].

The uclibc-ng libc only support time_t 32-bit (long int) so it will be
affected by the year2038 issue [3].

Fixes (in French, chapter Buildroot 2022 and GlibC):
https://www.blaess.fr/christophe/2038

Runtime tested with qemu_arm_vexpress_defconfig and the Bootlin glibc
bleeding-edge 2021.11-1 toolchain.

Before:
 # date
 Tue Jan 19 03:14:07 UTC 2038
 # date
 Thu Jan  1 00:00:00 UTC 1970

After:
 # date
 Tue Jan 19 03:14:07 UTC 2038
 # date
 Tue Jan 19 03:14:08 UTC 2038
 # date
 Tue Jan 19 03:14:09 UTC 2038

[1] 60b5eee76edfa153ef118d2788c74ac8da1497a0
[2] https://git.musl-libc.org/cgit/musl/tree/include/alltypes.h.in?h=v1.2.2#n3
[3] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/time.h?h=v1.0.40#n75
    https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/common/bits/types.h?h=v1.0.40#n106

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Christophe Blaess <christophe.blaess@logilin.fr>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 508ea7c366..cde050ca82 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -167,7 +167,7 @@ else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
 TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
-TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
