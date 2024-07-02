Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B961C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9DDE82045;
	Tue,  2 Jul 2024 07:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li_PW36EAzLv; Tue,  2 Jul 2024 07:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDA781FE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDA781FE6;
	Tue,  2 Jul 2024 07:48:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12D441BF97C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01353608C0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giS6mHuvVYgS for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C92B60670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C92B60670
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 151FC83979; Tue,  2 Jul 2024 07:48:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c61bc7fe7cb328efa01584faef419349d0ff2848
X-Git-Newrev: ab96856e9c79f5026f94bb473ef5d610b6ad9301
X-Patchwork-Hint: ignore
Message-Id: <20240702074810.151FC83979@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jinja2: bump to version
 3.1.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab96856e9c79f5026f94bb473ef5d610b6ad9301
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-jinja2/python-jinja2.hash |  6 +++---
 package/python-jinja2/python-jinja2.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 2ab343cce6..2b32f5cce4 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  d31148abd89c1df1cdb077a55db27d02  Jinja2-3.1.2.tar.gz
-sha256  31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852  Jinja2-3.1.2.tar.gz
+md5  02ca9a6364c92e83d14b037bef4732bc  jinja2-3.1.4.tar.gz
+sha256  4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369  jinja2-3.1.4.tar.gz
 # Locally computed sha256 checksums
-sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 209ca2e25a..780b693281 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.2
-PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce
-PYTHON_JINJA2_SETUP_TYPE = setuptools
+PYTHON_JINJA2_VERSION = 3.1.4
+PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/ed/55/39036716d19cab0747a5020fc7e907f362fbf48c984b14e62127f7e68e5d
+PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
-PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
+PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
 PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
 PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
