Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C8CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76B980E85;
	Sun, 22 Sep 2024 06:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vszk-ltQcuCM; Sun, 22 Sep 2024 06:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9DA88142F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9DA88142F;
	Sun, 22 Sep 2024 06:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC3B1BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28EF44011C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpX6wZcFcMBs for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B24B0402E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24B0402E4
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B24B0402E4
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:44:46 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82ab349320fso126346839f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726987485; x=1727592285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=589Ja/nxhtiHQVesBbFczxVcc7VFj2Yyk8RBGfL91xk=;
 b=dBfDkqUz3OfOKr5978q7IY7Nalv0s7FIDG276tk9bAAYSifDeNVnD0z/ElUq07/g1R
 IvIXXz4MrNdANKjP1B7xjGlIkHF2CopGCrDE7ixhUBRxvzBvbqyy6jfjkAUpkKbv/HOc
 YtcKiP00bx7SmkZQf1PDpYwjOVrsr2TA9et4wmRvtk9CowTk8mzi8jnke2qUJKCE3Bh7
 QAy2MBF4BCWIaMTBUz9JKyxJOEY6gxWEZZMG/IQOEO0hZwCezK5pt6BdfP/BF/QfrhgH
 Kfuuxg6uE2X2mpVAxSe6a8IBzCHWte4WuKqDKhsQce11C4hsowfDzmvsxUQElIdVqWDF
 euig==
X-Gm-Message-State: AOJu0Yxlv6JfM0QOgsoJQnWliGbuBu2bhE6GINcj5Ywta93pX7jCDO5b
 1wZ+oaCKZb5AM7DALTmhWGVoRakMTcPisp0fNKHXSBYnAuVZ50yluqJ4wA==
X-Google-Smtp-Source: AGHT+IHtDIozqK90X5lEA8ImXBlOnsdhdl4saIoRmLMe+1NpY79pNdwKisBJypObYAXQaIjTgtyGxw==
X-Received: by 2002:a92:cd84:0:b0:3a0:aa6c:8a51 with SMTP id
 e9e14a558f8ab-3a0c9cfe6c2mr73736265ab.8.1726987485280; 
 Sat, 21 Sep 2024 23:44:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17f2esm4463755173.50.2024.09.21.23.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:44:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:44:43 -0600
Message-Id: <20240922064443.977542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726987485; x=1727592285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=589Ja/nxhtiHQVesBbFczxVcc7VFj2Yyk8RBGfL91xk=;
 b=hMAEUe/dF4gRSBM+6HsCIz43ZDmT5cRvqP85YNAdVNFN2fg6h6zBl76KRf1sRy7jjC
 CfLzlcSm8sQ0jIVu+qYlQ/+X++FQPI+hrEoBTiaedzWjDJz4G6ZcIuE9CKXw45346Ay5
 PzBeYSpEmrkN9agTv/jeoDypf3Demvsyxnh4j4n8H6SNpb3eDoX3Pf3Re5vElAogsdst
 GOjnXBFBTVa52abe4ZtWAisDVO1J8oPWYZZdAZ+09YZt3jyj7usPZg/q+P3nvG/+urVS
 1xFBAr9yuHc+/9i+sEBaO7Pj9j5/wsT11MGD3GhIPTVoqClQ/yQLnG95WqCbRqKXE4H7
 Z4MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hMAEUe/d
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to version
 3.0.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

Add new python-markupsafe runtime dependency.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-werkzeug/Config.in            | 1 +
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-werkzeug/Config.in b/package/python-werkzeug/Config.in
index 27b2fdeaab..7b2a9a09ad 100644
--- a/package/python-werkzeug/Config.in
+++ b/package/python-werkzeug/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WERKZEUG
 	bool "python-werkzeug"
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Werkzeug is a WSGI utility library for Python. It's widely
diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 34adc67088..31972eacf2 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  3bb49cd2f2b51a1c638532e9a935e207  werkzeug-2.3.8.tar.gz
-sha256  554b257c74bbeb7a0d254160a4f8ffe185243f52a52035060b761ca62d977f03  werkzeug-2.3.8.tar.gz
+md5  c69f88f79e8b84d77abd262558ccd8fa  werkzeug-3.0.4.tar.gz
+sha256  34f2371506b250df4d4f84bfe7b0921e4762525762bbd936614909fe25cd7306  werkzeug-3.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index e8ef32bb1b..fa3d3cfd37 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.3.8
+PYTHON_WERKZEUG_VERSION = 3.0.4
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/3d/4b/d746f1000782c89d6c97df9df43ba8f4d126038608843d3560ae88d201b5
-PYTHON_WERKZEUG_SETUP_TYPE = setuptools
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/0f/e2/6dbcaab07560909ff8f654d3a2e5a60552d937c909455211b1b36d7101dc
+PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
-PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
+PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
 PYTHON_WERKZEUG_CPE_ID_VENDOR = palletsprojects
 PYTHON_WERKZEUG_CPE_ID_PRODUCT = werkzeug
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
