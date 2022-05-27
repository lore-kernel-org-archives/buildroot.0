Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250A6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 12:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3AAB417EA;
	Fri, 27 May 2022 12:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcRx_pUUCJW5; Fri, 27 May 2022 12:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A38844056C;
	Fri, 27 May 2022 12:29:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4688D1BF3D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F9D94056C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 12:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tw2Zbg4KwJRh for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 12:29:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B93340432
 for <buildroot@buildroot.org>; Fri, 27 May 2022 12:29:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e2so5721959wrc.1
 for <buildroot@buildroot.org>; Fri, 27 May 2022 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1o4duGWYuvYFydcHNnD0+TixNDuj7BtTOtsbDpNPm0I=;
 b=FpBuFsANe+bttPVyE7dixOLghD465cAxUZzdcrN+y56Sk2PTYlj0zGGrsiKDpDXdl+
 qURPGEsTwhRfr8qA1PLxceixzfByX9GmxiqOlrneVEYIQmSHiZKcXlYa5gKKkGZkSEiG
 ki3Y5Kzg2nGdxjMbWDQRmh8lmHEHLc3d01zWhSUAD8PqNsDRsuP23Um2ciscGmIEcfAV
 fSb6iMYTVacCVAQNMh5zQPTZaH6Iwz1KMf1xGAnszZf4dbDkl1cq7+o/eV7UDjlZza//
 SlBznKPX7zcb0ufYPgANc+hfC0aUiZhSW0MpDK9ceKEeXIqV8PjMuymuK50SYKI4kKLT
 Fkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1o4duGWYuvYFydcHNnD0+TixNDuj7BtTOtsbDpNPm0I=;
 b=MmZ32EBHTzB/2uATej3R4/cpTis+lTHZH8Dft2AyiF4a2EPV4cwWL7VaoZqmqJ3tbV
 jEYXHVZSdV2rH3RkmBJw3hZfY7TudNPjP5KCKxoMH9bH/ErywvWHu+qvSw/sb335xRW0
 v/572TFY1CNMmKusgWg3bX31LKK5T7clnEAd54DauYQVQ+E2lc5CutOFkVuNuDJE4iaP
 mLCGBL51cpXcgJCu1XZKB7x8lkCkq5CzGN81c6cpbQeB0ebPv5ZSgzAzQKWlmpabBOvS
 d1hmTw+qsLhRnGtD3+v9cJ3XIvEQGGCEgDf0hsCODVigDH3kPlhCtUktWlchx/+wjLTV
 GmfA==
X-Gm-Message-State: AOAM532nt3laFD8YLsKgw13pwcGqjQysI2ImkXiEPHB1C5le4b6WwgMW
 wgGRrpuCVmB+8SJRicgmwvWWPjzuXIA=
X-Google-Smtp-Source: ABdhPJxj0swwBR6BklDuvKfzNvITkPo/ZCLzwRW79ocfNzno2GtgqYeLU4OUzKD99q12FWpTyCH0mQ==
X-Received: by 2002:a05:6000:1f0e:b0:20e:6f3e:d882 with SMTP id
 bv14-20020a0560001f0e00b0020e6f3ed882mr32701796wrb.370.1653654586755; 
 Fri, 27 May 2022 05:29:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b003942a244f39sm2781685wmq.18.2022.05.27.05.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 05:29:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 14:27:10 +0200
Message-Id: <20220527122710.1296005-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
/home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-without-reallocarray.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/pipewire/0001-fix-build-without-reallocarray.patch

diff --git a/package/pipewire/0001-fix-build-without-reallocarray.patch b/package/pipewire/0001-fix-build-without-reallocarray.patch
new file mode 100644
index 0000000000..ee80dfb3bb
--- /dev/null
+++ b/package/pipewire/0001-fix-build-without-reallocarray.patch
@@ -0,0 +1,46 @@
+From 0708a39b439cec2871cfe3b705191028397e5b8b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 May 2022 10:57:50 +0200
+Subject: [PATCH] src/pipewire/utils.h: fix build without reallocarray
+
+Fix the following build failure without reallocarray (e.g. on uclibc):
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
+/home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/0708a39b439cec2871cfe3b705191028397e5b8b]
+---
+ src/pipewire/utils.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/pipewire/utils.h b/src/pipewire/utils.h
+index 351216eb3..5a0dc6fd2 100644
+--- a/src/pipewire/utils.h
++++ b/src/pipewire/utils.h
+@@ -29,6 +29,7 @@
+ extern "C" {
+ #endif
+ 
++#include <stdlib.h>
+ #include <string.h>
+ #include <sys/un.h>
+ #ifndef _POSIX_C_SOURCE
+@@ -86,6 +87,10 @@ pw_strip(char *str, const char *whitespace);
+ #endif
+ 
+ ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags);
++
++#if !defined(reallocarray)
++# define reallocarray(ptr, nmemb, size)		realloc(ptr, nmemb * size)
++#endif
+ /**
+  * \}
+  */
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
