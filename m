Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830FBC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E92410CA;
	Sun, 15 Jan 2023 11:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E92410CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iy9_K4NLuAjP; Sun, 15 Jan 2023 11:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A4B41296;
	Sun, 15 Jan 2023 11:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A4B41296
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4733E1BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A039981F05
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A039981F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0r0QHBBzUQV for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D0E281ED0
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D0E281ED0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ACD0870BF; Sun, 15 Jan 2023 11:06:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:01:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89a2bafaa4bd5aee71a13fb1542a15c7410cd6af
X-Git-Newrev: d5a1a38c8975153838f4e3f43ea03820613e4882
X-Patchwork-Hint: ignore
Message-Id: <20230115110628.8ACD0870BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-networkx: bump to version
 3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5a1a38c8975153838f4e3f43ea03820613e4882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required decorator dependency.

License hash changed due to year update:
https://github.com/networkx/networkx/commit/49f20fe11d2a804a83d538759e06511eb90ad5a3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-networkx/Config.in            | 1 -
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 5 ++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
index 0f3e86f497..e2fc6ae478 100644
--- a/package/python-networkx/Config.in
+++ b/package/python-networkx/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_NETWORKX
 	bool "python-networkx"
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  A Python package for the creation, manipulation,
 	  and study of the structure, dynamics, and
diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index d166f0b8d8..96ef9777da 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  22139ab5a47818fa00cbaa91eb126381  networkx-2.8.8.tar.gz
-sha256  230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e  networkx-2.8.8.tar.gz
+md5  1bfbb5cd184b486feae8345f541a5e50  networkx-3.0.tar.gz
+sha256  9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412  networkx-3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  aae9f809fb1a1592ed72e9f52df10cfad8fe226b8d4d28385f90dd4341ce7119  LICENSE.txt
+sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index f097671d66..d369df1a04 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 2.8.8
+PYTHON_NETWORKX_VERSION = 3.0
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/cd/16/c44e8550012735b8f21b3df7f39e8ba5a987fb764ac017ad5f3589735889
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/99/f9/d45c9ecf50a6b67a200e0bbd324201b5cd777dfc0e6c8f6d1620ce5a7ada
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
 PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
