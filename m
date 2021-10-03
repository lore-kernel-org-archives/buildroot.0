Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5D6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B737161872
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B737161872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A03C84960;
	Sun,  3 Oct 2021 19:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHrI4XSTTmWo; Sun,  3 Oct 2021 19:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB20F84966;
	Sun,  3 Oct 2021 19:58:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205381BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5FF440186
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6HuiBn9zw6N for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD43340575
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3CBD787B03; Sun,  3 Oct 2021 19:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:51:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed89ba44e6cd6a03a3cb97cf299da69c42d9107
X-Git-Newrev: 70440e28c8eefd469f6994c524d062dee168493e
X-Patchwork-Hint: ignore
Message-Id: <20211003195309.3CBD787B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump to version 2021.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=70440e28c8eefd469f6994c524d062dee168493e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list (added python-jedi).
* The package is python3-only, and not because of pygments, so
  the comment after the "depends on" can be removed.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pudb/.Config.in.swp   | Bin 0 -> 1024 bytes
 package/python-pudb/Config.in        |   3 ++-
 package/python-pudb/python-pudb.hash |   6 +++---
 package/python-pudb/python-pudb.mk   |   4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pudb/.Config.in.swp b/package/python-pudb/.Config.in.swp
new file mode 100644
index 0000000000..eb0c0ba873
Binary files /dev/null and b/package/python-pudb/.Config.in.swp differ
diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
index b3a93058b5..64789021d1 100644
--- a/package/python-pudb/Config.in
+++ b/package/python-pudb/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_PUDB
 	bool "python-pudb"
-	depends on BR2_PACKAGE_PYTHON3 # pygments
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_URWID # runtime
+	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_CURSES # runtime
diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index b3c089b85f..fc19f589d9 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5	4c024311d3f53bc189084821e7ef7d5e  pudb-2019.1.tar.gz
-sha256	ac30cfc64580958ab7265decb4cabb9141f08781ff072e9a336d5a7942ce35a6  pudb-2019.1.tar.gz
+md5  100b955e103b72279604420bbdcd07a5  pudb-2021.1.tar.gz
+sha256  309ee82b45a0ffca0bc4c7f521fd3e357589c764f339bdf9dcabb7ad40692d6e  pudb-2021.1.tar.gz
 # Locally computed sha256 checksums
-sha256	a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
+sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 6a462bf3e5..31df3147d0 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2019.1
+PYTHON_PUDB_VERSION = 2021.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/32/2a/96f72649e5dfc90cf69d8590c00884c6897d6cbc54f727fb40f47b4faae3
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/c7/69/813e93519fc28744457ff68fa2eaac3b4ea30dda1e6994e969fe9d3008d9
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
