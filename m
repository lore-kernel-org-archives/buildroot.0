Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E12BFA373F
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AC04033A;
	Mon, 24 Oct 2022 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AC04033A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goORPklQhgeg; Mon, 24 Oct 2022 19:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D5A40332;
	Mon, 24 Oct 2022 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D5A40332
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF6C1BF334
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8850880CEA
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8850880CEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-FGenhFulus for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 19:54:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0428680CC8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0428680CC8
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 19:54:50 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.179.36])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 17EE02003DC;
 Mon, 24 Oct 2022 21:54:43 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 21:54:36 +0200
Message-Id: <20221024195436.409490-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666641287;
 bh=m1jPwe99ZLPrE+jJAGVt8thhM8LDutjHXAeYMPTYJYw=;
 h=From:To:Cc:Subject:Date:From;
 b=LQbYkfQSTblj5vyd4bcVJMw918SbmU4YAzCPp7AYxqJNLV5KVVsUzO/jV+xZEyJ5J
 TanEVqBlmrz8ckvamRbjp4SkKPv1gS6huUWBy/2IXytFgpl+S2eWKSXHtuQDHeFhz5
 SwVo9yCrOXvVk0jX+UCTViD7f3EB6petVqXFqrue90SR+vend50IEhDq6C4dE5yZJL
 CKyp9VmF0HV2NW4cMXJ5BXEFynoKMSXItGoj9avMqgQ/b5NP3RpynA5CPuMvz2mEdJ
 SUktqRF49yAgrdvIOSbvhmAZ2V03NQBX+Db4BJTHhqxd9QCAHB+Mxg5CTjiabwx8BI
 iaCxW59q0bAPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LQbYkfQS
Subject: [Buildroot] [PATCH 1/1] package/python-distro: bump to version 1.8.0
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

Also adds md5 file hash published on:
https://pypi.org/pypi/distro/json

For change log since 1.7.0, see:
https://github.com/python-distro/distro/releases/tag/v1.8.0

Most notable change is the upstream support for Buildroot
(included in python module docs and tests).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on commit bd6e792 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
       -d dl \
       -o output_folder \
       tests.package.test_python_distro.TestPythonPy3Distro
    ...
    OK
---
 package/python-distro/python-distro.hash | 4 +++-
 package/python-distro/python-distro.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
index 8f09197156..3d3e4258de 100644
--- a/package/python-distro/python-distro.hash
+++ b/package/python-distro/python-distro.hash
@@ -1,3 +1,5 @@
+# From https://pypi.org/pypi/distro/json
+md5  a1e81972bbcfc0dc77dd0cde590c22a6  distro-1.8.0.tar.gz
+sha256  02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8  distro-1.8.0.tar.gz
 # Locally computed
-sha256  151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39  distro-1.7.0.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
index c69849b7ac..e079d8e265 100644
--- a/package/python-distro/python-distro.mk
+++ b/package/python-distro/python-distro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DISTRO_VERSION = 1.7.0
-PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/b5/7e/ddfbd640ac9a82e60718558a3de7d5988a7d4648385cf00318f60a8b073a
+PYTHON_DISTRO_VERSION = 1.8.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/4b/89/eaa3a3587ebf8bed93e45aa79be8c2af77d50790d15b53f6dfc85b57f398
 PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
 PYTHON_DISTRO_LICENSE = Apache-2.0
 PYTHON_DISTRO_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
