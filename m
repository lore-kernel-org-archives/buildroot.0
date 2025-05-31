Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1126C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7D18412A;
	Sat, 31 May 2025 20:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5V4NiqK3Bq9; Sat, 31 May 2025 20:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B560E8411B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B560E8411B;
	Sat, 31 May 2025 20:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53241117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F128411F
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3DK0_HiMn46 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 20:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725EF840DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 725EF840DC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 20:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 616748780C; Sat, 31 May 2025 20:50:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 May 2025 22:42:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 71c8ca75784206b133f304925ad83bbbe0245172
X-Git-Newrev: 9357dc5694a6566d064175d946546b652cd23d60
X-Patchwork-Hint: ignore
Message-Id: <20250531205010.616748780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-{dunamai,
 poetry-dynamic-versioning}: remove packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=9357dc5694a6566d064175d946546b652cd23d60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Both packages where added as host-only dependencies to build
package/python-aiomqtt, and are not used by any other package. With
aiomqtt switching to hatchling they are not needed any more.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                             |  2 --
 package/python-dunamai/python-dunamai.hash             |  5 -----
 package/python-dunamai/python-dunamai.mk               | 15 ---------------
 .../python-poetry-dynamic-versioning.hash              |  5 -----
 .../python-poetry-dynamic-versioning.mk                | 18 ------------------
 5 files changed, 45 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78bb555530..5987eef735 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1115,8 +1115,6 @@ N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
-F:	package/python-dunamai/
-F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
deleted file mode 100644
index 9c0fcc1810..0000000000
--- a/package/python-dunamai/python-dunamai.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  5aa5f8aa470a4e8f67430b1a8a6ff801  dunamai-1.23.0.tar.gz
-sha256  a163746de7ea5acb6dacdab3a6ad621ebc612ed1e528aaa8beedb8887fccd2c4  dunamai-1.23.0.tar.gz
-# Locally computed sha256 checksums
-sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
deleted file mode 100644
index ba422f5b2f..0000000000
--- a/package/python-dunamai/python-dunamai.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-dunamai
-#
-################################################################################
-
-PYTHON_DUNAMAI_VERSION = 1.23.0
-PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/06/4e/a5c8c337a1d9ac0384298ade02d322741fb5998041a5ea74d1cd2a4a1d47
-PYTHON_DUNAMAI_SETUP_TYPE = poetry
-PYTHON_DUNAMAI_LICENSE = MIT
-PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
-HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
-
-$(eval $(host-python-package))
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
deleted file mode 100644
index 7e0675cabb..0000000000
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
-md5  d3d35766974dc0e040d73f7dcc15cc5f  poetry_dynamic_versioning-1.6.0.tar.gz
-sha256  568b728eeb7b2c4a3b818565bbaffc2128bde68ad037152d464b92975f45ce70  poetry_dynamic_versioning-1.6.0.tar.gz
-# Locally computed sha256 checksums
-sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
deleted file mode 100644
index 6ff596bca2..0000000000
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python-poetry-dynamic-versioning
-#
-################################################################################
-
-PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.6.0
-PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
-PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/d3/f9/97b14cae52513ee028f1e81aad8a44e3a8f5a5d47570b48219431e131989
-PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
-PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
-PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
-HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = \
-	host-python-dunamai \
-	host-python-jinja2 \
-	host-python-tomlkit
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
