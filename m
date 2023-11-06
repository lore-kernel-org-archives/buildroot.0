Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38EEC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A838F417DA;
	Mon,  6 Nov 2023 22:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A838F417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCn72ij4JZrR; Mon,  6 Nov 2023 22:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0524212A;
	Mon,  6 Nov 2023 22:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0524212A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144731BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E25F41C0A
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E25F41C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjDwXKhrhLzg for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21531417CA
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21531417CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B34B86B2B; Mon,  6 Nov 2023 22:08:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:02:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31f7ec223cbda3c0b260a75a54f521142e055c3f
X-Git-Newrev: 4a3b7a18f35d5f78868c70a9cb1e9677365a0fb7
X-Patchwork-Hint: ignore
Message-Id: <20231106220816.0B34B86B2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cheroot: bump to version
 10.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a3b7a18f35d5f78868c70a9cb1e9677365a0fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cheroot/Config.in           | 1 -
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-cheroot/Config.in b/package/python-cheroot/Config.in
index bb9b4abbc3..4c907ff8c6 100644
--- a/package/python-cheroot/Config.in
+++ b/package/python-cheroot/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CHEROOT
 	bool "python-cheroot"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	help
diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index c3556109cd..d103eb6f96 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  1617fdbaba7d6edbe5b0ff48f7563111  cheroot-9.0.0.tar.gz
-sha256  3d47ad9ee19ecbec144b4758399036692fdbf67a40b96eef1fb1454367b3d338  cheroot-9.0.0.tar.gz
+md5  be96fa052c54892240f916fbb06cc571  cheroot-10.0.0.tar.gz
+sha256  59c4a1877fef9969b3c3c080caaaf377e2780919437853fc0d32a9df40b311f0  cheroot-10.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index f75065c7da..86e16f7db2 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 9.0.0
+PYTHON_CHEROOT_VERSION = 10.0.0
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/8c/e7/8e6387d59a352c5799e917a23e7b76771a8bb97322c1ce7e42934d0066c3
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/08/7c/95c154177b16077de0fec1b821b0d8b3df2b59c5c7b3575a9c1bf52a437e
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
