Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778B4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1502460EBA;
	Tue, 26 Apr 2022 17:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 957SF0VNbcbH; Tue, 26 Apr 2022 17:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2602861104;
	Tue, 26 Apr 2022 17:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 976661BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E6560EBA
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcFFZg7PfKsd for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75CDD60B52
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:18:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x18so26461252wrc.0
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AAQ6ql8FrHbJQlKfA8mS0eVSboUdD+Mrrv1OvrgOBs=;
 b=EkuU2YQQmXq+e1jVXzkHQLVha+zx4WEIN/jDjg2jMGCiFB187UU99sWlMx1621NX4M
 DNFiI6eItWdxRasfMCUTgwDrisy5izXl5KfBty4mWNoRg7K6q5q9eM7xWOB0Le1vGxsH
 upc7P+gZT0PRL7S9wV3BblrzV3oa4qPGcTF9pmCXjTeCW+zAbqAcFeoLBMZSbWHoDncz
 ZX555rJUejJeJSQN4A+wxnpjLCYocJTFvEdaw2/egb3SkqP3YJJbewJeRWgFHLCqoDyI
 omGNf9YuIXhecJYLrYUBTRYIeGmOkbd987hXEbBiMdK/hws5xm1pKTILfJO+wKpWF5fd
 RTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6AAQ6ql8FrHbJQlKfA8mS0eVSboUdD+Mrrv1OvrgOBs=;
 b=IxzK6az7101Drhrqy+i0muhG1IaeMKy4jTL2YjbIFWHQSgvnJa7kQn2oZoRWf13OFV
 pD1kFhihbnAvX9GrV7GSY6FFEv8rdJME/FuHOmH6qmoZp03vr2Pm28Sw5eT5qvphzyy9
 kZOrlSXDvPhs+1YWUgmTprHnUwNsa1459xurDPrHhUCVK1m2UU0jU4ykruYGYZhhbg1B
 /n0fdGSUiLsdtnZLs83sEnRiI2NEehDzm4kly70TQB2o9XdJnQ0fS+zRUmOS2Gn0/MDw
 Sl0i5VMls3HOVEnf6vJoDklVhrQUK3voElbdBcgQD8t5F7TUY59AG3Gzh9ZiNrbnSdBV
 PtOA==
X-Gm-Message-State: AOAM531Nh8FKb15PcoxZtj0rFJaBzqCs8MPe5GjAn1qOSh+MrMKsNsg0
 4D67IK7Dxqf7NXRamPCafDb3MUX/F3g=
X-Google-Smtp-Source: ABdhPJy5cz4Y67XIkfH2UfGImbwc1BBdml2iDIf4sU98Racbmzt0vK2Ue3oqwBrNW+3638gNCw1faw==
X-Received: by 2002:a05:6000:1c0b:b0:20a:855e:1272 with SMTP id
 ba11-20020a0560001c0b00b0020a855e1272mr19480208wrb.261.1650993511392; 
 Tue, 26 Apr 2022 10:18:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm12582352wrf.10.2022.04.26.10.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:18:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 19:15:59 +0200
Message-Id: <20220426171600.2552919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libpri: fix static build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pritest, rosetest and testprilib needs a static library and pridump
needs a dynamic library resulting in the following static build failure
since the addition of the package in commit
a77f356b78f9134227f9702a1eb09c3203c42d88:

/home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -fPIC -MD -MT pridump.o -MF .pridump.o.d -MP -c -o pridump.o pridump.c
/home/autobuild/autobuild/instance-15/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -static -shared -Wl,-hlibpri.so.1.4  -o libpri.so.1.4 copy_string.o pri.o q921.o prisched.o q931.o pri_aoc.o pri_cc.o pri_facility.o asn1_primitive.o rose.o rose_address.o rose_etsi_aoc.o rose_etsi_cc.o rose_etsi_diversion.o rose_etsi_ect.o rose_etsi_mwi.o rose_other.o rose_q931.o rose_qsig_aoc.o rose_qsig_cc.o rose_qsig_ct.o rose_qsig_diversion.o rose_qsig_mwi.o rose_qsig_name.o version.o
/home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/lib/../lib64/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0xd0): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/1217922af3a72646ae242c2c4dec22ead7883b91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpri/libpri.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpri/libpri.mk b/package/libpri/libpri.mk
index e1fa2abcf5..34d84393c4 100644
--- a/package/libpri/libpri.mk
+++ b/package/libpri/libpri.mk
@@ -17,6 +17,7 @@ LIBPRI_INSTALL_STAGING = YES
 # So we need to explicitly build only what we can.
 ifneq ($(BR2_SHARED_LIBS),y)
 LIBPRI_LIBS = libpri.a
+LIBPRI_UTILS += pritest rosetest testprilib
 define LIBPRI_INSTALL_A
 	$(INSTALL) -D -m 0644 $(@D)/libpri.a $(1)/usr/lib/libpri.a
 endef
@@ -24,14 +25,13 @@ endif
 
 ifneq ($(BR2_STATIC_LIBS),y)
 LIBPRI_LIBS += libpri.so.1.4
+LIBPRI_UTILS += pridump
 define LIBPRI_INSTALL_SO
 	$(INSTALL) -D -m 0644 $(@D)/libpri.so.1.4 $(1)/usr/lib/libpri.so.1.4
 	ln -sf libpri.so.1.4 $(1)/usr/lib/libpri.so
 endef
 endif
 
-LIBPRI_UTILS = pridump pritest rosetest testprilib
-
 define LIBPRI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
