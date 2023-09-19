Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FBBCD5BB3
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BCD82169;
	Tue, 19 Sep 2023 12:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BCD82169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mCJ42EAgMQi8; Tue, 19 Sep 2023 12:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B09B82039;
	Tue, 19 Sep 2023 12:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B09B82039
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34F691BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 12:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B124416F7
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 12:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B124416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHJQ7G5LLrSd for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 12:55:48 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE3AE400B9
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3AE400B9
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so754747266b.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 05:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695128146; x=1695732946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tj6rZHqU81VONGUZW8r1/C2IcdLaX3zayjzFnhmxdDA=;
 b=ujGqF0TYGGGHrKPqSIjjR1sIeOKaSpK+nYCbQYGT27KLPPwy8PUVb3yBMj2q3mgZe9
 8ijQ03DqyKb/9IGjy3dhwh9omFcXbSdl68jPX6jvcoxz4u807woqDM9nokPOV/5dY4cr
 pI23utgjOe0ScLDQz6URKHGTmXpQAGVXPtltbJbglj+Euj3BfEK+vOR6tE/NgJi3/SjN
 EG+z1W+JgxPfwIMeUL1HH2/4IRTuuxlbrvIDeNNoqYcm6LbNgNZMXI7GvLI6E19U9v4q
 tFotJhu8rw/nh+hadMtauhNymeDRjXfq+6HH+/B82keuis1jThHW9uUsL2krI7UIV5XS
 /uYw==
X-Gm-Message-State: AOJu0Yxsr7bBR9+SuR/nD1gWXp2iM8m86PFfznygSaYNux3fasd6rhy1
 6Zn9Oo7lnPGaDzwGRz0TIpGV8vifzKi18A==
X-Google-Smtp-Source: AGHT+IGMG0RfxEi1rwNKSZncO8pWdY9cDDdE+B1am2bIEmWypd7Qzw760wexwfb3fGPdK2bo0OY2hw==
X-Received: by 2002:a17:907:7601:b0:9ae:251:245a with SMTP id
 jx1-20020a170907760100b009ae0251245amr5506093ejc.60.1695128145570; 
 Tue, 19 Sep 2023 05:55:45 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-a46f-1ab1-1-fdec-12fa-4a04-46aa.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:fdec:12fa:4a04:46aa])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906248a00b00993928e4d1bsm7665331ejb.24.2023.09.19.05.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 05:55:45 -0700 (PDT)
From: kazemi.ms@gmail.com
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 14:55:42 +0200
Message-Id: <20230919125542.9100-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695128146; x=1695732946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tj6rZHqU81VONGUZW8r1/C2IcdLaX3zayjzFnhmxdDA=;
 b=ZX6gykANXEZgkNGmpL+64rCC5jjkIvvFMiDZoyKJbfM2yV3UEpZtqKMIVeC9s0B/w8
 bGG+31qxTig2wcYBLtc89vGaxXBWLi2BktPbnbeykgvRWS9u6zn1R5FEE4jIQ+W3JdvF
 pPR0Y+Yzlzr5w/bW2VXUIwYY5pqe6YzszVrVq15yw09WckHhHrS2ckM96ddtb+rF5WLi
 ZIJHipSUtr5m8ZNE9Cuvyjyh4uAkVbLZkZToHSRpfTlc5dBjXI6DrqOT5sBlsRRwoX2c
 RouMY+16dAHrEspPmlP9ZDyvi5FvIQvZUb59a96LwGAja89IEu3ENj1b7Hb7mW0sJ9Gt
 m2ug==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZX6gykAN
Subject: [Buildroot] [PATCH 1/1] package/mxt-app: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Saeed Kazemi <kazemi.ms@gmail.com>

mxt-app is a utility for managing Atmel maXTouch touch controllers
and other devices that support Atmel Object Based Protocol.

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/Config.in            |  1 +
 package/mxt-app/Config.in    |  8 ++++++++
 package/mxt-app/mxt-app.hash |  2 ++
 package/mxt-app/mxt-app.mk   | 20 ++++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/mxt-app/Config.in
 create mode 100644 package/mxt-app/mxt-app.hash
 create mode 100644 package/mxt-app/mxt-app.mk

diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..e8d39b74b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -556,6 +556,7 @@ endmenu
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
+	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
new file mode 100644
index 0000000000..7e8a5f4901
--- /dev/null
+++ b/package/mxt-app/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MXT_APP
+	bool "mxt-app"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  mxt-app is a utility for managing Atmel maXTouch touch controllers
+	  and other devices that support Atmel Object Based Protocol.
+
+	  https://github.com/atmel-maxtouch/mxt-app/
diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
new file mode 100644
index 0000000000..abf20c728a
--- /dev/null
+++ b/package/mxt-app/mxt-app.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  v1.36.tar.gz
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
new file mode 100644
index 0000000000..626cd352fc
--- /dev/null
+++ b/package/mxt-app/mxt-app.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mxt-app
+#
+################################################################################
+
+MXT_APP_VERSION = 1.36
+MXT_APP_SOURCE = v$(MXT_APP_VERSION).tar.gz
+MXT_APP_SITE = https://github.com/atmel-maxtouch/mxt-app/archive/refs/tags
+MXT_APP_LICENSE = Atmel License
+MXT_APP_LICENSE_FILES = LICENSE
+MXT_APP_DEPENDENCIES = libusb
+MXT_APP_INSTALL_STAGING = YES
+MXT_APP_AUTORECONF = YES
+MXT_APP_CONF_OPTS = --enable-debug
+
+MXT_APP_CXXFLAGS = $(TARGET_CXXFLAGS)
+MXT_APP_CONF_ENV = CXXFLAGS="$(MXT_APP_CXXFLAGS)"
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
