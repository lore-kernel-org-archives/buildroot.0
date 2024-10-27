Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B811DD13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 708DC80D2C;
	Sun, 27 Oct 2024 18:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMkZ2anL3j_o; Sun, 27 Oct 2024 18:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8296480CEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8296480CEA;
	Sun, 27 Oct 2024 18:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A815123
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B2E607EB
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdOf9BvKlpsu for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D61F6607E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D61F6607E3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB52684138; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20e85ab9cf1465e42b144ed49ff5501bce749d35
X-Git-Newrev: 86f77e8cada2810e4b229a36ab6ae42f078f2aa3
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.BB52684138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump to version
 2024.1.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=86f77e8cada2810e4b229a36ab6ae42f078f2aa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatch build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index dd67b9fd81..9918f3e041 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  8452e5d114a58a63b6c7781452980171  pudb-2024.1.2.tar.gz
-sha256  adc9b00042ba8367117df0a6c0dc62fa9609abd21c3bf8e5b73d620907c5b43e  pudb-2024.1.2.tar.gz
+md5  dc73886506e57c8ba2116e5cbe112fb8  pudb-2024.1.3.tar.gz
+sha256  264f239e0538e52e83d3d020143100b3171cae17227674bb1b9f8b075f34849c  pudb-2024.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index cad1bf00bf..4dedda0bc2 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2024.1.2
+PYTHON_PUDB_VERSION = 2024.1.3
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/54/70/fc7d81b7ac439d5e21c8c2b51e15cdc6632b720b02219057fe098a80e766
-PYTHON_PUDB_SETUP_TYPE = setuptools
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/36/27/fb087bdf2cd9c8e56d0347b863ce5995967c15a3e2a0b9245c7a8f6f1598
+PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
