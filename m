Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F4CD0407
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 21:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B89740260;
	Mon,  5 Jan 2026 21:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPBh3LQ643ml; Mon,  5 Jan 2026 21:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450DB40273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767646857;
	bh=nLTdZkheWSLNmFCBubowDUYRVugo/fnGSde8Lmszsy0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aAvYx40Y3tvVnQNkk3jtmvVeYpYZHnJXPQ0euV7okc8EsXAC8JOsDVqj91Zwj+YBY
	 sEu+alEvqN40Vv+CnYckg5L3qQ4LIKvR3PLz6tCY4XnqP7/SH0/ZVk00mW8YeTdeWy
	 gerYDRuxZqsWWuiCw8h7UxUXwen4X+xZievB4MohfO83cj9FurVR6TqfMsqmwr/wCi
	 J93X/sPd/uz9GUKzPHymfXUdY0lz4xj4W+KBofG1NbG/AsOrJYU4p1D6NcTRqDhL2k
	 0TJ+sH7xejYQLECh+FPm33jesJ7Up5PTPDJGGYclRLMPLJ5bvDNovRgnUrm/lz1Ezb
	 Tt5PzBGQLCeOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450DB40273;
	Mon,  5 Jan 2026 21:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B7EB249
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A6424007D
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_ovlZwNdyZG for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 21:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28174005C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28174005C
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37F6882C1; Mon,  5 Jan 2026 21:00:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 21:54:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6db2d76b703f7662565ecedefda5e4af49bc7f30
X-Git-Newrev: 898677d8b357f2080c61cce6ef3d0fb0b7689d6e
X-Patchwork-Hint: ignore
Message-Id: <20260105210051.D37F6882C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy: bump to version 1.19.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=898677d8b357f2080c61cce6ef3d0fb0b7689d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to addition of base64 license which
is BSD-2-Clause:
https://github.com/python/mypy/commit/8f922b3d879f31e4c52c1c643de70e27b5720654

Add new python-librt build/runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 6 +++---
 package/python-mypy/python-mypy.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 6c58bc4fc1..2ac5bd7c76 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_LIBRT # runtime
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 9f1656ddce..a31cb5dba6 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
-sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
+md5  a23b930a86aa298a97b72da06ee84084  mypy-1.19.1.tar.gz
+sha256  19d88bb05303fe63f71dd2c6270daca27cb9401c4ca8255fe50d1d920e0eb9ba  mypy-1.19.1.tar.gz
 # Locally computed sha256 checksums
-sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
+sha256  fdf1cd17f50e1305ed8cfd37467312d27a984648dba622cef70573b5512e4e1b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index ba07ef5b9c..4b02753978 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.2
+PYTHON_MYPY_VERSION = 1.19.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f5/db/4efed9504bc01309ab9c2da7e352cc223569f05478012b5d9ece38fd44d2
 PYTHON_MYPY_SETUP_TYPE = setuptools
-PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-librt \
 	host-python-mypy-extensions \
 	host-python-pathspec \
 	host-python-types-psutil \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
