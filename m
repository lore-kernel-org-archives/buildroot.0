Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7521C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1AFD60F39
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1AFD60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F51E81064;
	Wed,  3 Nov 2021 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yoY04JCFHgN; Wed,  3 Nov 2021 21:17:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEB4814A1;
	Wed,  3 Nov 2021 21:17:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7C141BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95405606B3
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wf5mRfylRC2s for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:17:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC99D60AED
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:17:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4052F8A474; Wed,  3 Nov 2021 21:13:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:16:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 349f5bcfb0ce6cb28f5c678db8a99fee0da5dd63
X-Git-Newrev: 47db4e74c9adaba38243946b00890ce8ea716333
X-Patchwork-Hint: ignore
Message-Id: <20211103211334.4052F8A474@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-artifact: bump to version
 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=47db4e74c9adaba38243946b00890ce8ea716333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
- Update license files hash due to the progressbar library changing versions
from v0.0.2 to v0.0.3

- Remove HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact as
commit a79edc3e7632f38de0dfeaa5a3c72567318e8079 removed the
cli/mender-artifact directory.

- Change -X main.Version= to
  -X github.com/mendersoftware/mender-artifact/cli.Version

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-artifact/mender-artifact.hash | 6 +++---
 package/mender-artifact/mender-artifact.mk   | 6 ++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 175865bb67..27f18862bc 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  8f5b69a6598dc071e6a0f2102dbd38a003e7db6be5794116d701531d6a740a46  mender-artifact-3.5.1.tar.gz
-sha256  0afbd1092d57f70da125041350363c3761802e807be80c7f1dfc005fea962b25  LIC_FILES_CHKSUM.sha256
+sha256  c46c305616cf53e65b786862addf04d97c388e451f11478886967b494c4ce5d9  mender-artifact-3.6.1.tar.gz
+sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -10,7 +10,7 @@ sha256  0afbd1092d57f70da125041350363c3761802e807be80c7f1dfc005fea962b25  LIC_FI
 # Apache 2.0 licenses.
 sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
-sha256  f4a394d9345ba64dd2796dc552c31af99c4b686a46c0eeda6538038732f771a9  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
 #
 # BSD 2 Clause licenses.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 8a77e67b8c..34d0cd9469 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.5.1
+HOST_MENDER_ARTIFACT_VERSION = 3.6.1
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
@@ -39,9 +39,7 @@ HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 # permission issues when cleaning.
 HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
 
-HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
-
-HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
+HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
 HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
