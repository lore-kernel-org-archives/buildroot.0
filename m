Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FC0C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 222DB84A66;
	Sun, 15 Sep 2024 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvH1F7iHiC8q; Sun, 15 Sep 2024 21:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9743584A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9743584A6A;
	Sun, 15 Sep 2024 21:43:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6F81BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCD7C60A4E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqlY7OrSudIm for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1188B60A42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1188B60A42
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E7CC7FB7E; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03d09538d3dc93dfc451fb959ea9e0b61f05655b
X-Git-Newrev: 5321ddb797058c89c341d6b6b7ca0c42179ebf67
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.0E7CC7FB7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 8.27.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5321ddb797058c89c341d6b6b7ca0c42179ebf67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-backcall runtime dependency.

Drop no longer required python-pickleshare runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/Config.in           | 2 --
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 87cc3969b0..8ab5516910 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,11 +1,9 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
-	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 33f70885b3..c8001362dc 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  eee726e4cef5fd680110a899b4e5e2cb  ipython-8.20.0.tar.gz
-sha256  2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a  ipython-8.20.0.tar.gz
+md5  cfe2461181c5ccc92e0039011898ab12  ipython-8.27.0.tar.gz
+sha256  0b99a2dc9f15fd68692e898e5568725c6d49c527d36a9fb5960ffbdeaa82ff7e  ipython-8.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index d3c2c05a05..d88d1ed5af 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.20.0
+PYTHON_IPYTHON_VERSION = 8.27.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c5/d1/187474d64bdefcb6804c1a3a1597d9e94f287e71c06f50f7784d56833fb7
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/57/24/d4fabaca03c8804bf0b8d994c8ae3a20e57e9330d277fb43d83e558dec5e
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
