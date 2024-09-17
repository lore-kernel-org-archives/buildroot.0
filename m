Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4487BCAC5A2
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF61C610C5;
	Tue, 17 Sep 2024 21:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9mjYUFJbTJ6; Tue, 17 Sep 2024 21:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D975A610DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D975A610DC;
	Tue, 17 Sep 2024 21:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 514AE1BF966
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4083481DE6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6jrvcoHxHey for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4082181DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4082181DE5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4082181DE5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:00:49 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso266281839f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726606849; x=1727211649;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gONG/o/lahQlzHy6kUVIV6RE441WN+SK4I4x7pZAtKE=;
 b=p0FrejJIu7+DaVtYhuwqahh4nGDTYsUPaeynh5l+wKY18WCHCzMf3xeGlwbR6pqxiT
 cAzrGeMDcADZ1OswrFhqAvhmUxVXniBrRkj1prKJqPjP6FhyKq82dFDBpScHN2hQL0Gz
 auMEJMrR+FCaStk1QQfd3yzv8KDtIbPmuf1G3dxlY9RpyNIF/xcE7SIakAaJywlmlXEj
 uEY4OgY7bdC0HQc2Z5umC9ZQXaD9WMuGd0uBqytVkV8GoQYmNQhZ/zBLfC9EtoOXa4ml
 FeHdZcEYhyiW1klulu/6/wD7ZGN8B1GC09L7GYdG1EPQsA8aeLAQAzNTSBpPKIE4K5Dg
 hA1A==
X-Gm-Message-State: AOJu0YwlwkNniQkYJAcaWeKGRfZ9xJfmh2ZINmYF+g4aAGjuO81fwW+P
 Jdl2/42HY20AUVdSE+VRm1L4jQpW5sO+DKzaXayiTChjxnwR5eiiyEM4pw==
X-Google-Smtp-Source: AGHT+IGeRdYJ0hGNzdfdu9Th8yr7hSQWjENzi/8Kou8PTBdGjRvCBkRnOqfDCpXzpxmz3CJ9wtW+3A==
X-Received: by 2002:a05:6602:15cc:b0:82a:ab20:f4bf with SMTP id
 ca18e2360f4ac-82d1f8c7dd7mr2311499239f.1.1726606848680; 
 Tue, 17 Sep 2024 14:00:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49354ac7sm227574639f.47.2024.09.17.14.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:00:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:00:46 -0600
Message-Id: <20240917210046.4190378-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726606849; x=1727211649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gONG/o/lahQlzHy6kUVIV6RE441WN+SK4I4x7pZAtKE=;
 b=akrk2jWma3pCpS+7DnoNo5GKB0R4thVyHIW8u8bKuZBRHW2pwEjut9fbpqcIXLrsih
 tdILf14F3jdhZ+fnLKXr6VsJTvJZFiseJ4UJpKNrcdf1gkutu3baiYcm8vDXWsclLON0
 9jOq760UHgFAvBxNeJ89G8PuDHofeoh2DI8n09i50H3hPPfJGZ2IdbSadk4EhEzJnofC
 agsmxd7vkhThZ+wMoZpygM0XdST+9tqQ9m4lG/M5l4qKitQZCuTa7VHb5cIxzWGX8qqR
 jUpGAffNaxT0UQl5oMOEFsCcY6MwnXUmCfmeddt9VU4Mj7p7XXPbOE/So/wQQZW/7/Xa
 BFlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=akrk2jWm
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.27.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools build backend to meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycairo/python-pycairo.hash |  4 ++--
 package/python-pycairo/python-pycairo.mk   | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index f44afe6fc4..633b31d975 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  7669cdc70111d01ba6faecd65d8cdbf6  pycairo-1.25.1.tar.gz
-sha256  7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c  pycairo-1.25.1.tar.gz
+md5  12097575a1bb683cab7dc425d9769a68  pycairo-1.27.0.tar.gz
+sha256  5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430  pycairo-1.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index eb60293ff8..8d9459e9e2 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,12 +4,20 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.25.1
+PYTHON_PYCAIRO_VERSION = 1.27.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/c7/7c/de4d40316ee563e4f15a0f05f28c8458833fbef80c4588b9dd51f39b78ee
-PYTHON_PYCAIRO_SETUP_TYPE = setuptools
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/07/4a/42b26390181a7517718600fa7d98b951da20be982a50cd4afb3d46c2e603
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 
-$(eval $(python-package))
+PYTHON_PYCAIRO_CONF_OPTS = \
+	-Dpython=$(HOST_DIR)/bin/python \
+	-Dtests=false \
+	-Dwheel=false
+
+PYTHON_PYCAIRO_CONF_ENV = \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
