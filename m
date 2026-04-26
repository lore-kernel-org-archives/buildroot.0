Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28786FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 17:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE67A42A2E;
	Sun, 26 Apr 2026 17:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMUGFUuJBxXO; Sun, 26 Apr 2026 17:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB7E942A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777225467;
	bh=KYQ5dkchUQEiKHehcEkl3iRA9lysHwY57azqCjy2ExE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EPOuVtPVjVuzMKTV2SSmQ0OlHtiZCVnsaRz7nk3O9mASFO5nj05PGm0iBrkg4yNcr
	 f2Y7NGN2GA0CIOMqr2zsAJiOiX1Y02nBahf/PjD8ZEUKtta7FDMAcWkETD+7wA64Ke
	 q115Dj16Xrt1SL9eOgX0Yv3KFVNAy1zOztf5ew+SvBqyzLAm/GHUjuaDorRrQnAPjd
	 o9c641tTJcJ5uVR62GIDc5HeVeujsycQOYH7avkXoWTzE44354k1cV3qwjH35fyu9L
	 /t8R5WY/gBnkoI5gR9J4Zqhuszkbr7VBERRPNQjJlrCrgaCXoTD/bgpCHLLjsU5bfB
	 4k9t9bdV/thZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7E942A30;
	Sun, 26 Apr 2026 17:44:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA2A231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 981C842A30
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jp7AEJJ5Q6WZ for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 17:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=stefan_preiss@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B4F642A2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4F642A2E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B4F642A2E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 17:44:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6dy-1viXzH49Ak-00jSH4; Sun, 26
 Apr 2026 19:44:22 +0200
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 19:44:06 +0200
Message-ID: <20260426174407.8470-1-stefan_preiss@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:F8sLXUMB2vDkfz+4nXeM6m+kg9/u4vCCzgByWN//vtvZtpQ6EC0
 cjAqwEyF+OIY5jgeU3InKKGU3wIrjOf7IMTP/qYqtK66B+wNxwFmQ6r3mwyhbGrAgT+IU7G
 5BEv42DPJDhvdMZmZwuYKYME7vxEeZjDCaPjJqcq9tTbTqxWvtz3aF5xKtTx3zbEDqGiMKD
 OlfSbWgDw7JaenI414QKQ==
UI-OutboundReport: notjunk:1;M01:P0:9XaMsszdckM=;uyHRZAddvhAvsMQ/KvAQNbDrqjY
 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
 yUTgFms+BXappvg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777225462; x=1777830262; i=stefan_preiss@gmx.de;
 bh=jkLHlhfIobqP29ilclOBQFa+TL5DGKEqpHj6HUc7+sk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BEI7zqYpMXbBLsZFfGkKB+Y9ldc5kKsmCwI1+d+MKMtVWBspTslIFnv46ZTj2hlw
 Ut3Z/zI96Y6ehlZHv+R1r9VyLVV5TVCFJwqkVmzA4g4nhlaOmuoUMKYG3QZoNdr7g
 cG/gXNiNRyiClAFHWDx3ucpWvpIgPDXxErE9OrfX6LPLQWIvejveC1Pj+13Pk0AE+
 5TjdLzRKuFfHToDM3gUD4MQXmK2vMeeuvQ9EZb/iz4Wn3PxRfx3mwpvZpCWlDAmDS
 /6fLw1ELm8c+zSwBZtV6961v1sK0J4MDdQcl5V2iOluhrY6LlfowMiZDHwQYZXGXt
 C3ncwg6k+EfTOjJdjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=stefan_preiss@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BEI7zqYp
Subject: [Buildroot] [PATCH] feat(package/poco): build package with cmake
 instead of make
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Preiss, Stefan via buildroot" <buildroot@buildroot.org>
Reply-To: "Preiss, Stefan" <stefan_preiss@gmx.de>
Cc: "Preiss, Stefan" <stefan_preiss@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently when building with make, the cmake config files are not
generated. This leads to problems when integrating the package in an
application built with cmake.
---
 package/poco/poco.mk | 88 ++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 61 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index fe1dd29855..c5f418a664 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -9,7 +9,6 @@ POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
-POCO_INSTALL_STAGING = YES
 
 POCO_DEPENDENCIES = \
 	pcre2 \
@@ -22,78 +21,45 @@ POCO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
-POCO_OMIT = \
-	Data/ODBC \
-	PageCompiler \
-	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
-	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
-	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),,Data/PostgreSQL) \
-	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
-	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
-	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
-	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
-	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
-	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
-	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
+POCO_CONF_OPTS = \
+	-DENABLE_DATA_OBDC=OFF \
+	-DENABLE_PAGECOMPILER=OFF \
+	-DENABLE_ACTIVERECORD=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_CPPPARSER=$(if $(BR2_PACKAGE_POCO_CPP_PARSER),ON,OFF) \
+	-DENABLE_CRYPTO=$(if $(BR2_PACKAGE_POCO_CRYPTO),ON,OFF) \
+	-DENABLE_DATA=$(if $(BR2_PACKAGE_POCO_DATA),ON,OFF) \
+	-DENABLE_DATA_MYSQL=$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),ON,OFF) \
+	-DENABLE_DATA_SQLITE=$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),ON,OFF) \
+	-DENABLE_DATA_POSTGRESQL=$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),ON,OFF) \
+	-DENABLE_JSON=$(if $(BR2_PACKAGE_POCO_JSON),ON,OFF) \
+	-DENABLE_JWT=$(if $(BR2_PACKAGE_POCO_JWT),ON,OFF) \
+	-DENABLE_MONGODB=$(if $(BR2_PACKAGE_POCO_MONGODB),ON,OFF) \
+	-DENABLE_NET=$(if $(BR2_PACKAGE_POCO_NET),ON,OFF) \
+	-DENABLE_NETSSL=$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),ON,OFF) \
+	-DENABLE_PDF=$(if $(BR2_PACKAGE_POCO_PDF),ON,OFF) \
+	-DENABLE_PROMETHEUS=$(if $(BR2_PACKAGE_POCO_PROMETHEUS),ON,OFF) \
+	-DENABLE_REDIS=$(if $(BR2_PACKAGE_POCO_REDIS),ON,OFF) \
+	-DENABLE_UTIL=$(if $(BR2_PACKAGE_POCO_UTIL),ON,OFF) \
+	-DENABLE_XML=$(if $(BR2_PACKAGE_POCO_XML),ON,OFF) \
+	-DENABLE_ZIP=$(if $(BR2_PACKAGE_POCO_ZIP),ON,OFF) \
+	-DPOCO_UNBUNDLED=ON
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-POCO_CONF_OPTS += --no-fpenvironment --no-wstring
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT -DPOCO_NO_WSTRING
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT
 endif
 
 # disable fpenvironment for soft floating point configuration
 ifeq ($(BR2_SOFT_FLOAT),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CONF_OPTS += -DPOCO_NO_FPENVIRONMENT
 endif
 
-POCO_MAKE_TARGET = shared_release
-
-POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POCO_LDFLAGS += -latomic
+POCO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
-define POCO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
-		--config=Linux \
-		--prefix=/usr \
-		--ldflags="$(POCO_LDFLAGS)" \
-		--omit="$(POCO_OMIT)" \
-		$(POCO_CONF_OPTS) \
-		--unbundled \
-		--no-tests \
-		--no-samples)
-endef
-
-define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
-		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
-		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
-		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
-		POCO_PGSQL_LIB=$(STAGING_DIR)/usr/lib/postgresql \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
-endef
-
-define POCO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-define POCO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
