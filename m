Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FACAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6160641310;
	Tue, 16 Sep 2025 21:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0N65c7CGGNK; Tue, 16 Sep 2025 21:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99858412FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99858412FC;
	Tue, 16 Sep 2025 21:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4FD279
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F97741DB2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umDt-Nz1OB7o for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AAA941DC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AAA941DC6
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1667784EFA; Tue, 16 Sep 2025 21:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07903d2b274bc98f930e06dee237682015acb1d7
X-Git-Newrev: ef0526fef339d69c2b361fa609d4997068d5de45
X-Patchwork-Hint: ignore
Message-Id: <20250916211649.1667784EFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 45.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef0526fef339d69c2b361fa609d4997068d5de45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-pkgconf dependency which is needed for finding openssl.

Set OPENSSL_NO_VENDOR=1 in the environment to ensure we use the
system openssl library.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 148e28aa9d..02b2b891e2 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  fee8ee88b2661e0cfcb14285abd3cf292d36aa6ee72e9f76d0c0d8ad010e1c27  python-cryptography-44.0.1-cargo4.tar.gz
+sha256  9c070a97c37b4cc487737fa7a1fec27c2d44ba54c39f1c2cc558b2b9878283f9  python-cryptography-45.0.7-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fd2c3d7a50..8455c4b9ac 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 44.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 45.0.7
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/c7/67/545c79fe50f7af51dbad56d16b23fe33f63ee6a5d956b3cb68ea110cbe64
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/a7/35/c495bffc2056f2dadb32434f1feedd79abde2a7f8363e1974afa9c33c7e2
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
@@ -15,13 +15,17 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-pkgconf \
 	host-python-cffi \
 	host-python-setuptools \
 	openssl
 HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-pkgconf \
 	host-python-cffi \
 	host-python-setuptools \
 	host-openssl
+PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
+HOST_PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
 PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
 HOST_PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
