Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B48FC43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 08:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3A040920;
	Sun, 12 Jun 2022 08:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zzjiJ40w9SF; Sun, 12 Jun 2022 08:58:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349E040901;
	Sun, 12 Jun 2022 08:58:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD4C1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F0B540901
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKIWvpDaDBMT for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 08:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B20D408F4
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 08:58:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id e5so1488835wma.0
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 01:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uft4TS60ywsLj0rwTVF66Cqw7zwgAs9tOOzX8URrlFU=;
 b=AX7mCSFFzXzZ5+yJt1AK2CcyziNFSOXnLZrUxQH/kCGvtASk+3nReU94OvrD1CRU/7
 VXzpJrYzxszKTNd+Dhx/Hca7Iy3UDuhXzpuVDDlBRxO/q20AMyph8hIRuExvXOjqmXnE
 3iYGDOgeF32wPS5v4+0SfV5VCsk53sR84Mm5dlarkCjOsM1arQYmU9w3bt66BB7yXJmv
 Ga13E2UzyW9kRnoWtfS8g/s3odkhKda/J6x0A/+A9i5cKrTJ6HFPU7ES4kF4Y1wgPSvO
 bh+2gT/32TZSP3VsrWT2tiqScDdkviXRZbqTw2DM9JQjUkLc5fV2rsdHKdAk8jkB6447
 oR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uft4TS60ywsLj0rwTVF66Cqw7zwgAs9tOOzX8URrlFU=;
 b=2S8NTkpzdzRUjARow+P2GAAuuTfAiX9BeOhCgicrcN7mIkdTQuU/g1B4za+aSrk2sl
 qnPuwiyveBOX37fBu0XEwB3U9x80HNTQwr2eBiA/b0km2KJEu1ijAg0dX0abgGH7PI0C
 ORAdZONgeTIyMgfwjtTOOvCZMdHCNEmCH6ads0bJSwLVKJAIgOTwykcIP1n8moPy1HeE
 Ub301PMkh4cx5HLlRmT0GCFXV1hzs/anZ0C20Njh0dqKX3aWtiuQ6vMoT5OuPIC0dpt8
 wXkGhKiXo8buqQGCEnxTe93REAe7RY5lw2tvZCeZUP4jzDacFtP+W8fPTEht5Ywf2idh
 s+tQ==
X-Gm-Message-State: AOAM532RAyBoDew7cPT/rSYxbRu1oW+NCwKmFk4yhPjK5wcK0CJPEzTf
 vveV0hMA7ANmm6MzaIBhsbwUnz37Cqs=
X-Google-Smtp-Source: ABdhPJy+uUZsycOOXPJc9rXIqFw+YP1dK4+wyKeCVM/OV5UpWichXsxRfNUnQb85LbPucPhIjSgYJw==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr8685446wmq.12.1655024332075; 
 Sun, 12 Jun 2022 01:58:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b002103136623esm4891460wru.85.2022.06.12.01.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 01:58:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 10:56:16 +0200
Message-Id: <20220612085616.1875054-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/zstd: fix build without threads
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
Changes v1 -> v2:
 - Fix the following check-package error:
  package/zstd/zstd.mk:67: conditional override of variable ZSTD_BUILD_LIBS
  package/zstd/zstd.mk:70: conditional override of variable ZSTD_BUILD_LIBS

 package/zstd/zstd.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index bef46deae8..b885506cca 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -39,13 +39,13 @@ endif
 ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
 
 ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
+ZSTD_BUILD_LIBS = libzstd.a libzstd.pc
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS = lib libzstd.pc
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS = lib libzstd.pc
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
@@ -73,7 +73,7 @@ ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
 
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
