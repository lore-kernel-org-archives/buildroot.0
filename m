Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36614C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E984982695;
	Fri,  7 Jan 2022 22:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xOuAhSPtPE7; Fri,  7 Jan 2022 22:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36024824DF;
	Fri,  7 Jan 2022 22:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB46E1BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA35081D4D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlYAKUmDJdRs for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D892781BCB
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:26:22 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id u8so8901680iol.5
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZKCiwrd3tKnO2YGy6GJ4mknrrsFWNPyNp6M632wcUA=;
 b=oIsHGJfNILWGDiqPAIQfDXxfzI4b/850JiN/MQVK20xAJhVyL+wmrcP7zNnU6SW493
 05G/MWIdRuBFO3Se7yg2U2u2twCSOBuw5QBG6T3sUB9XHsXYV1GBQPyQ0uLFqvTKRPjN
 QOlfV1BaJYMLXPpAWqFC2jMum5uhRRAy4NQs+xsRlpOXyt4CaYlpl/ZLbJ2RRaBwcT4T
 lwyolvx2JIvmWN3HVEbUDDqMe0J4NDCAkCPiXaFZiFdX/+Q08y1iibzcNUx128OoVSXt
 TVIc+edpUaCBnmjOXxNnZ1EHT8KbQSQ8hBycNHse6nMs5Kj3fRibUBTPtoYZV47Tjczq
 V4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZKCiwrd3tKnO2YGy6GJ4mknrrsFWNPyNp6M632wcUA=;
 b=rLfeYCSnCt5bMNbAKUFJNzprCLgWHIkRJZiSJ/EmYGIDqyQu/L2lO7BOGUVL5nXRy/
 pLO+hOyWYaQE4KUAMjGkWwplQLWpMl7HYbgARa55ysuaWKJGqPjjSjIBueg/Cg0iCPmW
 INcS1rkuLmMG8HocpbWZQB/azHd1hExHnh5MUp742Rgpxoz65GTjkeIZXA8AFdiLnphI
 DIGCObNWmguIjnqHYiAHFsmRECINaIXo+UMhG+VpHto9C3rvvZ8g+mHVMgYCsGqRIjA4
 OAJBoSgT7HKtlNIIogiQSAaGTR3o9vMCk0fwcJ4MbMOpVYgIRRHrYSKYLBzugc8bZoAn
 9BrQ==
X-Gm-Message-State: AOAM533gaBUZS6zhGO4No+R7zoc1ZiRn3PSbZIEAqPkLZJuCkzpxld6I
 GxuOwaiP2SIR9/tHz+8RqRRd0f3nL68=
X-Google-Smtp-Source: ABdhPJzqqWvyQpBBG4181No75iNSV2RJ/bKn/KWE7ZWV1BaMyRiUJwel4GhiAzFnA+q0RZtk0SOvQQ==
X-Received: by 2002:a5d:85d5:: with SMTP id e21mr30604375ios.51.1641594381831; 
 Fri, 07 Jan 2022 14:26:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id k12sm3596453ioc.50.2022.01.07.14.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 14:26:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:26:13 -0700
Message-Id: <20220107222613.4124764-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107222613.4124764-1-james.hilliard1@gmail.com>
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/lilv: new package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lilv/Config.in | 11 +++++++++++
 package/lilv/lilv.hash |  4 ++++
 package/lilv/lilv.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/lilv/Config.in
 create mode 100644 package/lilv/lilv.hash
 create mode 100644 package/lilv/lilv.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f8aa809294..c214abe209 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1254,6 +1254,7 @@ F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/lilv/
 F:	package/lv2/
 F:	package/pipewire/
 F:	package/python-aioconsole/
diff --git a/package/Config.in b/package/Config.in
index 51a4180569..1cf2bb5219 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1358,6 +1358,7 @@ menu "Audio/Sound"
 	source "package/libsoundtouch/Config.in"
 	source "package/libsoxr/Config.in"
 	source "package/libvorbis/Config.in"
+	source "package/lilv/Config.in"
 	source "package/lv2/Config.in"
 	source "package/mp4v2/Config.in"
 	source "package/openal/Config.in"
diff --git a/package/lilv/Config.in b/package/lilv/Config.in
new file mode 100644
index 0000000000..086125cdc9
--- /dev/null
+++ b/package/lilv/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LILV
+	bool "lilv"
+	select BR2_PACKAGE_LV2
+	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_SORD
+	select BR2_PACKAGE_SRATOM
+	help
+	  Lilv is a C library to make the use of LV2 plugins as simple
+	  as possible for applications.
+
+	  https://drobilla.net/software/lilv.html
diff --git a/package/lilv/lilv.hash b/package/lilv/lilv.hash
new file mode 100644
index 0000000000..afa20fc083
--- /dev/null
+++ b/package/lilv/lilv.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/lilv-0.24.12.tar.bz2.asc
+sha256  26a37790890c9c1f838203b47f5b2320334fe92c02a4d26ebbe2669dbd769061  lilv-0.24.12.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/lilv/lilv.mk b/package/lilv/lilv.mk
new file mode 100644
index 0000000000..651597953d
--- /dev/null
+++ b/package/lilv/lilv.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# lilv
+#
+################################################################################
+
+LILV_VERSION = 0.24.12
+LILV_SITE = https://download.drobilla.net
+LILV_SOURCE = lilv-$(LILV_VERSION).tar.bz2
+LILV_LICENSE = ISC
+LILV_LICENSE_FILES = COPYING
+LILV_DEPENDENCIES = host-pkgconf lv2 serd sord sratom
+LILV_INSTALL_STAGING = YES
+
+LILV_CONF_OPTS += \
+	--dyn-manifest \
+	--no-bash-completion \
+	--no-coverage
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LILV_DEPENDENCIES += python3
+else
+LILV_CONF_OPTS += --no-bindings
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+LILV_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LILV_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
