Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1829C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 22:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6444C404D1;
	Sun, 20 Feb 2022 22:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xADffquPdatb; Sun, 20 Feb 2022 22:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E26F404C8;
	Sun, 20 Feb 2022 22:21:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B81B1BF95E
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DBCD81403
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGmEs_jLp9TD for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 22:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD5E8139B
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 22:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 690398343E; Sun, 20 Feb 2022 22:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 23:18:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63b780f5e96e2f9282fb48b2846bab1c0f4f9455
X-Git-Newrev: aeb138911e773cf4011b81fc4fcec0037f366bb1
X-Patchwork-Hint: ignore
Message-Id: <20220220221236.690398343E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: security bump to
 version 7.31.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aeb138911e773cf4011b81fc4fcec0037f366bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-21699: IPython (Interactive Python) is a command shell for
interactive computing in multiple programming languages, originally
developed for the Python programming language. Affected versions are
subject to an arbitrary code execution vulnerability achieved by not
properly managing cross user temporary files. This vulnerability allows
one user to run code as another on the same machine. All users are
advised to upgrade.

Also update indentation in hash file (two spaces)

https://github.com/ipython/ipython/security/advisories/GHSA-pq7m-3gw7-gq5x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipython/python-ipython.hash | 8 ++++----
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 5f591129a4..cd18c3d125 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  f733048322cd34ce392ec5404813540b  ipython-7.28.0.tar.gz
-sha256  2097be5c814d1b974aea57673176a924c4c8c9583890e7a5f082f547b9975b11  ipython-7.28.0.tar.gz
+md5  6907b67691ba697173a3befb2c35f7ac  ipython-7.31.1.tar.gz
+sha256  b5548ec5329a4bcf054a5deed5099b0f9622eb9ea51aaa7104d215fece201d8c  ipython-7.31.1.tar.gz
 # Locally computed sha256 checksums
-sha256	341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
-sha256	e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
+sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
+sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index c669dd1b92..389ebfa897 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 7.28.0
+PYTHON_IPYTHON_VERSION = 7.31.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/e2/c8/7046d0409a90e31263d5bbaa708347d522ac584a1140c01a951d9deb1792
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/fb/39/c1947dc1bb993a35469ca474535cb3214c91f5f9a7752a1fcbd9b6b37dde
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
