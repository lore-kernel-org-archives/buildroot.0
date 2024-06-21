Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD13C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7B482092;
	Fri, 21 Jun 2024 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1gT_5Omrd10; Fri, 21 Jun 2024 21:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B2FD820B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2FD820B0;
	Fri, 21 Jun 2024 21:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27D4E1BF834
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1112E4090C
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 21:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZVm20zzDXa7 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 21:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B415540693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B415540693
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B415540693
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 21:09:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 009C6B0053E;
 Fri, 21 Jun 2024 23:09:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 23:09:04 +0200
Message-ID: <20240621210904.319172-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719004162;
 bh=PdEftHefDN7mYOorI4y5amvO+8+yRGAScn3vZpaulPI=;
 h=From:To:Cc:Subject:Date:From;
 b=HB+deTvtjH/flyXWpw9cXYkkoYtj6kEveH0+GRkUZ9N63v7aER56RH8U86txP5yVg
 1khJvvJ+TyHeqkg3ToPrEXBe8jPGJ0p/i88hQyRXZYp9Zi1Otw5viC2a0uV6+IlS7w
 9w2CxWCD3CZTaMU2f8wmfTcPPYWtL5npbEyjkVN0I0REaS2M6Mx8CE6Pww0eEfiumg
 bPNMPCFCCftQEZS8jRSUXWNMuhn8ye/pbfvWcf8+yZDNor+G0jfX7VfXgKgjKL7ZjU
 O1HqTiaG1uOYCfym59pXd5RtqLlK0VHYrgy1EWNVTxXihQfRJ6b6Mf8AONOXdOruv+
 LSoTJGrTyrULw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HB+deTvt
Subject: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version
 1.2.12
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.2.7, see:
- https://github.com/alsa-project/alsa-python/releases/tag/v1.2.12

This commit also adds a comment about the pgp signature check in the
hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 4ae18c5 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_pyalsa
    ...
    OK
---
 package/python-pyalsa/python-pyalsa.hash | 6 ++++--
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index d4cfe0d61f8..206107d29ad 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,2 +1,4 @@
-# Locally computed
-sha256  67d8f99f1ccf23e7ebdfa2c3be0b09f147949fd9511d1e6748b7f412ef046e1f  pyalsa-1.2.7.tar.bz2
+# Locally computed, after checking pgp signature from:
+# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.12.tar.bz2.sig
+# with key F04DF50737AC1A884C4B3D718380596DA6E59C91
+sha256  8abeaf41e5f48f617a52d1078932da89ab303d4a1d8f9919f947bdb1b7d03f50  pyalsa-1.2.12.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 1661fe47b49..19d2c91d237 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.7
+PYTHON_PYALSA_VERSION = 1.2.12
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = setuptools
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
