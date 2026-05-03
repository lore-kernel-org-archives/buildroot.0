Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF35CCD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D8A86154F;
	Sun,  3 May 2026 14:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko0JZu0BvbA5; Sun,  3 May 2026 14:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA8E6153E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819880;
	bh=VlSnMYxUBKl+uiZq/bFV8aI3ysco5NmbT/rZmwSkZOQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tv6bwApcZYHTo/wV2Jn5W0Cys4F06duBOL/fsDIAAs0/8NvW1HhGStAGPBBowwQrS
	 dUIkZn8SrWWqC47mQeKjRF8pijpdA9XWwpOGhrhUx9RHrW2DUhvy8nRhmsJArQAaqi
	 Fimt5uA88BmJ/iRjWBG2dhWBMniYzWmPIqq6+VTG7Savr0Nicz7l9XpOVRF2waGFVn
	 F0hQ/lUd9+IEIBj2trkDrj9zjnjhrInP7osCw+4fwb0gX7qez6iOubp1zXMDABdZDJ
	 E6rL2A+QXo578tyO16CJ0vHn4qV6kdU4Vq1Bto6j9XMewrNSSDo+kudeoCNu9rKd8I
	 ESCqZvW+VgHJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA8E6153E;
	Sun,  3 May 2026 14:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BCA75190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD326406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwvPccgTEuub for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD93C4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD93C4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969DE83FAE; Sun,  3 May 2026 14:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bcba8498b257f949cecfb466e56f2891dac51d8
X-Git-Newrev: a789f4bdb8517e86d45881d7c0d196e0311d4bc7
X-Patchwork-Hint: ignore
Message-Id: <20260503145043.969DE83FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyroute2: bump version to
 0.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a789f4bdb8517e86d45881d7c0d196e0311d4bc7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/svinota/pyroute2/blob/0.9.6/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index e98f776b5f..a488951cde 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  ed5b0e365ac698f0229e4801a635793e  pyroute2-0.9.5.tar.gz
-sha256  a198ccbe545b031b00b10da4b44df33d548db04af944be8107c05a215ba03872  pyroute2-0.9.5.tar.gz
+md5  a8c34ff9de89e55d5d50e9959937e56f  pyroute2-0.9.6.tar.gz
+sha256  6bc5e2ea9a372ded682b4ede4028ba00236bd6e35b42d833f39a96b219ef1db2  pyroute2-0.9.6.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index c068d0760b..dabf7e923d 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.9.5
+PYTHON_PYROUTE2_VERSION = 0.9.6
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/1d/b2/1019ddc278549fb7e64a16d7775e0f7d981135f762b8706e583414d655e3
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/9b/3c/cae3aa8a07522d4fd625958f690ab6eb4ffbd9c94e30e2995f585fded630
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
