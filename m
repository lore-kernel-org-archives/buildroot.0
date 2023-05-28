Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0862EC7EE29
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 19:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E54841B7E;
	Sun, 28 May 2023 19:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E54841B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hESBpNqdTooE; Sun, 28 May 2023 19:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125A141B92;
	Sun, 28 May 2023 19:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125A141B92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9AF81BF836
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D72F8402C3
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 19:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D72F8402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEzTqhGYlxFg for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 19:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE5E240272
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE5E240272
 for <buildroot@buildroot.org>; Sun, 28 May 2023 19:01:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30adc69c0dbso1322186f8f.1
 for <buildroot@buildroot.org>; Sun, 28 May 2023 12:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685300478; x=1687892478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmBW8L3mD6jWJOnfho/aGnyiyFbdqTF341HlJQGw9q0=;
 b=BRCuCzGmHsXtpXK4iKd7foz6A8rFmJmovBmIX/gd2rZ2Hj8m1N0wOlG4M0uybMmYol
 2YWNiHa/4R06q8iLhRumkS5ZbiecgP2X3HJDYL/hqLAcIORbUc60aPAyWC2X7/sxFwMZ
 c6AgZoaflDwSjMrp2ShMeIO/gX8SwDYf5m//od/kOwO3GKNICZ3WlzRSS0aFu2GnEjCM
 WZWwYDm8Qz5mb71IN4ASYmzQaM/oT4ugKjulUG8JgeOcZ+21RPDXKCI2iWShIWGGWzdN
 ffoPjK3OO/4XS9N9e/sRNE0ih5AnpTkwd8MGUXDXkGxaqyDfe7yJJCK7FsXovidvXhun
 3Xrw==
X-Gm-Message-State: AC+VfDxNeAs9gC4HRWLYD4z+whATiRWKG4z6WSGSat2sFwrKlK1Hys9x
 s2c/fbdKh+I1Qaej4x/z/biZUOL+NIE=
X-Google-Smtp-Source: ACHHUZ4efilMRg8oVK5ocK/lF2E2A9KF7LCq4DVyZqRKcCH1P1guOWT/RmvUdCJAJyfiYOBZ8Z85PA==
X-Received: by 2002:a5d:4bcd:0:b0:30a:e165:e68e with SMTP id
 l13-20020a5d4bcd000000b0030ae165e68emr7599319wrt.27.1685300477913; 
 Sun, 28 May 2023 12:01:17 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b0030632833e74sm11440967wrp.11.2023.05.28.12.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 12:01:17 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 21:01:10 +0200
Message-Id: <20230528190111.2430580-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230528190111.2430580-1-romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685300478; x=1687892478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmBW8L3mD6jWJOnfho/aGnyiyFbdqTF341HlJQGw9q0=;
 b=hLh846UEhapHG2SmFr746PhY/PZxxtWtNSfJg67IuPLgwCrZJkpgnKMYDwaCP1y+cQ
 uvVxElYgGRANgkWkO0i76C71EZOp/1CkCBgoStWNB8U46TyxCgVgIG/iAAcSxI6uT5DZ
 8kUFt/ej/7wP1FdBmSceMfKj02HOvlp/lk0L+K4cEd2GiT2SPcpvKUzddpJyyVuOG1lS
 Oz7Xq0CFq8lhWKyPxlLgC6kV0a0WYsBXK16E73NQcxKj1dCBs1tfP2bNfR+OhlxMnSHW
 laTXn2ZEA/K8t8gZuuAGtEflLRifh+ziJ+rBcj9rzZOlVsxf8rzqdzew3eEDo2RwNqc0
 mSvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hLh846UE
Subject: [Buildroot] [PATCH 4/5] package/python-stack-data: new package
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
 package/Config.in                                |  1 +
 package/python-stack-data/Config.in              | 10 ++++++++++
 package/python-stack-data/python-stack-data.hash |  5 +++++
 package/python-stack-data/python-stack-data.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-stack-data/Config.in
 create mode 100644 package/python-stack-data/python-stack-data.hash
 create mode 100644 package/python-stack-data/python-stack-data.mk

diff --git a/package/Config.in b/package/Config.in
index e018fe66ca..585072aa83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ menu "External python modules"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
+	source "package/python-stack-data/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-stack-data/Config.in b/package/python-stack-data/Config.in
new file mode 100644
index 0000000000..508eb9cf13
--- /dev/null
+++ b/package/python-stack-data/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_STACK_DATA
+	bool "python-stack-data"
+	select BR2_PACKAGE_PYTHON_ASTTOKENS # runtime
+	select BR2_PACKAGE_PYTHON_EXECUTING # runtime
+	select BR2_PACKAGE_PYTHON_PURE_EVAL # runtime
+	help
+	  Extract data from python stack frames and tracebacks
+	  for informative displays.
+
+	  http://github.com/alexmojaki/stack_data
diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
new file mode 100644
index 0000000000..6decd3ca8e
--- /dev/null
+++ b/package/python-stack-data/python-stack-data.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/stack_data/json
+md5  bf86c3c81a0158e1e7f3979da5a0033b  stack_data-0.6.2.tar.gz
+sha256  32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815  stack_data-0.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
new file mode 100644
index 0000000000..494ce8f454
--- /dev/null
+++ b/package/python-stack-data/python-stack-data.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-stack-data
+#
+################################################################################
+
+PYTHON_STACK_DATA_VERSION = 0.6.2
+PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
+PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
+PYTHON_STACK_DATA_SETUP_TYPE = setuptools
+PYTHON_STACK_DATA_LICENSE = MIT
+PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
