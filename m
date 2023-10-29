Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC8BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 23:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5FD8201E;
	Sun, 29 Oct 2023 23:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F5FD8201E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3boEsavq0m8W; Sun, 29 Oct 2023 23:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E22F582015;
	Sun, 29 Oct 2023 23:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E22F582015
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0363E1BF3EE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D05FE70653
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 23:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05FE70653
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xn3Ld7TMOcp0 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 23:40:11 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33E370636
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 23:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33E370636
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3576e74ae9dso12998685ab.3
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 16:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698622809; x=1699227609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=aC1ekRohBcHKIGDF/erHlkstDCiyU23fWPHrBuNEC+/eQ3ZjPELQEZ+huqP2n+mRVx
 +51JOBLXKTWpdShkWjX4nu3aohl9XsgwpzCYDV0aXOPU48MQFC0sEhNgDk+Bm3WBYr5O
 xrevjS3cELx5yDNlWxmtwbHNuzN4l29RvMyW9xXoNyNX5zNqBeSues2c/By9BwAgqsBv
 SGRjoiK5MXw/GjTCaGsb2QBQ52kfLW8cogrY2L5pMJaUhVEvDIoftiu5qI7AXsXoU6CB
 ZxZdm7v7J4TUsbvV5SvN08s1bP5pkrAY0E5zGUHYCan6ZLKHdgmqK7bFck7py1JoF+lt
 8rJA==
X-Gm-Message-State: AOJu0YzAELVFhZAQxBPl9J78SsoZWclIdEDVcktoU2dXEb16+pHz0LFM
 nlNCqcZRoDyjxPh5yDGdMqM3NpxpaR8=
X-Google-Smtp-Source: AGHT+IEU1h3WgeAW7cLJw0EdwmHr+ufBycLGi/ITfwuidAcuyfFoyHWUpw/zvOQa5yU6YmGBO7+JFQ==
X-Received: by 2002:a05:6e02:1567:b0:358:574:4c74 with SMTP id
 k7-20020a056e02156700b0035805744c74mr11535390ilu.2.1698622809578; 
 Sun, 29 Oct 2023 16:40:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 j16-20020a056e02015000b00357e53527afsm2012478ilr.61.2023.10.29.16.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 16:40:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 17:40:00 -0600
Message-Id: <20231029234003.2606006-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698622809; x=1699227609; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=XobLoyPkhlIvUhPPv8dc8YuNbgHuL+J0BZli9vbx2oABAlX43DkZodhpi6aH77xK06
 ZaLM1LwTJufvpkDZBPWMT/z5fjzA6IYAaM7KNwm9m7qzoqF0DDJVDmCFQZaVOhqISXKg
 vnVre24YGSJS8boNYlXzYaf1+tdKgK4ARyL0Nj3a48Xpp1Hz0Esysr7sAipt1XZaXCtj
 JgNoQ6nDz7Xt/+ObW+O2I4aWkDVY5t4IwHvWZ4/0hOC3xu2WY+MQ/TJ/NW+8tXxAsnH/
 GUk22h8o0lLwOFLq3e2GdvHQUtZDLUv6zFbfU/w/T7geVblXid2FdovII7P1xVa71IV2
 /OqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XobLoyPk
Subject: [Buildroot] [PATCH v4 1/4] package/python-poetry-core: new host
 package
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
