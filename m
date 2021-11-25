Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6BEC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D718827CE;
	Thu, 25 Nov 2021 12:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXyPnqPT1CHk; Thu, 25 Nov 2021 12:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7AA827AF;
	Thu, 25 Nov 2021 12:56:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0CCC1BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFADF615F2
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yngop4nyIsWd for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:56:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E719160A62
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:56:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l16so11434530wrp.11
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEL8S2k3pp+/IIbrOfgApYBXsUnWDGzohRosG7jv8rk=;
 b=FuLCXEj0AJYIFCXZEFUWd5XJyukBmuOJ6da8hNaQQpPE25hQ2QDj1Ig1SQOYTzGimr
 55VTQm789ZVUeIaByl09vORDxxCeYnvVPJXxOaxYEk94b4hHiBRYjF0dyJqB6yotIsut
 bkoh/u2mcOopgjLoVACVWESmp9kvtLX+sbDAVW6gjoqub5hjn2okWrDV+kiAI0Ss5ulm
 Pr4o5dnfKkQLpWJOTE78Et/95ldsivnsaMDTBwvV4IjUwnpmxzGtLSIm0uI63/+vNmNs
 mgS4mvCrGBFM+8VcoiRMlcD0DGMjxLdRr0Iv/7si3Txm6uqNboYV8cZnte+MW//rcezU
 h+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEL8S2k3pp+/IIbrOfgApYBXsUnWDGzohRosG7jv8rk=;
 b=tLxB+XHQN8pbV7b0Ad07dHeq7kJdJMCEn669KGdFwxH2gMNWiNqsmiCEOe/QSUrxf/
 Vh5wxAjlwGTWmAaNjhPco6hp87bX0ukbB3JBQtzjizJBJQZT76K5BsPGqPvPyMptT2Oh
 DIXI6TRd3h7m0CnojMsO7bfQ9KU5MPRrNylelGClZ31O+1fN+4SJhot9gNIEL2SDQFDC
 ELiXzAimnXU4i7TKT85n8XHL/BjHyWZaTKlHE0UutLVfMUHTV4jbb/wphOC3obtItiN/
 g9hg/PbR8eQCbX7k7HlVpy7J1lhH5sdw9h8zG6jppb0wVIx4AtuH46CTYTbxvJxssW//
 Oi8w==
X-Gm-Message-State: AOAM533VJpRz76FWD7GvFTvSBr0yJAhwo1JMJ1VZVedknzt0/y42IX7L
 zSu69YqPhE/tRMWCLmuRpFElfax4VXM=
X-Google-Smtp-Source: ABdhPJzuQo+yCvyb/5LBV2ABA7t1Agci4Om1wg/TbT9xLreyiJQSvTFSXN3txxQNusmYJnCYa0BKDw==
X-Received: by 2002:adf:e991:: with SMTP id h17mr5908184wrm.40.1637844990072; 
 Thu, 25 Nov 2021 04:56:30 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810c:8d40:ec0:e54:15ff:fe38:2651])
 by smtp.gmail.com with ESMTPSA id r62sm2909178wmr.35.2021.11.25.04.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:56:29 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 13:56:01 +0100
Message-Id: <20211125125558.1087094-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125125558.1087094-1-heiko.thiery@gmail.com>
References: <20211125125558.1087094-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/sysrepo: bump version to 2.0.53
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The license changed from Apache-2.0 to BSD-3-Clause

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...uild-with-musl-libc-fails-due-to-unk.patch | 42 +++++++++++++++++++
 package/sysrepo/Config.in                     |  3 +-
 package/sysrepo/sysrepo.hash                  |  4 +-
 package/sysrepo/sysrepo.mk                    |  8 ++--
 4 files changed, 49 insertions(+), 8 deletions(-)
 create mode 100644 package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch

diff --git a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
new file mode 100644
index 0000000000..784cfb1445
--- /dev/null
+++ b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
@@ -0,0 +1,42 @@
+From 896dc6aee38898fe1c6822ee6a4a4989d21c650b Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Thu, 25 Nov 2021 12:18:06 +0100
+Subject: [PATCH] sysrepo BUGFIX build with musl libc fails due to unknown type
+ name 'mode_t'
+
+When building against the musl libc the build will fail due to the
+missing sys/type.h include.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/plugins_datastore.h    | 1 +
+ src/plugins_notification.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/plugins_datastore.h b/src/plugins_datastore.h
+index a64e4131..d577e929 100644
+--- a/src/plugins_datastore.h
++++ b/src/plugins_datastore.h
+@@ -18,6 +18,7 @@
+ #define _SYSREPO_PLUGINS_DATASTORE_H
+ 
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ #include <libyang/libyang.h>
+ 
+diff --git a/src/plugins_notification.h b/src/plugins_notification.h
+index 2099db62..f410e8d9 100644
+--- a/src/plugins_notification.h
++++ b/src/plugins_notification.h
+@@ -18,6 +18,7 @@
+ #define _SYSREPO_PLUGINS_NOTIFICATION_H
+ 
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ #include <libyang/libyang.h>
+ 
+-- 
+2.30.2
+
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 8de141efc2..52df1bc4c3 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	help
 	  Sysrepo is an YANG-based configuration and operational state
 	  data store for Unix/Linux applications.
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 693a2bbf7d..b382c16036 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cc7537a03f48dc3c955436e1e0ed077bc3b31a755d6979d24ca42e1187fce01  sysrepo-1.4.122.tar.gz
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  fe09da5f40fb53e3fb97268a134cc0ed3003f0018d0d117c73e81e1553a11f30  sysrepo-2.0.53.tar.gz
+sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index c0db05e52c..acb3052023 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.122
+SYSREPO_VERSION = 2.0.53
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
-SYSREPO_LICENSE = Apache-2.0
+SYSREPO_LICENSE = BSD-3-Clause
 SYSREPO_LICENSE_FILES = LICENSE
-SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
-HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
+SYSREPO_DEPENDENCIES = libyang pcre2 host-sysrepo
+HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre2
 
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
