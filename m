Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FFEC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A90E60D4F;
	Tue,  7 Nov 2023 21:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A90E60D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wFDW0wIcrJa; Tue,  7 Nov 2023 21:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AEF60C20;
	Tue,  7 Nov 2023 21:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96AEF60C20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 592A11BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318C860C2B
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 318C860C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIFqe20s58Xi for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E23160C20
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E23160C20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57F7086C2B; Tue,  7 Nov 2023 21:35:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 11:51:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d0ac3976bac0000dac5e0feec3015ca13f97ade
X-Git-Newrev: f59da331afea8d0db7a126565587f3405c50872f
X-Patchwork-Hint: ignore
Message-Id: <20231107213549.57F7086C2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpds-py: bump to version
 0.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f59da331afea8d0db7a126565587f3405c50872f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from generic pep517 infrastructure to maturin infrastructure.

Verified license is still MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-rpds-py/python-rpds-py.hash |  4 ++--
 package/python-rpds-py/python-rpds-py.mk   | 14 +++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index e42dfbd948..b04aa210d3 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  3b1087c3c7d55b8730dfaa539147646292074819295812267832ce5b64a0034c  rpds_py-0.9.2.tar.gz
+sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8bcb72c82ea8ae74802293c41d93ad7d51434001b0ae45a603a5af0f507aee0a  LICENSE
+sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 2b5530f237..6f71d02047 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,19 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.9.2
+PYTHON_RPDS_PY_VERSION = 0.12.0
 PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/da/3c/fa2701bfc5d67f4a23f1f0f4347284c51801e9dbc24f916231c2446647df
-PYTHON_RPDS_PY_SETUP_TYPE = pep517
+PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
+PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
-PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin
-PYTHON_RPDS_PY_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_RPDS_PY_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_RPDS_PY_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_RPDS_PY_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
