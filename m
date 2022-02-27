Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 09:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B4C582D57;
	Sun, 27 Feb 2022 09:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-KTx89oa8mE; Sun, 27 Feb 2022 09:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C4082C18;
	Sun, 27 Feb 2022 09:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6111BF329
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 09:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 286FD40165
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 09:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 159IKAedozCX for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 09:12:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0289400FD
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 09:12:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so4157420wmj.0
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62hYpsxzRgdQOT6KT2bQAOIDfNt0gy5eLWFGKatgiL4=;
 b=j33dbboLxFI5qLaako7ZZmX2BINizkh3pYK5B9pWoc5ybQpDO/boEQelWgEpjbvD9y
 2TMHNlfP+yK4853nYOTvW4M0PXAmU2350hU62ohv1bKSRe5oNjzp3UP49B4guCtPzdA2
 0s3WdX0aIWF64yv4ITs0aYScl4X4q0hl2H2pMbX98KodIqzmIlcu+AEYNliDFYaEzdQS
 Yf+Fl1jsdQxAuHr4qRkj0rPdUSdgYRKWXGE2uCSYQ2E0ZUlSJov0u4+i1CO18WFaX2b5
 04cUxgO7NYvwjD7W5SW1nDvWuSkhbRc8go9akPyQ8QVN5d7cAMz7CoWsECT6uAFPdfqk
 nIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62hYpsxzRgdQOT6KT2bQAOIDfNt0gy5eLWFGKatgiL4=;
 b=74l/15DpOntjreYsYn8AkTnJsURPS/Uqm0ODkoRIPnWoiKmOOPvBKhGK9zTbk0YTrZ
 cOB0WjYvOrcduWjN54A0w3H52K2q6djGxVtBMFPVaapH/qQxidY7qxbXlntPppYyKAJq
 9a//nxN9VpyDRR1oDjV+rIN7i0xjK+vhIcCaOwNXrpvei6daFTh4cIyhjxa+x/iTijtj
 IdomwFFOYKr8MRUkBiavtaxB5K7B6lhyuOUdtvn4j3JRZou9fI9Iak4loBajwIUSB+aQ
 TPDHtLonrl5i/eTPUDNFUGNLdbUcZJCR7hsE1gHQ0/fsDDRkh+2RjU/FNbqI/zWNQTuv
 rqsw==
X-Gm-Message-State: AOAM531psIbLbUPZjKtK9zqBcZ0JrKcyUc7bunWb9Niedy/cJ+/KCy8v
 ssBDQseWNJ2ZU9mA14FyZ6l/1Dscjow=
X-Google-Smtp-Source: ABdhPJxbCZYg2MmSeiHwbtgDhRTPpcM1lFLoDH4smvoa3pWP/6YJ+DLRYSybvQz04/cIfdHR9tYbrg==
X-Received: by 2002:a05:600c:1f05:b0:37b:d9aa:e210 with SMTP id
 bd5-20020a05600c1f0500b0037bd9aae210mr9488107wmb.63.1645953122816; 
 Sun, 27 Feb 2022 01:12:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm12208472wmb.48.2022.02.27.01.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 01:12:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 10:11:40 +0100
Message-Id: <20220227091140.3643535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix build with libexecinfo
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

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/10.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: ../../libwinpr/libwinpr2.so.2.5.0: undefined reference to `backtrace_symbols_fd'

Fixes:
 - http://autobuild.buildroot.org/results/095c33098a6e59ff664080e03baf1a3c92b4265f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c536f6cb1c..5f6ae56d1d 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -43,6 +43,11 @@ else
 FREERDP_CONF_OPTS += -DWITH_ALSA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+FREERDP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
+FREERDP_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 FREERDP_CONF_OPTS += -DCHANNEL_URBDRC=ON
 FREERDP_DEPENDENCIES += libusb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
