Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AF6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00F783EF4;
	Sat, 16 Apr 2022 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBXhqugwliu4; Sat, 16 Apr 2022 21:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C749E83104;
	Sat, 16 Apr 2022 21:15:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 343241BF341
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30A8560C33
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fDaq6fzkgcR for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 21:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214CB60B86
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 21:15:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e21so14393209wrc.8
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2NihjtGshnQlCpqLd8GZNenv7HKZkjcbvPDmrUtiT04=;
 b=I6naRrX7jF2iCmFdkZAcmT8yHXbfRkZ3IgFKCgj7LNonnYvplmbh6aES91yZV7thm2
 Wyt19aFJ/mCISo5QQyDf/48MGqeXUL9CyXy4vA+YyzFJdile2kltegmE/9ErxfTNwA0p
 iOvyIj2sUlKjuF/V9Sutew7IqisMwS2HBlRst+ULDknY7FVFLPuaxomFkFwH2y+BZgjb
 LsFKzySB7eJ0yZoE3G9yS25Y6oXrG+S7lzeAcbBID44Xr4GfPCqQJZcfWk3W/mGIrqET
 hHZ7sVKalWPwacvsCTGXOkLExifdkwNY0AEPfrXKKzqq0esRvPmULOjJH4AIf7BBEwlN
 hGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2NihjtGshnQlCpqLd8GZNenv7HKZkjcbvPDmrUtiT04=;
 b=O/FrLZY6MVMy79PCph0vS3MKNpUNDq3LgwRqSaSpi6/Ub2nKyRY7MndR576EUIM123
 LVVM5g6e1GG0J6DbhRZUGasPI7sHUwlXK1SeEw+BhisR8gMaLZTBDfN3pjf0KixcER17
 uE9vNBJpJMl+N7gwI7YaDkNJlOWIMKxQcV57KqnAOZentIkHm3KLlA8dv1pqmxv3C37R
 ADtx8zm0dKG2ArnE6KUW0Fpd/IW+RrcHIwTDXxvBC3sYWuFKAhp3SxvYnQrNu/x/Httw
 pFZI99ezlgfdK9WkBzoIUvcqaoIuuadeY5lQTRSYPo9eTqF8VGDtZStxC5TXtYK7Rqoe
 QtBA==
X-Gm-Message-State: AOAM532+sQda2phZ3bkxRuQSdo7KNIM1LaM8LN7gROxyTX6CiH2cd+0o
 ouU6OilxLi5J4cDmvpn6WpvH6vB1TSI=
X-Google-Smtp-Source: ABdhPJw5iTmaEuMQdbmSjOfd7uuOWwLib9L8jVPPy2XnokD9IOMkv5iPdnmyI7m5TQXOZMI2+t/f6A==
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr3603163wrp.407.1650143733214; 
 Sat, 16 Apr 2022 14:15:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k124-20020a1ca182000000b0038eb706c030sm11647585wme.39.2022.04.16.14.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 14:15:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 23:13:23 +0200
Message-Id: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: fix BR2_SHARED_STATIC_LIBS
 build
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

Add --static when calling pkg-config with BR2_SHARED_STATIC_LIBS to
avoid the following build failure if a package (e.g. dash or zabbix)
decide to use the static library of of its dependency instead of the
shared library (e.g. edit or openssl) resulting in the following build
failures:

/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/10.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/bin/../powerpc64-buildroot-linux-gnu/sysroot/usr/lib/libedit.a(terminal.o): in function `terminal_tputs':
terminal.c:(.text+0x1d4): undefined reference to `tputs'

/nvmedata/autobuild/instance-28/output-1/host/lib/gcc/powerpc64le-buildroot-linux-gnu/10.3.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /nvmedata/autobuild/instance-28/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
dso_dlfcn.c:(.text+0x28): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking

Fixes:
 - http://autobuild.buildroot.org/results/2032d6b1233ce5c79a0c9421052ab1b9184c5b89
 - http://autobuild.buildroot.org/results/b0e1bd19f0612a0e90d89ad8fe9e294f57871f6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkgconf/pkgconf.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 5d65f69c10..c40c8b9433 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -35,10 +35,10 @@ endef
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
 
-ifeq ($(BR2_STATIC_LIBS),y)
-HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
-else
+ifeq ($(BR2_SHARED_LIBS),y)
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
+else
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
 endif
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
