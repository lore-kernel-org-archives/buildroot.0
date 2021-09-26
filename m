Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9F5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BFC60F6D
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BFC60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8852081C38;
	Sun, 26 Sep 2021 19:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZRcAPV7UuQ07; Sun, 26 Sep 2021 19:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C091781C18;
	Sun, 26 Sep 2021 19:57:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF11C1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 404554029D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 751VEu3AiYyB for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1299340305
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 994B78D269; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c
X-Git-Newrev: 9c0d6a574bfd4a13a6dec3f02d38e2a2942c7700
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.994B78D269@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipy: bump to version 1.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c0d6a574bfd4a13a6dec3f02d38e2a2942c7700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package supports both python versions.
* Indent with two spaces in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ipy/Config.in       | 1 -
 package/python-ipy/python-ipy.hash | 6 +++---
 package/python-ipy/python-ipy.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-ipy/Config.in b/package/python-ipy/Config.in
index bead932da8..b4f0c8cb5e 100644
--- a/package/python-ipy/Config.in
+++ b/package/python-ipy/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPY
 	bool "python-ipy"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  IPy - class and tools for handling of IPv4 and
 	  IPv6 addresses and networks.
diff --git a/package/python-ipy/python-ipy.hash b/package/python-ipy/python-ipy.hash
index 641a2eb21f..3d8e1e8c71 100644
--- a/package/python-ipy/python-ipy.hash
+++ b/package/python-ipy/python-ipy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipy/json
-md5	1a90c68174234672241a7e60c7ea0fb9  IPy-1.00.tar.gz
-sha256	2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621  IPy-1.00.tar.gz
+md5  d6cf83e7f418ebbd23324ba1c658b907  IPy-1.01.tar.gz
+sha256  edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a  IPy-1.01.tar.gz
 # Locally computed sha256 checksums
-sha256	078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
+sha256  078bb46799e46e51e7239c24ff130d345db911c11efafef5e3c45dfb7adb0a61  COPYING
diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index 817b531e0b..2a01daf4ca 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPY_VERSION = 1.00
+PYTHON_IPY_VERSION = 1.01
 PYTHON_IPY_SOURCE = IPy-$(PYTHON_IPY_VERSION).tar.gz
-PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/e1/66/b6dd22472bb027556849876beae2dd4dca3a4eaf2dd3039277b4edb8c6af
+PYTHON_IPY_SITE = https://files.pythonhosted.org/packages/64/a4/9c0d88d95666ff1571d7baec6c5e26abc08051801feb6e6ddf40f6027e22
 PYTHON_IPY_LICENSE = BSD-3-Clause
 PYTHON_IPY_LICENSE_FILES = COPYING
 PYTHON_IPY_SETUP_TYPE = distutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
