Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3029FC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9509741C61;
	Thu, 27 Jul 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9509741C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1hVN1dXbHMI; Thu, 27 Jul 2023 16:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 590A841C6A;
	Thu, 27 Jul 2023 16:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590A841C6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58BDA1BF475
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3240A400DA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 16:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3240A400DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLFNWCYs9EpT for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 16:42:29 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE6C5400CC
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 16:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE6C5400CC
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-34642952736so4650665ab.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 09:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476147; x=1691080947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zPps0od/HUKqR6xWe0kWZ2jD9nuc/NA0Q+3i7H3Mgdg=;
 b=J+i+Sbvb23l8Gmjdd/CamuVQmG+UoTI4CoHPKwhRWjcqlA24ToLxjmfFtSS3Nf7tGo
 9Vfu7JVHAotJf8hXq24aUZGgtudzWGNP+pvqrFS6tjeicRqp5FLjBCO/E8v9Do7tjASL
 7bFE+BZnetUcH+0tL547c/juJUExLfWy3e3hkOiHC6yNlX5yCRfqcjF+Q0WanWZp/1NW
 iUSfYAUl0F9IzDJ6eZlHaRBjj4R6wAReZSH73qnxqM9wHUHmekegf68fiwMwJyCWzI3T
 HYiLRMX0LKKFxCGqCPeJwoV/+xM51ecT1bmRht0A9IVSOZm7S3pbQvQspKk1N8bY97l1
 7Fuw==
X-Gm-Message-State: ABy/qLbMi92iAAPuGXl+Yd1W2IfTL3sSr9ImDbX9BC8oECnxBX6Yi6O0
 uRKkMBPsuKPrOJe8CNQYA7gBoWD6+bE=
X-Google-Smtp-Source: APBJJlF7Q296eHD8Pi8XPBLqHQeIOvGjFDM7KZBUFCz5BxnXMQaWyTCbV/s6JJQmnQD7u8MnX3whbQ==
X-Received: by 2002:a92:cdad:0:b0:348:8152:18c4 with SMTP id
 g13-20020a92cdad000000b00348815218c4mr6821364ild.22.1690476147551; 
 Thu, 27 Jul 2023 09:42:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 dy37-20020a0566381d6500b0042b068d921esm542451jab.16.2023.07.27.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:42:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 10:42:24 -0600
Message-Id: <20230727164224.1945786-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690476147; x=1691080947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zPps0od/HUKqR6xWe0kWZ2jD9nuc/NA0Q+3i7H3Mgdg=;
 b=TD1R4esGoYhMXl89ijtGdj+nbbU3L1b2+ogaZx3bbAZGln4EWPS4+TrZUfl0PITCIh
 U65GKsmAfOUlZQFb2/9f8F3ZgHgAZVgB+VulMaFyQZU7oyoK3Ey1n+jTlAjFLpdFzDuq
 ivnQHyP2EAvxRs98ufE2KpGtt1vC6LV2IRz6SElKqFbPzCxvbmed7fVhXqAyEfphvmfa
 EQADgdI9wbm1kK899pQLtqcHarmSTIom5SXULXGRR+NTvAgYKxtRZRR5RwsO9RMCYCIQ
 byspIH8A31bboXk2Nqk8CUad5zsU/XLhn2AEPoTz5QQdAB4g2nn0aGB5HAJGdln6h6c+
 R58g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TD1R4esG
Subject: [Buildroot] [PATCH 1/1] package/python-rpds-py: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-rpds-py/Config.in           |  8 ++++++++
 package/python-rpds-py/python-rpds-py.hash |  4 ++++
 package/python-rpds-py/python-rpds-py.mk   | 22 ++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/python-rpds-py/Config.in
 create mode 100644 package/python-rpds-py/python-rpds-py.hash
 create mode 100644 package/python-rpds-py/python-rpds-py.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ff44c195d..afdd5a4065 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1424,6 +1424,7 @@ F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-pyproject-hooks/
+F:	package/python-rpds-py/
 F:	package/python-rtoml/
 F:	package/python-selenium/
 F:	package/python-snappy/
diff --git a/package/Config.in b/package/Config.in
index 1237281701..b07d4be98f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1267,6 +1267,7 @@ menu "External python modules"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rfc3987/Config.in"
+	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
diff --git a/package/python-rpds-py/Config.in b/package/python-rpds-py/Config.in
new file mode 100644
index 0000000000..172c5fd0b6
--- /dev/null
+++ b/package/python-rpds-py/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_RPDS_PY
+	bool "python-rpds-py"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings to the Rust rpds crate for persistent
+	  data structures.
+
+	  https://github.com/crate-py/rpds
diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
new file mode 100644
index 0000000000..e42dfbd948
--- /dev/null
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  3b1087c3c7d55b8730dfaa539147646292074819295812267832ce5b64a0034c  rpds_py-0.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256  8bcb72c82ea8ae74802293c41d93ad7d51434001b0ae45a603a5af0f507aee0a  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
new file mode 100644
index 0000000000..2b5530f237
--- /dev/null
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-rpds-py
+#
+################################################################################
+
+PYTHON_RPDS_PY_VERSION = 0.9.2
+PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/da/3c/fa2701bfc5d67f4a23f1f0f4347284c51801e9dbc24f916231c2446647df
+PYTHON_RPDS_PY_SETUP_TYPE = pep517
+PYTHON_RPDS_PY_LICENSE = MIT
+PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
+PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin
+PYTHON_RPDS_PY_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_RPDS_PY_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_RPDS_PY_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_RPDS_PY_DL_ENV = $(PKG_CARGO_ENV)
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
