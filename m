Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9179EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16D454046A;
	Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_yZrZqVmHW3; Sun, 23 Jan 2022 10:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE9E640462;
	Sun, 23 Jan 2022 10:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 502091BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C3A081446
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzkmM7Du2wTk for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74FAB81442
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e8so6366623wrc.0
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCQpwHdrvTES+Uss6S15rfsoaBqdCbHUfXVLBVZ13Eo=;
 b=EILO1yeFrqFuTPFe9GFgZMK1lIhKvdmhb9sblKbtN7xpVrSd+GTBHTip0C2vkxE/SG
 PQRSxE4KpzlkVshhvsj4UP/vqaxRpg7DTpLHCKcmTK/j/jyurcXnFZD2XL7GDv49JqCg
 r8WXBOVUPAoSZKJJspiDCa6hlu9OcDYJz4QioSh35v69MK2hUdKC71h1HK2v0wuPCTD6
 0PKZeKKcyzezintLXJizMK0YE3+VZvaZ+DgDcD2FLgRfjnUo2jJbpgRvzgZmv8RkjtkM
 WfOFRV/eJF62QOwRBZowvlaPbyrBQCHmogwFSKaXOuVjqhlo0f0L9E6ACioS92rqMKV+
 o4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCQpwHdrvTES+Uss6S15rfsoaBqdCbHUfXVLBVZ13Eo=;
 b=Dq5/xQzhFp8VMlzmL1hWWbIV/yqD3UDLNRv9Gs65dJDLM2pQ5ivjR0FIdPieZU2KxG
 t1EABwN17EZU4v5v8UDS+w0QK+pRqkPFdNumZYs1veGEGJR8j0Zh9NhSNTYrkXFS6Pfs
 bI/uLryGztwb9aQ/hnNS0vJl9hv9Or+7l6abPuvvb/Ljq+7clfBeJVFVgyJm6WRMdw9p
 /RmygvqZFKXWU0aKk6xLXaW890xzC6ZS4UdQLaQmaKU5LIITo+A59a+STk/yOvNd8PPo
 NP1TjoVEi6290VUCsAPVNwwOOnVWXwJktst7Hb/K9LkokPRYGZFRHJc6P02jf45a/0bK
 LiyQ==
X-Gm-Message-State: AOAM5300HSDQglP+y8R8LUDorWiZIJpx51Ebr3o5+xpMptFRcoDEUs8F
 XssjY0wYxJ4x4WSmLKnZ99jWxZXsdvg=
X-Google-Smtp-Source: ABdhPJy0jyOLUNeQvAulkzDMhoC2oGJk4NFg5ms9Hv5Z77tAXxtcro4kGo/s1h5nAKqP3C3GvyzffA==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr5826427wri.656.1642932093672; 
 Sun, 23 Jan 2022 02:01:33 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:52 +0100
Message-Id: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/6] package/lighttpd: reorder alphabetically options
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
 package/lighttpd/Config.in   | 32 ++++++++++++++++----------------
 package/lighttpd/lighttpd.mk | 36 ++++++++++++++++++------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 99a09e9766..59c1e0b2a6 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BZIP2
+	bool "bzip2 support"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 support for lighttpd mod_deflate.
+
+config BR2_PACKAGE_LIGHTTPD_LUA
+	bool "lua support"
+	depends on BR2_PACKAGE_LUA
+	help
+	  Enable Lua support. Needed to support mod_magnet
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
@@ -34,18 +46,6 @@ config BR2_PACKAGE_LIGHTTPD_PAM
 	help
 	  Enable PAM authentication support for lighttpd.
 
-config BR2_PACKAGE_LIGHTTPD_ZLIB
-	bool "zlib support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support for lighttpd mod_deflate.
-
-config BR2_PACKAGE_LIGHTTPD_BZIP2
-	bool "bzip2 support"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bzip2 support for lighttpd mod_deflate.
-
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
 	select BR2_PACKAGE_PCRE2
@@ -59,10 +59,10 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
-config BR2_PACKAGE_LIGHTTPD_LUA
-	bool "lua support"
-	depends on BR2_PACKAGE_LUA
+config BR2_PACKAGE_LIGHTTPD_ZLIB
+	bool "zlib support"
+	select BR2_PACKAGE_ZLIB
 	help
-	  Enable Lua support. Needed to support mod_magnet
+	  Enable zlib support for lighttpd mod_deflate.
 
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 2a05071209..bdbf75191c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -37,6 +37,20 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
+LIGHTTPD_DEPENDENCIES += bzip2
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
+LIGHTTPD_DEPENDENCIES += lua
+LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
@@ -51,20 +65,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_pam=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
-LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
-endif
-
-ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
-LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
 LIGHTTPD_DEPENDENCIES += pcre2
 LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
@@ -85,11 +85,11 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=false -Dwith_webdav_locks=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
-LIGHTTPD_DEPENDENCIES += lua
-LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
+LIGHTTPD_DEPENDENCIES += zlib
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
 else
-LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
