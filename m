Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B80D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0444341562;
	Thu, 10 Oct 2024 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkQ812wHCAgZ; Thu, 10 Oct 2024 21:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75FB41577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A75FB41577;
	Thu, 10 Oct 2024 21:32:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06E2B1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1EC6400F9
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzKsFHcBu3Hv for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B8C940582
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B8C940582
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1702185C67; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4a3890ba9a2d1d50a98876de1ee4968de66b04a
X-Git-Newrev: b036738f325a1650c6778c17fc30e53a711f47ee
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.1702185C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-metadata: bump to
 version 0.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b036738f325a1650c6778c17fc30e53a711f47ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

Add new host-python-packaging dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyproject-metadata/python-pyproject-metadata.hash | 4 ++--
 package/python-pyproject-metadata/python-pyproject-metadata.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index af5121c63c..093be17e75 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  048ef3f91a5ba7c89a33894cb2c7725d  pyproject_metadata-0.8.0.tar.gz
-sha256  376d5a00764ac29440a54579f88e66b7d9cb7e629d35c35a1c7248bfebc9b455  pyproject_metadata-0.8.0.tar.gz
+md5  fdaf264fe130f45ba830222b95c556fa  pyproject_metadata-0.8.1.tar.gz
+sha256  e6b494d4fbac8007ed0efd3a08df067bb28a299fb113b885ce77e492ad1f0600  pyproject_metadata-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index eaf31ff591..08d2b4bda4 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.8.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.8.1
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/cf/cc/428b057f8c229b7c374efe9d6a6a35e693f79e071e25846ab0c55e59d337
-PYTHON_PYPROJECT_METADATA_SETUP_TYPE = setuptools
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/fa/24/47dc876eacddcf7125fe59cd26b064530c7e58655dae87f6928bf47aabaf
+PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
+HOST_PYTHON_PYPROJECT_METADATA_DEPENDENCIES = host-python-packaging
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
