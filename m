Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFEBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D130161020;
	Wed, 27 Apr 2022 20:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id layPDTZg9BOv; Wed, 27 Apr 2022 20:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3D861022;
	Wed, 27 Apr 2022 20:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 637D51BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FE024089B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJGgAZgHgcpf for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:20:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DE77403ED
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:20:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso3168866wmh.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+++5aADtVKjfvwNLVBFEl3WA/F03oXpoJw/Q1qi6pcM=;
 b=KL8kV6LTn8ecNs5BfNF8YAAbETmvsC/hNiOV23Bo3QDqHPYq8YJSBiqvSbODZrrWD1
 a8+GtHI3uVxZtCqlQg9u398PzvLNunyIiS34fzakNxdpCGNfeEhG+bxpR2g+vHNTxM2W
 vwBBNMJ8nP5K98CChEndYoG9jbOOVmq+aQfqQSU5yZdGJK8KjnXfA2VbfNHROqU9/Kjz
 lyD9ANzD6Rg4ghj0ICZUQlZ1deM037FIr+1IrsAsIAVRDlly84mStPFG2rPqLKXlNXoI
 RS02A1ZMGwaRCoF3bT7yCxPzvK43n+8mQ6qkklifoPcsa1LDDREwfmKADUfsK9Qn3u+N
 U0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+++5aADtVKjfvwNLVBFEl3WA/F03oXpoJw/Q1qi6pcM=;
 b=LyLb77zIuDhLZdpvU/8epUBhElG9ZWOD4r2lUU8aCc4dmrTXR4VoagEoN1eolnB1SE
 2jP0vQnHyHJttqIIJeQWEuH9ZMT0LcxYlek4z57iTfkhR4vwEd7M4jBAKB36DcqJ5NEO
 rGt/VxDdMYMwNUBQDgcjkg0YGxRwyYFv9sD9hXeQkt0XH56DC4pf6BV/8P9LJgKvIkzq
 B9gOiPSbJr4Cu4sQslwTCa0VOtIXGXnXeb53KZ9hpQj4QSOdaUz8LeDPDCotJ7NDMaf5
 KPe00RJjclveM+fTs26jjR+Yh2sgk92u/NzPG7HS/fIntkZODBnj6+j+kcVxwROgYkY/
 hqOA==
X-Gm-Message-State: AOAM532OuGn3WO2XSZg/U1x+Wejd1AGgTGX4GqOGQOdovtF9VEQrgLVe
 /L3PoqWrToqN+Cc09g//Gsp1srFkJug=
X-Google-Smtp-Source: ABdhPJyVqezOKB0BUtr/vgmBF8zBg7sst1LDhm3DVCIYsPmQ+Yt5Fy40l2m/gfGA/GeXW1/SnHOPRQ==
X-Received: by 2002:a05:600c:3d95:b0:393:d67a:d2a8 with SMTP id
 bi21-20020a05600c3d9500b00393d67ad2a8mr26650760wmb.39.1651090810769; 
 Wed, 27 Apr 2022 13:20:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000186500b0020a8688963bsm17694967wri.89.2022.04.27.13.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:20:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 22:18:12 +0200
Message-Id: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: fix build with
 argp-standalone and NLS
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

Fix the following build failure with argp-standalone and NLS raised
since commit 5430c8fedd0392e79e0c011825b056fea129980a:

configure:14644: checking for argp_parse in -largp
configure:14669: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -lm -lm -lm  >&5
/home/giuliobenetti/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
/home/giuliobenetti/autobuild/run/instance-1/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'

[...]

In file included from freeipmi-argp-fmtstream.c:35:
freeipmi-argp-namefrob.h:62:32: error: redefinition of 'argp_fmtstream_write'
   62 | #define __argp_fmtstream_write argp_fmtstream_write
      |                                ^~~~~~~~~~~~~~~~~~~~
freeipmi-argp-fmtstream.c:395:1: note: in expansion of macro '__argp_fmtstream_write'
  395 | __argp_fmtstream_write (argp_fmtstream_t __fs,
      | ^~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/26090162396b1b8cedfc58e1790ced528fcc35c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeipmi/freeipmi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index 9fb59245b9..b26ed0c0bf 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -20,7 +20,8 @@ FREEIPMI_CONF_OPTS = --without-random-device
 # Work around for uClibc or musl toolchains which lack argp_*()
 # functions.
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-FREEIPMI_DEPENDENCIES += argp-standalone
+FREEIPMI_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
+FREEIPMI_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
