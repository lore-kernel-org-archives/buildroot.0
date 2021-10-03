Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC33DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 946EF61B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 946EF61B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7AE426F4;
	Sun,  3 Oct 2021 08:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4utGKhVW9tuL; Sun,  3 Oct 2021 08:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A997E42700;
	Sun,  3 Oct 2021 08:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2F921BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2CBD4019B
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccYUP-c0REQi for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C347240536
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3F3A48DB44; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd684ab9f38ad908013d09fe7e46cebfada4406c
X-Git-Newrev: e5744715b61322468b7ebfd59ff0850c9c4b5fee
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.3F3A48DB44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setproctitle: bump to
 version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5744715b61322468b7ebfd59ff0850c9c4b5fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* hash file: indent with two spaces and bring also sha256 from pypi.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-setproctitle/Config.in                | 1 +
 package/python-setproctitle/python-setproctitle.hash | 8 ++++----
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-setproctitle/Config.in b/package/python-setproctitle/Config.in
index d13afaa401..a901fd7055 100644
--- a/package/python-setproctitle/Config.in
+++ b/package/python-setproctitle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SETPROCTITLE
 	bool "python-setproctitle"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A Python module to customize the process title.
 
diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index 6bade7bba7..88e4453277 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=2dcdd1b761700a5a13252fea3dfd1977
-md5	2dcdd1b761700a5a13252fea3dfd1977  setproctitle-1.1.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/setproctitle/json
+md5  9898587a1668f1c53f6699ca5d35256d  setproctitle-1.2.2.tar.gz
+sha256  7dfb472c8852403d34007e01d6e3c68c57eb66433fb8a5c77b13b89a160d97df  setproctitle-1.2.2.tar.gz
 # Locally computed
-sha256	6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398  setproctitle-1.1.10.tar.gz
-sha256  40e85df0511ccacd29b6b5898e7e09b76889fc2f5d94b2670ece847977d3bbed  COPYRIGHT
+sha256  85bd836337aa702e0a4e2a54676c6ae046ffb357dbf4a990189595a60fcd1648  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index ff33c0c18a..13e9e261be 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.1.10
+PYTHON_SETPROCTITLE_VERSION = 1.2.2
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/a1/7f/a1d4f4c7b66f0fc02f35dc5c85f45a8b4e4a7988357a29e61c14e725ef86
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
