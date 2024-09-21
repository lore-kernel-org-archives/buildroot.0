Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A08ECF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969A3608E7;
	Sat, 21 Sep 2024 21:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2S8dkRmX7YV9; Sat, 21 Sep 2024 21:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03856608D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03856608D6;
	Sat, 21 Sep 2024 21:08:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9132D1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5E6240557
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bO7lXwuTo4_2 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381A840425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381A840425
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33F948417C; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:52:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cf37ab3f955e61b6156dd0b6f201b62b55782b4
X-Git-Newrev: 5e84e6ea37d0e3cb9830e14301692619b22bae7e
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.33F948417C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycairo: bump to version
 1.27.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e84e6ea37d0e3cb9830e14301692619b22bae7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools build backend to meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pycairo/python-pycairo.hash |  4 ++--
 package/python-pycairo/python-pycairo.mk   | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index f44afe6fc4..633b31d975 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  7669cdc70111d01ba6faecd65d8cdbf6  pycairo-1.25.1.tar.gz
-sha256  7e2be4fbc3b4536f16db7a11982cbf713e75069a4d73d44fe5a49b68423f5c0c  pycairo-1.25.1.tar.gz
+md5  12097575a1bb683cab7dc425d9769a68  pycairo-1.27.0.tar.gz
+sha256  5cb21e7a00a2afcafea7f14390235be33497a2cce53a98a19389492a60628430  pycairo-1.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index eb60293ff8..8d9459e9e2 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,12 +4,20 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.25.1
+PYTHON_PYCAIRO_VERSION = 1.27.0
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/c7/7c/de4d40316ee563e4f15a0f05f28c8458833fbef80c4588b9dd51f39b78ee
-PYTHON_PYCAIRO_SETUP_TYPE = setuptools
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/07/4a/42b26390181a7517718600fa7d98b951da20be982a50cd4afb3d46c2e603
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 
-$(eval $(python-package))
+PYTHON_PYCAIRO_CONF_OPTS = \
+	-Dpython=$(HOST_DIR)/bin/python \
+	-Dtests=false \
+	-Dwheel=false
+
+PYTHON_PYCAIRO_CONF_ENV = \
+	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
+	PYTHONPATH=$(PYTHON3_PATH)
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
