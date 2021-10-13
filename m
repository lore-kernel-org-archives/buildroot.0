Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C32C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C394A60E0B
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C394A60E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5F360D70;
	Wed, 13 Oct 2021 20:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oAauUMeIQwr; Wed, 13 Oct 2021 20:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E686560D80;
	Wed, 13 Oct 2021 20:02:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4956B1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34FE060B0E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo-D4ADxAUKI for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9002860D71
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D5A6895BC7; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:54:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa9edee7d248d581d0ada991db836f968aca3259
X-Git-Newrev: 03034692ca7424e49270d7ab1d22d39a22b9b0f0
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.D5A6895BC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-arrow: bump to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=03034692ca7424e49270d7ab1d22d39a22b9b0f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Indent with two spaces in the hash file.
* License file was updated to fully fit the Apache license format
  (see: https://github.com/arrow-py/arrow/pull/679)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-arrow/Config.in         | 3 +--
 package/python-arrow/python-arrow.hash | 6 +++---
 package/python-arrow/python-arrow.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
index 1458556830..aed9a682ff 100644
--- a/package/python-arrow/Config.in
+++ b/package/python-arrow/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_ARROW
 	bool "python-arrow"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Better dates and times for Python.
 
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 90e0533232..9216e1c26c 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5	554f18b0e23182ee0e8cb2a882d2f607  arrow-0.15.2.tar.gz
-sha256	10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f  arrow-0.15.2.tar.gz
+md5  608682052926c7e5636285af0618ef38  arrow-1.2.0.tar.gz
+sha256  16fc29bbd9e425e3eb0fef3018297910a0f4568f21116fc31771e2760a50e074  arrow-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a4b7601be50569c2c96a9818fc809b0149410c84c99714d60c9d4fb0ae861fa2  LICENSE
+sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index f8326288b2..a20ac8dbc7 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 0.15.2
+PYTHON_ARROW_VERSION = 1.2.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/43/0e/47416c54ad7742981bf77fdfc405987551ab14b181a6140c8cd2a5823872
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/dc/bd/2565b8533bb8cf66e10a9e68a1d489ad839799b2050f0635039e614e3b1a
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
