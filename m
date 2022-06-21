Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65A9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 21:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54D6F8402E;
	Tue, 21 Jun 2022 21:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D6F8402E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcFp9ZIbyKbO; Tue, 21 Jun 2022 21:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C7A83FF1;
	Tue, 21 Jun 2022 21:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C7A83FF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8301BF2F3
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C2094059C
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 21:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C2094059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kEhbDerHw9O for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 21:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E63C74023B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E63C74023B
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 21:05:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.28.156])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EC85513F85F;
 Tue, 21 Jun 2022 23:05:38 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 23:05:29 +0200
Message-Id: <20220621210529.251477-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1655845542;
 bh=0TEpSUMP0VnqRds9wWQiQ6UxjlUqZM7MKAR9aR33P3M=;
 h=From:To:Cc:Subject:Date:From;
 b=siTRE+mWlqLhUzpsit6c6HQkngW29sE7IaxyCfjS1Xe9E69mEB+ZNKvHVRa54nv8g
 0rIkKytISjTXdcj5vzKpnPBJCLQ95UJyxsFdADAwLb/M4/ZDXU7IHnqHn9HVNLaGRF
 GXFnB48dYibPMEUBeDs9AYgg57bXYZEL2sp7QoGDALwbULO9uElWMBoOPl0CqSjvRw
 /IaOs5BR/rd85myhfo0hA/TcxbZMUDQfc5aRoZQ5NlnJfSlfrJfZMEhSGq/LayrWIW
 Yb3+nd4nt619VSrw4jhQWDF3Ndjv0o8NfobiWdIQa1oKmSXgLA3uP6qATq5RjiRpHX
 HsPMscRJ4tjjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=siTRE+mW
Subject: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version 0.4.9
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
https://github.com/vsajip/python-gnupg/blob/0.4.9/README.rst#049

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_gnupg.TestPythonPy3GnuPG
    ...
    OK
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index fa0e8ae6e5..71deeedcee 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  02c5d77b8db9dfba0741627560d89bd5  python-gnupg-0.4.8.tar.gz
-sha256  b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7  python-gnupg-0.4.8.tar.gz
+md5  e27cd8c6ce3b5c9197e931b65bbb4c9a  python-gnupg-0.4.9.tar.gz
+sha256  aaa748795572591aaf127b4ac8985684f3673ff82b39f370c836b006e68fc537  python-gnupg-0.4.9.tar.gz
 # Locally computed sha256 checksums
 sha256  9620da3d3afdfca7dea53c4375c1507ab2d3a4af4e706827023acb49a9ec4a5e  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index fda264a0ed..582a649f9a 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.4.8
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
+PYTHON_GNUPG_VERSION = 0.4.9
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/c8/cb/46fb80639cf0dd4251aeb075a1a5e2ebbb8c9656f28ddfe9d8c99b68b6da
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
