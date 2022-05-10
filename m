Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD155C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 07:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E9660F6E;
	Tue, 10 May 2022 07:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HWDSaTV8xtB; Tue, 10 May 2022 07:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA0160F68;
	Tue, 10 May 2022 07:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4761BF2BE
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 07:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08216415D3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 07:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jZULg5zRGuJ for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 07:14:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D32F415D1
 for <buildroot@buildroot.org>; Tue, 10 May 2022 07:14:40 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g20so18871597edw.6
 for <buildroot@buildroot.org>; Tue, 10 May 2022 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=TsrLmVhgLVheX25kVcTWsYmL9nEoEv8ge36h8IegZQc=;
 b=TYOeZ69+phUidoyV6CDEBiGFR/B0bkctJDKBDTBfsLaN5XS3R9iz/F/udV8GVOtva0
 jNxb+cTSP36rYa/jYyvxmaDD/cLOaXQ/LE6oWwOzkfSZ4I66NmkRgPJRtnr4d+Q1fgNv
 sptTnku3F65xZKIr2X6NBS2r8zwfgBDqDA+ZLNRfqUJmwlt5PYHecyRtDFzbpRejzZza
 /mFtBRJqOYQBtAXPTaJsuQFKT7TqsEw21kNlz436Ga//mnqIbo4brTo99P/NMIzOHsTG
 kz1ntwaZGvxVJwBXv/n9B4bwEF58QfoJZ3xUdORIL6IArxmROwBX0rIqcjD1W/F4LA5b
 5zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TsrLmVhgLVheX25kVcTWsYmL9nEoEv8ge36h8IegZQc=;
 b=Ga5iZ4ibyZ1mL2NF9VMz5q0QGlIFCgCjMTW9zcMesphIS38XhSoZsYEla7vPaO9vXw
 go9KBgKCMM8PniwJdwHGS0gqa1zX4FtTRN8+uzPj9FXZdkjH/OP5HyRCdF1Iwz/fk2GG
 xBktB7xPR6F74Pqhm7KmZ9J9T1bRBtb/Tueb90rMtXBJopABvxfeWSMcj1bfHgQv3565
 phQQyn/jGVcJTAmWX8vgsq5RAJ+tZVHJvdX5HCndg/KEXP/IJsPqkK1mASV/1onj0qyZ
 VWAi+bq0Ep7CGEn+dlyUt5ElEnJDMXYijfg1nZCXNtdOZUT+KMjxhe22S6mRoHXYpGU2
 hClg==
X-Gm-Message-State: AOAM531uWJV518nuvCpp7a8v4OaY7dadXkAMbkGdR/6THv8oRBP1k10P
 UZCIQ3X8Cw9WEoUw8IMeXo7/+yESknY=
X-Google-Smtp-Source: ABdhPJyMKPdAclXjRMuom3dJBCLyRIOF5ztw6RN1lVlSKs2cB4a7PxqYajklBYx4fXul/AWHZsPQmA==
X-Received: by 2002:a05:6402:5205:b0:427:b431:e0ed with SMTP id
 s5-20020a056402520500b00427b431e0edmr22100455edd.186.1652166878235; 
 Tue, 10 May 2022 00:14:38 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 fi13-20020a170906da0d00b006f3ef214da9sm5901884ejb.15.2022.05.10.00.14.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 00:14:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 09:14:30 +0200
Message-Id: <20220510071430.29647-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-rfc3987: new package
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-rfc3987/Config.in           |  7 +++++++
 package/python-rfc3987/python-rfc3987.hash |  5 +++++
 package/python-rfc3987/python-rfc3987.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-rfc3987/Config.in
 create mode 100644 package/python-rfc3987/python-rfc3987.hash
 create mode 100644 package/python-rfc3987/python-rfc3987.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..68eafd2463 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1205,6 +1205,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
+	source "package/python-rfc3987/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
diff --git a/package/python-rfc3987/Config.in b/package/python-rfc3987/Config.in
new file mode 100644
index 0000000000..3cd74f5314
--- /dev/null
+++ b/package/python-rfc3987/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RFC3987
+	bool "python-rfc3987"
+	help
+	  Parsing and validation of URIs (RFC 3986) and IRIs (RFC
+	  3987).
+
+	  http://pypi.python.org/pypi/rfc3987
diff --git a/package/python-rfc3987/python-rfc3987.hash b/package/python-rfc3987/python-rfc3987.hash
new file mode 100644
index 0000000000..013cee6161
--- /dev/null
+++ b/package/python-rfc3987/python-rfc3987.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+md5  b6c4028acdc788a9ba697e1c1d6b896c  rfc3987-1.3.8.tar.gz
+sha256  d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733  rfc3987-1.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.txt
diff --git a/package/python-rfc3987/python-rfc3987.mk b/package/python-rfc3987/python-rfc3987.mk
new file mode 100644
index 0000000000..cad17e8de2
--- /dev/null
+++ b/package/python-rfc3987/python-rfc3987.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rfc3987
+#
+################################################################################
+
+PYTHON_RFC3987_VERSION = 1.3.8
+PYTHON_RFC3987_SOURCE = rfc3987-$(PYTHON_RFC3987_VERSION).tar.gz
+PYTHON_RFC3987_SITE = https://files.pythonhosted.org/packages/14/bb/f1395c4b62f251a1cb503ff884500ebd248eed593f41b469f89caa3547bd
+PYTHON_RFC3987_SETUP_TYPE = setuptools
+PYTHON_RFC3987_LICENSE = GPL-3.0+
+PYTHON_RFC3987_LICENSE_FILES = COPYING.txt
+
+$(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
