Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC70C7619A
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 20:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027B640176;
	Sun,  2 Apr 2023 20:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027B640176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It-waq_4XZ9R; Sun,  2 Apr 2023 20:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274B5401C9;
	Sun,  2 Apr 2023 20:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274B5401C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C04E31BF36C
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A79F81E3E
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 20:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A79F81E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFXtN4pY9tl5 for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A44481E17
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A44481E17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78B1D83768; Sun,  2 Apr 2023 20:47:43 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 2 Apr 2023 22:40:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2ac1a951fc7581b980c5517594d511aa792a3e3
X-Git-Newrev: 63463ee43f58637b4a70cb98743423a9d6906eac
X-Patchwork-Hint: ignore
Message-Id: <20230402204743.78B1D83768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypa-build: bump to version
 0.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=63463ee43f58637b4a70cb98743423a9d6906eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to flit-bootstrap build backend.

Remove no longer needed host-python-pep517 dependency.

Add new host-python-pyproject-hooks dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index 4c02ee1dce..9da56f9f68 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  f2dc1823b0eff7037e19be18e354b2f1  build-0.9.0.tar.gz
-sha256  1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c  build-0.9.0.tar.gz
+md5  742e7cd0a67455c1df90061b42088bd2  build-0.10.0.tar.gz
+sha256  d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269  build-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index adc124b074..d7c03323b7 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.9.0
+PYTHON_PYPA_BUILD_VERSION = 0.10.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/de/1c/fb62f81952f0e74c3fbf411261d1adbdd2d615c89a24b42d0fe44eb4bcf3
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
-PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
+PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-pep517
+	host-python-pyproject-hooks
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
