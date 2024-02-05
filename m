Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A04EC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24FBB41466;
	Mon,  5 Feb 2024 11:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24FBB41466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKD-mZSyNs2i; Mon,  5 Feb 2024 11:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7C1740B7E;
	Mon,  5 Feb 2024 11:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7C1740B7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0FD41BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C4582A0E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C4582A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji9uFMh26dtS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:25:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3ABE829FE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3ABE829FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B026B86BC0; Mon,  5 Feb 2024 11:25:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:17:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85c5071bfea948fabbac6c3e81103c7979fa6646
X-Git-Newrev: f0a4e392daccac896f3bf07b971377fde56ec484
X-Patchwork-Hint: ignore
Message-Id: <20240205112551.B026B86BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplesqlite: bump to
 version 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0a4e392daccac896f3bf07b971377fde56ec484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-setuptools runtime dependency.

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-simplesqlite/Config.in                | 2 --
 package/python-simplesqlite/python-simplesqlite.hash | 4 ++--
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
index 81501c9e83..d650439dce 100644
--- a/package/python-simplesqlite/Config.in
+++ b/package/python-simplesqlite/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_PYTHON_SIMPLESQLITE
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_SQLITESCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 06edbfab3d..8060437718 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  11f2ef73243fb0d677ed00d22f1441b2  SimpleSQLite-1.3.0.tar.gz
-sha256  f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8  SimpleSQLite-1.3.0.tar.gz
+md5  a907352592539345bf8145c3e39015cb  SimpleSQLite-1.5.2.tar.gz
+sha256  f9a25b9e43d7aa28f551d170a42cfae10139c5c81a1bcb8776f857816ef5ae0f  SimpleSQLite-1.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index ea60cefc16..d8efe23a6c 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 1.3.0
+PYTHON_SIMPLESQLITE_VERSION = 1.5.2
 PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/a0/2c/39a9e7dc4af46d101f48753086c686982790ecc2bdf5e9fa88f85f027e7a
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/c8/07/92e3291fda6f1bbf6e7ff4721d87566e1615572d9c205ef64398c5d22efe
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
