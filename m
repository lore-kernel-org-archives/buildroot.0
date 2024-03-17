Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D04C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 09:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D73940181;
	Sun, 17 Mar 2024 09:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRxjRKeWrn9D; Sun, 17 Mar 2024 09:58:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA142402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA142402F2;
	Sun, 17 Mar 2024 09:58:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 891251BF5DA
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 09:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D2460760
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 09:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqUF1EI3i5XX for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 09:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22D8E60622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D8E60622
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22D8E60622
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 09:58:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4140a259a54so4097495e9.0
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 02:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710669504; x=1711274304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qdmhotbeeGfC2CDGAnye0ujQNTIv8EpEWqZFszpSFkE=;
 b=uCoeL/a3pgqLCOq+V+t4HyjfkdRlGO22Zkxy9Mysi7Im/166i2SbHHqMEDdL5N/ITy
 n4HedQ9bXV4Pu8j2TmWAmOIn+MQCjk9fg8pTrfHfzeZ+gaECe1fIAe8avrSkDmq9reju
 x/dPSPhPdscpNV9OPDlJ3EOUxd+kz8GoFHiIhKmq4CW34RVFJdpNmsBZOSNb9V4WrhKb
 JetGTOheHUvCAP3u4QXuBru6iU5ylO5yZDnzDklRUau22WHnHkvyaahsvVi9StzW56Wb
 oRgWRCqP+QC0Aw23FCj3j6Jq9FmXLfR7/Bbf4JR7E4lmymDY8m6EUstUmkPkgk1EPuN0
 DvSA==
X-Gm-Message-State: AOJu0Yxm/h+r+ogM3OlLLSs88q5iIPLQUjkcb1MvQGiNU0EfnbSgmeMF
 o2v3e928J9R+oPW0LotVgseFsO2Gpyf0LPRLccEIXfdk8/crd9VVSqGNhnGY
X-Google-Smtp-Source: AGHT+IES2LQl73UMeyECUi+QdfOKi1L3aWLwx02PKL3BWgFEnvy9b0hIEuGggKrCteBSQ9XvG/dLeg==
X-Received: by 2002:a05:600c:1c14:b0:412:e50f:acaf with SMTP id
 j20-20020a05600c1c1400b00412e50facafmr5837813wms.24.1710669504039; 
 Sun, 17 Mar 2024 02:58:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c500d00b004140e634d25sm750462wmr.11.2024.03.17.02.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 02:58:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 10:58:11 +0100
Message-ID: <20240317095811.52758-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710669504; x=1711274304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qdmhotbeeGfC2CDGAnye0ujQNTIv8EpEWqZFszpSFkE=;
 b=Y12CpIiNeWHuA3ykLnhln3qpVdguoGkYwHSe8f1jaNXU8aPTrY+LaLY29E7g9+qCHc
 GSdn7vErfNi2G9JmJ5HwFu0lbVVTd6xCKJN5XpncYaI7XSng+3FFd6EWNgRgWis/clZR
 sLNPVOhV3Fw5bYARGfbbxshfKuqeLUqDv/cU874jwyoaDKgm71Tpy1PaSeC8uHHVxYB5
 bIwCWjrexfvPE5gpmVPQxGxOgmgBUMt5FQCi+uJ251XuBr3KaJSNJhFR2wBpfInunMdf
 8uqSOCQf6J+7NzugS2tk1umK0mY1mr17fKF+1isu9x7ZP+hUWLJoHuKuV3Qm8i3NKyVC
 lpKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y12CpIiN
Subject: [Buildroot] [PATCH 1/1] package/xvisor: fix build without python
 interpreter
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failures on a system not providing the "python"
interpreter binary raised at least since bump to version 0.3.1 in commit
c4f8b8968770ecbf6444a5921c6472f126717626 and more probably
since the addition of the package in commit
e23ddf0c13e6d3b054782b86188396a0c2add1a5 and
https://github.com/xvisor/xvisor/commit/ba904b4066f4b375cb1ad76ca41570741dbec62e:

/bin/sh: line 1: /home/buildroot/autobuild/instance-2/output-1/build/xvisor-0.3.1/tools/scripts/d2c.py: cannot execute: required file not found

or

/bin/sh: /home/buildroot/instance-0/output-1/build/xvisor-0.3.2/tools/scripts/d2c.py: /usr/bin/python: bad interpreter: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/2e100bacc9e9face8351287e4c979c1729709d7b
 - http://autobuild.buildroot.org/results/5d8a08512db1b3095158753e3a7843b0fd6c9749

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...plicitly-use-the-python3-interpreter.patch | 35 +++++++++++++++++++
 package/xvisor/xvisor.mk                      |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch

diff --git a/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
new file mode 100644
index 0000000000..349d4415e2
--- /dev/null
+++ b/package/xvisor/0001-TOOLS-d2c-py-explicitly-use-the-python3-interpreter.patch
@@ -0,0 +1,35 @@
+From 888c94e7a121d96aa88f84c58fe7e2bd771fc5ac Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 25 Aug 2023 21:56:37 +0200
+Subject: [PATCH] TOOLS: d2c.py: explicitly use the python3 interpreter
+
+When compiling Xvisor on a system not providing the "python"
+interpreter binary, compilation fails with output:
+
+    (d2c)       core/vio/keymaps/modifiers.c
+    /bin/sh: 1: /build/xvisor-0.3.2/tools/scripts/d2c.py: not found
+
+This commit fixes the issue following the PEP 394 recommendation:
+https://peps.python.org/pep-0394/
+
+It sets the "shebang" to `#! /usr/bin/env python3` to allow using other
+interpreters in the PATH, or virtual environment.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+
+Upstream: https://github.com/xvisor/xvisor/commit/888c94e7a121d96aa88f84c58fe7e2bd771fc5ac
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/scripts/d2c.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/scripts/d2c.py b/tools/scripts/d2c.py
+index b46a7bc468..daac4a5450 100755
+--- a/tools/scripts/d2c.py
++++ b/tools/scripts/d2c.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#! /usr/bin/env python3
+ #/**
+ # Copyright (c) 2013 Anup Patel.
+ # All rights reserved.
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index eba37be9b7..2a51706b55 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -11,7 +11,7 @@ XVISOR_LICENSE = GPL-2.0+
 XVISOR_LICENSE_FILES = COPYING
 XVISOR_INSTALL_IMAGES = YES
 XVISOR_INSTALL_TARGET = NO
-XVISOR_DEPENDENCIES = host-bison host-dtc host-flex
+XVISOR_DEPENDENCIES = host-bison host-dtc host-flex host-python3
 
 XVISOR_MAKE_TARGETS = all
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
