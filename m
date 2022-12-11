Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7406DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E43C403A7;
	Sun, 11 Dec 2022 09:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E43C403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-3vkdx7B6YF; Sun, 11 Dec 2022 09:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42BA3403C2;
	Sun, 11 Dec 2022 09:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42BA3403C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8474A1BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAD6D403A7
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD6D403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOBLKKVBmYBY for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E97404EB
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E97404EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0282F85FA6; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b9b6541b2d1e06ab14e69c774d6f70e4d96db21
X-Git-Newrev: 85516a05b3bbe41793d431043ab505bb89786d1d
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.0282F85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-packaging: bump to version
 22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=85516a05b3bbe41793d431043ab505bb89786d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to flit package infrastructure.

Drop python-parsing dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-packaging/Config.in             | 1 -
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
index 12170df84e..c09dfffe2c 100644
--- a/package/python-packaging/Config.in
+++ b/package/python-packaging/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PACKAGING
 	bool "python-packaging"
-	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  Core utilities for Python packages.
 
diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 0f353a9e36..e10c11904b 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  e713c1939f294fd729af4a7be40dd141  packaging-21.3.tar.gz
-sha256  dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb  packaging-21.3.tar.gz
+md5  806414ea4c6f17b029a7911b622062e8  packaging-22.0.tar.gz
+sha256  2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750ab48e2c41de2cfd3  packaging-22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 74b5803525..c9190ccfee 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 21.3
+PYTHON_PACKAGING_VERSION = 22.0
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c
-PYTHON_PACKAGING_SETUP_TYPE = setuptools
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/6b/f7/c240d7654ddd2d2f3f328d8468d4f1f876865f6b9038b146bec0a6737c65
+PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
+HOST_PYTHON_PACKAGING_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
