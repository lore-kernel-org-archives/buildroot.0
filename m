Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A74C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885A460E96;
	Tue, 19 Apr 2022 21:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86-TKwAvtYpk; Tue, 19 Apr 2022 21:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9015760D6C;
	Tue, 19 Apr 2022 21:25:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE1C41BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9B5828F2
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWRCecwNGOOz for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:25:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B0FF828B5
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:25:13 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id r10so5715623pfh.13
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 14:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMlAaDq7TGNEhRSE5FlwSA1mwdVatuXIrus8bVg81v0=;
 b=xphCi45WloSOUsxYc/kOxUkUXOcsBJl5+aar3zknEXc1Oc/+9GVxTlcwElBJuznTgl
 gKQg4MLBp2OXzwya2p7UrJqSYyc0w+i2OL5oaFKK6l3hYVnUloWTO/P+3cRBYWIpv5rX
 ip9Zs1ldAj1s9HKSNM1nze9CFyoauZkKrwtyMP2ayB8m+dLdIKXwkZ7dpSTSDnFq+uKg
 cQhzIkA6SGWqbnAjs8ZH2h7KhHPUWtgV0So0p1mrBRGwzRJY78rRxIJB/sKPsCh8wxfs
 fpi3ZN9naU+z7/KK09PtSm+C6bosfIv9Tujc6HCCDCXpDRyVsIu62LeOh82tUynFeGz4
 1WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMlAaDq7TGNEhRSE5FlwSA1mwdVatuXIrus8bVg81v0=;
 b=pVWTJCWImAK/fVvRlNuuyvgxUP5smsXZb/AWLv+xOJwBUCtEJy8MrSzXEDmU6tO4WW
 6CYhrVeTTNa9S2QXO47R/Ekv6XXQLg8rB9J9yWmdESb34xff9IvtNusbbWFToyUzAFzZ
 qpW3qXcKjzhphzuJ2p0TS8h9nq6EyjTPQZ895nhWhTmJsETWRn+dCB0y38HtzhLZcNYO
 Ly8XWrETa0thCEbCU36aveGTXRiFLwRCG3eJxG3NnlVOqsv3Iq6ANKV/G4YaCoeU8sFZ
 4G5HF6dbjtmIJBBfX4ZRr3wvGaK1dy5ggZqSPUEw+1HVE/w3toRaMnXqjHVNoYHaViWr
 ik1A==
X-Gm-Message-State: AOAM533hDqH77ZS4jg798uOotzfkcUxXsKnnSfz+NgTTDnD4/gWgy/tp
 7eqDHwgEDLfwwW4ZD9nfvBJ5drXNhMA7YlzX
X-Google-Smtp-Source: ABdhPJyRzA7AuEKAi0RwOUJTgmr0q9gvKG4h9Z5nWAvkE9n7qP93UgEP+7qL/zPBle5EAkRJxMd8Xw==
X-Received: by 2002:a63:350e:0:b0:3a9:fb92:85b8 with SMTP id
 c14-20020a63350e000000b003a9fb9285b8mr10068651pga.328.1650403513394; 
 Tue, 19 Apr 2022 14:25:13 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62158a000000b0050a6a93b3edsm9978506pfv.73.2022.04.19.14.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:25:12 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 14:24:47 -0700
Message-Id: <20220419212447.2441888-2-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419212447.2441888-1-gsmecher@threespeedlogic.com>
References: <20220419212447.2441888-1-gsmecher@threespeedlogic.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Adds python-orjson support.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/python-orjson/Config.in          | 12 ++++++++++++
 package/python-orjson/python-orjson.hash |  3 +++
 package/python-orjson/python-orjson.mk   | 22 ++++++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/python-orjson/Config.in
 create mode 100644 package/python-orjson/python-orjson.hash
 create mode 100644 package/python-orjson/python-orjson.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58f..0846aac835 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3058,3 +3058,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Graeme Smecher <gsmecher@threespeedlogic.com>
+F:	package/python-orjson/
diff --git a/package/Config.in b/package/Config.in
index c599271c65..1494387c2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1111,6 +1111,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-orjson/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-paramiko/Config.in"
diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
new file mode 100644
index 0000000000..fa96eee57d
--- /dev/null
+++ b/package/python-orjson/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_ORJSON
+	bool "python-orjson"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  orjson is a fast, correct JSON library for Python. It benchmarks as
+	  the fastest Python library for JSON and is more correct than the
+	  standard json library or other third-party libraries. It serializes
+	  dataclass, datetime, numpy, and UUID instances natively.
+
+	  https://github.com/ijl/orjson
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
new file mode 100644
index 0000000000..8f9cc2a7c9
--- /dev/null
+++ b/package/python-orjson/python-orjson.hash
@@ -0,0 +1,3 @@
+sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
new file mode 100644
index 0000000000..5de4b2c5fa
--- /dev/null
+++ b/package/python-orjson/python-orjson.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-orjson
+#
+################################################################################
+
+PYTHON_ORJSON_VERSION = 3.6.7
+PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
+PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
+PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
+PYTHON_ORJSON_CARGO_ENV = \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# orjson uses "maturin" to generate distribution packages - rather than teach
+# buildroot how to understand this, we reach in and install directly.
+define PYTHON_ORJSON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
+endef
+
+$(eval $(cargo-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
