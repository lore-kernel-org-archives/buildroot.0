Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7520C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 08:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59728401E3;
	Mon, 29 Nov 2021 08:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hZnr0tzUeh8; Mon, 29 Nov 2021 08:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C88C4037B;
	Mon, 29 Nov 2021 08:56:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3D11BF3F4
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9812F82E9D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 08:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjMUH2GyZeil for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 08:56:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0B3282A87
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 08:56:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id k21so20480017ioh.4
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 00:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lh68gcd+RDUO9phtg5TpHb1ug7eUR1EQTzMCdidyats=;
 b=gkrGSlLVyltRO2vVYFjgEpSapknCNEbgM1qd+kW2tP7uwsdnWWu+gQhxM/7xpheMld
 gwhgEzRZgrzd00sfM5hmoajRVr44akkYHYbP+ZVV5FZ3uxMwsTSvQONV1MsKQbnux3XX
 EkBw3BN3CiNA9Z9FWs2CANDf8Jsyd8R0LcR/dYDx3spF/iYseJs8Jm5iQ5CPlX18ddpe
 6rkQfh4IM/XZuQ2ox/sHTsm5OmR6KaCE/vveoab0St3qPiFejc65+0Bk4lM3bZNAlo6w
 1QN1J4dR+z/Wu5RJJOcMDiyUW0EGsPa5jCnLgBPB1o73HFRUE1D/UwnmRWKmnsKVzZHQ
 sTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lh68gcd+RDUO9phtg5TpHb1ug7eUR1EQTzMCdidyats=;
 b=r+TryVPSmlnDfDo57uHASX2t5svk1fFmIURqN3RvxbYjHKcsppqiFkQPpgu63+9pR4
 jdU/vpQo81Sp78e53pq7uwiN4VJ6gg+f1jJYBTC1AWN6YWaIydDoaJfAtF5wUcCB+P4A
 UxrI28M5CfzZw+e7MK3OKOn+Lt2+91z3RLTnoCzmr8rmZljTYN3aTXWyBi/b4an+yo29
 eYbQ+S1qzgKcDSDVzd9MXMhxxEG+3qtJtUIT2mn1PdL1ENsYyj3oFhjP1qGLocueBrI/
 aBAgp+kMC3zZ3LLbKfHwxVAYuGngPdJAVpl7nQIpyMXsDBPlMoGa9UbJVY1Ssjw7faVA
 5RyA==
X-Gm-Message-State: AOAM530RNPDDB6vw978NJMmSpVxFFHUGbPpVjaTP3JMaXdzO0hybbc0v
 wPHGe5f25GmSHUSI+EcBf1GfuNgDHzM=
X-Google-Smtp-Source: ABdhPJxUSjXKBYA95ql9q8BkEYi2wvKLTok/jTulde+5rptgyzA2wm9KJi54ctcXTUp4zDyZSxnanw==
X-Received: by 2002:a05:6638:390:: with SMTP id
 y16mr69342098jap.34.1638176177233; 
 Mon, 29 Nov 2021 00:56:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id l3sm7127145ilv.37.2021.11.29.00.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 00:56:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 01:56:07 -0700
Message-Id: <20211129085610.3701585-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/python-tomli: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-tomli/Config.in         |  7 +++++++
 package/python-tomli/python-tomli.hash |  5 +++++
 package/python-tomli/python-tomli.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-tomli/Config.in
 create mode 100644 package/python-tomli/python-tomli.hash
 create mode 100644 package/python-tomli/python-tomli.mk

diff --git a/package/Config.in b/package/Config.in
index cb94e30be3..52ef33ab97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1243,6 +1243,7 @@ menu "External python modules"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
+	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tomli/Config.in b/package/python-tomli/Config.in
new file mode 100644
index 0000000000..e1cecaaa36
--- /dev/null
+++ b/package/python-tomli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TOMLI
+	bool "python-tomli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A lil' TOML parser.
+
+	  https://github.com/hukkin/tomli
diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
new file mode 100644
index 0000000000..1a274c8a40
--- /dev/null
+++ b/package/python-tomli/python-tomli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli/json
+md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
+sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
new file mode 100644
index 0000000000..4e6b023ef7
--- /dev/null
+++ b/package/python-tomli/python-tomli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-tomli
+#
+################################################################################
+
+PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_LICENSE = MIT
+PYTHON_TOMLI_LICENSE_FILES = LICENSE
+HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
