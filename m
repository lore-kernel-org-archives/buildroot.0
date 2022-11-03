Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19346C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6DCE40BF3;
	Thu,  3 Nov 2022 21:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6DCE40BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyymwdNphdah; Thu,  3 Nov 2022 21:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDEE840BED;
	Thu,  3 Nov 2022 21:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDEE840BED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17CCB1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E3F40BE6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E3F40BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYvfaLACbXlp for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BD7C40BEC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD7C40BEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F15A287BCA; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:04:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3de9aa3eea839f3a6bfef923545ef6f7db16f1cd
X-Git-Newrev: 2e6c204f51f5696aa056324a5a30ac5d23648e8f
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.F15A287BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ipython: bump
 to version 8.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e6c204f51f5696aa056324a5a30ac5d23648e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch which is no longer needed.

Migrate from distutils to setuptools infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-set-correct-python-executable-path.patch         | 15 ---------------
 package/python-ipython/python-ipython.hash                |  4 ++--
 package/python-ipython/python-ipython.mk                  |  6 +++---
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/package/python-ipython/0001-set-correct-python-executable-path.patch b/package/python-ipython/0001-set-correct-python-executable-path.patch
deleted file mode 100644
index 0fbd5a1c8e..0000000000
--- a/package/python-ipython/0001-set-correct-python-executable-path.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Set correct Python executable path
-
-Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
-
---- python-ipython-2.1.0/setupbase.py	2014-05-21 15:19:12.000000000 -0400
-+++ python-ipython-2.1.0-new/setupbase.py	2014-07-23 23:34:32.892030423 -0400
-@@ -394,7 +394,7 @@ class build_scripts_entrypt(build_script
- 
-             mod, func = entrypt.split(':')
-             with open(outfile, 'w') as f:
--                f.write(script_src.format(executable=sys.executable,
-+                f.write(script_src.format(executable='/usr/bin/env python',
-                                           mod=mod, func=func))
- 
-         return outfiles, outfiles
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index cd18c3d125..e61727e045 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  6907b67691ba697173a3befb2c35f7ac  ipython-7.31.1.tar.gz
-sha256  b5548ec5329a4bcf054a5deed5099b0f9622eb9ea51aaa7104d215fece201d8c  ipython-7.31.1.tar.gz
+md5  8c98f6def0622ea32975cb779247c3d7  ipython-8.6.0.tar.gz
+sha256  7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5  ipython-8.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 389ebfa897..f3aac75db1 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.31.1
+PYTHON_IPYTHON_VERSION = 8.6.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/fb/39/c1947dc1bb993a35469ca474535cb3214c91f5f9a7752a1fcbd9b6b37dde
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/7f/59/05e94e067afb61460f0d5229a1edb800e2f65b8436085fad9cd262d80d45
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
 PYTHON_IPYTHON_CPE_ID_PRODUCT = ipython
-PYTHON_IPYTHON_SETUP_TYPE = distutils
+PYTHON_IPYTHON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
