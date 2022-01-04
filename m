Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB1C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BACC403C7;
	Tue,  4 Jan 2022 20:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWyU3HyhjPsU; Tue,  4 Jan 2022 20:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9943640287;
	Tue,  4 Jan 2022 20:09:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B60EC1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C3E40287
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvFkk1rqnqsB for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8715E40203
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:09:07 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id f8so23573974pgf.8
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT4Vcg6ujohVM8W/BFAHPeGSmi6wQdzGX8iyNNX6f1Q=;
 b=odAhTtqQqDghLnQ08mQIngg39CNIXn9MlCTFO2Vok16pKen2SKpOHg57/UdmqhzBuk
 pdZHF92FBi3xAfafC903qNbhGs2LlWJCpj87rLgvlaAzwfpfsyuh9B3Qjw+jEAjaodN3
 /WLh/RqfM/hPUYrZbYNFmlplq5T0Fh+2crpaaZfuZP2JALD09vNn1YoDNIlX6SFyTq9O
 mEQFUYwvYmXbockEIxP3Wzkvbh9MAh6vN1zb7EXTABeK0AxSVwyJ2EQ/z8Qb0AjsKIiB
 KYqrsl5Tsz5zqpZSAuMMkseBjIMBUcGB4F8G+5NWd3H4aygxyRp4Iti0M+oz/hzXAnY2
 rBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zT4Vcg6ujohVM8W/BFAHPeGSmi6wQdzGX8iyNNX6f1Q=;
 b=BdT8juJ38fVJhYS++74NLOmdaYn0YEzEolOcH6OZl2HxXFHgkv1FCJ7iwMeKf3qpPA
 dEHZeML50f94CcOJlGwiKzFHKuiKpMUgycRwHw2q4YMnRdkryj10nDGdZmYY7H2PvuKP
 dBU35GszO+23jaFbEYXy7OUU0iRG+TvH+QhwpB5pG9vqcqPzAT+zI8XL2yS3oLKeNBPk
 DxYD6OOOTZ6KhjOzCc+bS5IncqYjr4KigxqBC+1U+i+/Mmlbi+HOPYkmkx3GQSHwRzGh
 TtuwHqdL5sm8NAbWQT7vLpbVsQyBDfMpXhO0f2qeaYdfoA7Jvc52g1DVPCNVusppy09M
 oAjQ==
X-Gm-Message-State: AOAM533z/VeoHiOhpBk+Llh0siOPBbr7Of65DF3651Agtvo7DVNfX+1q
 5c5mQuNa3pyQLmaV5oQ7IN4rbEYGrz0=
X-Google-Smtp-Source: ABdhPJwdJ0pcrJVhhmawRY1pGLPhZvIgbARqW6yzUxKIJ+bvaV8LKleZaR+jvqDyEsGJGKWe3y6nlw==
X-Received: by 2002:a63:3d8a:: with SMTP id
 k132mr45346769pga.577.1641326946731; 
 Tue, 04 Jan 2022 12:09:06 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id 22sm43232537pfv.173.2022.01.04.12.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:09:06 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 12:09:04 -0800
Message-Id: <20220104200904.1422985-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdb: remove python2 support
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the GDB 9.2 changelog, python3 has been supported since at least
2019.

- Remove BR2_PACKAGE_HOST_GDB_PYTHON in package/gdb/Config.in.host

- Add BR2_PACKAGE_HOST_GDB_PYTHON to Config.in.legacy

- Change depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3 to
  depends on BR2_PACKAGE_PYTHON3 in package/gdb/Config.in

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy           |  7 +++++++
 package/gdb/Config.in      |  2 +-
 package/gdb/Config.in.host |  5 -----
 package/gdb/gdb.mk         | 10 +---------
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5994d94487..a126d56052 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_HOST_GDB_PYTHON
+	bool "GDB Python2 support removed"
+	select BR2_LEGACY
+	help
+	  Python2 is deprecated and no longer supported.
+	  Please migrate to Python3.
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
 	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
 	select BR2_LEGACY
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 6f1a883de7..daad6c910d 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -77,7 +77,7 @@ config BR2_PACKAGE_GDB_TUI
 
 config BR2_PACKAGE_GDB_PYTHON
 	bool "Python support"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  This option enables Python support in the target gdb.
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a6e1d7f53c..2c6c78f20a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,11 +41,6 @@ config BR2_PACKAGE_HOST_GDB_NOPYTHON
 	help
 	  This option disables Python support in the cross gdb.
 
-config BR2_PACKAGE_HOST_GDB_PYTHON
-	bool "Python 2"
-	help
-	  This option enables the Python 2 support in the cross gdb.
-
 config BR2_PACKAGE_HOST_GDB_PYTHON3
 	bool "Python 3"
 	help
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4ff498230a..2929eaf058 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -206,11 +206,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
 GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
 GDB_DEPENDENCIES += python3
-else
-# CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
-GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-GDB_DEPENDENCIES += python
 endif
 GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 else
@@ -287,10 +282,7 @@ else
 HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
-ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
-HOST_GDB_DEPENDENCIES += host-python
-else ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
 HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
 HOST_GDB_DEPENDENCIES += host-python3
 else
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
