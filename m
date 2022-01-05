Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 23:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C30428E8;
	Wed,  5 Jan 2022 23:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh4cy7-G-EVi; Wed,  5 Jan 2022 23:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF090428E4;
	Wed,  5 Jan 2022 23:15:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 158401BF336
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 23:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22B6428DF
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 23:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FfiCAXJXiXp for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 23:15:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDFB4428E4
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 23:15:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so298769wmb.0
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 15:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olEAVxAYVi2uGZlpL0gmpdKoTb20KFad50A2bF9NHjE=;
 b=XHO/HO1389HcfmN0uBGyYU25INqcxsfOsAqMaW5u2qLxAj6WtfMFmDTTUw9BsifoVE
 6cUr9UEhbSknEbpwf2L8MAgwU2IJ/iuCpbryEvWke9GyQW8wgP5p4t0vntdnaS8GNpG7
 RGuzZP5anCOEdUH0yNfWAhj0/01DTv0t2fUqrFbeYlbtnXyDP1Kq9NK6PD5Ovg+Oqhd5
 dJUNGpmEMQkL9QSTVV1N2ZrnDIbkBYeJm7WMqXO+kaY0/1UGjr9CudVSeFUI7pXDUesM
 FzWRfxDateSBQwBZiaYFb3PB4d3T9MWLhJAa4/9dyppKLdQqFNi/fiCcR0XYg6bX57PJ
 Ys2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olEAVxAYVi2uGZlpL0gmpdKoTb20KFad50A2bF9NHjE=;
 b=A1n/07/kezn/5NLoqVWK2gry9jvB/108e4QD1wZfhrSE6GwkAsPqR+M8+J2ziG4Qc4
 LVyuq6Ou4vPbSWRuG8koixNQnskctc+VY56+9YPbTTO1Z7Vn9BKi/UJeIFOVrdGH9SRP
 lGuz3BttGN5EoNWl5l0Ne5C24AlmwLtuzP7J1hjrtlGZ31J9gxAOFB0iHIXHqTtY/98C
 ijYcMSiBt0p14Qz95+g63QdKuvtEkkb0Fte2BKEtlh9q3FtD9LcZSFoKNXGoewXtay4U
 NCcgn0PRGSN8rZL3pUwEccSIdc09JLRSBrJrrxTDGnmlXqA9VtO4mcLjO7c+jVISxOTv
 68pQ==
X-Gm-Message-State: AOAM533ZOWnCRmLFb5vgtDnshrbp8XEDtwWDiLv8Dz35WuE/2sZIFEPj
 JqlHmmBhRrDHDm8hLPF0/hi+/SqcEQ0=
X-Google-Smtp-Source: ABdhPJx5W5AdvtoY9+4zKo/Lo2E0SHew0gSbVkfUn2zF70DhgbLpze2iErUQYJbmmhQzos1RIdq7LQ==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr4640389wmq.144.1641424543954; 
 Wed, 05 Jan 2022 15:15:43 -0800 (PST)
Received: from home.localdomain ([178.124.208.44])
 by smtp.gmail.com with ESMTPSA id m12sm374998wrp.49.2022.01.05.15.15.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:15:43 -0800 (PST)
From: Uladzimir Bely <wiselord1983@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 02:15:43 +0300
Message-Id: <20220105231543.22467-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-mpd2: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A client interface for the Music Player Daemon.

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-mpd2/Config.in        |  8 ++++++++
 package/python-mpd2/python-mpd2.hash |  5 +++++
 package/python-mpd2/python-mpd2.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-mpd2/Config.in
 create mode 100644 package/python-mpd2/python-mpd2.hash
 create mode 100644 package/python-mpd2/python-mpd2.mk

diff --git a/package/Config.in b/package/Config.in
index 7148639735..b9dc9b49e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1091,6 +1091,7 @@ menu "External python modules"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
+	source "package/python-mpd2/Config.in"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
diff --git a/package/python-mpd2/Config.in b/package/python-mpd2/Config.in
new file mode 100644
index 0000000000..015ca47610
--- /dev/null
+++ b/package/python-mpd2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MPD2
+	bool "python-mpd2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_MPD # runtime
+	help
+	  A Python MPD client library.
+
+	  https://github.com/Mic92/python-mpd2
diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
new file mode 100644
index 0000000000..83487257ee
--- /dev/null
+++ b/package/python-mpd2/python-mpd2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-mpd2/json
+md5  e31c6063e9c2e029a26b0815cd08b05e  python-mpd2-3.0.4.tar.gz
+sha256  7a67834e22d97e7cd77f8951c8baf87c149285c67d67d73550ce034302561ae5  python-mpd2-3.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
new file mode 100644
index 0000000000..6a7358e8cd
--- /dev/null
+++ b/package/python-mpd2/python-mpd2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-mpd2
+#
+################################################################################
+
+PYTHON_MPD2_VERSION = 3.0.4
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
+PYTHON_MPD2_SETUP_TYPE = setuptools
+PYTHON_MPD2_LICENSE = GNU Library or Lesser General Public License (LGPL)
+PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
