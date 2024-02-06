Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DCEC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845CF41579;
	Tue,  6 Feb 2024 15:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845CF41579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ng2aEwgyXJR; Tue,  6 Feb 2024 15:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A76A41586;
	Tue,  6 Feb 2024 15:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A76A41586
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B96371BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D90BB82A3B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxx4ADuwwBT8 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BE082A2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BE082A2E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B9F870EF; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 16:18:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d7b0259e21335c8da8566a581ef84d785d5a861
X-Git-Newrev: 2f4126a9cc5b7e044a90edad20e2e7de6f090fc7
X-Patchwork-Hint: ignore
Message-Id: <20240206151815.D5B9F870EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyhamcrest: bump to version
 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f4126a9cc5b7e044a90edad20e2e7de6f090fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatchling pep517 build backend.

Drop no longer required python-setuptools runtime dependency.

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyhamcrest/Config.in              | 2 --
 package/python-pyhamcrest/python-pyhamcrest.hash | 4 ++--
 package/python-pyhamcrest/python-pyhamcrest.mk   | 9 ++++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-pyhamcrest/Config.in b/package/python-pyhamcrest/Config.in
index c2a4dc06f7..27224cdbf1 100644
--- a/package/python-pyhamcrest/Config.in
+++ b/package/python-pyhamcrest/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYHAMCREST
 	bool "python-pyhamcrest"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Hamcrest framework for matcher objects.
 
diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
index 176079e0f5..ba230d3a07 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.hash
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
-md5  c808291b2fca0991d044927884e6d15e  pyhamcrest-2.0.4.tar.gz
-sha256  b5d9ce6b977696286cf232ce2adf8969b4d0b045975b0936ac9005e84e67e9c1  pyhamcrest-2.0.4.tar.gz
+md5  c731efc9bcb93ef4f73d110f5ca8e844  pyhamcrest-2.1.0.tar.gz
+sha256  c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7498eabacaf7c975bd9c  pyhamcrest-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index de5295e964..6631ff1d6a 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYHAMCREST_VERSION = 2.0.4
+PYTHON_PYHAMCREST_VERSION = 2.1.0
 PYTHON_PYHAMCREST_SOURCE = pyhamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/b1/9a/588f086b64ace8d2e9843d8551e9068b2570c3c51b06cb49a107303f8700
-PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/16/3f/f286caba4e64391a8dc9200e6de6ce0d07471e3f718248c3276843b7793b
+PYTHON_PYHAMCREST_SETUP_TYPE = pep517
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
+PYTHON_PYHAMCREST_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
