Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15908C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 16:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 839DE60BE0;
	Mon,  6 Jun 2022 16:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWv3pBZgJyVE; Mon,  6 Jun 2022 16:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C8F60BAC;
	Mon,  6 Jun 2022 16:25:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4886B1BF303
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3768660BAC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 16:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ra7UxIaTI52 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 16:25:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C12D60AA4
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 16:25:51 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.45.147])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D0D8B19F59E;
 Mon,  6 Jun 2022 18:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654532747;
 bh=DoLDP28XgUVnaMw9450MULoVrgrUPPvHO8grRslFJPc=;
 h=From:To:Cc:Subject:Date:From;
 b=D2u70MEY4Zv0o7XDuLNyI6gjH5gvYSZY7UNkeeQc/pFLOPngcEii/9SB2ZkIKxd9k
 Y25cCR76tsPIIJ8GCtYE3qs7X1WoCM93XtnHiA/VPSKCAer6zDMA/5o+eCfrLp87LV
 Eqxa0pNIwrVRhBa/sKRsJ3btHUdKJnIYHnhQKRdbjL2Ntu1lFPvyJ4tvPD4Kijj+Jn
 cr72j3u935LRvvQ7zPU3VIRhIZXmoPGcpabQ7hNhCppBBpT4xwGm4VN6lp+Y7gpcXb
 xo8dk8ZgFBoEfJD3rQsvzm1M8gSOD7WzqdhfpdiOIV7pUGh+qeuj6KwAb0eNPf4K8i
 uHzB7IIxfK0NA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:25:38 +0200
Message-Id: <20220606162538.14868-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version 1.2.7
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.2.6, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.7

This commit also changes the download protocol from FTP to HTTPS,
following the upstream project download page. See:
- https://www.alsa-project.org/wiki/Download
- https://www.alsa-project.org/main/index.php?title=Download&diff=7455&oldid=7386

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    make check-package
    ...
    0 warnings generated

    make qemu_aarch64_virt_defconfig
    ./utils/config \
      -e BR2_TOOLCHAIN_BUILDROOT_WCHAR \
      -e BR2_PACKAGE_PYTHON3 \
      -e BR2_PACKAGE_PYTHON_PYALSA
    make olddefconfig
    make
---
 package/python-pyalsa/python-pyalsa.hash | 2 +-
 package/python-pyalsa/python-pyalsa.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index 655150a649..d4cfe0d61f 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  327b29bad57b049571e3d1f63281fdd21df27447cb5e2eadf46b737fbcff6e69  pyalsa-1.2.6.tar.bz2
+sha256  67d8f99f1ccf23e7ebdfa2c3be0b09f147949fd9511d1e6748b7f412ef046e1f  pyalsa-1.2.7.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 10d5293c2c..cc5e2ec9a0 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.6
+PYTHON_PYALSA_VERSION = 1.2.7
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
-PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
+PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = distutils
 PYTHON_PYALSA_LICENSE = LGPL-2.1+
 PYTHON_PYALSA_DEPENDENCIES = alsa-lib
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
