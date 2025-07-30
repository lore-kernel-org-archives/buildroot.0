Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDC0C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C32961455;
	Wed, 30 Jul 2025 19:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1029osAZggQf; Wed, 30 Jul 2025 19:37:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B42B61456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B42B61456;
	Wed, 30 Jul 2025 19:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBEBB12E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD78261456
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VInq6AxMbLXB for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 19:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCBCA61455
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCBCA61455
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:37:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B54FD86D93; Wed, 30 Jul 2025 19:37:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 14:48:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6044cc5f26f8f076ead9a3d22dd84681c7c9e23f
X-Git-Newrev: 56adc0dacd4e07de3242a6acfa9337a12069e0c0
X-Patchwork-Hint: ignore
Message-Id: <20250730193716.B54FD86D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencl-{clhpp, headers,
 icd-loader}: bump version to v2025.07.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=56adc0dacd4e07de3242a6acfa9337a12069e0c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Synchronizes with OpenCL v3.0.19 specification release.

Releases:
https://github.com/KhronosGroup/OpenCL-Headers/releases/tag/v2025.07.22
https://github.com/KhronosGroup/OpenCL-ICD-Loader/releases/tag/v2025.07.22
https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2025.07.22

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
[Julien: factorize package names in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencl-clhpp/opencl-clhpp.hash           | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk             | 2 +-
 package/opencl-headers/opencl-headers.hash       | 2 +-
 package/opencl-headers/opencl-headers.mk         | 2 +-
 package/opencl-icd-loader/opencl-icd-loader.hash | 2 +-
 package/opencl-icd-loader/opencl-icd-loader.mk   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index add8563757..a8f56c5a43 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  51aebe848514b3bc74101036e111f8ee98703649eec7035944831dc6e05cec14  opencl-clhpp-2024.10.24.tar.gz
+sha256  c1031afde6e9eb042e6fcfbc17078f4b437a7e8d55482a1ca6e0fa762d262a89  opencl-clhpp-2025.07.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 4bff6ad73a..dbe90f6b41 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -9,7 +9,7 @@
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
 
-OPENCL_CLHPP_VERSION = 2024.10.24
+OPENCL_CLHPP_VERSION = 2025.07.22
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
diff --git a/package/opencl-headers/opencl-headers.hash b/package/opencl-headers/opencl-headers.hash
index bd8697e43d..535884f68e 100644
--- a/package/opencl-headers/opencl-headers.hash
+++ b/package/opencl-headers/opencl-headers.hash
@@ -1,3 +1,3 @@
 #Locally generated
-sha256  159f2a550592bae49859fee83d372acd152328fdf95c0dcd8b9409f8fad5db93  OpenCL-Headers-2024.10.24.tar.gz
+sha256  98f0a3ea26b4aec051e533cb1750db2998ab8e82eda97269ed6efe66ec94a240  OpenCL-Headers-2025.07.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencl-headers/opencl-headers.mk b/package/opencl-headers/opencl-headers.mk
index 388a86e02e..92f6a7fb1a 100644
--- a/package/opencl-headers/opencl-headers.mk
+++ b/package/opencl-headers/opencl-headers.mk
@@ -9,7 +9,7 @@
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
 
-OPENCL_HEADERS_VERSION = 2024.10.24
+OPENCL_HEADERS_VERSION = 2025.07.22
 OPENCL_HEADERS_SOURCE = OpenCL-Headers-$(OPENCL_HEADERS_VERSION).tar.gz
 OPENCL_HEADERS_SITE = $(call github,KhronosGroup,OpenCL-Headers,v$(OPENCL_HEADERS_VERSION))
 OPENCL_HEADERS_LICENSE = Apache-2.0
diff --git a/package/opencl-icd-loader/opencl-icd-loader.hash b/package/opencl-icd-loader/opencl-icd-loader.hash
index da9f75b63a..347cfe6e91 100644
--- a/package/opencl-icd-loader/opencl-icd-loader.hash
+++ b/package/opencl-icd-loader/opencl-icd-loader.hash
@@ -1,3 +1,3 @@
 # locally generated
-sha256  95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc  OpenCL-ICD-Loader-2024.10.24.tar.gz
+sha256  dff7a0b11ad5b63a669358e3476e3dc889a4a361674e5b69b267b944d0794142  OpenCL-ICD-Loader-2025.07.22.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/opencl-icd-loader/opencl-icd-loader.mk b/package/opencl-icd-loader/opencl-icd-loader.mk
index cb3d7e462d..222f051a75 100644
--- a/package/opencl-icd-loader/opencl-icd-loader.mk
+++ b/package/opencl-icd-loader/opencl-icd-loader.mk
@@ -8,7 +8,7 @@
 # must always be updated together to compatible versions.
 # Version desynchronization may result in build or runtime errors.
 # When updating one of them, make sure to check and update the others.
-OPENCL_ICD_LOADER_VERSION = 2024.10.24
+OPENCL_ICD_LOADER_VERSION = 2025.07.22
 OPENCL_ICD_LOADER_SOURCE = OpenCL-ICD-Loader-$(OPENCL_ICD_LOADER_VERSION).tar.gz
 OPENCL_ICD_LOADER_SITE = $(call github,KhronosGroup,OpenCL-ICD-Loader,v$(OPENCL_ICD_LOADER_VERSION))
 OPENCL_ICD_LOADER_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
