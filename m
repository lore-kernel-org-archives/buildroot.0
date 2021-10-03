Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C35C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A08E61872
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A08E61872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6758661710;
	Sun,  3 Oct 2021 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3pFUtLrSB6V; Sun,  3 Oct 2021 19:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF9B614BF;
	Sun,  3 Oct 2021 19:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BECD1BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF2C401BC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWq66tQlggSC for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8B440572
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1BF0787B03; Sun,  3 Oct 2021 19:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:42:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e96980865938044a08854a056ae11bdf6e10cb9
X-Git-Newrev: 7b6a46f9842a8a751720b31bb5825ad19c9ad1a8
X-Patchwork-Hint: ignore
Message-Id: <20211003195309.1BF0787B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-priority: bump to version
 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b6a46f9842a8a751720b31bb5825ad19c9ad1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* The two reverse dependencies, crossbar and twisted, already depend on
  python3

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[yann.morin.1998@free.fr: add note about crossbar and twisted]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-priority/Config.in            | 1 +
 package/python-priority/python-priority.hash | 8 ++++----
 package/python-priority/python-priority.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-priority/Config.in b/package/python-priority/Config.in
index b73b7e2ad4..8ac2d13824 100644
--- a/package/python-priority/Config.in
+++ b/package/python-priority/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PRIORITY
 	bool "python-priority"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A pure-Python implementation of the HTTP/2 priority tree.
 
diff --git a/package/python-priority/python-priority.hash b/package/python-priority/python-priority.hash
index c947375700..88fc9adac1 100644
--- a/package/python-priority/python-priority.hash
+++ b/package/python-priority/python-priority.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/priority/json
-md5	4f1ff52f7fa448e9d9cb46337ae86d1e  priority-1.3.0.tar.gz
-# Locally computed
-sha256	6bc1961a6d7fcacbfc337769f1a382c8e746566aaa365e78047abe9f66b2ffbe  priority-1.3.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/priority/json
+md5  149531bf0e754782cf218bfc8cc994ae  priority-2.0.0.tar.gz
+sha256  c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0  priority-2.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  f3e9c29e3db36dc305a4be68a8a225f93949852ce2d19b5b0a3c099eee6509c5  LICENSE
diff --git a/package/python-priority/python-priority.mk b/package/python-priority/python-priority.mk
index 8b6dbc1e4f..6e141c3e37 100644
--- a/package/python-priority/python-priority.mk
+++ b/package/python-priority/python-priority.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PRIORITY_VERSION = 1.3.0
+PYTHON_PRIORITY_VERSION = 2.0.0
 PYTHON_PRIORITY_SOURCE = priority-$(PYTHON_PRIORITY_VERSION).tar.gz
-PYTHON_PRIORITY_SITE = https://pypi.python.org/packages/ba/96/7d0b024087062418dfe02a68cd6b195399266ac002fb517aad94cc93e076
+PYTHON_PRIORITY_SITE = https://files.pythonhosted.org/packages/f5/3c/eb7c35f4dcede96fca1842dac5f4f5d15511aa4b52f3a961219e68ae9204
 PYTHON_PRIORITY_SETUP_TYPE = setuptools
 PYTHON_PRIORITY_LICENSE = MIT
 PYTHON_PRIORITY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
