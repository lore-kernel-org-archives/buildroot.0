Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D359BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355316077A;
	Sun,  5 Dec 2021 00:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WdntckALub0P; Sun,  5 Dec 2021 00:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B0460749;
	Sun,  5 Dec 2021 00:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3B7D1BF95D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B818B401E4
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDYgfbxf1imf for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:12:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87AFD400E9
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:12:01 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k21so8549133ioh.4
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+BP29zWN1QNuJ4z8TXUDCQOZsjgDbiwarxBTsutDl0Y=;
 b=ZtZ9DAuRDMc0NYJ+quDGcekdtMOM7SHYxfZ4FTYB4spmDrITIADy8O+ZoPfm8hst48
 xQLKxmfZTPYIYKv5Q9QNB2iljij1qTfHW85vJ/bm+Anat/jIa1xMR6sdCAHm4MswNWl1
 Nt3EivqI3QE2gTkfJoXgmdaYTBtJE0sDpd/Wk91qHOJ4IZ6Epmf49/9CYfMn6D5Cgmgt
 dtwBTXenQi5w+DXzPEkpo+9UnKdJk7JbJxXYjyAAvXzrV5ZxqLo6g8hlHOikRLj0C0Po
 50EYUFWVXquM62FhlGJm+9Fp34VbF8h2pCaW2gUg5uqnlCxeXOaLVCHpPZYOaKXv+poE
 7VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+BP29zWN1QNuJ4z8TXUDCQOZsjgDbiwarxBTsutDl0Y=;
 b=Ulxstljn3sEl3Y9nyg6zvRvUbbyMkdBImhSKbu+qzypJo0LLoi7gsVc8wMkEfsKFj/
 WWUZwr2f1G863U+fVZFms2Ah/i+qOaRUwHQciBvy5C/yTAM2Fk3YpEph89tjyngb5wWe
 7qA7bKkk2TWZ7mZ4DVeyeWE/3x2ZiO07RkAjP8I+heBPArVIFa6p2ztk2cqLaChv5jk4
 MrS/Py9/SsM4NKPI0vz8lTWUkgj+NjiCylZO2UY/xQykG877LzmD9bG+A2A2yBPPrFSf
 pAXyxIb8TiOUkIjSSUS98TTdzuwk6Mm57wTxly+crUf15qu6YJW3Si2RPvzr355Mc8yq
 51zw==
X-Gm-Message-State: AOAM533VNK+kN7mJK66atMmn1vCODJgI5PGvDx/qM6rGaAGs3qa7IA9y
 YXEICGAl3hV24EgL3dkW1wsg57m2zq8=
X-Google-Smtp-Source: ABdhPJyBuapCUvyWsAPHIJ3gIY/NSF19/I+B5vWxQkrbHXFt9CfiD/247xSM0DgbdT4HBeFJv7PLzg==
X-Received: by 2002:a05:6638:150d:: with SMTP id
 b13mr31849044jat.101.1638663120370; 
 Sat, 04 Dec 2021 16:12:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id b8sm4333309ilj.0.2021.12.04.16.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:12:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:11:53 -0700
Message-Id: <20211205001156.2402104-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/python-tomli: new package
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
index 006d3cf284..2089fc4ea6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1248,6 +1248,7 @@ menu "External python modules"
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
