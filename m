Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F06FD66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4131761186;
	Wed, 17 Dec 2025 21:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBQlqgOciItT; Wed, 17 Dec 2025 21:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C2B61161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007908;
	bh=3jAAzF89Vqv/JpZMhWXgzt69OvP2TlJtJO16+lsKI1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B8XG+VjXfMS5ETyjwZKNP/WVIlyR8dd+BML+Wo+pFkkhpTeHdo9YjUGC3Z0l5r8tA
	 az3Is7MhdJ9pIJM3wep4Fdvy4fZVftcYGqePijr+N8uxST+q5HFciH1OQeXbfsRMwL
	 8W7PExhfFuavC/jIZd6zTFlAGR+pleNBXNK5DX6H5Thc7ykBDeZkhkPDN9L8CWhPPw
	 RvIxMOMilu5TknfOB0pxXqjJyIYmmYD+Xbyx7ZMnKr0QRZC03OBlQdXZoZDGSjz6BD
	 wvk/uhx8owkL2na4wC6Qv7xhv+ghQE4Dpq0H1BmvsBWHojROvcY+TAa6PbncyhdcCF
	 VLnIean5u92AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22C2B61161;
	Wed, 17 Dec 2025 21:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EFC375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA4040F8B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbIAAcau_E9u for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179EE40F7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 179EE40F7D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0CD848DA; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 564a8ca359836f63cae1e8a69eddc935a1050780
X-Git-Newrev: 7440e901d3eb39ab9be6e6493749eb28d0d8710d
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.0A0CD848DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trove-classifiers: bump
 version to 2025.12.1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=7440e901d3eb39ab9be6e6493749eb28d0d8710d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pypa/trove-classifiers/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-trove-classifiers/python-trove-classifiers.hash | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 008c3a0b3e..5e3bd86638 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  769cd978e6756c423958bbfe76f130d8  trove_classifiers-2025.9.11.17.tar.gz
-sha256  931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd  trove_classifiers-2025.9.11.17.tar.gz
+md5  38bcf32894b739e814f3362ce191b62b  trove_classifiers-2025.12.1.14.tar.gz
+sha256  a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633  trove_classifiers-2025.12.1.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index a556cbd3dd..5a6d8f49d7 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.9.11.17
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.12.1.14
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/ca/9a/778622bc06632529817c3c524c82749a112603ae2bbcf72ee3eb33a2c4f1
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/80/e1/000add3b3e0725ce7ee0ea6ea4543f1e1d9519742f3b2320de41eeefa7c7
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
