Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6087C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB7140259;
	Tue,  9 Jul 2024 21:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLHhkMlZNlRT; Tue,  9 Jul 2024 21:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FDE04135B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FDE04135B;
	Tue,  9 Jul 2024 21:35:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 803DF1BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6AA4031E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqwItxun2OgL for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 633BE40259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 633BE40259
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 508C184492; Tue,  9 Jul 2024 21:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 23:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daa5d775d729efd529ff7ff8c58c0380018f1e42
X-Git-Newrev: 14388ca1b695a808c329fac8bd3470f17193785f
X-Patchwork-Hint: ignore
Message-Id: <20240709213457.508C184492@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sniffio: bump to version
 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=14388ca1b695a808c329fac8bd3470f17193785f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sniffio/python-sniffio.hash | 4 ++--
 package/python-sniffio/python-sniffio.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-sniffio/python-sniffio.hash b/package/python-sniffio/python-sniffio.hash
index 00af7c58bb..989e31d196 100644
--- a/package/python-sniffio/python-sniffio.hash
+++ b/package/python-sniffio/python-sniffio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sniffio/json
-md5  abb96bcda81817d6c632915c53ac29c8  sniffio-1.3.0.tar.gz
-sha256  e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101  sniffio-1.3.0.tar.gz
+md5  1673edc4dfeb739130a87bcd7b477864  sniffio-1.3.1.tar.gz
+sha256  f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc  sniffio-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  652c878488d1456361e08c3f8607fd7ba59892a14103d15cce4ff93c85b5cc8b  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-sniffio/python-sniffio.mk b/package/python-sniffio/python-sniffio.mk
index fa369a0e2f..120794d77c 100644
--- a/package/python-sniffio/python-sniffio.mk
+++ b/package/python-sniffio/python-sniffio.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SNIFFIO_VERSION = 1.3.0
+PYTHON_SNIFFIO_VERSION = 1.3.1
 PYTHON_SNIFFIO_SOURCE = sniffio-$(PYTHON_SNIFFIO_VERSION).tar.gz
-PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac
+PYTHON_SNIFFIO_SITE = https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd
 PYTHON_SNIFFIO_SETUP_TYPE = setuptools
 PYTHON_SNIFFIO_LICENSE = Apache-2.0 or MIT
 PYTHON_SNIFFIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+PYTHON_SNIFFIO_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
