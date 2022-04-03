Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCB2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70D7F405AD;
	Sun,  3 Apr 2022 22:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uP1XPiNHupaI; Sun,  3 Apr 2022 22:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D17404AB;
	Sun,  3 Apr 2022 22:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62D081BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5043041581
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PG1qPLhGcwA for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6BE41527
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:25 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id t19so6400711qtc.4
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dPGQJxVOaLn78yugrptVfwVyGaOgMgr6D30pdkoJ4Oo=;
 b=mY//qLosu88f4/Ol0Wvp7kTS73kugsh8QvqTldZwX30TKK5D7TPDDkkxeGXnRYs9Mj
 3iN4GabUWTM3ht8KcPoIWAeQCANtW6EbvQNX1EftQn4OKqgSpZOmw6aiFFI/MT8dqJgB
 lFJw7xY5ArtO4UFZMW19CqD0yPBZEnHDEtOPf5kN2kEBioQsm9hkcFzKMRUL4G28pyjC
 HHTu66DXeGjjR9a7fgyKEGbR4oj3cF9mR2z/ySaiZmKr+gU9nSJlHYpQ62uHuNIxI0fq
 B8HZwSGQu0+PqqtRAAV6jl4hM7Jia2pXToNcxcal5AHtqtcj+ULspMtXENqXMNVOi9sD
 FJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dPGQJxVOaLn78yugrptVfwVyGaOgMgr6D30pdkoJ4Oo=;
 b=2OILwIk1cPBnEuhhPU5w1zTygwR1rME6pKC29aBsr1aX8mmrqhM7RXNRGHMajZtdBI
 Urj+OLt3YhdlwChsbG7e4yKhCHG6qSECkljTU/gcyETz9uMqhpZwrMoGRs9oMg9IPiWs
 u8yIugkd3joBI95Bc1y+s+AfwAXHDYlMbGPs0lqxC8b4H+2XmBdhSjOqxSu0FnAoJLl1
 9g7wy7b9J+L3wbwg7rpdkgWDuI0BBxmg5PtNXLki9lkX6cWoeq06hrtDdrJhFGBHhNdG
 pNHTJkCJpz7j9QuASRWbMhey3XnJLnZPYlD36MDVfKZHNeNqN6y0j5wRr/efpYpEekvy
 aw9A==
X-Gm-Message-State: AOAM531UTO4ZPx4gXkB5sXzA751yYNmNErqwIjrCwfs2giyhfN/H4fk+
 hl6wce7I6xsVj8rLACovDLOvpGj1x7I=
X-Google-Smtp-Source: ABdhPJyfPnjcPO09XeMaWBq6mB0X8vR7vGRCLZbKLrerBeTBJT+2jr1lpgxMGeNiA308wlwo9mgYTw==
X-Received: by 2002:a05:622a:196:b0:2e0:705c:35b2 with SMTP id
 s22-20020a05622a019600b002e0705c35b2mr15727991qtw.567.1649024424719; 
 Sun, 03 Apr 2022 15:20:24 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:24 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:49 -0300
Message-Id: <20220403221953.1158787-2-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/python-appdirs: add new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

Required by python-twisted[conch], which is required by python-crossbar.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-appdirs/Config.in           |  7 +++++++
 package/python-appdirs/python-appdirs.hash |  5 +++++
 package/python-appdirs/python-appdirs.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-appdirs/Config.in
 create mode 100644 package/python-appdirs/python-appdirs.hash
 create mode 100644 package/python-appdirs/python-appdirs.mk

diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..a1964df5f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -929,6 +929,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-ansicolors/Config.in"
+	source "package/python-appdirs/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
 	source "package/python-argon2-cffi-bindings/Config.in"
diff --git a/package/python-appdirs/Config.in b/package/python-appdirs/Config.in
new file mode 100644
index 0000000000..5585759aa6
--- /dev/null
+++ b/package/python-appdirs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_APPDIRS
+	bool "python-appdirs"
+	help
+	  A small Python module for determining appropriate platform-
+	  specific dirs, e.g. a "user data dir".
+
+	  http://github.com/ActiveState/appdirs
diff --git a/package/python-appdirs/python-appdirs.hash b/package/python-appdirs/python-appdirs.hash
new file mode 100644
index 0000000000..52689b8b2c
--- /dev/null
+++ b/package/python-appdirs/python-appdirs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/appdirs/json
+md5  d6bca12613174185dd9abc8a29f4f012  appdirs-1.4.4.tar.gz
+sha256  7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41  appdirs-1.4.4.tar.gz
+# Locally computed sha256 checksums
+sha256  36ddb4d0a745a93ab203203d7190814b1b89727d254caff48c7a7afbbd47000b  LICENSE.txt
diff --git a/package/python-appdirs/python-appdirs.mk b/package/python-appdirs/python-appdirs.mk
new file mode 100644
index 0000000000..222aadbb29
--- /dev/null
+++ b/package/python-appdirs/python-appdirs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-appdirs
+#
+################################################################################
+
+PYTHON_APPDIRS_VERSION = 1.4.4
+PYTHON_APPDIRS_SOURCE = appdirs-$(PYTHON_APPDIRS_VERSION).tar.gz
+PYTHON_APPDIRS_SITE = https://files.pythonhosted.org/packages/d7/d8/05696357e0311f5b5c316d7b95f46c669dd9c15aaeecbb48c7d0aeb88c40
+PYTHON_APPDIRS_SETUP_TYPE = setuptools
+PYTHON_APPDIRS_LICENSE = MIT
+PYTHON_APPDIRS_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
