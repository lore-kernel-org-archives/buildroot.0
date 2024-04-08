Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFA9CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 513EF41468;
	Mon,  8 Apr 2024 21:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88plGqS1HXNB; Mon,  8 Apr 2024 21:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9318C4146D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9318C4146D;
	Mon,  8 Apr 2024 21:01:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 007A91BF95D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED08A81EB3
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVKROJG1NZyR for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB3C81EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB3C81EBA
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16CD485C8D; Mon,  8 Apr 2024 21:01:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 23:00:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f2d16b277e038c63e6cbbf65296c94dd88db4d9
X-Git-Newrev: fcfad666dafe66ab4f4f8b63f7ecc0c522894372
X-Patchwork-Hint: ignore
Message-Id: <20240408210131.16CD485C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump to version 2024.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcfad666dafe66ab4f4f8b63f7ecc0c522894372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since commit
8937db8dd595e0988751e5dbb568e870b07b39cc thanks to
https://github.com/inducer/pudb/commit/8c8f9d4a25e226e77a18d4d938eecf2f969e9b32:

FileExistsError: File already exists: /home/buildroot/instance-0/output-1/target/usr/lib/python3.11/site-packages/test/__init__.py

https://github.com/inducer/pudb/compare/v2023.1...v2024.1

Fixes: 8937db8dd595e0988751e5dbb568e870b07b39cc
 - http://autobuild.buildroot.org/results/0e3b15b9d02dda231f768595cdcff4e75ad71afd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 08afc67b76..a6d6b9dbae 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  81178e875fd7e15237267c3055e447a3  pudb-2023.1.tar.gz
-sha256  15df3c603aba87a918a666ef8e1bf63f764238cc3589db3c5b7a5f1b01ea2f03  pudb-2023.1.tar.gz
+md5  65639ff646f9e1f452446f4364b2e47f  pudb-2024.1.tar.gz
+sha256  fc9d6a976a59b590764c8379ec200fecd47faa84259b64efd8cd86066a0af338  pudb-2024.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index ff13efb773..68fe3850ac 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2023.1
+PYTHON_PUDB_VERSION = 2024.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/96/d3/a471fe68788178f2a5024031a153673df72b9287530f32b0cd469d64a68a
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/b3/a1/db467e7c828e2ced173d9dbb47abc17ca0e0b3225cb1f4066293e63a2ed9
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
