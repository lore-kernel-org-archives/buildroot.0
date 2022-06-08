Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3069C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 19:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D13260F79;
	Wed,  8 Jun 2022 19:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYvKRFSPo6If; Wed,  8 Jun 2022 19:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD01260D79;
	Wed,  8 Jun 2022 19:59:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A972B1BF25B
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98E598244D
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zhz4g3lHljo for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 19:59:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5F1482444
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 19:59:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso302737wmc.4
 for <buildroot@buildroot.org>; Wed, 08 Jun 2022 12:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMQHw2Dp9HjbO805mto4IxuPsk0YFi+MRuPjeUyMfzE=;
 b=HUpHvLM6nqbhHoxfIVcZ1GknJXLX5j7I/lN8Y5iUluiue3rt1y7Cz1mFR3MvkyEtKZ
 oHcuzDojNz9MQ0yupo87M3cNq57dflQX+PDJzbKqgzxvq/NqpNFJvinkhEyUrxYXVU8I
 9z8TNJcE2j2zjaREKXiF5R0ziEjBZp8H2NMK4vhckhgj+prZ2giJuBRizi2YP1KG3ai1
 XsWcYpWieagtu2APMcgKL2ZO8jEAsR+eYWXeTUxdelw1bBzekRmJqmaKFWKLIMpC26lm
 ojoa+1a2oN8PnEdC6zmgVKCEIm5AC7rRxxVAN5xIj2RCDlEm7gGzj8v2vOyJ1EpeKVig
 Dncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMQHw2Dp9HjbO805mto4IxuPsk0YFi+MRuPjeUyMfzE=;
 b=4J46hN9cWNWRCERSLZB0llaZZ0iEMDhhEj1L53d39kRBuonPYe6BaqVuyC/OoWvbeQ
 GN/6lNagl+9BdUyqvEziJn7oxWNxbfW2L9X6uIiZZy3QrYYt9H7R2Jxhcfxk1SjNuJ1b
 lfqzXp6tFwqScveaNeR11U5Q7F7MALhcF7//CwdP8V0CpFRKzE22gDyYcXX/Zk2tWLWE
 cpUZVY2F7BLxwsTyfPYfmpTs2V8KdicN6XerZKluUNU+lHmf3heI8uFiKHK/vS2iyGbG
 GsM2U9I/46+ZZoAg4JGBjiqekqWZyhiXV6cjCYVnmqP9aukchTgXXYvWfUxePq7G1iq+
 FUJg==
X-Gm-Message-State: AOAM530qwpexb1Q0PT3fi/MTD3rIRwrhQtqbHFCp+96dqG87BfdNM3Sa
 5kzK+PPA2ZxiGvwe8YlspmI9IxVgjhQ=
X-Google-Smtp-Source: ABdhPJzN+G1hDxr1FsjWvPI0Co4k+MKOcdc8jpTY0Ua2lTCtyPHd8yh2JYOh0eto4B0Mov4RX/ocGg==
X-Received: by 2002:a7b:c3d1:0:b0:39c:64d0:b8c2 with SMTP id
 t17-20020a7bc3d1000000b0039c64d0b8c2mr860148wmj.195.1654718340793; 
 Wed, 08 Jun 2022 12:59:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a05600c1c9a00b0039740903c39sm23886487wms.7.2022.06.08.12.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 12:59:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 21:56:18 +0200
Message-Id: <20220608195618.2243703-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/noip: fix static build
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

Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
LDFLAGS is not supported) to fix the following static build failure
(e.g. with musl):

/home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `__gthread_once':
/home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700: undefined reference to `pthread_once'

While at it, drop CFLAGS (which is not supported by Makefile)

Fixes:
 - http://autobuild.buildroot.org/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/noip/noip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index b7fcc84e2f..3b4850a633 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -13,7 +13,7 @@ NOIP_LICENSE_FILES = COPYING
 define NOIP_BUILD_CMDS
 	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
+		LIBS="$(TARGET_LDFLAGS)" PREFIX=/usr CONFDIR=/etc
 endef
 
 define NOIP_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
