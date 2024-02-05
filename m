Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A9C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2003B41766;
	Mon,  5 Feb 2024 11:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2003B41766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hr-P6t1KLch0; Mon,  5 Feb 2024 11:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 306924175E;
	Mon,  5 Feb 2024 11:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 306924175E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFEB1BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38A8C8204D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A8C8204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Az_fK0UAtyr for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:34:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67F8681FC7
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F8681FC7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5472186BE3; Mon,  5 Feb 2024 11:34:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:32:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0a4e392daccac896f3bf07b971377fde56ec484
X-Git-Newrev: 081162580f99d1a68133f7f513bf2cd6d1b8b6b6
X-Patchwork-Hint: ignore
Message-Id: <20240205113409.5472186BE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-segno: bump to version 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=081162580f99d1a68133f7f513bf2cd6d1b8b6b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to formatting change:
https://github.com/heuer/segno/commit/5f61bc42535b836c30015a0cef5db1e52ef8ac67

Drop no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-segno/Config.in         | 3 +--
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
index 3957cd79bf..7107e67443 100644
--- a/package/python-segno/Config.in
+++ b/package/python-segno/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_SEGNO
 	bool "python-segno"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
-	  QR Code and Micro QR Code generator for Python 2 and Python 3
+	  QR Code and Micro QR Code generator for Python.
 
 	  https://github.com/heuer/segno/
diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index 286bdf3615..58142c184f 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
-sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
+md5  b80c19075a7a07cce50b054e9e221cf7  segno-1.6.0.tar.gz
+sha256  8d3b11098ac6dd93161499544dedbfb187d4459088109b8855ff0bbe98105047  segno-1.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
+sha256  3af9b2f15c736a571978760b2d60598502c205eb6daebe2ec36f0272c380ed28  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index c832f38f4b..2c230ee26b 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.5.2
+PYTHON_SEGNO_VERSION = 1.6.0
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/51/a8/960844fec8d853a4e8e91f64bdde323ea5a2a44357eca799e7f7f7bf2f1e
 PYTHON_SEGNO_SETUP_TYPE = setuptools
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
