Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08BBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42008316A;
	Mon,  6 Dec 2021 12:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSm1hsA-GiJ7; Mon,  6 Dec 2021 12:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF6B83260;
	Mon,  6 Dec 2021 12:04:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 438261BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB1760C0A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fe4ADQR19iGW for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57BF560B75
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id j7so9871308ilk.13
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=LeoFuqKrYdUDAVZnJUGeCP1Bg3sQ9aPEukjTs90HUWUCSEY5hsv4Nj7mFD/nxggH2I
 z88d59DkK1LN5YYpwv5PX8AdSPdjBPr/ACvfh/fd4KiP6Z0QX7xLTSca7mjBmXqV5CSg
 h+lUL/BURmzLiLLYqh5Sfy38RePBPEGxf7dK3t1HpVrEHYVTOYzP8ezG/aqKrFTCS9Nu
 dqT5iKoEs4k3uTQs14T24gb1Uf66gJOY6CEJdeHbdPL0NS7z0GH0HKxPjhglej4F42Xm
 6eMkgj0gcqYlGFoDLU1w00P0P/bW4X218X/yUKec9jpNCKz+Ku6GY//LH10GvCrcqA9r
 iO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=NKsjUf4fjmlSgIJ5Ij9AHpxu751Y4IZYMZg44gguiL4MjtSa6X9OwJnkvEDAIel3UD
 qx7zK14DnyT7OX73Fad/FriuAXeCDkdMGS64FFkjB7hx7wJjHyxmqQAbYNNc13irVrZP
 qSj0oMiVWdufvnQPKD2TSMkmZZ9dWsH8vcpNdCnIW09TPVW5H5kVKJPCIxkuGEeEmSm5
 6KwVILfuAglAKoG/HgpymMjVQOZndxrf8IYiIHJ+r2hdz+JmTqrohpWf4Wozv6NEeiJu
 yVAQNNmdEPoeDIqKa/6C0Vi4mNTNYnfD6sRNs67liZLKnga+m72+ljULOf3RrCM4tL1G
 zXUw==
X-Gm-Message-State: AOAM5310lxudt91AHxQWwRCkDhlqeI1jcs8yGRZCEFvoy3l6fq2Zak/M
 Lnpw6SVkXJ4F7Ps4IN4+gkd7xFbUuZs=
X-Google-Smtp-Source: ABdhPJw0sNF+QSAcNsA1L3wPowx+Dmf2HHHXjEi5DVYvR0wm+UCd3zc+6Xq8kw97JEXLw0agOaufkQ==
X-Received: by 2002:a05:6e02:16ca:: with SMTP id
 10mr29582237ilx.274.1638792220320; 
 Mon, 06 Dec 2021 04:03:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:24 -0700
Message-Id: <20211206120325.3120351-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206120325.3120351-1-james.hilliard1@gmail.com>
References: <20211206120325.3120351-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/python-pypa-build: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Due to a namespace clash with python-build we need to use a different
package name.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pypa-build/python-pypa-build.hash  |  5 +++++
 .../python-pypa-build/python-pypa-build.mk    | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/python-pypa-build/python-pypa-build.hash
 create mode 100644 package/python-pypa-build/python-pypa-build.mk

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
new file mode 100644
index 0000000000..c7daedc6b3
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/build/json
+md5  ec3dbe55359ee735b45766b30dfad877  build-0.7.0.tar.gz
+sha256  1aaadcd69338252ade4f7ec1265e1a19184bf916d84c9b7df095f423948cb89f  build-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
new file mode 100644
index 0000000000..6babade672
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pypa-build
+#
+################################################################################
+
+PYTHON_PYPA_BUILD_VERSION = 0.7.0
+PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/f0/62/c73b775216bb1f34962beaf005f38460c6161177fef6e068a7a0c30a1597
+PYTHON_PYPA_BUILD_LICENSE = MIT
+PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
+PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPA_BUILD_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-pep517 \
+	host-python-tomli
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
