Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A92C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 20:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 928524152D;
	Tue, 21 Dec 2021 20:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lJ9lXHlv5kC; Tue, 21 Dec 2021 20:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0D941521;
	Tue, 21 Dec 2021 20:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 089531BF398
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0572860F32
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkfDoJPgIVFg for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 20:45:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED44760F2B
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 20:45:25 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.87.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7E6C519F594;
 Tue, 21 Dec 2021 21:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640119522;
 bh=81Wky0TJhipeyGXthP1MyoWtWQ2pd3XE8HY8zzrpwzI=;
 h=From:To:Cc:Subject:Date:From;
 b=NvbdarxP073z33DhuYEIxOAeV1UCovbMNXF9c3wjrRh/VkGUV5+PHlSU1J9OXYQEM
 118Ouj8CqCad3FdrnsfmvylIqnJWToX4kLsiMKBrynCgwH+wdqhafzPy1sm/Zh3wEV
 UyeQ4cIcDiQEd+3kbrWIZcx//V5726OH8IymPL5m/8jrvAy7CVxBZVek6ZWM85j80S
 RsLbz3iX7Oeavh3cNPxomM6myAHU7wEA2FT1nZxtALNrh3SP+EMlfCrswImcYLh+8k
 mwrEeF97oYDcHG5npv8rJhWpL19R2dJ49zYS6xu8hJyqgfWhOFZTZcghXQJEonLQr+
 JHvXgW+L/jWsQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 21:45:05 +0100
Message-Id: <20211221204505.207107-1-ju.o@free.fr>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version 1.2.6
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

For change log since 1.1.6, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.6

Also update spaces in hash file (using 2 spaces)

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyalsa/python-pyalsa.hash | 2 +-
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index c484313b96..655150a649 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2771291a5d2cf700f0abbe6629ea37468d1463a01b2330d84ef976e1e918676c  pyalsa-1.1.6.tar.bz2
+sha256  327b29bad57b049571e3d1f63281fdd21df27447cb5e2eadf46b737fbcff6e69  pyalsa-1.2.6.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 74f0347d86..10d5293c2c 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.1.6
+PYTHON_PYALSA_VERSION = 1.2.6
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = ftp://ftp.alsa-project.org/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = distutils
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
