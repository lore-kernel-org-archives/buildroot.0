Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC74C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD8B60BAD;
	Thu, 27 Jan 2022 19:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctd8fjyTFoaM; Thu, 27 Jan 2022 19:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE3260B7A;
	Thu, 27 Jan 2022 19:23:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71C81BF3C3
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C669160B7A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETfZQZgHlaR1 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 19:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E32BE60B79
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:23:43 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id w7so4892188ioj.5
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 11:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxhB31eOr3QNZMSupDy3CYfUOx/26zPLtM4MprO6B/s=;
 b=RRbJspRa0U0zATwBLzycRlX7+/Rfdc5OCW1yTzzyOxCbuoe9QP6qg1vPwVTmFS7zvk
 Dc/wriGiY9krUJxyJC3Q5L2zXFjDX3uAJ5lnZxIG0udeFX3gCWOUw+FxvQ19TYgefX4k
 vZYu+hkB6CnqEXwKXmFRqa80ZmueAASTtQT3SJqQ+jR8NiA7dBb2CvHAjhUcSmOsyR8G
 3WHEEufIUYjKngxFA5NNsZ9rKn3GfNgOYC5hzY7cbc35OUxtqudOUouFmBoyfEyc/NX3
 FmKG4Y0iFpm2ltpBhfQLoSTgxAWM5T3sOIdxe7sJ/14f91M8zJzNbJRQXnxo7eyCmV9K
 MvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxhB31eOr3QNZMSupDy3CYfUOx/26zPLtM4MprO6B/s=;
 b=sb94ueWgh2J3sFIndBq5JiyVRL9ge+9LDc7q3/69yWRsHaTQaeX2Pdibbm0aSnzwrU
 GFhAXA2QarEDwIzII1trYpU4LAvHuKeu64x38VfUk15Xgxi+PCrm9fMRMcr8pYpnnFqQ
 BFhACTxuqNIkNOqFqhhjkR543tazzja0LSHVMOdwBQIWcDHU/XuHVo/9f+uBzD2SPGOh
 Inwz1xsQrknX/DXDHlcYWPTzpLe9/6P9dW5xZy718texF8ggexFZFqswpoKcm9CTa8VQ
 fKcnwzCpbJ4EUDsKTSbeDOLyLHUfcheMVZh7I8U72ust4F2fEpz6nY/eeUI/JN7239Tx
 UTyg==
X-Gm-Message-State: AOAM5334Fgj9Tj+YUCKj1mI4QceiQIhn2oBVoDRVijWGQPBiNYkE1Htt
 bAoa4I2paZq9eFi54r5mxw/tHtcaLqg=
X-Google-Smtp-Source: ABdhPJxTIJbDoEzU3r0VIUIYmpUoPaWXo6xTuQDtx1YYOUo18APAP3Ht1XHPJBkU2Yg2dEHnXeH8tw==
X-Received: by 2002:a05:6602:2dd5:: with SMTP id
 l21mr2826690iow.132.1643311422895; 
 Thu, 27 Jan 2022 11:23:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id f12sm669023ilj.47.2022.01.27.11.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:23:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 12:23:08 -0700
Message-Id: <20220127192311.1954197-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127192311.1954197-1-james.hilliard1@gmail.com>
References: <20220127192311.1954197-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/5] package/sord: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/sord/Config.in |  8 ++++++++
 package/sord/sord.hash |  4 ++++
 package/sord/sord.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/sord/Config.in
 create mode 100644 package/sord/sord.hash
 create mode 100644 package/sord/sord.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e40b0e9ae..0d70c676d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1336,6 +1336,7 @@ F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
+F:	package/sord/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index decf523821..aa700bc8d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "JSON/XML"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
 	source "package/serd/Config.in"
+	source "package/sord/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/sord/Config.in b/package/sord/Config.in
new file mode 100644
index 0000000000..91dfb41d0b
--- /dev/null
+++ b/package/sord/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SORD
+	bool "sord"
+	select BR2_PACKAGE_SERD
+	help
+	  Sord is a lightweight C library for storing RDF data in
+	  memory.
+
+	  https://drobilla.net/software/sord.html
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
new file mode 100644
index 0000000000..af175f91f0
--- /dev/null
+++ b/package/sord/sord.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/sord-0.16.8.tar.bz2.asc
+sha256  7c289d2eaabf82fa6ac219107ce632d704672dcfb966e1a7ff0bbc4ce93f5e14  sord-0.16.8.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
new file mode 100644
index 0000000000..f805805e9d
--- /dev/null
+++ b/package/sord/sord.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sord
+#
+################################################################################
+
+SORD_VERSION = 0.16.8
+SORD_SITE = https://download.drobilla.net
+SORD_SOURCE = sord-$(SORD_VERSION).tar.bz2
+SORD_LICENSE = ISC
+SORD_LICENSE_FILES = COPYING
+SORD_DEPENDENCIES = host-pkgconf serd
+SORD_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SORD_DEPENDENCIES += pcre
+endif
+
+SORD_CONF_OPTS += --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SORD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
