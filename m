Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86024C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2967A4014C;
	Fri, 28 Jan 2022 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1Axq8AeFYNm; Fri, 28 Jan 2022 21:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFAC840BE4;
	Fri, 28 Jan 2022 21:22:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01A711BF345
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F196C41D70
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcTaGLYj6bO3 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C663741D6C
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:22:16 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a1c1f16000000b003525bf08b1eso402103wmf.0
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzEKrC4CU8YTMaHJnWle1DpYvK3EkaPtHaAoLkapRrw=;
 b=UGyyPYRajvPfL63fpBcYtibkbLN63vZNja72n0hOcLxU2g78waGhiUZez0IZP7vewg
 J9HypHHGaXN0BAcsFYD/Gndsa536GtndIBDzVG8VBn3wgi4aeLVACtIimyNL5BjDAVab
 9XZcytFHNXGdmWNceyfk2G5s7GVXj41uzzLgO5vyvXo6AIMPJdm3T9Xdhg/28y8YGwV9
 IhjnTwZ7pHfv2BAxuJINDYFzx2ZaQ14CG5Dp5tlgNR3/4WKnw5YFQqIpN6lBLT0i5QmY
 TdJ7kMnDE73otUwmE/nOgIdWSWgaz62M7BhA/0FA8sXKiO2uWEZMa5p/6dWGT7JE9QAD
 fZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzEKrC4CU8YTMaHJnWle1DpYvK3EkaPtHaAoLkapRrw=;
 b=G71HkxtHgR2jQQ1AC0k5h10dr8BlHKxAFRmvC5AI8jFS3Sk3vvF6fgpBTKxqxVitTe
 QBjaT+VHRhUC3Hk8yE99qvBgzn/f7u8fGpNp0nt6eFtvjbXlEmLd72E7X9tSD0WMxOw6
 M2NfDf3M6xD08hP4YaDa4tLBAG3RkX+G48CUrDcIBuN7Jc7lXxckSMK9/NYOcZrtnhXM
 ZmxquuuvWB51Eeepv3fPrEgYx02X8Pk/tZu6lBwpBUzKal8f0K2ASA4zKnssH/pe30Y1
 qeHEFgOlpHF3GO5u1Xm9CMFOlRD2dPhXrp501iYZEB4l3XKMYjfMXn9oKJh89hKbqyOE
 YhTw==
X-Gm-Message-State: AOAM532ZuaECW15mfZ57+Lp18zIKLcHwt65ApWWHWw4Sp985BYAMOOd3
 /9iEBJqEREutpwEeQ9OSzxzU6P2uhog=
X-Google-Smtp-Source: ABdhPJx8UpaC8ih7xFj2DDdcF3h1MggQOw+dBijZqtv9oeYpNSMgErUOzPcJNzBw+xsikYzeuQGKlA==
X-Received: by 2002:a05:600c:2251:: with SMTP id
 a17mr17590603wmm.102.1643404933858; 
 Fri, 28 Jan 2022 13:22:13 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id j13sm5465446wrw.116.2022.01.28.13.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 13:22:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:20:05 +0100
Message-Id: <20220128212005.2899314-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version 2.2.7
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://www.keepalived.org/release-notes/Release-2.2.7.html
https://www.keepalived.org/release-notes/Release-2.2.4.html
https://www.keepalived.org/release-notes/Release-2.2.3.html
https://www.keepalived.org/release-notes/Release-2.2.2.html
https://www.keepalived.org/release-notes/Release-2.2.0.html
https://www.keepalived.org/release-notes/Release-2.1.5.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-core-Fix-compiling-on-RHEL-9.patch   | 34 ---------------
 ...us-fix-policy-to-not-be-overly-broad.patch | 42 -------------------
 package/keepalived/keepalived.hash            |  2 +-
 package/keepalived/keepalived.mk              |  5 +--
 4 files changed, 2 insertions(+), 81 deletions(-)
 delete mode 100644 package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
 delete mode 100644 package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch

diff --git a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch b/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
deleted file mode 100644
index 39134fcc35..0000000000
--- a/package/keepalived/0001-core-Fix-compiling-on-RHEL-9.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Tue, 8 Jun 2021 08:57:45 +0100
-Subject: [PATCH] core: Fix compiling on RHEL 9
-
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
-
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/3fd0c21e4f63ac0a52b5d7a09575f0f364972e4d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/core/layer4.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
-index d2cc971a3..fdca04913 100644
---- a/keepalived/core/layer4.c
-+++ b/keepalived/core/layer4.c
-@@ -27,13 +27,14 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <netinet/in.h>
-+#include <net/if.h>
- #include <linux/icmp.h>
- #include <linux/icmpv6.h>
- #ifdef ERRQUEUE_NEEDS_SYS_TIME
- #include <sys/time.h>
- #endif
- #include <linux/errqueue.h>
--#include <netinet/in.h>
- 
- #include "layer4.h"
- #include "logger.h"
diff --git a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
deleted file mode 100644
index 6287d6117d..0000000000
--- a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
-From: Vincent Bernat <vincent@bernat.ch>
-Date: Tue, 23 Nov 2021 06:50:59 +0100
-Subject: [PATCH] dbus: fix policy to not be overly broad
-
-The DBus policy did not restrict the message destination, allowing any
-user to inspect and manipulate any property.
-
-Signed-off-by: Vincent Bernat <vincent@bernat.ch>
-
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
-index 2b78a575c..b5ced6085 100644
---- a/keepalived/dbus/org.keepalived.Vrrp1.conf
-+++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
-@@ -3,12 +3,15 @@
-  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
- <busconfig>
- 	<policy user="root">
--		<allow own="org.keepalived.Vrrp1"/>
--		<allow send_destination="org.keepalived.Vrrp1"/>
-+		<allow own="org.keepalived.Vrrp1" />
-+		<allow send_destination="org.keepalived.Vrrp1" />
- 	</policy>
- 	<policy context="default">
--		<allow send_interface="org.freedesktop.DBus.Introspectable" />
--		<allow send_interface="org.freedesktop.DBus.Peer" />
--		<allow send_interface="org.freedesktop.DBus.Properties" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Introspectable" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Peer" />
-+		<allow send_destination="org.keepalived.Vrrp1"
-+		       send_interface="org.freedesktop.DBus.Properties" />
- 	</policy>
- </busconfig>
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 94af43c3e6..9d8ab949b7 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  245bf399e4320064996ac5507236a8896f545d005f6c4c3b91701bcbc5728c60  keepalived-2.1.4.tar.gz
+sha256  c61940d874154a560a54627ecf7ef47adebdf832164368d10bf242a4d9b7d49d  keepalived-2.2.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index e31c02dec5..7a1123b4dd 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.1.4
+KEEPALIVED_VERSION = 2.2.7
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
@@ -12,9 +12,6 @@ KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
-# 0002-dbus-fix-policy-to-not-be-overly-broad.patch
-KEEPALIVED_IGNORE_CVES += CVE-2021-44225
-
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
 KEEPALIVED_CONF_OPTS += --enable-json
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
