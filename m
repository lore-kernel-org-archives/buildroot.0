Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4436C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6007080B78;
	Mon, 14 Nov 2022 21:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6007080B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1P-45RfDVMWp; Mon, 14 Nov 2022 21:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8076B80B82;
	Mon, 14 Nov 2022 21:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8076B80B82
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09E461BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9287400D0
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9287400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSdeQNNWEGcj for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:53:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16DCF40012
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16DCF40012
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:53:32 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.249.66])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 342595FF9E;
 Mon, 14 Nov 2022 22:53:26 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 22:53:14 +0100
Message-Id: <20221114215314.485513-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668462809;
 bh=obpD2XPJ+9ay1vjLHB2Qgs6g28DG1FsKE2Pv9OhV68w=;
 h=From:To:Cc:Subject:Date:From;
 b=aBXaJmuyXaucb1zgpJuAou7Zq+phhCacoqqDS8mh5dJfliW5iSjNbdhQ81UDdlM7Y
 geWud6c2bqe3Rgf5NrBEUlQ9S1o+8ixfvLcHhU5MqvfDtOadm8MYJjwDyWArAnofAS
 KhO0Go0lMV2V0yvTIXWjLzR1xZn293SuGPjADvBGJTfhCfgQc2iEPCHa9plU2gbP5w
 OH8pWEsWu59G5aWsdDdC6eGAQTjAK2oRcweqvSrIoLNYXmKKDkuW+dOhoXwPdvRtUm
 qRv4e0ehxhAuvb8z7Q6chICoQUMVzkBtYCoTkw+iJYMxpQe3kOZZqgHkhQ08PaTh/w
 l/uyVb/ySwfPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aBXaJmuy
Subject: [Buildroot] [PATCH next 1/1] package/python-automat: bump to
 version 22.10.0
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

Current python-automat version 20.2.0 no longer work with Python 3.11
updated in commit 738500c296.

Running package runtime test with command:

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_python_automat.TestPythonPy3Automat

Fails with output:

    Traceback (most recent call last):
      File "/root/sample_python_automat.py", line 27, in <module>
        led.turn_on()
        ^^^^^^^^^^^
      File "/usr/lib/python3.11/site-packages/automat/_methodical.py", line 232, in __get__
      File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 43, in decorator
      File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 35, in copyfunction
      File "/usr/lib/python3.11/site-packages/automat/_introspection.py", line 23, in copycode
    TypeError: code() argument 13 must be str, not int

This commit fixes this issue by updating the package to the latest
version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on next branch at commit d31447b with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_python_automat.TestPythonPy3Automat
    ...
    OK
---
 ...1-Remove-uneeded-dependency-to-wheel.patch | 28 +++++++++++++++++++
 package/python-automat/python-automat.hash    |  4 +--
 package/python-automat/python-automat.mk      |  4 +--
 3 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch

diff --git a/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch b/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
new file mode 100644
index 0000000000..2be7ec6cda
--- /dev/null
+++ b/package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch
@@ -0,0 +1,28 @@
+From d04d51d62a23370869ad466fa95b7d4ec2e0fa6e Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 14 Nov 2022 22:30:33 +0100
+Subject: [PATCH] Remove uneeded dependency to "wheel"
+
+Attempting to build Automat in Buildroot fails while trying
+to check for this undeeded dependency.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c2f9816..afa8012 100644
+--- a/setup.py
++++ b/setup.py
+@@ -15,7 +15,6 @@ setup(
+     packages=find_packages(exclude=[]),
+     package_dir={'automat': 'automat'},
+     setup_requires=[
+-        'wheel',
+         'setuptools-scm',
+     ],
+     install_requires=[
+-- 
+2.38.1
+
diff --git a/package/python-automat/python-automat.hash b/package/python-automat/python-automat.hash
index 33a64abedf..cfb16ac664 100644
--- a/package/python-automat/python-automat.hash
+++ b/package/python-automat/python-automat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/automat/json
-md5  d6cef9886b037b8857bfbc686f3ae30a  Automat-20.2.0.tar.gz
-sha256  7979803c74610e11ef0c0d68a2942b152df52da55336e0c9d58daf1831cbdf33  Automat-20.2.0.tar.gz
+md5  b8064994239aabb172748f984489ce75  Automat-22.10.0.tar.gz
+sha256  e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e  Automat-22.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  LICENSE
diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index b94fd2e1c4..675fbd2260 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOMAT_VERSION = 20.2.0
+PYTHON_AUTOMAT_VERSION = 22.10.0
 PYTHON_AUTOMAT_SOURCE = Automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
-PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f4ef745cc5c2f0713c8eddcd07153b4bee7f72a8dc9f9384b
+PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/7a/7b/9c3d26d8a0416eefbc0428f168241b32657ca260fb7ef507596ff5c2f6c4
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
