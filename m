Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BC7C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0FB41C57;
	Tue,  9 Jan 2024 07:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0FB41C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPmT_1CFKQMU; Tue,  9 Jan 2024 07:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16F8341A3A;
	Tue,  9 Jan 2024 07:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F8341A3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECBE1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17B6F821A9
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B6F821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IvNo7OZ5wgX for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:24:27 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31FE4821A0
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FE4821A0
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3608bdb484fso5499475ab.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704785066; x=1705389866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8PZlhpCu51MjCgPZGpqyX/OowGrcDIWw3+GcbsfTCxs=;
 b=LQ1biJzG5AFNYVwBC+2Mla7XlVg6UOSecmtQyT6Z7j0VUGSFGo+4hRuHyjDFMWws4h
 9P5P3e9g7eZ3kEYBsJwk29+M1D2OAMf0PZYvQNUxiM7RHfdxSmyQhgGbdoRdWorlHglf
 mGu+qVRJ1DTvxml/IsyvSXXMppxVF/g510Ek0P6Nmg8GOBw7QPXIT/6dQkWvApNLVtz4
 /YEhf36FAozk9ETKY3EV1hqB37SDkDRB1eIwzmIQ0QyoX/+KwkUQPOXGwAB4F7gXOWW3
 GAJ1l6lRo6xZzfPktOxR7arFCNdaHDM5GnEmHipG04r217P9vX40K9XSmebb5nxOXPNC
 z29w==
X-Gm-Message-State: AOJu0YyZZ+hrpMwA34ArybjrDWCBMAqQtjKA0EvVxltSnALApgUywypR
 KeZYI8EvlQOaD7szWLcp7ONNEJSWdmaWwg==
X-Google-Smtp-Source: AGHT+IFVKUBuIbb9SlpChHY20lS5zUmM89okSzsyRJCaVw958Ot7cqxWYi7NaVh1YeeRtNVBfIh/5g==
X-Received: by 2002:a05:6e02:1a03:b0:35d:7f18:f02d with SMTP id
 s3-20020a056e021a0300b0035d7f18f02dmr301257ild.19.1704785065884; 
 Mon, 08 Jan 2024 23:24:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 p9-20020a92d489000000b0035fb79100cesm437691ilg.59.2024.01.08.23.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:24:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:24:23 -0700
Message-Id: <20240109072423.4031745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704785066; x=1705389866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8PZlhpCu51MjCgPZGpqyX/OowGrcDIWw3+GcbsfTCxs=;
 b=c/OuAtuZ2wS5xcx3NVLVuUqqEVCiauUNhwNNEhsO5cyQRsJOGZGbZ3ZcnCMw9JxYO0
 7ZgCquoowtXwymQxwCTZlN1/R/l047ZH0R4pCSawWDgDU8CSaUaiLNgz5p97XtMy7Xcc
 ZCG/B820WTQS34/3T8FMpHpW/pf7p0LuB3KuaT9Pm5CGOoYUVW2AypE/d2+5AxzSbZee
 mqHQQao+ocCLCtdyg+aJgIavgrKppBhHRE775Odo1lTQcFrHUa2eL3qQNxaAkwFhzexE
 ruKPWRfD07RcJw+6xCwLZKk9gG+h8WsEGfzKQqEp6jbCvEpYRcF2uPBNP6aj367EavKj
 TR/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c/OuAtuZ
Subject: [Buildroot] [PATCH 1/1] package/python-esptool: bump to version
 4.7.0
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-intelhex runtime dependency.

Add new python-pyyaml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-esptool/Config.in           | 2 ++
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 36243fa89e..4099957971 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	select BR2_PACKAGE_PYTHON_INTELHEX # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 	select BR2_PACKAGE_PYTHON_REEDSOLO # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 25fea229b0..490b4e7e9c 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  17853949fd582550a7c270f08d7691d4  esptool-4.6.2.tar.gz
-sha256  549ef93eef42ee7e9462ce5a53c16df7a0c71d91b3f77e19ec15749804cdf300  esptool-4.6.2.tar.gz
+md5  e7f2012cf31cd23f60049b179fb3b53a  esptool-4.7.0.tar.gz
+sha256  01454e69e1ef3601215db83ff2cb1fc79ece67d24b0e5d43d451b410447c4893  esptool-4.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index c0709c64b1..f5aaface74 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.6.2
+PYTHON_ESPTOOL_VERSION = 4.7.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/a3/63/c757f50b606996a7e676f000b40626f65be63b3a10030563929c968e431c
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879dee053874a4f955ed1e9ad97275485f51cb4bc2cb4e9b24479
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
