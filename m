Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6C4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21D860E97;
	Sun,  3 Apr 2022 21:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mI2FdU72hbrM; Sun,  3 Apr 2022 21:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E707B60BD1;
	Sun,  3 Apr 2022 21:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFB51BF2CA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BEFB82C33
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zh7lkebrOFv4 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 21:19:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84C0482BFD
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 21:19:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso2067132wme.2
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 14:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RTvZX/AgPL/JuAU4VCO2d1j5SJbrwxQr1b4at9eklwA=;
 b=kei21Rad75vZfOcma5PGIUZhfwcsgpi12AEkeWSe8bastQ7iQXgAbf3haLIQvHJFgR
 ogIFW7OYYGTCgaOW69v3BxEcn+Ownpa0m+RktASgWQmBpINtg+aReg3LWXGvUhimZRqj
 B5jhZZvQNwvB9T9T+IVvaY6fSD46yXmcFowBbAQnUEyaeRmVxvwsVMZ8giFDW8zcFDrV
 WHWKjvLapql/L5QppGUK5FsaKF6vUnTrH6puPi71ERE0O4lipxl6qzONgAo01JXJ53vp
 CW4YGEqJvsfj08qyAEBwSO0RXqT/unL/UX6P6V5Jlu9IT/Y9dVMAejbl/P9ikFB5xx9O
 oNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RTvZX/AgPL/JuAU4VCO2d1j5SJbrwxQr1b4at9eklwA=;
 b=2LILoT98wZ6yqYSrkpvLFxvmL9ob6pK5/Qln+J3vJbFZKbgQ73A7zV9zBCg2IkNurh
 SAoo1d9BRDYV3ElqlBF1H7nPbGwaNXCLx0V2X4T6uLOCBEMV2kD/cSeJNGjCjhIP5Xza
 jOkRZRJJe0DP2QD/LwWFvqRj+Fd0uBWtdYSgUAQHQ9LRZly0NYaozDVXzAryCDWmRM5W
 xT7HcxPQIgAUCOpaAmjgaoFu5P66x2Hc6Yuj+snPZCgJwobyLUUSwwqQrS+1RbJvG4iK
 MqsIb6sHuJoRAFMTjcmqT2KsSy2SunEskfDgBmOuREbauhZFW6JaP+XJs8V9zEbNxpgZ
 Eq7g==
X-Gm-Message-State: AOAM532rtIuDPk5j+cDjmuzjTrbyTdELExkyG7bdrLOGolOWTQaTixpI
 3baJxDPeonlZdeD4KmBX9HBHk9ZVY28=
X-Google-Smtp-Source: ABdhPJx9mS3f5mjB4f7nCuU63kh23l7qd0CakZV6rvn6oGc/17ugeytLlQJWt+6w9yjulTGuj3H1pw==
X-Received: by 2002:a05:600c:ad1:b0:38c:8bf6:7d6b with SMTP id
 c17-20020a05600c0ad100b0038c8bf67d6bmr17032074wmr.84.1649020779378; 
 Sun, 03 Apr 2022 14:19:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm7601986wru.78.2022.04.03.14.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 14:19:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 23:17:54 +0200
Message-Id: <20220403211754.2037013-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix build with gcc
 4.8
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

Fix the following build failure with gcc 4.8 raised since bump to
version 0.14.0 in commit a334b9a7668ba412cb2da79b75a019cd89985145 and
https://github.com/RidgeRun/gstd-1.x/commit/e83c94920bb33846ff0642dcf070fc5fd124e4f6:

../libgstd/libgstd.c: In function 'gstd_set_ipc':
../libgstd/libgstd.c:119:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (gint ipc_idx = 0; ipc_idx < num_ipcs; ipc_idx++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/00ad1b8979000aa10a20228c998389bc913cbbd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gstd/gstd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 08a29f26ff..817e9143ae 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -28,6 +28,8 @@ GSTD_CONF_OPTS = \
 	-Dwith-gstd-logstatedir=/var/log/gstd \
 	-Dwith-gstd-systemddir=/usr/lib/systemd/system
 
+GSTD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 GSTD_CONF_OPTS += -Denable-systemd=enabled -Denable-initd=disabled
 GSTD_DEPENDENCIES += systemd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
