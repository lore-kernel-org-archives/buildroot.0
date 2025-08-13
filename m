Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D841CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 15:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455E041716;
	Wed, 13 Aug 2025 15:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYhr1GeA0Xyq; Wed, 13 Aug 2025 15:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3B441721
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3B441721;
	Wed, 13 Aug 2025 15:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9697A938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 889C5600B3
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBXfiJ4fnNmG for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 15:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A7A60699
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A7A60699
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 15:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB4BA87562; Wed, 13 Aug 2025 15:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 17:26:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dec8cfe396094523c27a15dc63ec4d325e6f49e0
X-Git-Newrev: 786557d859dba7e52c883e5215e53e93fac13b88
X-Patchwork-Hint: ignore
Message-Id: <20250813152758.BB4BA87562@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyroute2: bump
 to version 0.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=786557d859dba7e52c883e5215e53e93fac13b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From 0.9.1 the pyroute2 core is async, the synchronous API remains
available as a wrapper.

Upstream changelog:
https://github.com/svinota/pyroute2/blob/0.9.4/CHANGELOG.rst

pyroute2 now requires the python3 ssl module at runtime. This is
reflected in Config.in.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien:
 - add comment in commit log about new ssl runtime dependency
 - add runtime comment in Config.in
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyroute2/Config.in            | 1 +
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
index 9e685f9d1e..2e667165a8 100644
--- a/package/python-pyroute2/Config.in
+++ b/package/python-pyroute2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYROUTE2
 	bool "python-pyroute2"
 	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Python netlink library - Linux network / netns / wireless /
 	  ipset configuration.
diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 3785c9ad7f..87402b9dbb 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  6699294168d3051b2897a556ceeaf6c2  pyroute2-0.8.1.tar.gz
-sha256  b91f4a1f7abb9824637b1fe67e6e4a0a071d98d4a1a1b47ef792304ff3adad11  pyroute2-0.8.1.tar.gz
+md5  225d6899da226df8899efcff2557204a  pyroute2-0.9.4.tar.gz
+sha256  3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070  pyroute2-0.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index fea6e43979..efe8d73f52 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.8.1
+PYTHON_PYROUTE2_VERSION = 0.9.4
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/4d/04/c9060b6cb024d05467e17ea93d3ca4bd2f3b05deb2372b7f79321640e8ad
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/b0/5e/fc64e211cce0078555c6db98aaf14348aed527565f3c4876913a290a5b2c
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
