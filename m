Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25CC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D4E782216;
	Tue,  6 Feb 2024 13:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mkHINyQPmHi; Tue,  6 Feb 2024 13:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70B538221A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70B538221A;
	Tue,  6 Feb 2024 13:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D66E91BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3C4B6118F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C4B6118F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jY-senIEuFI7 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25745611C3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25745611C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 143C887044; Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 14:06:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1229b824ad97efd49747770a35d24b9f4218c6be
X-Git-Newrev: b95111c2d47bfdb42ee20396f4722491fa27ffdd
X-Patchwork-Hint: ignore
Message-Id: <20240206130733.143C887044@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 8.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b95111c2d47bfdb42ee20396f4722491fa27ffdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-matplotlib-inline runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ipython/Config.in           | 1 +
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index c217efcfd1..87cc3969b0 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
+	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
 	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index f68b3ba78c..33f70885b3 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  ac2ff5bad97aa09befdf7f0f27323699  ipython-8.17.2.tar.gz
-sha256  126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb  ipython-8.17.2.tar.gz
+md5  eee726e4cef5fd680110a899b4e5e2cb  ipython-8.20.0.tar.gz
+sha256  2f21bd3fc1d51550c89ee3944ae04bbc7bc79e129ea0937da6e6c68bfdbf117a  ipython-8.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 1335121688..d3c2c05a05 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.17.2
+PYTHON_IPYTHON_VERSION = 8.20.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/a9/e9/c83d1a5756bf44f1802045a54dacc910d3d254c5ec56040993978d8c1b8d
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c5/d1/187474d64bdefcb6804c1a3a1597d9e94f287e71c06f50f7784d56833fb7
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
