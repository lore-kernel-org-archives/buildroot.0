Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544D0C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 11:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204E8404EF;
	Sun,  4 Jan 2026 11:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xtVjv3H_Sfp; Sun,  4 Jan 2026 11:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413AF40584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767525509;
	bh=OSz3ncr092E9zCF4NI5PU20VXolw9nrcTD75205VB9M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M+zPDyCAmSGqku8eUCeiCbZQPw89sWH0j8TKubUig8SdtyGPcqDcLlk0GX+dgjH4d
	 Cxfn9rAZ2VY67IJnMu0dxYlE6sE+KvYeZOmPz6u16BQXBOOG/1X+mkZOEfIUsTupAP
	 GXgVaPhyEMckUFGyegPgVB5ELlSHjZGPYROWaVFvuZ1v5a+abuY0qK81LAL0kVJhcI
	 oGD4d986NIK36VJce0eru1ucab6eIagXpfW+yAz85Fxvh1B81P6yiRQqEFyYbQWbFp
	 v/xdYBOurNklc/r7NZ5yA2z/bRLeifoql5W0PyU61eriSbcoMyjXconvwRLRrPG6cz
	 r0fyZTJUB0cWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413AF40584;
	Sun,  4 Jan 2026 11:18:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8ABA37A
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAEED6062E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEDdbTqezwox for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 11:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91C560625
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E91C560625
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9F1E881AC; Sun,  4 Jan 2026 11:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 12:02:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c21d39cb3133c8ebf769355a34c97ef2133c5f0
X-Git-Newrev: cf2ce6de553e04bbf428000ceb50173ed278ad66
X-Patchwork-Hint: ignore
Message-Id: <20260104111826.D9F1E881AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 9.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf2ce6de553e04bbf428000ceb50173ed278ad66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-ipython-pygments-lexers runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ipython/Config.in           | 3 ++-
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 8ab5516910..32c1f9a64e 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	select BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE # runtime
+	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
-	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
 	select BR2_PACKAGE_PYTHON_STACK_DATA # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 8186b5c09d..022975d976 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  5c629ec6cc81a8d5eecea3956e670d54  ipython-8.31.0.tar.gz
-sha256  b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b  ipython-8.31.0.tar.gz
+md5  777fdd0c2ec7b2fd1062071056cda377  ipython-9.8.0.tar.gz
+sha256  8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83  ipython-9.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 2bc4b54ef7..8af5b3c312 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.31.0
+PYTHON_IPYTHON_VERSION = 9.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/01/35/6f90fdddff7a08b7b715fccbd2427b5212c9525cd043d26fdc45bee0708d
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/12/51/a703c030f4928646d390b4971af4938a1b10c9dfce694f0d99a0bb073cb2
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
