Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55A8CCD1A4
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 533B58187F;
	Fri, 17 Oct 2025 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OONTVkS7bSOz; Fri, 17 Oct 2025 16:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7293809A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7293809A4;
	Fri, 17 Oct 2025 16:33:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D12AD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63BBB809A4
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujFO8gLRj5LT for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B038B80991
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B038B80991
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EA8A83933; Fri, 17 Oct 2025 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 960cbf71ae35b74ba43944d32c34dcb026eac74e
X-Git-Newrev: 6d0251c9d57cff04dbd43b2cb4aa0876e7978d03
X-Patchwork-Hint: ignore
Message-Id: <20251017163329.9EA8A83933@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: bump version to 1.7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d0251c9d57cff04dbd43b2cb4aa0876e7978d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependencies to python-cffi & python-patch-ng due to upstream
commit:
https://github.com/jnwatson/py-lmdb/commit/3f6f458df64fdbf4a2dbc5ec0aa407b640ef00e2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-lmdb/Config.in        | 2 ++
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
index b63af96ec4..a94badbe76 100644
--- a/package/python-lmdb/Config.in
+++ b/package/python-lmdb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_LMDB
 	bool "python-lmdb"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_PATCH_NG # runtime
 	help
 	  Universal Python binding for the LMDB 'Lightning' Database.
 
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index f729c197f8..525c434f2a 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
-sha256  d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  lmdb-1.6.2.tar.gz
+md5  0996b2df3b8019b76ce1fa37913e41f0  lmdb-1.7.5.tar.gz
+sha256  f0604751762cb097059d5412444c4057b95f386c7ed958363cf63f453e5108da  lmdb-1.7.5.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 1648ed7054..3f92ef066f 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.6.2
+PYTHON_LMDB_VERSION = 1.7.5
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c7/a3/3756f2c6adba4a1413dba55e6c81a20b38a868656517308533e33cb59e1c
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
 PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
