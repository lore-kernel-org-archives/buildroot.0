Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980E2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 11:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3605182B1A;
	Sat, 27 Nov 2021 11:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0757a0VBYqR; Sat, 27 Nov 2021 11:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642A48299D;
	Sat, 27 Nov 2021 11:37:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 564191BF30D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45E996062D
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 11:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYzqqpbL6GVM for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 11:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D57360598
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 11:37:44 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z18so14682930iof.5
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 03:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y3RgqN9PGME6h5Q0FMRRFo2hSuUS3vKdkgNIN0Vxk4I=;
 b=Y2yzoBEIxEXsZZBlYsS9ZWowhH2A8pJqYc1TobrHKXWpxv1sI4quYnF1Vp0QK19sje
 qb6QsJ7DI06aMTGKWT9eb2Kx5I2VaI2CMSPDYyDQcQ2GG19KyDVx1e5auDrmGil7jxUV
 JgkjadxI0QDQ4eoAG2orBMg4Nu1OSmxAS6m8FIuuGWeTd/N21CtSjhdh06waS5UfAIb9
 M8mLrfVan/H0/MKFz3GEKlhzj+fKK/ExZmyf1BBQ1ci1Bx8nMhR5qRXnuxam+NtnvrGo
 kCUF+hXpOTnvhQCaeMKWH3KIFxuVsjfgnLyKPUmWBvPVP7oIOEXUjSqj4Ry+3WbMcFoF
 u/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3RgqN9PGME6h5Q0FMRRFo2hSuUS3vKdkgNIN0Vxk4I=;
 b=zMSCUs4/V+Iz5Llet8WIh8wmtpelPz0m6+Vvnq3INxADjXDysnDQaNHxppoWJiCeSa
 i75hUkuA4cxq6sSHacXh2H5pIFwa20Z6++GgxL+voX0RmMvN8q+3iRsNcZJ71PeC3k0X
 KqIGSWTL2q26vZCw2fMWhdjXjQT2pJJTv7Si7h1ZgU8Z3gBm/SmjO9M1c8nqG2aHr1ko
 GTkjk4FkBR/SCaS/Nf9WfEcp6tWrFYO6Kl+OZiQuQ/yvwR3joYdP5boLRQifcz+xnKnm
 EuPMxCXilFxV4Pg6GFsiB3bHbkg0jQ5etl3pf6All+1OWlt0gLmGsbRhfRTxvxRZTSQ3
 ouZA==
X-Gm-Message-State: AOAM533N9U63KN8PTTzxJhhmAtNRJ33thHT8V9wq4LJOropi0oFI9vc/
 QlYxKa5UBAi+Oqi9R/OWQlpqNxAy7zI=
X-Google-Smtp-Source: ABdhPJwxwboW8zcrW0bA2TwsvRaYKEVq9oJtMw+XYZcWWeARyLpidQ1cb0E8K60c48OiRbfcAbdXgA==
X-Received: by 2002:a05:6638:41a4:: with SMTP id
 az36mr53135162jab.135.1638013063293; 
 Sat, 27 Nov 2021 03:37:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id g4sm6389435ila.78.2021.11.27.03.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 03:37:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 04:37:30 -0700
Message-Id: <20211127113735.2178776-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127113735.2178776-1-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/7] package/python-cssselect2: new package
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
 package/Config.in                                |  1 +
 package/python-cssselect2/Config.in              |  9 +++++++++
 package/python-cssselect2/python-cssselect2.hash |  5 +++++
 package/python-cssselect2/python-cssselect2.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-cssselect2/Config.in
 create mode 100644 package/python-cssselect2/python-cssselect2.hash
 create mode 100644 package/python-cssselect2/python-cssselect2.mk

diff --git a/package/Config.in b/package/Config.in
index 8efcecc90f..e5b161c86c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -970,6 +970,7 @@ menu "External python modules"
 	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
+	source "package/python-cssselect2/Config.in"
 	source "package/python-cssutils/Config.in"
 	source "package/python-cycler/Config.in"
 	source "package/python-daemon/Config.in"
diff --git a/package/python-cssselect2/Config.in b/package/python-cssselect2/Config.in
new file mode 100644
index 0000000000..0196471253
--- /dev/null
+++ b/package/python-cssselect2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_CSSSELECT2
+	bool "python-cssselect2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  CSS selectors for Python ElementTree.
+
+	  https://doc.courtbouillon.org/cssselect2/
diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
new file mode 100644
index 0000000000..ed5b863302
--- /dev/null
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cssselect2/json
+md5  6dfd5963c8a5d85f2634d1650b1ddfe1  cssselect2-0.4.1.tar.gz
+sha256  93fbb9af860e95dd40bf18c3b2b6ed99189a07c0f29ba76f9c5be71344664ec8  cssselect2-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
new file mode 100644
index 0000000000..18e0fba839
--- /dev/null
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cssselect2
+#
+################################################################################
+
+PYTHON_CSSSELECT2_VERSION = 0.4.1
+PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ad/3d/fb764303deb34cbc1a32fcecdfd239367cb16323920c88390b2f5ad751f0
+PYTHON_CSSSELECT2_SETUP_TYPE = distutils
+PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
+PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
