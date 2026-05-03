Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A2CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5045861279;
	Sun,  3 May 2026 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIvO_HpQbQdH; Sun,  3 May 2026 14:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F6EF612B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819907;
	bh=B8plb/i2xkCXfdHyFhh0MEaS8c2Bf42mB3pwgULyU8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ipW6feGNx53xtGsd/fO7F6Xz7wJea592KmSgodHEO5dOob409uxe9brzje9GGMVbY
	 VYH0ni0Hz2C56AyndeYCJhCeSHVwKmWqZBBvl6+x56hvCagkDlN+gjooNVGyOBhuuV
	 V1Ox5Y9xrk+aCiR8DJAS6crjr4zXp8+IPcMB8YUQ6Ub8zthurRgern2/IuJPSA/I62
	 C1iA+lhSyur009EwTSoLlh/GRtwFWEMRy5ddOIIU7c0exkcGgc1kWtwZS3yUbb5Mjs
	 O1Y3XAXQIQmP2Jp3Rw2NFeUHAoxAYG/vV8wBoKSLxX+Zs8yHeapjPW9vLQBw0JaoDS
	 wu0Lul1ZREGvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6EF612B5;
	Sun,  3 May 2026 14:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5620127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA8006131B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5SPAia7vY7c for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E3761327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6E3761327
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F8EB83FC0; Sun,  3 May 2026 14:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35473bc31e5276004c340087846e6c1bd9e7bf89
X-Git-Newrev: a2853852647730be1b2777bf778206f72c93b928
X-Patchwork-Hint: ignore
Message-Id: <20260503145053.6F8EB83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssutils: bump version to
 2.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2853852647730be1b2777bf778206f72c93b928
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jaraco/cssutils/blob/v2.15.0/NEWS.rst

Updated license hash due to upstream commit
https://github.com/jaraco/cssutils/commit/0ac56dd192a2d6d8c4dafb41c4701fbea2f844f0

Added dependency to host-python-coherent-licensed due to upstream commit
https://github.com/jaraco/cssutils/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
which was first included in version 2.12.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 66c87904b4..96576f9717 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5  c8c21e635454d9ca73b21892def35f55  cssutils-2.11.1.tar.gz
-sha256  0563a76513b6af6eebbe788c3bf3d01c920e46b3f90c8416738c5cfc773ff8e2  cssutils-2.11.1.tar.gz
+md5  8a90c28a2f037c525a25e5a2541fd9a5  cssutils-2.15.0.tar.gz
+sha256  e9739237f3915037dacba787c4b58f280e3ec5d9864953e185bf23d40ff7d021  cssutils-2.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  LICENSE
+sha256  b8f0d64361b0d6480ebd172c2c53c51e80745e41d69d612e4ffa35e85f8d822c  LICENSE
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 0fc706780c..9b7a93ddd0 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 2.11.1
+PYTHON_CSSUTILS_VERSION = 2.15.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/33/9f/329d26121fe165be44b1dfff21aa0dc348f04633931f1d20ed6cf448a236
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/01/00/7e89107ea389e952eea73b1b90ac6633e15a519c4a518ee90bb93a2f83dc
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = LICENSE
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
-PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_CSSUTILS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
