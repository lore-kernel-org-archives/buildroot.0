Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B38C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 17:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF954612B2;
	Fri, 10 Jun 2022 17:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bngbt7tRH45k; Fri, 10 Jun 2022 17:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01DE61054;
	Fri, 10 Jun 2022 17:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C688C1BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B41D2404C4
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 17:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rktrsuhX7-sl for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 17:16:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF9FB401AD
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 17:16:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so1367730wmz.2
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8hPHt8zCh4TNER5HmHf0S70goAJcd12RmUlroZGl5BE=;
 b=Ow5yo6dCyW8NTjevRVEstNkfRHxSQlDnoSJW8ElbWLQ9pATJqHtQc1XeWYE5dPvyub
 +7vgud1tc5roZcCplKwk/+4niufYDBjXXtj+YygABzqJeSViFQGg7vX763tfAob4cbrC
 tXphPzdqWZRHkmyDQhneNIIjiFKYwVCoFCZSYwvkBEJKYpClwKeAfakcqbTRaXtxumaf
 K68KrkAeI283M6hyCHMWtzzH+BcYC+J3ZvPv9LYPDdVZv8ssoarBDPfRuaVzZILOgeoA
 KmsTLcrw7w24k2uzgO3sqvXF6CorAKgQ/N5L+TBV7t59UqRmZUKOq7AHrv+IsD5QiCLd
 ZATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8hPHt8zCh4TNER5HmHf0S70goAJcd12RmUlroZGl5BE=;
 b=hl4gVaHlHPWfs25QgkDFaltnElWDdMJHxYgTQJE7HRnJfFsw6THi1v5FvorC6sjhbN
 Ml6xV3aKLHtJVIqW0vgBBmtmw2XU96EvSe4VlETMMHKYORQYnS6BIi/qwSh98BHxociG
 xP0ZKFzg9xO5y85UcbTiejRYrTvIvtCRP4d+8pnNP4Bt/R8OU90agpdPdIfHY2MJSfEM
 MLoNuAMt6ygJ40fbfXhFsO/t+BqGZjuH7nGetY9cKy99hMB1BtY0VrhE00i9wmdqyhos
 lFtyvJNamTM5r12eLbZ3tlHG1gDU7C+xDMg3YfUNzRibVoah45zy/KLlll7yC1ajyj2M
 0GPw==
X-Gm-Message-State: AOAM533P/nwjQknFpVvhcgQFJw/39exZhj9xjXBpATlbmuCA1gzmRH4M
 BJaElMjmWZcPxz9R3sOyA3fnbxRc3Ts=
X-Google-Smtp-Source: ABdhPJwRbvqXgVBtTN+iPSn8EUaUZrO/qcwVR4tO1Evvnq3bIxnYt/6QfpSaDaoujWCWfDKlHbCQwg==
X-Received: by 2002:a05:600c:5127:b0:397:4862:e474 with SMTP id
 o39-20020a05600c512700b003974862e474mr777142wms.68.1654881375611; 
 Fri, 10 Jun 2022 10:16:15 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b0039482d95ab7sm3617650wmf.24.2022.06.10.10.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 10:16:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 19:13:35 +0200
Message-Id: <20220610171335.3607268-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zstd: fix build without threads
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
 package/zstd/zstd.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index bef46deae8..15896dc43a 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -38,14 +38,15 @@ endif
 # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
 ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
 
+ZSTD_BUILD_LIBS = libzstd.pc
 ifeq ($(BR2_STATIC_LIBS),y)
-ZSTD_BUILD_LIBS = libzstd.a
+ZSTD_BUILD_LIBS += libzstd.a
 ZSTD_INSTALL_LIBS = install-static
 else ifeq ($(BR2_SHARED_LIBS),y)
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS += lib
 ZSTD_INSTALL_LIBS = install-shared
 else
-ZSTD_BUILD_LIBS = lib
+ZSTD_BUILD_LIBS += lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
@@ -73,7 +74,7 @@ ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
 
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
