Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0BAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01EA60B20;
	Thu,  2 Jun 2022 16:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNUa4J93yYns; Thu,  2 Jun 2022 16:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C37B960B07;
	Thu,  2 Jun 2022 16:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 446F31BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F10C40570
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gm2ssCL0ebe for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18863400D8
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:27:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id a10so295399wmj.5
 for <buildroot@buildroot.org>; Thu, 02 Jun 2022 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeKhPrBAyLxQWkW+sOqmq/HNF2k1fIAFb/5/KHWpwqs=;
 b=eQnTfvDjKfXQkPI8ZGbApiSc8OSa/EKX0RxhKLm7YucibtfbdhKYZQBoSa1ii8oTIq
 xpb1RSrJc8M+nNcpfu0EVpKTRrLkqoZ9H4EMp0s7qlmPRZsPHFEMfcZBDGY0AfcYZATU
 IS0+wZe6Z6aqOV55gfUa/y3ro2nS2JF6G3XC4L8VLT6uxVKtNgdKVYGpdg9quEubPKeJ
 ZWq7vDZetIoSsZ3sTF4l2SrgIE5lCYYWw474a3LSWRsLnDkYyE8En2SWIVxIEGQ75Lt9
 bKeZtO9r4zBnb6SlRJuZpJ68P+wS1Tb0pJkehECQ5D2ozkdrCEzVPy6O9RK95Hj9mnyn
 sK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeKhPrBAyLxQWkW+sOqmq/HNF2k1fIAFb/5/KHWpwqs=;
 b=i2OG9PhI0PWUiDS0ToNnv0qTzVQdH3IGgLawy3oLYlrhFP38eaixrhUhSSInS3bBpL
 a969X0TTl21KxOrHL0OnFvBK5wGJ1HRWY/wAS9dRZw3rTvAC4sVk+yF2JW9duUXxrfxj
 geeXwf7oMOOiQMktJKP6NHLmzjQywIPxlROHaev95mTya9bS7tv90Y6JkXPbXVl0qczd
 /WXbhnrXdLsJ/+z3SX1TJrW0v8v/y/YPyyvTwq1xovTMJWrJezYbjs0yge4SVyAjPQeX
 V6RmhXfXY02x1BtsPXlS+jegAWkM0L9qVdEvezo+qw9uUXu4z+Ld/S7pEHS27m9Cb9lT
 m3Zw==
X-Gm-Message-State: AOAM531/SFE7CUBZ8ceS/DEt6YxkpXcttNbotApSQIuvK/2VAlENYY+7
 mssMgJ3jrHVK10JEokUSXD0lvRB72bg=
X-Google-Smtp-Source: ABdhPJx9i3hgvsb3BhN6NRse1Bwq1FyKIgW9H8funZSKbjjN1Nxe89s0z/6IQ9uZdcqho56hFOrMPA==
X-Received: by 2002:a05:600c:3ba4:b0:397:49b8:262 with SMTP id
 n36-20020a05600c3ba400b0039749b80262mr4727624wms.77.1654187242031; 
 Thu, 02 Jun 2022 09:27:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002102f2fac37sm4961229wrt.51.2022.06.02.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 09:27:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 18:24:49 +0200
Message-Id: <20220602162449.4160788-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: put back libuuid
 dependency
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

Commit 8b47feff2ff8ac37355431cb0414822da2c87ea1 wrongly removed libuuid
dependency resulting in the following build failure:

checking for UUID... no
configure: error: Package requirements (uuid) were not met:

Package 'uuid', required by 'virtual:world', not found

It should be noted that <uuid/uuid.h> is still used in one example:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/examples/C/glib/add-connection-gdbus.c#L17
as stated in
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b:

"We still require libuuid for building, because it is used by an example
program. Maybe that should be changed, to avoid the build dependency.
But that can be done at a later time."

Fixes:
 - http://autobuild.buildroot.org/results/ac25c42d73161bf4cdfae3e53de8826f0b8dbf9c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/Config.in          | 2 ++
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1370c81c9c..39114daf18 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  NetworkManager is a set of co-operative tools that make
 	  networking simple and straightforward. Whether WiFi, wired,
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 81d6eedf0f..3c39ce7d6d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
-	host-intltool libndp
+	host-intltool libndp util-linux
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
