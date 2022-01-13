Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581AFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE866FC73;
	Thu, 13 Jan 2022 19:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Htc4yO-TItX; Thu, 13 Jan 2022 19:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5BF6FC6E;
	Thu, 13 Jan 2022 19:44:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0B41BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7B24011F
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JAZ9syQmEfx0 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6F08400E4
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B02538356C; Thu, 13 Jan 2022 19:37:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:43:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23e4fbecb31678751812c54ce3006bab55bb3358
X-Git-Newrev: b4e3ef223f72f035f4bf84cba85f0d0b924bf937
X-Patchwork-Hint: ignore
Message-Id: <20220113193713.B02538356C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hpack: bump to version 4.0.0
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5108652661601124512=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5108652661601124512==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b4e3ef223f72f035f4bf84cba85f0d0b924bf937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (HISTORY.rst removed)
- Update site in Config.in
- python 2.7 has been dropped
- Update indentation in hash file (two spaces)

https://github.com/python-hyper/hpack/blob/v4.0.0/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rt-HISTORY.rst-from-UTF-8-format-to-ASCII.patch | 40 ----------------------
 package/python-hpack/Config.in                     |  3 +-
 package/python-hpack/python-hpack.hash             |  8 ++---
 package/python-hpack/python-hpack.mk               |  4 +--
 4 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch b/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch
deleted file mode 100644
index 015b8a24da..0000000000
--- a/package/python-hpack/0001-Convert-HISTORY.rst-from-UTF-8-format-to-ASCII.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3d195f4f599f37c89419f1db1302f94acb38c264 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 1 Aug 2017 10:15:33 +0200
-Subject: [PATCH] Convert HISTORY.rst from UTF-8 format to ASCII
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-UTF-8 formatted file breaks installations on some systems:
-
-Traceback (most recent call last):
-  File "setup.py", line 34, in <module>
-    long_description=open('README.rst').read() + '\n\n' + open('HISTORY.rst').read(),
-  File "/home/peko/autobuild/instance-1/output/target/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
-    return codecs.ascii_decode(input, self.errors)[0]
-UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 1125: ordinal not in range(128)
-
-To fix this error just replace '§' with 'S' meaning 'Section'.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- HISTORY.rst | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/HISTORY.rst b/HISTORY.rst
-index 37b2d9c..b9310f5 100644
---- a/HISTORY.rst
-+++ b/HISTORY.rst
-@@ -27,7 +27,7 @@ Release History
- - HPACK now tolerates receiving multiple header table size changes in sequence,
-   rather than only one.
- - HPACK now forbids header table size changes anywhere but first in a header
--  block, as required by RFC 7541 § 4.2.
-+  block, as required by RFC 7541 S 4.2.
- - Other miscellaneous performance improvements.
- 
- 2.3.0 (2016-08-04)
--- 
-2.11.0
-
diff --git a/package/python-hpack/Config.in b/package/python-hpack/Config.in
index b0ea03bc42..0608f97281 100644
--- a/package/python-hpack/Config.in
+++ b/package/python-hpack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_HPACK
 	bool "python-hpack"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Pure-Python HPACK header compression.
 
-	  http://hyper.rtfd.org
+	  https://github.com/python-hyper/hpack
diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index 72886b0edd..988cbaae0b 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/hpack/json
-md5	556b0ae66180f54c2ce8029a0952088b  hpack-3.0.0.tar.gz
-# Locally computed
-sha256	8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2  hpack-3.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/hpack/json
+md5  27e01514ef06dc9fa0798d3dcb7de47c  hpack-4.0.0.tar.gz
+sha256  fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095  hpack-4.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index d6b96649e9..3cf534d055 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HPACK_VERSION = 3.0.0
+PYTHON_HPACK_VERSION = 4.0.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://pypi.python.org/packages/44/f1/b4440e46e265a29c0cb7b09b6daec6edf93c79eae713cfed93fbbf8716c5
+PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db19b0f6b370e79d586b3e8528b20252c729c476a2c02954
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE

--===============5108652661601124512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5108652661601124512==--
