Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710E6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD2740157;
	Sat, 27 Nov 2021 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LJMd72iuZwk; Sat, 27 Nov 2021 11:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B47F4013D;
	Sat, 27 Nov 2021 11:38:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6220E1BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F91E40415
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aplk5pj5InBw for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79B604039E
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:45 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id a11so11423896ilj.6
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zTe2p8XgXpS9yny1Ywef2WTzNY75RquOD+a0v/FITrU=;
 b=HDYGyyLPov7USALl/4fcUUPH8EFwZyVhQp+sa9KmObIg6Cn0iB4JZtY9lxONel8MY4
 /mfUMZpj+IClmcn1YY7ioOA2M44H3k+3PcSL+1ZHOg2mjN0y/yKzDihzv2y2OkT+9c1S
 yxSvSlGUEYwu7gnPiXGADRVP/gdNNnRAzer0evqSaoG0Jwm51NaMRziZvsDQ8AB59CcC
 CSEjT+L0kL0jUGZSb9ew/8zTSkxQsJ9dSsfK+e75qP2mQwtLELn+tzIS2HQqgRw8hXgb
 Zvm456cbiBJ9EAXZI+1Zw73i7cnfAqgRHdlDSP6lYEKvNmCMWbHREIJ3Vn1tIHE+mYuZ
 dfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zTe2p8XgXpS9yny1Ywef2WTzNY75RquOD+a0v/FITrU=;
 b=Ltag1j2pooYxWncGN/7TdjHMc2RoxVKDzVNf3mFkR3j4GmzOAcqTLj5XqDcTrxgctO
 9yJXfURdlo4A/API7Ngn7KnN+My0K+t29ZS8YblA/KVixZhHtVU3sS+Whbmj0/NaNopn
 VfIqESvHW15BxaHJwSr0+J26ybeWjHG2+B9xoc3IH+R7lUn1ZvkywpR5wcIHDAvZDuj1
 i8/RSvC5SFI+ULL//KZCmp1nlgqsDBi3xKaXGhsFPGFBH8bKQGgORCTFUL1SXu9h+wfo
 unqlIhsv27jFVNgIb1fo3Q6mslGL9bF9HOpwi4rrIaakaHYQ/NysTjyI4WZCHbcmswGo
 4CLA==
X-Gm-Message-State: AOAM530n7UxvWQIwm5vbco3B25clVieqUg73/2XaVQ+SXKkr/GmO9nJI
 wS7g3mhroa2AQtY6gyLIH0+5dNyvRxs=
X-Google-Smtp-Source: ABdhPJzwOspWTay76+JrHEygr1SwhTQETFwKB1sVQJXO3w1uT33eJgoWXVxYW4mfoOVA7pZwCF4iUg==
X-Received: by 2002:a92:d2cc:: with SMTP id w12mr38485010ilg.111.1638013064439; 
 Sat, 27 Nov 2021 03:37:44 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:31 -0700
Message-Id: <20211127113735.2178776-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/7] package/python-pyphen: bump to version
 0.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-pyphen/Config.in          |  7 +++++++
 package/python-pyphen/python-pyphen.hash |  5 +++++
 package/python-pyphen/python-pyphen.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pyphen/Config.in
 create mode 100644 package/python-pyphen/python-pyphen.hash
 create mode 100644 package/python-pyphen/python-pyphen.mk

diff --git a/package/Config.in b/package/Config.in
index e5b161c86c..2bb4a0b4f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1161,6 +1161,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
+	source "package/python-pyphen/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pyphen/Config.in b/package/python-pyphen/Config.in
new file mode 100644
index 0000000000..30ccafcda4
--- /dev/null
+++ b/package/python-pyphen/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYPHEN
+	bool "python-pyphen"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Pure Python module to hyphenate text.
+
+	  https://www.courtbouillon.org/pyphen
diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
new file mode 100644
index 0000000000..3e87fbf032
--- /dev/null
+++ b/package/python-pyphen/python-pyphen.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/Pyphen/json
+md5  f8ec095e4fe30dc2b518a918788b33ed  pyphen-0.11.0.tar.gz
+sha256  e2c3ed82c3a04317df5102addafe89652b0876bc6c6265f5dd4c3efaf02315e8  pyphen-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
new file mode 100644
index 0000000000..8124f66f73
--- /dev/null
+++ b/package/python-pyphen/python-pyphen.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyphen
+#
+################################################################################
+
+PYTHON_PYPHEN_VERSION = 0.11.0
+PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/f8/af869a4983c1b3159945479510260985714265d48baf27d61f72b1ec8cbf
+PYTHON_PYPHEN_SETUP_TYPE = distutils
+PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
+PYTHON_PYPHEN_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
