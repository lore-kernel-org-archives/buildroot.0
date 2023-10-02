Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A946E748FC
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 17:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D9C240139;
	Mon,  2 Oct 2023 17:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D9C240139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nz4w8MfEVWEx; Mon,  2 Oct 2023 17:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88162404C9;
	Mon,  2 Oct 2023 17:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88162404C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 340C31BF3B9
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ADE660F79
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 17:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADE660F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJpNAb16a6V0 for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 17:36:43 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B152D60FB2
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 17:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B152D60FB2
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53829312d12so4157533a12.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 10:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696268200; x=1696873000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9QGza1lm0aXhcKJw0Wm+TH40BTjw9o/m3sbzG0z2nI=;
 b=ffaep09NPC2KOxurLhDD17cztrefBUNsqyyiX+gqnwo7CijOm7i011Da9zfJ11FJgs
 pywDV33gH8gT27wquGucf9NM7sQ1IcWa7L517yl4oAIp2+THBpH8l/xP9/gfKbGIx2f0
 F7SDfJD/ukp/7VH/4tUPqQcBPxYAKL/pnPn9L1b8BYJhVSCF8JyVeEa75GQOieRCiseU
 GBMWybeOGnIW3zP2dl3esncUC8pJuEN82N+AmHjEXO/k4CaCawibiCF1AfsXEhqOuJpS
 JX65cMp5M+XAMMHE3NR0haj+qDrH2zjgO4N6hBKBV+6gHx5ZRP3B/XMD+8vL9I3VjY4q
 FkZg==
X-Gm-Message-State: AOJu0YyNcQ6BSCLjrv642/kKzRgKPGkkXkj3iwp3WPhNg9mS0HWCCoo6
 DZ+BwOhuIM8LfvZ+xc2ZLQzh5+7QefaoWA==
X-Google-Smtp-Source: AGHT+IFkBoD8ogQIHoM7Pk4UyRtGQoPyCKrxsVsZM2S6w5MQR+J+Zc8Cr82h6wnKStqb8qJTnomj7g==
X-Received: by 2002:a17:906:73cd:b0:9b2:bcea:e517 with SMTP id
 n13-20020a17090673cd00b009b2bceae517mr316904ejl.10.1696268200192; 
 Mon, 02 Oct 2023 10:36:40 -0700 (PDT)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2a02-a46f-1ab1-1-acd-25a4-82b5-c6d1.fixed6.kpn.net.
 [2a02:a46f:1ab1:1:acd:25a4:82b5:c6d1])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a170906179500b00988e953a586sm17390928eje.61.2023.10.02.10.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:36:39 -0700 (PDT)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 19:36:28 +0200
Message-Id: <20231002173628.2812917-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696268200; x=1696873000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9QGza1lm0aXhcKJw0Wm+TH40BTjw9o/m3sbzG0z2nI=;
 b=AIvzE3g9cx4g5S1fEbafKDivp8KK0iI+Iyd9BORBk9jw7qGUWmuvPbaD10vDyP0zu4
 hL5LFw+/7xm8OOkLLwRgtXVMhtu69ahJHkxjdfri4HVYIHTUkEF0gy10Wso9PKVj8V0+
 5osb+zH6azHYDbBOmu7xMM3khkR4LHNS38vgfYdiw9G2ITmy1sLHvqWaw390G/9Kg8WY
 uMb6vrVLjoiCoEWoLrAwBMh6keLdKHE9MTg78WUTM26QsygJRD5ERUlXThb1DvPcJ4Z2
 dYJs42+w6ZCapyDGtSadRs+aWCmoZxu+ujgsFegSPwg/MdICJ7kh0SIDnC3w9oDFQ7zC
 5MyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AIvzE3g9
Subject: [Buildroot] [PATCH 1/1] package/eza: new package
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

eza is a modern, maintained replacement for ls, built on exa.

https://github.com/eza-community/eza.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/eza/Config.in |  8 ++++++++
 package/eza/eza.hash  |  3 +++
 package/eza/eza.mk    | 12 ++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/eza/Config.in
 create mode 100644 package/eza/eza.hash
 create mode 100644 package/eza/eza.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c45e7315da..944c4fd8bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2626,6 +2626,9 @@ F:	package/agent-proxy/
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
+N:     Saeed Kazemi <kazemi.ms@gmail.com>
+F:     package/eza/
+
 N:	Sam Lancia <sam@gpsm.co.uk>
 F:	package/lrzip/
 
diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..589dfc682a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2633,6 +2633,7 @@ comment "Utilities"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/easy-rsa/Config.in"
+	source "package/eza/Config.in"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
diff --git a/package/eza/Config.in b/package/eza/Config.in
new file mode 100644
index 0000000000..b0a49afefb
--- /dev/null
+++ b/package/eza/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EZA
+	bool "eza"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  eza is a modern, maintained replacement for ls, built on exa.
+
+	  https://github.com/eza-community/eza.git
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
new file mode 100644
index 0000000000..39923ceb48
--- /dev/null
+++ b/package/eza/eza.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2dac8aa41433eeaa07c4eabdf557b7e134c3fda9ba9edb8ab57959354856e20c  eza-0.14.0.tar.gz
+sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
new file mode 100644
index 0000000000..a327de0dcc
--- /dev/null
+++ b/package/eza/eza.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# eza
+#
+################################################################################
+
+EZA_VERSION = 0.14.0
+EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
+EZA_LICENSE = MIT
+EZA_LICENSE_FILES = LICENCE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
