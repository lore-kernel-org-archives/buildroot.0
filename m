Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D912DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 20:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A198984312;
	Wed, 16 Mar 2022 20:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQBW7cdHtn_y; Wed, 16 Mar 2022 20:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB85E841F5;
	Wed, 16 Mar 2022 20:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 685331BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57341841BF
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2AxSwCjtx_o for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 20:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55357841DE
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 20:40:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a1so3231180wrh.10
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHhHX7IQaxzUWwO34nPr+O4qcnSLMfaFCulezO9QZ+I=;
 b=JM6hHOpLdHJLR+zXA0DshiYrSg32eq3nJPKYtBW9rMXasZBMtjUFFq8iwh5MvZHmfV
 yiX5KrjE7qOnmmN/Fn0atZVIW7CDnAqqv/yWwrS3wsyMUSdzShR5Iygv5wFBc09fXm8g
 kjBteMeN7hAkNhDkv8xumY+8f+DH3OlhgcgF19/UDQ51A8Vusl9YPOXNZld0yr4+q+fS
 DYNbvEmuNNttQRC4AVvsOuWuke9kX6z0eAg7xSzUI/2q+oINcwferw7g9rEKQAfA1K83
 CxjXEDIaBnL77W1LEp84FOuFlIsg5+kkcwFjyzSlGdkafndmMaIEYwifJVxWQ3sC4+CF
 geTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHhHX7IQaxzUWwO34nPr+O4qcnSLMfaFCulezO9QZ+I=;
 b=J/K4KkzRzbZXeYZb2TvvJ/AoNCCULNAdxAJx1gxGIsxk7A8cNK0NGvGGA4jWhll9oN
 EletJqcfBtUuDdOKTkJYMjADixkPfOLMQiNJgB0Y76cluAjYCTCpob34BDpIwzED5Lz4
 MGQtJovCNW3BGJdGtc7+6UAnuxs6gfDOTlZgt9jbdlbbVWG5WWZ6pq/2meEJLs9zHgIn
 qmHN8TSBHY1vgeg/wThiaAMghj1KQoFqtlw85xF9YyXNuJXrOwEWDPQ1hrvuBYHiGdNh
 zjkD0MZQi1q8ga87rINPj+B5PUWcPCXW9PHPM38quEMhLg11L/uPu1JmfbxBhLFwcZ4F
 tKmA==
X-Gm-Message-State: AOAM532u5pEz9enk/8hNF+4at04tCrW63ODn8v9HAtmZd3xfEYRK7hBU
 3wOb/2WqqJHREMhoXfihM3k+1xNkngI=
X-Google-Smtp-Source: ABdhPJx6I8lSE+xIiV4hHQ1mMSX2hqlAhF5o3xjH3ng7rw2+6ZQA/+pkVVrFHY4jGuVXrxYHsVl3sw==
X-Received: by 2002:a5d:4ec7:0:b0:203:de83:6f44 with SMTP id
 s7-20020a5d4ec7000000b00203de836f44mr1377201wrv.56.1647463225334; 
 Wed, 16 Mar 2022 13:40:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a5d6f09000000b001f1f3330fc5sm2635303wrb.28.2022.03.16.13.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:40:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 21:39:22 +0100
Message-Id: <20220316203922.3081843-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316203922.3081843-1-fontaine.fabrice@gmail.com>
References: <20220316203922.3081843-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libminiupnpc: drop dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libminiupnpc can be statically built with or without binfmt flat since
version 1.7 and
https://github.com/miniupnp/miniupnp/commit/c183a72c46cae9e37ddf635318dfb0bdcd56ed9d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libminiupnpc/Config.in       | 6 ------
 package/libminiupnpc/libminiupnpc.mk | 8 ++++++++
 package/transmission/Config.in       | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
index a3410a0225..51f4b43bbb 100644
--- a/package/libminiupnpc/Config.in
+++ b/package/libminiupnpc/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBMINIUPNPC
 	bool "libminiupnpc"
-	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_STATIC_LIBS
 	help
 	  The UPnP protocol is supported by most home adsl/cable routers
 	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project
@@ -14,7 +12,3 @@ config BR2_PACKAGE_LIBMINIUPNPC
 	  ANSI C.
 
 	  http://miniupnp.free.fr
-
-comment "libminiupnpc needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on !BR2_BINFMT_FLAT
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 0633ccd234..52fe9849f2 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -18,4 +18,12 @@ LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
 LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=OFF
+else
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=ON
+endif
+
 $(eval $(cmake-package))
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index aaed7ec111..eb51ccf862 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_BINFMT_FLAT # libminiupnpc, libnatpmp
-	depends on !BR2_STATIC_LIBS # libminiupnpc, libnatpmp
+	depends on !BR2_BINFMT_FLAT # libnatpmp
+	depends on !BR2_STATIC_LIBS # libnatpmp
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_DHT
 	select BR2_PACKAGE_OPENSSL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
