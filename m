Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6913AC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8451641B4C;
	Sun, 28 May 2023 19:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8451641B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VO0Hn4lLiWgj; Sun, 28 May 2023 19:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38AF74193A;
	Sun, 28 May 2023 19:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AF74193A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA461BF836
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23CAC402C3
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23CAC402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3TN8bD9vZLXH for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:01:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D08340165
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D08340165
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:01:17 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30ae901a9ffso489559f8f.2
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685300475; x=1687892475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mP4QwVtRrTvjukCaSa+c3rHko2saBCzMY2HmYK9cNuc=;
 b=UBdNrrG0DnDQkefp4weYx92FP31LH/FidysmfgiIf0hZHo+fbDC8lSGQkl5v59XjfA
 Rbyml/6VCpkvUerPNoVmljIFgfdryFRCfSF6KHEWi/B6hVwAVuYfj4FMXHHL4VffUw4G
 pguICNOKXyQ3uSBeUdp8n9387eaTRR1mfW1fg6tlXZ2zbgBMqLk8NfZCB2YqsxqnfxLG
 ClZjrPhRZk+2WukcXRn+yyAOWa3s6WQ9lCeoALM9p+7NSGY8PeZneuYv050xG6egFOuO
 3YAr5DN7Kmi3qQ6VMhidHsyoqr8sy5OkTozQz3fIQk4ClLmDnHeiBCenNQRBZqtQckD4
 AZRA==
X-Gm-Message-State: AC+VfDyFKhlql6+z/uIxjUapttiVy2VzALdb7lCjsFlbKONzin3EsCCv
 +sbKUUz2RJ6X6nIObScBwB/dgrsu+fQ=
X-Google-Smtp-Source: ACHHUZ6dSfFRO2Bygk9zZJkwQTnaKonZXHTPq6phTB0N0icEo1oWV+3/LdcWjHfIS1cBAh5oWfkdAw==
X-Received: by 2002:a05:6000:11:b0:306:2d45:a8e0 with SMTP id
 h17-20020a056000001100b003062d45a8e0mr7722534wrx.15.1685300475258; 
 Sun, 28 May 2023 12:01:15 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0030632833e74sm11440967wrp.11.2023.05.28.12.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 12:01:14 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:01:07 +0200
Message-Id: <20230528190111.2430580-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685300475; x=1687892475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mP4QwVtRrTvjukCaSa+c3rHko2saBCzMY2HmYK9cNuc=;
 b=Z99Ihi1GGCf8zN1jOC1riGdn8lMvtEEQw1nQq9Qe1+idIfFlLroaNW1LtuzXikmUkb
 DpzTnbtc44WbSh8fXuM/wnrpVnFA7m4qsoeObWE9ViXj0SfFAmleuygKt9JTCfR3n8PV
 dErqpKvulv3hY9ZAFqA1VkwfyV7xQxHorRtxh09Y0J6jwPhy6bc6oJj9CRlN0qRl1Lld
 swGWlAfqOxsP5F2x/NGvMZaeBXnoHiQl/zPXcCJFPvvQMtuIkYqLsxS2nN5oh1p7/5ul
 pM/VEabMqgXXB+SdagI1EBlNjowW9UX3+IUxbTAwa9hHxOwJ7W7xZGwD6BEXj+mAlybh
 8dtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z99Ihi1G
Subject: [Buildroot] [PATCH 1/5] package/python-executing: new package
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-executing/Config.in             |  7 +++++++
 package/python-executing/python-executing.hash |  5 +++++
 package/python-executing/python-executing.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-executing/Config.in
 create mode 100644 package/python-executing/python-executing.hash
 create mode 100644 package/python-executing/python-executing.mk

diff --git a/package/Config.in b/package/Config.in
index 0cf2f3998c..82aa348455 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
 	source "package/python-evdev/Config.in"
+	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
diff --git a/package/python-executing/Config.in b/package/python-executing/Config.in
new file mode 100644
index 0000000000..e1f8f8efdf
--- /dev/null
+++ b/package/python-executing/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_EXECUTING
+	bool "python-executing"
+	help
+	  Get the currently executing AST node of a frame, and other
+	  information.
+
+	  https://github.com/alexmojaki/executing
diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
new file mode 100644
index 0000000000..40fd43b5fd
--- /dev/null
+++ b/package/python-executing/python-executing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/executing/json
+md5  e6fa9a6abf00555ccc8a6b3524729238  executing-1.2.0.tar.gz
+sha256  19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107  executing-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
new file mode 100644
index 0000000000..4c968323ea
--- /dev/null
+++ b/package/python-executing/python-executing.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-executing
+#
+################################################################################
+
+PYTHON_EXECUTING_VERSION = 1.2.0
+PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8f/ac/89ff37d8594b0eef176b7cec742ac868fef853b8e18df0309e3def9f480b
+PYTHON_EXECUTING_SETUP_TYPE = setuptools
+PYTHON_EXECUTING_LICENSE = MIT
+PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
+
+PYTHON_EXECUTING_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
