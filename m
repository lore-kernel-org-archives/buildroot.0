Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC28C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 16:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DD241752;
	Sun, 12 Jun 2022 16:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdO9AQJUzJmS; Sun, 12 Jun 2022 16:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBA141716;
	Sun, 12 Jun 2022 16:05:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF9C1BF299
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 16:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A6D883E43
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 16:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ka5exXQxQ7B6 for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 16:05:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 007F483E26
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 16:05:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o16so4401143wra.4
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWaw6wHSUqeJ2iOZw/eWlUiME7PYlxLFz3hfKwkg4Dk=;
 b=jCm/GKKTK2NlHB7SUiiKl/erU32KHccQU3u1y6plBYk62qbpyUVq2LFRuliQqK58CP
 6DCiA6qwP7Ect6Al8RZIhCuVpXxX1tv7qczaFgk2kyvwOz7u0aNgU27juw182qpv5NM4
 cnB3k0Ha5fnWipK8oaYVtc2ynnrFZOL3ff8CE3JWR5alYFClbeTeUeSYaThKqpyK8yem
 hGX47CZHFcuBePGjga/lOCLTCcOQhmvVNf0MFOmeSGtAO73TQBIHgKv09prDPiPD7gtN
 mlaYxmVgxz0JXBnGeVhuTD1TMYFE8HCAwNSXpapyGCVauTLfc4zPeacdeq/5iccZUZgL
 8Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WWaw6wHSUqeJ2iOZw/eWlUiME7PYlxLFz3hfKwkg4Dk=;
 b=S7mwc7BKQAVfAFGRSyfqXkGfeeRlQRD2M0JScLIGEhjCpZ3HmYvc8EPIjAOWHqUPbz
 3Dprdigo5NVy3itxsPCjLdhoHsnsvovP+6JLZZVJBNnfB+sY50BUUBxvw+AQCPJIkg2T
 i7Ds22D2mAYAKR/WfoFjCPkBP2g8cl6D7qDkgd1BT7RQwy/MoRsL0AfopNlN1gIV9t/r
 0osI/i58c+2rWOInRrCW5/SoM0s78TwY7hAFq/ckDpsqW/HEyxgbxWIuDc73+ionA0bW
 gkXE/uUYgSQF/X4gMWuI01QFkTWClaSYTY6t2pu/YscZSeX84ekvma39gc1nFJltUxFv
 fzvw==
X-Gm-Message-State: AOAM530821ZqgGtRJY/cEMTwl1VwygW09BrF9bW6TuEfXJ1K8nedW7D4
 yWIv0cWwVTww/69FqFccqxeHs2WiguU=
X-Google-Smtp-Source: ABdhPJw6x0fDzdH6+pGKOmPF2fpdxco9Nx80l+S3QnyGV011Oq/F0+5hgmoRULgq3g76Gb/lKzJYaQ==
X-Received: by 2002:a05:6000:1e0d:b0:219:fc44:78cb with SMTP id
 bj13-20020a0560001e0d00b00219fc4478cbmr5277242wrb.371.1655049898873; 
 Sun, 12 Jun 2022 09:04:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0039c4d022a44sm6226498wmq.1.2022.06.12.09.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 09:04:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 18:02:17 +0200
Message-Id: <20220612160217.2210177-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3, 1/1] package/zstd: fix build without threads
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move libzstd.pc in ZSTD_BUILD_LIBS so it will be suffixed by -nomt
without threads. As a result, libzstd.pc will not contain -pthread in
Libs.Private which will avoid the following static build failure with
zchunk) raised since commit 0f0e913f10caf21f23c2e46f210519a7a3bc0b32:

/home/buildroot/autobuild/instance-2/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc  -o src/unzck src/unzck.p/unzck.c.o src/unzck.p/util_common.c.o -Wl,--as-needed -Wl,--no-undefined -static -Wl,--start-group src/lib/libzck.a -largp /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libzstd.a -pthread /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a -Wl,--end-group
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: cannot find -lpthread

Fixes:
 - http://autobuild.buildroot.org/results/481d1979920daaecac48dec763151e124651740f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Yann E. Morin):
 - Drop ZSTD_BUILD_LIBS overrides

Changes v1 -> v2:
 - Fix the following check-package error:
   package/zstd/zstd.mk:67: conditional override of variable ZSTD_BUILD_LIBS
   package/zstd/zstd.mk:70: conditional override of variable ZSTD_BUILD_LIBS

 package/zstd/zstd.mk | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index bef46deae8..75eb6ecc07 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -38,14 +38,15 @@ endif
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
 ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
 
+ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
 ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
+ZSTD_BUILD_LIBS_BASENAMES += libzstd.a
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS_BASENAMES += lib
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS_BASENAMES += lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
@@ -63,17 +64,20 @@ endif
 # purpose.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
-ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS_THREAD_SUFFIX = -mt
 else
 ZSTD_OPTS += HAVE_THREAD=0
-ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS_THREAD_SUFFIX = -nomt
 endif
 # check-package disable OverriddenVariable - override intended
-ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
+ZSTD_BUILD_LIBS = \
+	$(addsuffix -release, \
+		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
+			$(ZSTD_BUILD_LIBS_BASENAMES)))
 
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
+		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
