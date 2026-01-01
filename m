Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD00EEEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0CC81E16;
	Thu,  1 Jan 2026 09:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aYbzt-UKT8X; Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AF3D81E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260578;
	bh=M/JEV9WLYQuHewpSdvg9EiJR1Kcsc8xvSwNX2MNKeAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jb9uHbnZzLWmUBY41EVy3PjSHt8WuxATHseAvlo3mMwQB7kcQuLpCYSW4TEicPFl3
	 7pg8l77sLDOnucG+0Y36/abnn6aSJBvRZdNUGKiCV2WkxYR9qPkKZCdDqknFJpqYgp
	 de52umnG/JNKl4/BxgxA8wJ4FgpViBReuaikzxgkNTYraNsRinrhDMCtcgTghgVl0+
	 wUWqoqSYzzSqyOkAVL3CjG1frxFZjX9byD9gVNHMAOdnOp7oPlqq8ndiiXSn2jNToG
	 1Ty1eJyvlhgGDXxnJec8u0Om8ocpYP8Pp2S+8d26q/VLX7IhPAS/c/37+a95lAiJ35
	 tHziRfmRcFSvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF3D81E5C;
	Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDE4351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F6158156C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S203Fz1TMN22 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5610581584
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5610581584
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 545BB86FB6; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d3f9eaf88cbe9eb5d5443b402e6ada061896ebd
X-Git-Newrev: 2d19a0b332dc17c18533b8d909986c235bc4648b
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.545BB86FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{python-}protobuf: bump to version
 33.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d19a0b332dc17c18533b8d909986c235bc4648b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to set -Dprotobuf_BUILD_LIBUPB=ON for host-protobuf now
as some libupb headers now appear to be required.

Also set the new -Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON option
to ensure cmake doesn't try to download dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 6 ++++--
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 98159ad897..db91cf296b 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e  protobuf-29.3.tar.gz
+sha256  6b6599b54c88d75904b7471f5ca34a725fa0af92e134dd1a32d5b395aa4b4ca8  protobuf-33.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4540443702..e2158216c4 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 29.3
+PROTOBUF_VERSION = 33.2
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
@@ -26,6 +26,7 @@ PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_BUILD_TESTS=OFF \
 	-Dprotobuf_DISABLE_RTTI=OFF \
 	-Dprotobuf_INSTALL=ON \
+	-Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
 	-DWITH_PROTOC=$(HOST_DIR)/bin/protoc
 
 HOST_PROTOBUF_DEPENDENCIES = host-libabseil-cpp
@@ -34,12 +35,13 @@ HOST_PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_ALLOW_CCACHE=ON \
 	-Dprotobuf_BUILD_CONFORMANCE=OFF \
 	-Dprotobuf_BUILD_LIBPROTOC=ON \
-	-Dprotobuf_BUILD_LIBUPB=OFF \
+	-Dprotobuf_BUILD_LIBUPB=ON \
 	-Dprotobuf_BUILD_PROTOBUF_BINARIES=ON \
 	-Dprotobuf_BUILD_PROTOC_BINARIES=ON \
 	-Dprotobuf_BUILD_TESTS=OFF \
 	-Dprotobuf_DISABLE_RTTI=OFF \
 	-Dprotobuf_INSTALL=ON \
+	-Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
 	-Dprotobuf_WITH_ZLIB=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1e1833980c..fdfbc4b4f1 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  26ee22a630b0dbfce4de03adc5600fbc  protobuf-5.29.3.tar.gz
-sha256  5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620  protobuf-5.29.3.tar.gz
+md5  59060f8bb01846579e5c8d95917ad925  protobuf-6.33.2.tar.gz
+sha256  56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4  protobuf-6.33.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 898a133d37..8db9a2f621 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f7/d1/e0a911544ca9993e0f17ce6d3cc0932752356c1b0a834397f28e63479344
+PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/34/44/e49ecff446afeec9d1a66d6bbf9adc21e3c7cea7803a920ca3773379d4f6
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
