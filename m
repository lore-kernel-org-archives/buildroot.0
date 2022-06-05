Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DC3C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F0C41A18;
	Sun,  5 Jun 2022 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_nuQvV1CIWt; Sun,  5 Jun 2022 21:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF924187A;
	Sun,  5 Jun 2022 21:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1DAA1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0ECC84035
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBbGhDzcswKM for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C43F184034
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:33:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id z17so1922892wmi.1
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 14:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zISE6p+BfXIm4j6KWHQsgO0qffzrcWRupY8FX0wY1OU=;
 b=lxpBgqaeKjrvVQKWwkA6ViCGbQSQ61GlkyYHlZtj4GsOFAxNs1eVYKYC6LSSvx3uiY
 48CAWZezfeCdsC2gHUNT8En+72incrY2otF/JZpWWuUOqFki5cErVnGYKznzbALwEgMI
 WgFZ6dlSIhYQpgub8Qs1WyMPo/NyHGi+SYnqfgok+yFV/tDgcWPB3t/mm+RsbLyoZ/7L
 x3cRq/AGveLqyIZ+b65ZN1LpVAdAjf78abAFuLwKjOzp1nZAawHxaFNa3gi58ZbEtkNA
 LXt3/NY6WSrAC9GHpVm6r9z67Si2JXRdkOYXEDGqHH9tb0H6w0CJb6/PRlcrpYLjOR2s
 51wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zISE6p+BfXIm4j6KWHQsgO0qffzrcWRupY8FX0wY1OU=;
 b=Xr9JoYEG3aFKaRRZJtghKC/hmGoBiQRc9tE7OdjNNh6GpcOuwvWqLIwU4sdhgMvUxE
 lKS4312b7WoTYybApxmCF7WvGNTg9ZOq6IOVf8yu7cC0StS2wZe9pY9OwHF4tfvmx9a4
 aBbdTLOA26yX0OPBvFikLniVlCPGO4S4C2SVarI4vB/ySARC30XDxKACVwwLz0XpMuEV
 fRtznwM4vmOB/Gh7sG8XwGs/cUGaT4/eiRoRsBSdz9qbgqg0+EdmvT5kf2cWsoBo/qcM
 YOkjExMJHyMFDx3Unm+UlL21o/8QA/fEHH9kMJPqmKTxzLi4aUl+Cj1Xrxk97q9xnrBO
 auFA==
X-Gm-Message-State: AOAM5316YorQKIkzZ3u46YA0OcVEVd+hxibL0RQw2u1SoNeC07zok+dJ
 K7MaS6zgdbJCOgwSQI/6oB8Ii1rQITk=
X-Google-Smtp-Source: ABdhPJwmJjRHSyxSZ9AY0/PwFTy6M0H+9PiJvbJGqDUDx25oiA3ZU2r4Bqei6js7iydUCvgYb2xWrA==
X-Received: by 2002:a7b:ce04:0:b0:394:1f46:213 with SMTP id
 m4-20020a7bce04000000b003941f460213mr19305475wmc.157.1654464828634; 
 Sun, 05 Jun 2022 14:33:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e41-20020a05600c4ba900b0039754d1d327sm14692929wmp.13.2022.06.05.14.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 14:33:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 23:31:13 +0200
Message-Id: <20220605213113.2366560-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: fix tmon static build
 with uclibc
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

Pass LDFLAGS (which will contain -static) to fix the following tmon
static build failure with uclibc:

/home/autobuild/autobuild/instance-3/output-1/host/bin/x86_64-buildroot-linux-uclibc-gcc -O3 -Wall -Wshadow -W -Wformat -Wimplicit-function-declaration -Wimplicit-int  -D VERSION=\"1.0\"   tmon.o tui.o sysfs.o pid.o  -o tmon -lm -lpthread -lpanel -lncurses
/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_FDE':
/home/autobuild/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/x86_64-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469: undefined reference to `dl_iterate_phdr'

Fixes:
 - http://autobuild.buildroot.org/results/58f4cdb734b68afb02595d004e7ca19a15d1abcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/linux-tool-tmon.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-tmon.mk.in b/package/linux-tools/linux-tool-tmon.mk.in
index 15931c3124..56c328c51f 100644
--- a/package/linux-tools/linux-tool-tmon.mk.in
+++ b/package/linux-tools/linux-tool-tmon.mk.in
@@ -9,6 +9,7 @@ LINUX_TOOLS += tmon
 TMON_DEPENDENCIES = host-pkgconf ncurses
 TMON_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
 	CC=$(TARGET_CC) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
