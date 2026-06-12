Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF32FCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C03883A47;
	Fri, 12 Jun 2026 16:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DxWPxakIkYl; Fri, 12 Jun 2026 16:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8335183A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282345;
	bh=PIQ/VCMRzerM4B3tmwe2wlGkaAcraiN8A9RH3/Clak0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QIV5WJywsOjDIZ+BKBCZ0GkjCYEGd5S8NeAxmO+Astzz9SpzdqNOXhdT6mRt/Kr+Y
	 aIjdbIi99fPJ1JmC80Z7sB3I41KhfsIilGEr8ZdckIx9Bz1fKl9mCmDh6dFIm2dDnv
	 QDEYo3E7DqEJNSx0KgSktPhlNp54gLD0nOZPaxu7r6F0pSQaGlntuNMdIx2yUYY+cG
	 /aTK1Qv85RNzuu18CqxSnc+08I71tjsMkieFi6NIvmUSEaOfdnanQGTE49UTGyJW+A
	 eNgUQk0cmmrQ+DP18s0VpMtkO2lEfpDptJyfc8wInSLSPeHd3OXY81fCHRLcX00MfT
	 T5D4CknXSta/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8335183A0A;
	Fri, 12 Jun 2026 16:39:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E041612F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D238B61086
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSU4QdjCZZPC for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8AC96107F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8AC96107F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1A8788115; Fri, 12 Jun 2026 16:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:37:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 374d0a02e4595247aa15c34d1bc35c5dcb316c7c
X-Git-Newrev: cdb2fab2e84d365d57106fc245ae51a6c4ff5efa
X-Patchwork-Hint: ignore
Message-Id: <20260612163844.A1A8788115@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-modemmanager: bump to
 version 1.0.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdb2fab2e84d365d57106fc245ae51a6c4ff5efa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here: https://github.com/zhanglongqi/python-sdbus-modemmanager/blob/master/changelog.md#105

Patchfile removed as it is fixed upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...t.toml-fix-sdbus-modemmanager-intall-path.patch | 50 ----------------------
 .../python-sdbus-modemmanager.hash                 |  4 +-
 .../python-sdbus-modemmanager.mk                   |  4 +-
 3 files changed, 4 insertions(+), 54 deletions(-)

diff --git a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
deleted file mode 100644
index 40638c652e..0000000000
--- a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7a99efa663bf9602099f0658aecbec6b5dce778a Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 9 May 2026 00:29:59 +0200
-Subject: [PATCH] pyproject.toml: fix sdbus-modemmanager intall path
-
-Since the switch to poetry in 1.0.3 [1] python-sdbus-modemmanager
-install step miss-behave (as reported by [2]).
-
-The sdbus-modemmanager python module is intalled in a second
-"modemmanager" subdirectory:
-
-  /lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/
-
-This break existing python script using:
-
-  from sdbus_block.modemmanager import MMBearer
-
-Fix tool.poetry install step by removing one "modemmanager".
-
-[1] 0d8ae7217841ab1bc12282076f766f94415573f5
-[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359
-
-Upstream: https://github.com/zhanglongqi/python-sdbus-modemmanager/pull/25
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 5e57df6..bf97a5d 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -27,8 +27,8 @@ classifiers = [
- 
- [tool.poetry]
- packages = [
--    { include = "modemmanager", from="sdbus_async", to="sdbus_async/modemmanager" },
--    { include = "modemmanager", from="sdbus_block", to="sdbus_block/modemmanager" },
-+    { include = "modemmanager", from="sdbus_async", to="sdbus_async" },
-+    { include = "modemmanager", from="sdbus_block", to="sdbus_block" },
- ]
- 
- [build-system]
--- 
-2.54.0
-
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
index 3833864bd8..c93b881843 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
-md5  d75c065dd08ce96e37db0858af0dd44f  sdbus_modemmanager-1.0.3.tar.gz
-sha256  8fd5509de6ce363019667a14267ebce99f2b67849d1d7ee72d0228611ac1ba0a  sdbus_modemmanager-1.0.3.tar.gz
+md5  e68913d43059959d564744bb31e09f5c  sdbus_modemmanager-1.0.5.tar.gz
+sha256  d8b2ac81b3c43fc4e13a2aabdf0e8312ebd61c8488fe3686d0f4338605b88e25  sdbus_modemmanager-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
index 62d128b264..5d0e9b20fb 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.3
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.5
 PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/38/2c/d66aa7f981df1d654bf70942964a4ca24cf930815fe7d656e1979c44a33a
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/4e/fe/9ddd6c51aac270339b47708732112491c0dc690094bd8210253ce934285b
 PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = poetry
 PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
