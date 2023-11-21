Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A8FC61D92
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 17:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED5A8135B;
	Tue, 21 Nov 2023 17:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED5A8135B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYob0wnbopmK; Tue, 21 Nov 2023 17:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B5C781312;
	Tue, 21 Nov 2023 17:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5C781312
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 620A41BF5D7
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 17:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A3E640078
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 17:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3E640078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6t24qjXJIBPX for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 17:47:36 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 762DE4004B
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 17:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762DE4004B
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-671357f0209so21929256d6.0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 09:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588855; x=1701193655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=icIpdSRhouL4+LIgGFAuQY7b4h0ooRqLZdO6aWGqoF8=;
 b=DCCDYxGFEf4Ho+JIZI+8GBLupvyRIWC6GRTdIzvyhz/lqAItClB0Of2dM36PFHnRTb
 p1z+YbDe+CP/AvK05+TfayZ9sNBIxossfq/V7qt3QkkwHDIOw8azhETDvrGihVR00AXp
 +fsOqsvrDlYT705gm6n6+F+VdYbwaeOG2qUVPT3xiecuQdADPamQMCKROyTRFohPC1Cy
 W76otk6XRngjOvS67Ugfgc4yAASc2PzOajX0mWX9tCfu3VhZwu3kUtDhr99F+PMrEQx0
 lh4jalXsR0JvPU2mjvUKTTPQ3GfBFKu3VWq+9cMYXIYCBhaPNC5DXJFE4w8bUfp9eZde
 ajOw==
X-Gm-Message-State: AOJu0Ywq7bFw9ARVLxfS6ML328FtPqrGrNWB9ZKnD3CdXllItWxnKS6p
 rPkaCSDhGgLSao9yiSSkYZsIOL9NcYcAMQ==
X-Google-Smtp-Source: AGHT+IFRS1D5DKas3C9yd+6VlknWCa8Eb6l1VzNblWR+cD455I4GYIqDdvPa4pbEnEd4jTN4FxktCg==
X-Received: by 2002:a05:6214:f26:b0:655:d82d:2fd0 with SMTP id
 iw6-20020a0562140f2600b00655d82d2fd0mr14905110qvb.21.1700588855089; 
 Tue, 21 Nov 2023 09:47:35 -0800 (PST)
Received: from localhost.localdomain (c-68-36-104-89.hsd1.mi.comcast.net.
 [68.36.104.89]) by smtp.gmail.com with ESMTPSA id
 pm14-20020ad446ce000000b00677fb735738sm3637402qvb.34.2023.11.21.09.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 09:47:34 -0800 (PST)
From: Byron Gallagher <trippgallagher98@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 12:47:22 -0500
Message-Id: <20231121174722.4164-1-trippgallagher98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700588855; x=1701193655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=icIpdSRhouL4+LIgGFAuQY7b4h0ooRqLZdO6aWGqoF8=;
 b=T72I8CiyC/P01+wtzrQG/AuCYH92cpqJdFcfsNiGnzx6UPLH9+tA+huvyG70Tt0Ksl
 HpnAweHX+sY6syszysia1YBG9s1SvEZXG9aCWB9/VDJdCSlule+lN/4O78AL3avVptrn
 79emi/0FfIIifbQR4l4zDZqTvqVSCXjdhrwxicQkfmCECJOIWbRKLe3kJfcpvkWi7Ys5
 LO1/T0ozDTsi7hL8vP2wcQ5m18o2mPBA0/nnlO3ZUczCIZC5tlK0vyscpFMTz5K4LeGX
 rvTarQ21bYpK/7/XdR4vwsrzngUQ5pqtg/sDZU4EMz6wV3h0rFMEk+GXavOkqzcEgGgB
 ycNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T72I8Ciy
Subject: [Buildroot] [PATCH] package/socat: fix static openssl compatibility
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
Cc: Byron Gallagher <trippgallagher98@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

4028ee71743a25af172809e098e4c8eb61bf55f4 disables static openssl
compatibility due to issues linking against zlib.

This patch re-enables the functionality by patching socat's
autoconf to include zlib when locating openssl. Bug also reported
upstream via socat@dest-unreach.org.

Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
---
 ...-build-link-against-zlib-for-openssl.patch | 35 +++++++++++++++++++
 package/socat/socat.mk                        |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/socat/0003-build-link-against-zlib-for-openssl.patch

diff --git a/package/socat/0003-build-link-against-zlib-for-openssl.patch b/package/socat/0003-build-link-against-zlib-for-openssl.patch
new file mode 100644
index 0000000000..3851d5bcab
--- /dev/null
+++ b/package/socat/0003-build-link-against-zlib-for-openssl.patch
@@ -0,0 +1,35 @@
+From 0434a4674a012a35f6390d9afc4812de59a394ab Mon Sep 17 00:00:00 2001
+From: Byron Gallagher <trippgallagher98@gmail.com>
+Date: Tue, 21 Nov 2023 12:25:18 -0500
+Subject: [PATCH] build: link against zlib for openssl
+
+If openssl is static, socat will not find it due to autoconf
+failures on AC_TRY_LINK without -lz.
+
+Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9d60473..ae0e6bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,12 +580,12 @@ if test -n "$WITH_OPENSSL" -a "$sc_cv_have_openssl_ssl_h" = 'yes'; then
+       if test -n "$OPENSSL_BASE"; then
+ 	L="$OPENSSL_BASE/lib"; LIBS="$LIBS -L$L -lssl -lcrypto"
+       else
+-	LIBS="$LIBS -lssl -lcrypto"
++	LIBS="$LIBS -lssl -lcrypto -lz"
+       fi
+       AC_TRY_LINK([#include <openssl/ssl.h>],
+        [SSL_library_init();ERR_error_string()],
+        [sc_cv_have_libssl='yes'],
+-       [ LIBS="$LIBS -lcrypto"
++       [ LIBS="$LIBS -lcrypto -lz"
+        AC_TRY_LINK([#include <openssl/ssl.h>],
+        [SSL_library_init()],
+ 	  [sc_cv_have_libssl='yes'],
+-- 
+2.34.1
+
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index f958f26522..0741605687 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
