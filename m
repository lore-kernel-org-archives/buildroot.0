Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9614BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 23:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1C3360EDD;
	Fri, 25 Feb 2022 23:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPnZu63_izSb; Fri, 25 Feb 2022 23:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9D260BB2;
	Fri, 25 Feb 2022 23:05:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65611BF2A7
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92FE160BB2
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 23:05:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzNKHSYNgT54 for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 23:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 866E860B8C
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 23:05:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y5so2505018wmi.0
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 15:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8sYsbNQeHsfdK7vYLux4gOctWqSd4scyhcz+RDoAJc=;
 b=ld1Gr7kdoxwBfFpT3m0tzps25ZWw0O7cnBs5lQI8UD6jLHnHqzt9CubTtqg0WFb6cT
 nFTVoYcGAVx2TXpbSy1rAgowjadHPOXxlBe4vDA0XS/BrzCw0Xd3R66ugNp1Dzv7oxEw
 DvF6D+L3TboVzoMnrkqAoDN53RJBZh7sN1whjkVaw2RwEoGJZhTwSwADTai5MhwMOMku
 n566ZTPCni0Nz8/sv9tULZ45sEQtzKAq9k1JM0VF7k+1B5wNdNAvuOGZpw3pt7DgfgY5
 +AZo02HRsUmZdDltsmHyxacl4ie/AjE0m0s75Iw/2Ch3klD9YIXi13d3aCmjnuzBsedV
 Kzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8sYsbNQeHsfdK7vYLux4gOctWqSd4scyhcz+RDoAJc=;
 b=tTihmGlTvoJYYeaksGKqEOzBBP7XfWotpi2GHfAk/Up+fX1IDJtV4Seynu06XhE5lC
 XXn86fXZ4XR1eC/x4Fc9eQUnimEzKdA2Z1CqTvh10ns+inkxJc8rEX7cxMGkl4T/Z9Kw
 u9xU85lJWPZ3Cc2dqz5WSRM99+jw65k5LeF3w83kWCg+iRaqUKkqLtZjx1fo1A20RPqA
 /+gJrjj4dTr61R2lo+wrGvbjpi8iU7/StXmIPkxb9pYGpW+tBfjw3R4YqSdEb9GxVGQT
 pXX2Im+5i+oJRgAgaf4OsF9g0k4+7WpLw+CFkK/9mZx6WVdHnOwW2++enJT2uJdxIhcY
 qlJQ==
X-Gm-Message-State: AOAM532914iqpJN+vQG/kHUSqr96jx1fo8w7EfY6Vl8gC6KAmkeod+4H
 hv1e9+twhoax01TPRpeTeoO+HNlFngU=
X-Google-Smtp-Source: ABdhPJwSMmg5BlaTmEJfzBJiknfKV12WyHT0RKxZggziLiaqfz0e+bRmQPC8VUOBJPhaY3P8qX6BSg==
X-Received: by 2002:a05:600c:1f14:b0:37b:c475:2de0 with SMTP id
 bd20-20020a05600c1f1400b0037bc4752de0mr4516772wmb.70.1645830343339; 
 Fri, 25 Feb 2022 15:05:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm4089329wms.1.2022.02.25.15.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 15:05:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 00:05:18 +0100
Message-Id: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/zabbix: fix shared netsnmp build
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following shared build failure with netsnmp raised since the
addition of the package in commit
42382a171277ead59e365f5920e757f01c04ac77:

configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"

Fixes:
 - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-netsnmp.m4-fix-shared-netsnmp-build.patch | 44 +++++++++++++++++++
 package/zabbix/zabbix.mk                      |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch

diff --git a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
new file mode 100644
index 0000000000..ffb1f54ba2
--- /dev/null
+++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
@@ -0,0 +1,44 @@
+From 3e810c0804ec40ad6e111a9791cdb2033ecdad71 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Feb 2022 23:30:19 +0100
+Subject: [PATCH] m4/netsnmp.m4: fix shared netsnmp build
+
+Since commit fe391e8689c523d3c7ea6b173d25aa5dba3a6902, the build fails
+with the following error if the user provides the path of
+net-snmp-config through the --with-net-snmp option:
+
+configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"
+
+However, the assumption that a static library will be provided by the
+system is just plain wrong so replace AC_MSG_ERROR by AC_MSG_WARN
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zabbix/zabbix/pull/61]
+---
+ m4/netsnmp.m4 | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/m4/netsnmp.m4 b/m4/netsnmp.m4
+index 5e84d84303..87e21a67e6 100644
+--- a/m4/netsnmp.m4
++++ b/m4/netsnmp.m4
+@@ -140,8 +140,11 @@ AC_HELP_STRING([--with-net-snmp@<:@=ARG@:>@],
+ 			test [ "x$static_linking_support" = "xno" -o -z "$static_linking_support" ] -a -z "$_libsnmp_dir_lib" && AC_MSG_ERROR(["Compiler not support statically linked libs from default folders"])
+ 
+ 			if test "x$static_linking_support" = "xno" -o -z "$static_linking_support"; then
+-				test -f $_libsnmp_dir_lib/libnetsnmp.a || AC_MSG_ERROR(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
+-				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`
++				if test -f $_libsnmp_dir_lib/libnetsnmp.a; then
++					SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`
++				else
++					AC_MSG_WARN(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
++				fi
+ 			else
+ 				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s/-lnetsnmp/${static_linking_support}static -lnetsnmp ${static_linking_support}dynamic/g"`
+ 			fi
+-- 
+2.34.1
+
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index e6564e68fd..a8ecbb42db 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -10,6 +10,8 @@ ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJO
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
 ZABBIX_CPE_ID_VENDOR = zabbix
+# We're patching m4/netsnmp.m4
+ZABBIX_AUTORECONF = YES
 
 ZABBIX_DEPENDENCIES = pcre
 ZABBIX_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
