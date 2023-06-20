Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160F8EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955A94176D;
	Tue, 20 Jun 2023 17:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 955A94176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsXNVb-OLjC8; Tue, 20 Jun 2023 17:38:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D2E41778;
	Tue, 20 Jun 2023 17:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D2E41778
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40CB11BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A80A405FC
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A80A405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id om7H_WZMlQPJ for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:38:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17EB040901
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17EB040901
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:38:21 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b2c3ec38f0so3171245a34.1
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687282699; x=1689874699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPAB3kwB+mBkrz+d8ntumvf2vmw7CCBWfKIo9HTm8w8=;
 b=M6oCswkEzeySGEawmIQRFvroPT/Sxs7pTiQYE9cdXNELAfcPt3dkYB8Vm9U5kEat3f
 4iJWGUsqE72NxPSDcc4xzkwd1csnZ1E3EHNzf3lJKceDqQdoQIHUQkBklj2ghp/LHMjA
 WwAXycR2soAD84xMynM2FC4PCJEGWp7ft0qYi/lCk6uXb8WpbJF/WqejJ24UGlaQrRm4
 CRedwhsYEer9QWNpHkMxl639rBgfnvG855Ysyp0Q1Lw26O1iIVNN/xxD9hXsG2WbwJ29
 +dtNEiutvuLfah0QbdUJyH1CpGhGDN4o6rjRJcFr76VFsaaLgxxEHSY2+RQ5nXsQ7w70
 r7EA==
X-Gm-Message-State: AC+VfDyx6KQw2VhXcQtG2plprn2m5rFCu7H4sp5jLAeMm4HrblniugDZ
 A/TyTLc0mnKcf6Gjj/9N1jvZtUtpM4c=
X-Google-Smtp-Source: ACHHUZ5NyrjX7ngJLgvhDMy3F9CXFd4OCNuMbLQH+wUvCMixGFk1vu25f6whptxn4f+RLIqyTbnpiw==
X-Received: by 2002:a05:6358:5110:b0:131:9c:2dd4 with SMTP id
 16-20020a056358511000b00131009c2dd4mr871998rwi.9.1687282699494; 
 Tue, 20 Jun 2023 10:38:19 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 m125-20020a817183000000b0056d4c86b639sm609213ywc.9.2023.06.20.10.38.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:38:19 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:38:13 -0700
Message-Id: <20230620173813.4590-2-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230620173813.4590-1-ckhardin@gmail.com>
References: <20230620173813.4590-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687282699; x=1689874699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPAB3kwB+mBkrz+d8ntumvf2vmw7CCBWfKIo9HTm8w8=;
 b=iwzjoCCjUY/LIkjEsnZo0BjfWm5fq6Xx+657LF5gSuFQfAxbggMHgmARB7AHL43CTC
 i4NFlgsbcvQbzxy9KCUJ5fhk0jQPtxQYnpADCWD5DIBVbkBebfSc2NVKOp7t48Ykmplx
 tlFTdj5+0miw/+5l+w0VoOhkn+rjrgVka/osbnHdBzi/RXzL9zwf97OwaDKeULRDubzN
 C21w1ZeuNFIG3mOKqrMSJph6suKSnRTMbx2lg6m/rMyvI/8dVXv26eZVqpevwX1nGLzG
 xX0H29YhKxgOoe5wChN+3N3Kf3+PqoRqe0EghstmYFR9Bu+o3U1SRcIo12bu5eBQf568
 a9fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iwzjoCCj
Subject: [Buildroot] [PATCH 2/2] package/alsa-plugins: require libsamplerate
 for the plugins
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During the execution of the alsa plugins on a test application,
the library would not function without samplerate being enabled
and present. So, this is a patch to just include the samplerate
since the latest versions seem to require it for the plugins to
work.

There might be another fix instead of this patch, but this got
the sound to play for the bluez alsa stack as expected.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/alsa-plugins/Config.in       |  1 +
 package/alsa-plugins/alsa-plugins.mk | 22 ++++++----------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/package/alsa-plugins/Config.in b/package/alsa-plugins/Config.in
index ee0fb4c1d5..e85ff218dd 100644
--- a/package/alsa-plugins/Config.in
+++ b/package/alsa-plugins/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ALSA_PLUGINS
 	bool "alsa-plugins"
 	depends on BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
+	select BR2_PACKAGE_LIBSAMPLERATE
 	help
 	  Advanced Linux Sound Architecture Plugins
 
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index d23a81c5ee..8046720297 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -7,30 +7,20 @@
 ALSA_PLUGINS_VERSION = 1.2.7.1
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
-ALSA_PLUGINS_LICENSE = LGPL-2.1+
-ALSA_PLUGINS_LICENSE_FILES = COPYING
-ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
+ALSA_PLUGINS_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (samplerate)
+ALSA_PLUGINS_LICENSE_FILES = COPYING COPYING.GPL
+ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib libsamplerate
 
 ALSA_PLUGINS_CONF_OPTS = \
+	--enable-samplerate \
 	--disable-jack \
 	--disable-usbstream \
 	--disable-pulseaudio \
-	--disable-libav \
-	--disable-maemo-plugin \
-	--disable-maemo-resource-manager \
-	--with-speex=no
+	--disable-avcodec \
+	--with-speex=builtin
 
 ifeq ($(BR2_PACKAGE_ALSA_UTILS),y)
 ALSA_PLUGINS_DEPENDENCIES += alsa-utils
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
-ALSA_PLUGINS_CONF_OPTS += --enable-samplerate
-ALSA_PLUGINS_DEPENDENCIES += libsamplerate
-ALSA_PLUGINS_LICENSE += , GPL-2.0+ (samplerate plugin)
-ALSA_PLUGINS_LICENSE_FILES += COPYING.GPL
-else
-ALSA_PLUGINS_CONF_OPTS += --disable-samplerate
-endif
-
 $(eval $(autotools-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
