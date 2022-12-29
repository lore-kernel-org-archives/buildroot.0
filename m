Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E7C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A24818BE;
	Thu, 29 Dec 2022 09:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A24818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEcRX1Fc8tO7; Thu, 29 Dec 2022 09:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1F0818AC;
	Thu, 29 Dec 2022 09:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1F0818AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE9241BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76D340887
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76D340887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYOe1b8hufBA for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:30:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 982194047D
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 982194047D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8405C87028; Thu, 29 Dec 2022 09:30:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:30:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e4b0d8be54ce6dd9c54f1c04eeb752db2f0dcf3
X-Git-Newrev: 65d14c82db6e6c4555cc83b65ff22578e4525601
X-Patchwork-Hint: ignore
Message-Id: <20221229093055.8405C87028@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-remotes: bump to
 version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=65d14c82db6e6c4555cc83b65ff22578e4525601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from distutils to flit package infrastructure.

Add a patch fixing incorrect flit requires/build-backend in
pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Fix-flit_core-build-requires-backend.patch | 32 ++++++++++++++++++++++
 .../python-aiohttp-remotes.hash                    |  4 +--
 .../python-aiohttp-remotes.mk                      |  6 ++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
new file mode 100644
index 0000000000..cf940eaf87
--- /dev/null
+++ b/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
@@ -0,0 +1,32 @@
+From 3d39ee9a03a1c96b8e798dc6acf98165da31da1f Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 11 Mar 2022 12:59:53 -0700
+Subject: [PATCH] Fix flit_core build requires/backend.
+
+Only flit_core should be required by pyproject.toml, the regular flit
+package is the pep517 frontend which is not what should be set for the
+build system.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/aio-libs/aiohttp-remotes/pull/355]
+---
+ pyproject.toml     | 4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 214d64d..8c6b882 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+-requires=["flit"]
+-build-backend="flit.buildapi"
++requires=["flit_core"]
++build-backend="flit_core.buildapi"
+ 
+ [tool.flit.metadata]
+ module="aiohttp_remotes"
+-- 
+2.38.1
+
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index 595340d5d8..51c5cf08b4 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5  da13880f25ec3b9cf98c7baff92835a2  aiohttp_remotes-1.1.0.tar.gz
-sha256  e44f2c5fd5fc3305477c89bb25f14570589100cc58c48b36745d4239839d3174  aiohttp_remotes-1.1.0.tar.gz
+md5  c46a71df656e7f1e111684ced68a85d0  aiohttp_remotes-1.2.0.tar.gz
+sha256  f95c3a6be5e2de746a85ce9af49ec548da6db8378d7e81bb171ec77b13562a6c  aiohttp_remotes-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index e2bc3e1c18..e0ec789f41 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 1.1.0
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.2.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/e3/fc/5523010172e2d8685a8934fbb49d564118c9ebc1e4233a62b77310f979db
-PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/54/05/7c4be6171cc78a13171a4f89e5d308c4a636bdd8ee36101367e99e410ed8
+PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = flit
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
