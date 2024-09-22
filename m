Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E9FCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E733081F77;
	Sun, 22 Sep 2024 10:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoG_9eGSjhNi; Sun, 22 Sep 2024 10:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A7F820EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A7F820EA;
	Sun, 22 Sep 2024 10:36:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA76B1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C852740652
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqZtuM_6vyOl for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C51C40636
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C51C40636
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47CAC811F3; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 478f4a0b3a64e3d32d65892f3b606f0b0d67d6ea
X-Git-Newrev: cd02650a580b25192a587bf6b467f81be8de6330
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.47CAC811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tpm2-pytss: bump to version
 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd02650a580b25192a587bf6b467f81be8de6330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-packaging runtime dependency.

Add new python-pyyaml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tpm2-pytss/Config.in              | 2 ++
 package/python-tpm2-pytss/python-tpm2-pytss.hash | 4 ++--
 package/python-tpm2-pytss/python-tpm2-pytss.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
index dec9a311d4..e66df9f0b0 100644
--- a/package/python-tpm2-pytss/Config.in
+++ b/package/python-tpm2-pytss/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 	select BR2_PACKAGE_TPM2_TSS
 	help
 	  TPM 2.0 TSS Bindings for Python.
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
index 10a9f112b7..0e73f6d460 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.hash
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
-md5  069a02c99d3203fada940c3dd43b699c  tpm2-pytss-2.2.1.tar.gz
-sha256  b8f15473422f377f59c7217dcd1479165cce62dfa33934ec976a278baf2e9efe  tpm2-pytss-2.2.1.tar.gz
+md5  241696dfce31c539ae418a5d3587b945  tpm2-pytss-2.3.0.tar.gz
+sha256  20071129379656f5f3c3bc16d364612672b147d81191fb4eb9f9ff9fbee48410  tpm2-pytss-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
index 80491aac46..9a192fc7ca 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.mk
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TPM2_PYTSS_VERSION = 2.2.1
+PYTHON_TPM2_PYTSS_VERSION = 2.3.0
 PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
-PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/13/e5/8d4a9ac91579c741ec9fb63befcf6577107f22f3508c364fd53e277d7237
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520
 PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
 PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
 PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
