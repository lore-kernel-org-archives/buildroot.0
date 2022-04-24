Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D607C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97BA8401B2;
	Sun, 24 Apr 2022 20:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hNCfJH9kb4o; Sun, 24 Apr 2022 20:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD0CD4018F;
	Sun, 24 Apr 2022 20:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75A51BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A545E60AB3
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JQV2pSOjZHH for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:49:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96A9F60AA7
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:49:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so11324537wma.3
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sb+GDViINPyUIepXgeHXtDJUafNLUFTHSN+7oEDmmpI=;
 b=kGUAFv60wtwltnfmhhGhoqSyoIImGpV35muhK+DG6mPvKAKnkTfRcBpBlXa5AsJnoy
 6Hf0qhJf8LqbFGBl2w+mHItxcycLBL8gHBK4EmJz2mWM0fxQ0zvozFJQOhugRtoEPt/2
 xQ+nl6YMpGxd0w6RxvTXNsEqSOdw59Ad7Cs+aMI42Xeq1Bn2ETeSNVVg1O5L281vRH4e
 +nHkPieL4RL9oaWqxNKYASlLGDEZqfDnzOVtmDlr7zTp1xzYou6ebn/76Kn6qGTiZQU8
 LUzisPIK4wUTNKXpeoa6iTN06puO3vAA11D2f9BW6/gkb4yUpQpjUiPJ1wYLfaeoBgzS
 jDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sb+GDViINPyUIepXgeHXtDJUafNLUFTHSN+7oEDmmpI=;
 b=WLkPNVRlavlI/9mSh0gp0do1diDzHtBfk6pVsbJOFnuG4+fjnbFOwJC9BRvicOz0qU
 yvxgQGY88274ypCr+uUqXh+3cArA1dS2DgTIH0wZhOvr9PctnLjqYRXC8nrlnv5vhydM
 XSs2DFvxXZov9UCgiK4txt9IbfLwNBBjjHSSRIerKfH6uO+2V6Ig59Q+Mbv6ptxZYSq7
 fGl++dfUWkViPGDsWIRV3ODNDFtWNCkiJGHPX2O44sMkgWvYf5c6SU6tSAxxCCoWN3aO
 XM4uNrORKqJPDEQBNHrfavnjIcjQuqFxwVIRhs3JtJBE7ljzpv053ZnxDvNi88oP4WtI
 /cEw==
X-Gm-Message-State: AOAM531Wk0xBUGc70UOmahElVwoaIsejcI83y2p8DYRh1LNQybMsA0aq
 bN4iHmW4/BE0Znyy2xfoHdLWzJtzp7w=
X-Google-Smtp-Source: ABdhPJwKRVnO2NH4lx2Kn0Nh6LmhEy+ZXZUYy7qtUWeFGh5xopYHUIyhuLcZ5zNEwOEw/WoYwF+6pQ==
X-Received: by 2002:a05:600c:5020:b0:38f:f83b:e773 with SMTP id
 n32-20020a05600c502000b0038ff83be773mr13746091wmr.57.1650833341607; 
 Sun, 24 Apr 2022 13:49:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b00205aa05fa03sm7024897wrr.58.2022.04.24.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:49:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 22:46:56 +0200
Message-Id: <20220424204656.3352319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix build with libexecinfo
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

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/836348270d564a46cc9ee840cf87b2494cc82cec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cairo/cairo.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 98f270442a..f479aa252a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -15,6 +15,8 @@ CAIRO_INSTALL_STAGING = YES
 # 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 CAIRO_IGNORE_CVES += CVE-2018-19876
 
+CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
@@ -27,7 +29,7 @@ endif
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CAIRO_CONF_ENV += LIBS="-latomic"
+CAIRO_LIBS += -latomic
 endif
 
 CAIRO_CONF_OPTS = \
@@ -81,6 +83,11 @@ else
 CAIRO_CONF_OPTS += --disable-ft
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+CAIRO_DEPENDENCIES += libexecinfo
+CAIRO_LIBS += -lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 CAIRO_CONF_OPTS += --enable-gobject
 CAIRO_DEPENDENCIES += libglib2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
