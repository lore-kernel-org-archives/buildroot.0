Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E023EC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB2383298;
	Wed,  7 Feb 2024 16:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8ohSfd1tRMe; Wed,  7 Feb 2024 16:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A96A7832B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96A7832B3;
	Wed,  7 Feb 2024 16:01:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBE301BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA07183298
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKy-fRi0mjHy for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85BD82319
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D85BD82319
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C517F875FD; Wed,  7 Feb 2024 16:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:58:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc1181524da559b684320ee4d3a5a0fdd69dc3bc
X-Git-Newrev: 6008f2b1b901be1374ac201b5e560cca61b4b61e
X-Patchwork-Hint: ignore
Message-Id: <20240207160129.C517F875FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: bump to
 version 23.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6008f2b1b901be1374ac201b5e560cca61b4b61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to MIT header added:
https://github.com/pyca/service-identity/commit/a4a82c1b646d07cf2f3b4705ce17f22e6484556c

Migrate from setuptools to hatchling pep517 build backend.

Drop no longer python-pyopenssl runtime dependency.

Drop no longer python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-service-identity/Config.in                    |  2 --
 package/python-service-identity/python-service-identity.hash |  6 +++---
 package/python-service-identity/python-service-identity.mk   | 12 ++++++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 278900971e..dccd8f37c0 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Service identity verification for pyOpenSSL.
 
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index f648918dbd..32d8f21ad4 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
-sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
+md5  14a751406024544784459474d93d1ea5  service_identity-23.1.0.tar.gz
+sha256  ecb33cd96307755041e978ab14f8b14e13b40f1fbd525a4dc78f46d2b986431d  service_identity-23.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
+sha256  51f7c647190e74d19f9f24f1b19645b425eb8f30f049196053686bff188505cf  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index e4ae8e6889..6e61dd951b 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
-PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
+PYTHON_SERVICE_IDENTITY_VERSION = 23.1.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/3b/98/2a46c7414ffc1d06ba67d2c2dd62a207a70cb351028a8cd8c85b3dbd1cf7
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
-PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
+PYTHON_SERVICE_IDENTITY_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs \
+	host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
