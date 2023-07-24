Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FBBEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6746F4023B;
	Mon, 24 Jul 2023 19:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6746F4023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNh5BpPHt0I2; Mon, 24 Jul 2023 19:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4285D401C9;
	Mon, 24 Jul 2023 19:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4285D401C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE3781BF3C3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C531B4016B
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 19:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C531B4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4iaetuZt5Ia for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 19:38:07 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 812E54011B
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 19:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 812E54011B
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D734513F8C4;
 Mon, 24 Jul 2023 21:38:00 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 21:37:53 +0200
Message-ID: <20230724193753.8490-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690227484;
 bh=TPRw8Pb0rXXRAO870VeKHukmp5JY+K3YWpK1QBDFG94=;
 h=From:To:Cc:Subject:Date:From;
 b=ZjuEE3Yo5dR0X4XYzZPIMcZGV25nSyyKX4GLtlPtVStvo9o20onygiPm1Wfzp8gvd
 055LWo5oCpfpvwwyaOxgyJBaHAgOohmbHk8qUtzS5byu9XqbZbOzykP45kzUJuKTPC
 yYZp57iUf5eKcDLffvjuMn6KNrIHCk8eI9LJZwpl0u9Y9vsQJUWzZh33jBJtetXqFG
 3pJXl8l0hC6eKmKKE+23sbYXeeDca0PKfCCKS1yp7UF1yoX7oxBZH1CIkVP6Eg6ke3
 8k3mRoEI8KBPNGT5k7T5wnYkBXfPxAkyWoWxgErCLcr+vgsInysyllAXfQ4ZtYixp2
 PhQ5i1DQWNwLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZjuEE3Yo
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.5.1
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

For change log, see:
https://github.com/vsajip/python-gnupg/releases/tag/0.5.1

This commit also adds a comment about the archive being checked with the
PGP signature published by the package author.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on master branch at commit f359791 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_gnupg
    ...
    OK
---
 package/python-gnupg/python-gnupg.hash | 7 +++++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 7886ff7dae..d52b634b8d 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  19cc1aef3a612b7b5f13e388260e65d4  python-gnupg-0.5.0.tar.gz
-sha256  70758e387fc0e0c4badbcb394f61acbe68b34970a8fed7e0f7c89469fe17912a  python-gnupg-0.5.0.tar.gz
+# also checked PGP signature from:
+# https://bitbucket.org/vinay.sajip/python-gnupg/downloads/python-gnupg-0.5.1.tar.gz.asc
+# with key: 9147B477339A9B86
+md5  c5d99c5f0456f8cbf69324ec5e6acaff  python-gnupg-0.5.1.tar.gz
+sha256  5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8  python-gnupg-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index b51ac61892..f582f4cdb7 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.0
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/e3/5c/5ff9877001616912a74f4377cd5f80925b31a678087800beae5b28bdb80e
+PYTHON_GNUPG_VERSION = 0.5.1
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/62/7737485f44bd4d7d904f4094372f4119195865b29f119fa51a98e121a13a
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
