Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50ECC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6820D6124C
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6820D6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 308DC400F3;
	Sun,  3 Oct 2021 08:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OC4d-g08AtFU; Sun,  3 Oct 2021 08:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FDB44019B;
	Sun,  3 Oct 2021 08:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6AD1BF95A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0E561746
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNgthQmv0byX for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8863360ACF
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0158F8DB40; Sun,  3 Oct 2021 08:20:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd817ef6e6c53aed04a7ad97be9c2e0326f583bf
X-Git-Newrev: e72a59b283d9b45c434646e9b70931a1baad80ab
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.0158F8DB40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymysql: bump to version
 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e72a59b283d9b45c434646e9b70931a1baad80ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pymysql/Config.in           | 1 +
 package/python-pymysql/python-pymysql.hash | 6 +++---
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pymysql/Config.in b/package/python-pymysql/Config.in
index 75b447cbd1..69ba485e77 100644
--- a/package/python-pymysql/Config.in
+++ b/package/python-pymysql/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYMYSQL
 	bool "python-pymysql"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  PyMySQL is a pure-Python MySQL client library. It follows
 	  the DB-API 2.0.
diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 36323ca73a..dd81bdab7e 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5	e5d9183cc0a775ac29f9e0365cca6556  PyMySQL-0.9.3.tar.gz
-sha256	d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7  PyMySQL-0.9.3.tar.gz
+md5  3fe6ff2eefb58af5c54d335c6e0216de  PyMySQL-1.0.2.tar.gz
+sha256  816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36  PyMySQL-1.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256	314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
+sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index edb08ee054..3703572f35 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 0.9.3
+PYTHON_PYMYSQL_VERSION = 1.0.2
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/da/15/23ba6592920e21cb40eb0fe0ea002d2b6177beb1ca8a4c1add5a8f32754d
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
