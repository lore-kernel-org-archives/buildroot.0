Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B02C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739F0610A2
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 739F0610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A4D80D10;
	Tue, 12 Oct 2021 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDkAJVrF1iSa; Tue, 12 Oct 2021 20:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A187D80CD2;
	Tue, 12 Oct 2021 20:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6F91BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F7D34011D
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVfgdw_TbdSV for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A262940104
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 23FA49553D; Tue, 12 Oct 2021 20:34:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:23:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55d1195a301d09a70bd1f768c571769916100393
X-Git-Newrev: dcc990f5ad02bf7595483b0941c2087343b55847
X-Patchwork-Hint: ignore
Message-Id: <20211012203447.23FA49553D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-wtf: bump to version
 0.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcc990f5ad02bf7595483b0941c2087343b55847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Update URL in Config.in

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-flask-wtf/Config.in             | 3 ++-
 package/python-flask-wtf/python-flask-wtf.hash | 9 ++++-----
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
index bb15489956..18329d0776 100644
--- a/package/python-flask-wtf/Config.in
+++ b/package/python-flask-wtf/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_FLASK_WTF
 	bool "python-flask-wtf"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
 	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
 	help
 	  Simple integration of Flask and WTForms.
 
-	  https://github.com/lepture/flask-wtf
+	  https://github.com/wtforms/flask-wtf
diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index cff3661824..848d6d7783 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,6 +1,5 @@
-# From https://pypi.org/project/Flask-WTF/#copy-hash-modal-d090dbe5-8665-4c96-a565-57134e470a60
-md5  1b60b7dd1245b0d0173c21123717af61  Flask-WTF-0.14.3.tar.gz
-sha256  d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720  Flask-WTF-0.14.3.tar.gz
-
-# License files
+# md5, sha256 from https://pypi.org/pypi/flask-wtf/json
+md5  920a5a476ecfb751952b5048cc05fcf8  Flask-WTF-0.15.1.tar.gz
+sha256  ff177185f891302dc253437fe63081e7a46a4e99aca61dfe086fb23e54fff2dc  Flask-WTF-0.15.1.tar.gz
+# Locally computed sha256 checksums
 sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350  LICENSE
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index a334e3c052..e2078103f5 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 0.14.3
+PYTHON_FLASK_WTF_VERSION = 0.15.1
 PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/2e/f4/3d9e1905ffad67e20ef4f5963d711e8e29ab9439120d7ffec3d2922020e3
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/9c/b5/4b48cece7b31aac2beab115330c2978ef4deee3aeb0dd1037c9b7a71b8c3
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
 PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
