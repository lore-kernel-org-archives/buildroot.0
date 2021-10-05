Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A70C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A863611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A863611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 384FC4089D;
	Tue,  5 Oct 2021 19:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbSLXrtevItU; Tue,  5 Oct 2021 19:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7418E4089B;
	Tue,  5 Oct 2021 19:39:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACB231BF989
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D3860C30
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdOLqYsrl7uL for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA3760C18
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0D0BD91223; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bfe142e0d84400e386286347afd6e26f90b8aae
X-Git-Newrev: 026a0baeb89a017a766eae5ffd34c0297df96338
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.0D0BD91223@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dnspython: bump to version
 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=026a0baeb89a017a766eae5ffd34c0297df96338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-dnspython/Config.in             | 1 +
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/Config.in b/package/python-dnspython/Config.in
index 99fd6a9a5f..da9b959366 100644
--- a/package/python-dnspython/Config.in
+++ b/package/python-dnspython/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DNSPYTHON
 	bool "python-dnspython"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A powerful DNS toolkit for python.
 
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index af09d51cd5..c9c74c8d75 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5	bc9ca3b3a82164667d5730ec6d5248a2  dnspython-1.16.0.zip
-sha256	36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01  dnspython-1.16.0.zip
+md5  8a362d7b2358be3117683e2dbf9654fc  dnspython-2.1.0.zip
+sha256  e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4  dnspython-2.1.0.zip
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index ed11687291..77e6082807 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 1.16.0
+PYTHON_DNSPYTHON_VERSION = 2.1.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).zip
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/13/27/5277de856f605f3429d752a39af3588e29d10181a3aa2e2ee471d817485a
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
