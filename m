Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E12C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0066103C;
	Mon, 27 Feb 2023 14:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F0066103C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1obbcdCdY53o; Mon, 27 Feb 2023 14:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3617C61059;
	Mon, 27 Feb 2023 14:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3617C61059
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B52DC1BF870
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F78D60B8F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F78D60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjFyH6P14K1L for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A89256005E
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89256005E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9495C86BF4; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 15:40:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daf01a38be705ada7ce3e083f096d424ead5544c
X-Git-Newrev: da5d2adf572f9b89b6ea82f9548bd4dfba7482ab
X-Patchwork-Hint: ignore
Message-Id: <20230227145800.9495C86BF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-werkzeug: security bump to
 version 2.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=da5d2adf572f9b89b6ea82f9548bd4dfba7482ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-23934 and CVE-2023-25577

https://github.com/pallets/werkzeug/security/advisories/GHSA-px8h-6qxv-m22q
https://github.com/pallets/werkzeug/security/advisories/GHSA-xg9f-g7g7-2323
https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 13b95bc448..0b60a40066 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
-md5  9d7e50c5bb3a9fc12823b5faf374b90e  Werkzeug-2.2.2.tar.gz
-sha256  7ea2d48322cc7c0f8b3a215ed73eabd7b5d75d0b50e31ab006286ccff9e00b8f  Werkzeug-2.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/werkzeug/json
+md5  28c3ec6a4b1ce8f06c85612c1dfa351a  Werkzeug-2.2.3.tar.gz
+sha256  2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe  Werkzeug-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 3ebae3c165..0dd27d145f 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.2.2
+PYTHON_WERKZEUG_VERSION = 2.2.3
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/f8/c1/1c8e539f040acd80f844c69a5ef8e2fccdf8b442dabb969e497b55d544e1
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/02/3c/baaebf3235c87d61d6593467056d5a8fba7c75ac838b8d100a5e64eba7a0
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
