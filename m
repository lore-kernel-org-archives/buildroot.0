Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7129DC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124F34086E;
	Mon, 14 Nov 2022 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124F34086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXhtkhlNjdrH; Mon, 14 Nov 2022 22:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9E64085D;
	Mon, 14 Nov 2022 22:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9E64085D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35D991BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE044085D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE044085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kax61BzVW-aE for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:17:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5765401FC
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5765401FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0D0D83B7B; Mon, 14 Nov 2022 22:17:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:16:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 96b9a589ea43fdf895930471d9031e52fc16eb7b
X-Git-Newrev: 12c430f880f9255529d8c53cdb59f4178d2cd8f4
X-Patchwork-Hint: ignore
Message-Id: <20221114221739.C0D0D83B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-automat: bump
 to version 22.10.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12c430f880f9255529d8c53cdb59f4178d2cd8f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Remove-uneeded-dependency-to-wheel.patch  | 28 ++++++++++++++++++++++
 package/python-automat/python-automat.hash         |  4 ++--
 package/python-automat/python-automat.mk           |  4 ++--
 3 files changed, 32 insertions(+), 4 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
