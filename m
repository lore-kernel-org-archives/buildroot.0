Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC66C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 09:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9283360B91;
	Thu,  9 Dec 2021 09:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9vnsTwRmYqx; Thu,  9 Dec 2021 09:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80BD607FF;
	Thu,  9 Dec 2021 09:31:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAD21BF3CD
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 09:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A643607FF
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 09:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3U-Vsr381oD for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 09:31:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7010E607F0
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 09:31:36 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id j21so4750191ila.5
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 01:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EtPrQM+4pvMrER94BqccoeDwYo3MukLYJc2qqJDKXF8=;
 b=Y1aNilhojNWwwHYWCMisxbrOyrWEy9j7tahpMUNfKXIuTFFlRIOWfTE2ZZkGKaSABI
 2I7+rdJIR7iFH+qfzAG+Nz5iUNxcygYqrRgViTSylgSwgIz7R4w4mN86ker8NKWTWBx3
 rGzMceYW8qiD9bsYeLFsPS/KnGDG06AJaGYZiC6cFxcoXhI3bc4bdg4HTA4b8EsRjbg6
 zwV3TtpqKWct4zT8jvma0KCrsz4DlZkA6knsZppycB5ZkCIQnuorV+Bq1xzM3vnA35c2
 Go7U7RMrwMgh4DWD+oTFd3Ks5sRg5UsFA81iYdSczeGhbaLqz3zaurbs9NT7+liopvxr
 9qJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EtPrQM+4pvMrER94BqccoeDwYo3MukLYJc2qqJDKXF8=;
 b=Gxjz60xtkKbuId1AZNrgJDQgnyiwWv/Zo3kui1b1XNK90CLKDCawAou6Anhq4edSPE
 u4Nc3QaBqpjpLJ+q9GLgzvjhJ+Bn62TqCP88fzNfiZhjkL9zoiwWM3e2FFkuWkDRz9/A
 gYVkGRqLqcEwH3eWW76eqbBHES8aX2+BCfNSLPG1hIxl/u86kMgfdQdHcDBR1ECEjWgO
 SOpBpzAwB2z747/i7bkAp0uzVW/BN+tFT6lK10lKGR5Nm6PGFAGNFvXQNCZGxlw8GAIu
 +UzkHYs8rkCqoFQkUSRQHodyIp7jxtVRleydSDpU1swVJE+SNKl4YFI39AEaVBJhHfo1
 DD5A==
X-Gm-Message-State: AOAM5335t51xZbALdLWWvbwwXNKbTJP1K76qQxrjt3d66TxGrSbRytuH
 VVBfZ8fo+jul3M2UPdbeRm3R2T+ax8vDDw==
X-Google-Smtp-Source: ABdhPJyE16RKHo7SwpwPLaTSRgTgh4BViaMVpazvLe5AXYJR9LbesQy3cLRZ+EcX0nplGPzgsjzG3A==
X-Received: by 2002:a05:6e02:1947:: with SMTP id
 x7mr13006562ilu.295.1639042295345; 
 Thu, 09 Dec 2021 01:31:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id 11sm3562041ilq.23.2021.12.09.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:31:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 02:31:29 -0700
Message-Id: <20211209093129.3075373-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zchunk: new package
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in          |  1 +
 package/zchunk/Config.in   |  8 ++++++++
 package/zchunk/zchunk.hash |  3 +++
 package/zchunk/zchunk.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/zchunk/Config.in
 create mode 100644 package/zchunk/zchunk.hash
 create mode 100644 package/zchunk/zchunk.mk

diff --git a/package/Config.in b/package/Config.in
index 57208309c4..3fad1c6d3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1377,6 +1377,7 @@ menu "Compression and decompression"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
+	source "package/zchunk/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
 endmenu
diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
new file mode 100644
index 0000000000..d610e15997
--- /dev/null
+++ b/package/zchunk/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ZCHUNK
+	bool "zchunk"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  A file format designed for highly efficient deltas while
+	  maintaining good compression.
+
+	  https://github.com/zchunk/zchunk
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
new file mode 100644
index 0000000000..d6b425dc70
--- /dev/null
+++ b/package/zchunk/zchunk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  33934adecddc50c64615dd8cdfe52a79df674a5bb1d5e83a9c09e1d1e6e9b92c  zchunk-1.1.16.tar.gz
+sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
new file mode 100644
index 0000000000..d8538542f1
--- /dev/null
+++ b/package/zchunk/zchunk.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# zchunk
+#
+################################################################################
+
+ZCHUNK_VERSION = 1.1.16
+ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
+ZCHUNK_LICENSE = BSD-2-Clause
+ZCHUNK_LICENSE_FILES = LICENSE
+ZCHUNK_INSTALL_STAGING = YES
+ZCHUNK_DEPENDENCIES = libcurl
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ZCHUNK_DEPENDENCIES += openssl
+ZCHUNK_CONF_OPTS += -Dwith-openssl=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-openssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+ZCHUNK_DEPENDENCIES += zstd
+ZCHUNK_CONF_OPTS += -Dwith-zstd=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-zstd=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
