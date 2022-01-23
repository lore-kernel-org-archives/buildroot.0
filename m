Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D0EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05441404C7;
	Sun, 23 Jan 2022 10:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1nAES_9yVmj; Sun, 23 Jan 2022 10:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1A5F404A0;
	Sun, 23 Jan 2022 10:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 739C21BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 706E281446
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QR1Ypyo8VE2U for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7627E81442
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r22so487263wra.8
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eNSjjbHju/89FiANAsIY3GS2/XWjBeOVCnp2+sNyxB8=;
 b=U3nw8mlVYkWVW35N/5irVz5q/kXKJtpSReWFTjh2cwq+m2xxVQjdwTLmnpekFsMXVG
 dfkP8qqynGGQDg7z6H4erGQoNZttGLviasyxiZ4RurnZAOFROIS+j1CnIAGi3c+sXbzM
 iJAFLDn/uzPwwpypEsmYQP1hIt/Og59VnK/opjPN6FghLqQq1sG2pUQL3efYX18JvGqe
 o/H6lWSewsiZN7OxTNY4mn7ZRs6+Pk0iN8EwHEsUtiFd9CDXtgs9ot/9B9Z7oJZuYqUb
 lr80JF5lHJOGBqSbGqpnGsa9X+fmwpAHx5EermF0C57E67Q6veTutLc53/hDLXr8A1lQ
 38/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNSjjbHju/89FiANAsIY3GS2/XWjBeOVCnp2+sNyxB8=;
 b=eYBdq8JNgZkQnc086iWuk5jqtMgnXUDENGPhEKhg2+UsuHxHQ6TCV1s/t1uP0IRgPX
 GoewQEGbdyy5y31ySYRRkcwNEgdIfJjLqp6R7viOtxPZVrCPTqFbGXP8L6OqgxY4jsw/
 O+SY7sIH7z7WmlTPVSIQTSexb0FJn16dNXccaU99Hd6gHulgiUOjGE97NYaAJHkVi+eW
 j8E1yeYXNehrGivola8naqyJsQCziujTbNzHh2Lzal3R9eRCCQW6C1OtaTMIc8Ut5X2f
 WuyaSzzlXrugiBTOaKnwrpB8a0OC78A52gYkmBw/Tz1Gm6BVLQ5iVL3YkXdhUbOsT1Xd
 hkiw==
X-Gm-Message-State: AOAM530vDUHLLWngUi+o9qole3fdCkxlE4VjeRACJdEQITI1FbirojER
 jNur3vm8iz4yj35xWmaE/Poqye9SY2A=
X-Google-Smtp-Source: ABdhPJy+n5WMXoibuZLQL6Rb0zL+I5RIAWjKmMO3vHGZp1SMraRmIRDYPlCG/uIGkqUYZNmH50d8HA==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr10089809wrr.661.1642932098569; 
 Sun, 23 Jan 2022 02:01:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:54 +0100
Message-Id: <20220123095957.492671-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
References: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,3/6] package/lighttpd: add brotli support
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-meson-fix-typo-in-variable-name.patch | 25 +++++++++++++++++++
 package/lighttpd/Config.in                    |  6 +++++
 package/lighttpd/lighttpd.mk                  |  8 +++++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch

diff --git a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
new file mode 100644
index 0000000000..d338979d46
--- /dev/null
+++ b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
@@ -0,0 +1,25 @@
+From 876a1e1b2cc21282a0df5245004197cdffe1d380 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Thu, 20 Jan 2022 07:04:51 -0500
+Subject: [PATCH] [build] meson: fix typo in variable name
+
+[Retrieved from:
+https://github.com/lighttpd/lighttpd1.4/commit/876a1e1b2cc21282a0df5245004197cdffe1d380]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 4ee163468..b35c1037f 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -266,7 +266,7 @@ endif
+ libbrotli = []
+ if get_option('with_brotli')
+ 	libbrotli = [ compiler.find_library('brotlienc') ]
+-	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotlienc, prefix: '#include <brotli/encode.h>')
++	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotli, prefix: '#include <brotli/encode.h>')
+ 		conf_data.set('HAVE_BROTLI_ENCODE_H', true)
+ 		conf_data.set('HAVE_BROTLI', true)
+ 	else
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 05a7c84961..f3e252d850 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,12 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BROTLI
+	bool "brotli support"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Enable brotli support for lighttpd mod_deflate.
+
 config BR2_PACKAGE_LIGHTTPD_BZIP2
 	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4f05db4e29..22db1a7348 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,7 +13,6 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_brotli=false \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
@@ -36,6 +35,13 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
+LIGHTTPD_DEPENDENCIES += brotli
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
