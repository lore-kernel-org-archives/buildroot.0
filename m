Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCADC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 17:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C0060B32;
	Sun, 16 Jan 2022 17:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElsfXWuRyQSh; Sun, 16 Jan 2022 17:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1770460675;
	Sun, 16 Jan 2022 17:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 057201BF5DE
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 17:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E825382771
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 17:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUqsgmXV9uCE for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 17:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8169481B7B
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 17:54:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k5so6740434wmj.3
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPlGz7NteSqLAvC0ODJsP0XUKsaHecrCw0qx0qG1XJk=;
 b=XXwLHL+sRiM5GnLprTX4w6VZ2dKHUwGkEF0Aj/N6iQ41H6sEtna78XYqbVwuJsIVBA
 ZvPRfGN5Fd9CVnFdbQD6crmvD/g3zAuHUmrvJj4k7sBWPvZWhr+fzM/vKxj2Tg0/ScuA
 KA5WTeefL6bSC9UYAYG1rXoPOSl/uoMQp1Exw7DpG3ukONsTP+hBv5qRn+ajd2+zV4qs
 Mp5j22VWonPNtp4NyUw4TqV8n4OUDZNHs7oRBIP7OnP2BD3j9hajBhJBZj0WIdPWCX5O
 Oar7gJAuS/RJ7aHjFFodtm7kPI1ZWbfa6KnO3s2B9XtBoIPjRh+6LwBodK291IMrfb/A
 J+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPlGz7NteSqLAvC0ODJsP0XUKsaHecrCw0qx0qG1XJk=;
 b=evgZPUCfK6LLWfqEmOVDzYIS89a2HCxDWBxL1pZJJqxK0j9CFcOtMNEZ3kcXkIN7WX
 90FwIfY880XqHYl+tLKg+E4RQJO2bZ0I2kU3fLRqQvkD727i9CvhL+nOLCnsc8+jpZUM
 iE/zhTNFcesdKQbDNWx6MuoN0/rwmytkXeYG+bk5Uf8/7BbVCg/lQn0zP9/tinfC2itZ
 UjbzybtOVNPWZ7jBiiA99kiy8RG7XgWyfttwMQm8CADS2M88+gqB7Mq2X3Yhl8y8eHcr
 0p/VTGPSDE7MtHcX7og2oXjKxV0oZpDvtijm5kZe8+vfU8j4WboW+7bdlb0oORvp74RG
 BRaQ==
X-Gm-Message-State: AOAM530eQrD1XIXf6D69E22nq0czpUhJgfscDrFlrudiMFxIsUQ//YML
 oYqqA6pPaZh+fEwg+sEw5JzeI3OnobU=
X-Google-Smtp-Source: ABdhPJw2CxJAQcucohW7MvfVNAN4xPGxkvHmO5B9auHLOIQyT3/Ezt5/l0KFt4fY92Z1EUfI1Lnuvw==
X-Received: by 2002:a5d:4301:: with SMTP id h1mr15796258wrq.511.1642355646091; 
 Sun, 16 Jan 2022 09:54:06 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id c11sm18922302wmq.48.2022.01.16.09.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 09:54:05 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 18:53:19 +0100
Message-Id: <20220116175320.453041-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/opencl-clhpp: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

opencl-clhpp are the OpenCL API C++ bindings

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/opencl-clhpp/Config.in         | 10 ++++++++++
 package/opencl-clhpp/opencl-clhpp.hash |  3 +++
 package/opencl-clhpp/opencl-clhpp.mk   | 16 ++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/opencl-clhpp/Config.in
 create mode 100644 package/opencl-clhpp/opencl-clhpp.hash
 create mode 100644 package/opencl-clhpp/opencl-clhpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a91e2dfcde..483afa4932 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1084,6 +1084,7 @@ F:	package/libeXosip2/
 F:	package/libolm/
 F:	package/libosip2/
 F:	package/ocrad/
+F:	package/opencl-clhpp/
 F:	package/opusfile/
 F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
diff --git a/package/Config.in b/package/Config.in
index 4df1474b91..08eb3ad809 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1564,6 +1564,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
+	source "package/opencl-clhpp/Config.in"
 	source "package/opencv3/Config.in"
 	source "package/opencv4/Config.in"
 	source "package/opengl/Config.in"
diff --git a/package/opencl-clhpp/Config.in b/package/opencl-clhpp/Config.in
new file mode 100644
index 0000000000..12045be055
--- /dev/null
+++ b/package/opencl-clhpp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_OPENCL_CLHPP
+	bool "opencl-clhpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  opencl-clhpp are the OpenCL API C++ bindings
+
+	  http://github.khronos.org/OpenCL-CLHPP/
+
+comment "opencl-clhpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
new file mode 100644
index 0000000000..27b27cd80c
--- /dev/null
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -0,0 +1,3 @@
+# Locally Computed
+sha256  869456032e60787eed9fceaeaf6c6cb4452bc0ff97e0f5a271510145a1c8f4d4  opencl-clhpp-2.0.16.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
new file mode 100644
index 0000000000..610cd45b62
--- /dev/null
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# opencl-clhpp
+#
+################################################################################
+
+OPENCL_CLHPP_VERSION = 2.0.16
+OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
+OPENCL_CLHPP_LICENSE = Apache-2.0
+OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
+OPENCL_CLHPP_INSTALL_STAGING = YES
+
+# OpenCL_CLHPP is a header-only library
+OPENCL_CLHPP_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
