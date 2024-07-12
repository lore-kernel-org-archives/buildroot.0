Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E7EC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8961F400F0;
	Fri, 12 Jul 2024 14:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1pDU6a6a1RW; Fri, 12 Jul 2024 14:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C0E40199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C0E40199;
	Fri, 12 Jul 2024 14:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A146B1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FFF684685
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzUWKgSR_eoo for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B997F8467C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B997F8467C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0FD585FCC; Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:37:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca9e08277c473de1d0119768661ce0ba96559a7a
X-Git-Newrev: 0c06715849224e8fa140d685e146cc614f895606
X-Patchwork-Hint: ignore
Message-Id: <20240712143952.B0FD585FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bcrypt: bump to version
 4.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c06715849224e8fa140d685e146cc614f895606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from generic setuptools infrastructure to setuptools-rust
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bcrypt/python-bcrypt.hash |  2 +-
 package/python-bcrypt/python-bcrypt.mk   | 19 ++++---------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 8e660a158b..f3e0517429 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  f0b2c7d5d79a6537e3d291b07d2be70dd122a15ea871854d4ce95b447c6873a5  python-bcrypt-4.0.1-cargo2.tar.gz
+sha256  630f29d9eccca3aea0521eaeff7e4aab43611f1bbf4f8afcdf590aeee9fc8187  python-bcrypt-4.1.3-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index f3137401d7..3d1aeab288 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,24 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.0.1
+PYTHON_BCRYPT_VERSION = 4.1.3
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/ca/e9/0b36987abbcd8c9210c7b86673d88ff0a481b4610630710fb80ba5661356
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_BCRYPT_SETUP_TYPE = setuptools
+PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-PYTHON_BCRYPT_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-rustc
-PYTHON_BCRYPT_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_BCRYPT_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
+PYTHON_BCRYPT_CARGO_MANIFEST_PATH = src/_bcrypt/Cargo.toml
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
