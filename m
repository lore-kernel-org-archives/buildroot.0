Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE26AC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CCCF403EA;
	Wed, 20 Dec 2023 20:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCCF403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1C21905cnPzE; Wed, 20 Dec 2023 20:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C8CB436E6;
	Wed, 20 Dec 2023 20:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8CB436E6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F21D1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E29140152
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E29140152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9n3wcGc10clA for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CD7F40029
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CD7F40029
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A9658386E; Wed, 20 Dec 2023 20:47:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:46:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 713a71c73084f9c610dac71df526c8d7c84bf1cf
X-Git-Newrev: 088dd5fd3f81e929831d846f3afac035fbc079da
X-Patchwork-Hint: ignore
Message-Id: <20231220204701.6A9658386E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump to version 2023.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=088dd5fd3f81e929831d846f3afac035fbc079da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-urwid-readline runtime dependency.

Add new python-packaging runtime dependency.

Remove no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pudb/Config.in        | 3 ++-
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pudb/Config.in b/package/python-pudb/Config.in
index 06f1b20c26..2bdd689121 100644
--- a/package/python-pudb/Config.in
+++ b/package/python-pudb/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_PUDB
 	bool "python-pudb"
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_URWID # runtime
+	select BR2_PACKAGE_PYTHON_URWID_READLINE # runtime
 	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_CURSES # runtime
 	help
 	  A full-screen, console-based Python debugger.
diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 1ae15ad8a6..08afc67b76 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  cda1c28dc52318162e2b131280f09960  pudb-2022.1.3.tar.gz
-sha256  58e83ada9e19ffe92c1fdc78ae5458ef91aeb892a5b8f0e7379e6fa61e0e664a  pudb-2022.1.3.tar.gz
+md5  81178e875fd7e15237267c3055e447a3  pudb-2023.1.tar.gz
+sha256  15df3c603aba87a918a666ef8e1bf63f764238cc3589db3c5b7a5f1b01ea2f03  pudb-2023.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index a357c34c44..ff13efb773 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2022.1.3
+PYTHON_PUDB_VERSION = 2023.1
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/85/a5/f1fd378f56bd8168b5921fd09d4b84fd8101a90e81402a509796caea2094
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/96/d3/a471fe68788178f2a5024031a153673df72b9287530f32b0cd469d64a68a
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
