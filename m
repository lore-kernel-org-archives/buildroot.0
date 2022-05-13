Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF2D414C6;
	Fri, 13 May 2022 22:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfBihpuGhZdO; Fri, 13 May 2022 22:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD0341526;
	Fri, 13 May 2022 22:16:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1901BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5E874093B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nf19dlerd5LS for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8EC34015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A38A185E29; Fri, 13 May 2022 22:00:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b931400a27cab4aeebbadc0caca55d41300c739
X-Git-Newrev: a072b2c07efcbc2b8398a0c124f72ed7e0845e34
X-Patchwork-Hint: ignore
Message-Id: <20220513220045.A38A185E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: bump to
 version 21.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a072b2c07efcbc2b8398a0c124f72ed7e0845e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop BR2_PACKAGE_PYTHON_CHARACTERISTIC runtime dependency which is no
longer used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-service-identity/Config.in                    | 1 -
 package/python-service-identity/python-service-identity.hash | 8 ++++----
 package/python-service-identity/python-service-identity.mk   | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index aa6d0fe715..d6ca060562 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 9a20d08925..f648918dbd 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/service_identity/json
-md5	c6b8bac93e7d899a1da313a19cc6570a  service_identity-18.1.0.tar.gz
-sha256	0858a54aabc5b459d1aafa8a518ed2081a285087f349fe3e55197989232e2e2d  service_identity-18.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/service-identity/json
+md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
+sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
+sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 5330239e48..e4ae8e6889 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 18.1.0
-PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/9a/3d/9eb0563e066ea0540cf580695593ab079376e920016d4d1b3ff2fd8abf4b
+PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
