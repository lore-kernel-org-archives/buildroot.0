Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D84C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 12:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D097860594;
	Tue,  6 Aug 2024 12:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-v8Cjp63Y9u; Tue,  6 Aug 2024 12:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC85A6074F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC85A6074F;
	Tue,  6 Aug 2024 12:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3073F1BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 12:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1984E8059D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 12:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDZCmM4NI0Al for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 12:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CCB08059B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CCB08059B
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 12:04:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CFC8415D; Tue,  6 Aug 2024 12:04:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 13:59:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d70bbedd0d284744521ca3bc68984f6d8057ee50
X-Git-Newrev: cc7fb688b06fd67c7fff6dfea0fae33c740f9dbd
X-Patchwork-Hint: ignore
Message-Id: <20240806120452.23CFC8415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: security bump to version
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc7fb688b06fd67c7fff6dfea0fae33c740f9dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The release notes for version 1.1.0 mention fixes for memory handling
issues and bugs found out by fuzzing, which is the reason why this may
be considered a security update, despite them not having CVEs assigned:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.0
  https://github.com/AOMediaCodec/libavif/releases/tag/v1.1.1

The change checksum for the LICENSE file is caused by a path change for
one of the submodules, and the addition of the licensing terms for the
bundled libyuv sources. The latter are never built from the libavif tree
as there is a separate libyuv package, so BSD-3-Clause does not need to
be added to LIBAVIF_LICENSE.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libavif/libavif.hash | 4 ++--
 package/libavif/libavif.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index f4599cdb0b..b26e678abf 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146  libavif-1.0.4.tar.gz
+sha256  914662e16245e062ed73f90112fbb4548241300843a7772d8d441bb6859de45b  libavif-1.1.1.tar.gz
 
-sha256  10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639  LICENSE
+sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 1ca3add82b..0c2a8e4dae 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.0.4
+LIBAVIF_VERSION = 1.1.1
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
@@ -19,17 +19,18 @@ LIBAVIF_CONF_OPTS = \
 	-DAVIF_BUILD_MAN_PAGES=OFF \
 	-DAVIF_BUILD_TESTS=OFF \
 	-DAVIF_CODEC_AOM=OFF \
-	-DAVIF_CODEC_DAV1D=ON \
+	-DAVIF_CODEC_DAV1D=SYSTEM \
 	-DAVIF_CODEC_LIBGAV1=OFF \
 	-DAVIF_CODEC_RAV1E=OFF \
 	-DAVIF_CODEC_SVT=OFF \
 	-DAVIF_CODEC_AVM=OFF \
 	-DAVIF_ENABLE_GTEST=OFF
 
-# There is no CMake options to explicitly enable/disable usage of
-# libyuv, only autodetection :-(
 ifeq ($(BR2_PACKAGE_LIBYUV),y)
 LIBAVIF_DEPENDENCIES += libyuv
+LIBAVIF_CONF_OPTS += -DAVIF_LIBYUV=SYSTEM
+else
+LIBAVIF_CONF_OPTS += -DAVIF_LIBYUV=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
