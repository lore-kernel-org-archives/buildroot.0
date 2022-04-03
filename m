Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C199C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 10:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 278FF403F7;
	Sun,  3 Apr 2022 10:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCm6tMRP61pt; Sun,  3 Apr 2022 10:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA86A403AC;
	Sun,  3 Apr 2022 10:05:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A574A1BF29F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 10:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91E5B41676
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 10:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8wtm-OZ5sQv for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 10:05:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C890441675
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 10:05:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u16so10297907wru.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5PUZy1kaPzDJ/zpajKfVuIVTsMylg0crV5ee1Lsnx4=;
 b=eqEenl9mmRhou+b7jDP81DKGxsZTzl/JRp50xwU9KQ+q9NFOJ9NN+fmfvVTs7Bpzgi
 mFdryYeElT1umpPe5NN+nYl1l7BLLpg8+FDKxWvEeDpCiIPwtzjOYMopm82IXv1+UO29
 c5yHOr50H795k+wIuJbyGiLtQHaGJXHTRj162khGrMtLYWWO/YG6OLQgDZ14TJCk4+4E
 BX3Qf3q4DpZBL87vjL2VPOqN6kWiZlLefFuf0NQjxcFLM0d2kDJx/SxEiv+78el1a9j6
 hY54MLYyQET9aqRZXI4bwjPTx6DxXucHOKLnBaIUsDTALNh3eEiAg4oE/ngGz/ZcpSrA
 NQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5PUZy1kaPzDJ/zpajKfVuIVTsMylg0crV5ee1Lsnx4=;
 b=2AMbFig1VvKLsM0+wKos1Y/xUn3+EtCUcnaKkfxyTT2NXd2SVJOJxhKD2l82/6+B4C
 88tI+o998vQ7UvsM/w8jWMBaNBA1UM/yGjY/L6j0aFwNQggrDaJEDlQKRAK38mzvdbuf
 PT2eL0Xtrn1IxTd9wq5nfro2vCWLSXV05hf8zpUAd8PHHCMG09B7Y3IQVoU4OCoMAGRi
 BMI3/cJSAo36bZlkOkunOLHVO0+53eiljpz21C/wZTLMxK2gWw7exQg2BdzGobhrMrB4
 sgtLyduPNN57uhVWEi/GkqNmPJ8bCcKyiDD6RL5YtlNx0hu/lmmUvfCPUJr6Fe/YNFlD
 kiiw==
X-Gm-Message-State: AOAM531DaFAXUxslI1vWVY0pS6CxR3l9/GqxhyCRotwVV9OEH7S1gnrr
 SxB7FJ9ytyO4nNy8rp86JQFCExz+aj0=
X-Google-Smtp-Source: ABdhPJz8Dlz2OIiGsq/rXkl8bTdu2ZGPxl9+93IBa1ql7k09szsL3KJDXPPgsZuBYr/4LhmsRI457A==
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr13319485wrf.584.1648980329835; 
 Sun, 03 Apr 2022 03:05:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm7820404wry.53.2022.04.03.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 03:05:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 12:03:18 +0200
Message-Id: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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

Use internal bind as dhcp doesn't build since bump of bind to version
9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
doesn't plan to fix it any time soon:
https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883

In file included from ../includes/dhcpd.h:91,
                 from ctrace.c:29:
../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
   51 | #include <isc/boolean.h>
      |          ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/Config.in |  1 -
 package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 515040c612..e0706efafb 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
 	# fork()
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_BIND
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 18765a3639..f1e3c22f1c 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
-DHCP_DEPENDENCIES = bind host-gawk
+DHCP_DEPENDENCIES = host-gawk
 DHCP_CPE_ID_VENDOR = isc
+# internal bind does not support parallel builds.
+DHCP_MAKE = $(MAKE1)
 
 # use libtool-enabled configure.ac
 define DHCP_LIBTOOL_AUTORECONF
@@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
 DHCP_CONF_OPTS = \
-	--with-libbind=$(STAGING_DIR)/usr \
+	--with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
 	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+DHCP_BIND_EXTRA_CONFIG += --with-zlib
+DHCP_DEPENDENCIES += zlib
+else
+DHCP_BIND_EXTRA_CONFIG += --without-zlib
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DHCP_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
-DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
 DHCP_CONF_OPTS += --disable-libtool
 else
 DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
