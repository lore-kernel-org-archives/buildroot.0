Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3722AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DB260B7D;
	Thu,  2 Jun 2022 21:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgewLDV-FH-A; Thu,  2 Jun 2022 21:04:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD9F60D7B;
	Thu,  2 Jun 2022 21:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1851BF344
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 21:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AC0560D7B
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 21:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWtMnbqR2Wix for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 21:04:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFEE660B7D
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 21:04:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q7so7963122wrg.5
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T76WPLsj0Z80Y2S4NGTEG2j13vcUndt/W9DZ1f53X3o=;
 b=CeX1/tRs4bw/Y0XzdOSqSS0c0yGiJIZRIyvjdO9RoyfFmHud8Fs31lbTaEyyt1T/00
 GVu+RrUkghfPsg2H/Yi4iXK0laBBWzJxtFgTV0mUXSWRf0UBhE6/JpZltGmehMbDVw3H
 imJhG+MGIBzMApZ1x6mfTlRsnqVKOxXSaHESAc7vqP0Q0lyQc9eJeMp8dwqQrm4Vtwq0
 yi+HPa4YfxOPu2nFRgxXzZS14MY8NWZSBrJ297QEsD3p5A1ddg7VWNUqVz7hgl0aTNeq
 0uTd+e4MESNU21PkG+lNfW7yQMvmg2+GeW60kKrPEbU9kZAWvtR/6/BYc6hHp1JZdjG2
 6jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=T76WPLsj0Z80Y2S4NGTEG2j13vcUndt/W9DZ1f53X3o=;
 b=KsQU5AjC599QJIEPE8KpAVafRW6qsdn3UVgYaXuQmLIJIcSpDTbbE/5fM8pdRmTjKQ
 ANFMpKY9RIjlg9JBsREO0dYFjONuidAQpBT8jsfV5lkskX5XOHgmgH/7LltinOQhQncV
 rnLnzbfKog2vZPlge5ag91WLvo+Yo2xNW+Z+KJz+yzxvw6D50H9TmNzgdCguO31TLibS
 MWZ7wj8Eqhk606cAObrEbbfpNxEiUVF9UXWV2Fce9F4K5INN0ILkGU9zlWM97rl0FdcU
 mYcxBm7lbR2/5S9oCVDhEXEqJfXss8NrUBSHdiUZb9SMkyoC4wNeCarIRheWrOPg1EGe
 KX7g==
X-Gm-Message-State: AOAM533kzDJ069rkVQaUbXTnENVaRcHUXQBhp4LoiOn1N/NFHkxWt3MP
 0hqr/Db9p44YDUnmWQ4pU0l4u62sc/CPFQ==
X-Google-Smtp-Source: ABdhPJzseVn2dbcFvwM8qmZ9vW4nfo2H19PLwZlC0dTsPHq8YUJ7a9cVTfM1OronB5fqiS4zj2YGUw==
X-Received: by 2002:a05:6000:1565:b0:20e:64e7:e470 with SMTP id
 5-20020a056000156500b0020e64e7e470mr5286869wrz.260.1654203885959; 
 Thu, 02 Jun 2022 14:04:45 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:8d81:dd1:13eb:5257])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0039c3055a63dsm3371357wmq.36.2022.06.02.14.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:04:44 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 23:04:21 +0200
Message-Id: <20220602210421.426648-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: disable -Werror when building host tools
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
Cc: Anders Pitman <buildroot@apitman.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc-12 is starting to trickle down to some distros, like Archlinux.
gcc-12 has new warnings, and detects more cases of isues, like new
UAF cases, which is causing build issues in code that was previously
building fine, as reported in 14826:

    In file included from sigchain.c:3:
    In function 'xrealloc',
        inlined from 'sigchain_push.isra' at sigchain.c:26:2:
    subcmd-util.h:56:23: error: pointer may be used after 'realloc' [-Werror=use-after-free]
       56 |                 ret = realloc(ptr, size);
          |                       ^~~~~~~~~~~~~~~~~~
    subcmd-util.h:52:21: note: call to 'realloc' here
       52 |         void *ret = realloc(ptr, size);
          |                     ^~~~~~~~~~~~~~~~~~
    subcmd-util.h:58:31: error: pointer may be used after 'realloc' [-Werror=use-after-free]
       58 |                         ret = realloc(ptr, 1);
          |                               ^~~~~~~~~~~~~~~
    subcmd-util.h:52:21: note: call to 'realloc' here
       52 |         void *ret = realloc(ptr, size);
          |                     ^~~~~~~~~~~~~~~~~~

In that case, the kernel has already fixed their code, which is part of
5.17:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=52a9dab6d892763b2a8334a568bd4e2c1a6fde66

However, we can't easily carry that patch, because we don't know
whether the kernel the user uses already has the fix ir not.

Instead, we can just tell the kernel to disable use of -Werror when
building host tools.

As a consequence, we can drop it from the perf-specific setting.

Fixes: #14826

Reported-by: Anders Pitman <buildroot@apitman.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk                            | 3 +++
 package/linux-tools/linux-tool-perf.mk.in | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5aed47fee7..0d0cfcac50 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,11 +147,14 @@ endif
 
 # We don't want to run depmod after installing the kernel. It's done in a
 # target-finalize hook, to encompass modules installed by packages.
+# Disable building host tools with -Werror: newer gcc versions can be
+# extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	WERROR=0 \
 	DEPMOD=$(HOST_DIR)/sbin/depmod
 
 ifeq ($(BR2_REPRODUCIBLE),y)
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 4e28129f50..d82d45973c 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -20,7 +20,6 @@ PERF_MAKE_FLAGS = \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
 	prefix=/usr \
-	WERROR=0 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
