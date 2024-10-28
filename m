Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764CD33993
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946424072B;
	Mon, 28 Oct 2024 14:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNzQlfaV3p2m; Mon, 28 Oct 2024 14:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4510C40317
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4510C40317;
	Mon, 28 Oct 2024 14:41:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89654AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F254094B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGTf7l1DiA7C for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F17940976
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F17940976
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B3AB816AF; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6276e8044dae5e6fa48910e909f8f6b2bda15152
X-Git-Newrev: 19bc24ac83dadfe6686a10d90489c892d1970607
X-Patchwork-Hint: ignore
Message-Id: <20241028144053.4B3AB816AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.136.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19bc24ac83dadfe6686a10d90489c892d1970607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-async-timeout runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zeroconf/Config.in            | 1 -
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
index 69ea81d93a..1570674f59 100644
--- a/package/python-zeroconf/Config.in
+++ b/package/python-zeroconf/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ZEROCONF
 	bool "python-zeroconf"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_IFADDR # runtime
 	help
 	  Pure Python Multicast DNS Service Discovery Library
diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index dbc54b1e1c..a40bbacb5e 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  c4d49cca10d8d10f12e9152d6380de35  zeroconf-0.123.0.tar.gz
-sha256  c50f24c9a7a6c7ba4bb301defad03a9d85dffb3ee280953de44eee9f432f2550  zeroconf-0.123.0.tar.gz
+md5  f72c481e45177fa6811822d65881b95c  zeroconf-0.136.0.tar.gz
+sha256  7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf944320b5f3519586bbc82  zeroconf-0.136.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 726d874034..970633c269 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.123.0
+PYTHON_ZEROCONF_VERSION = 0.136.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/db/47/85eafb277f6ef78e1a1895cc72f0035dfa6a5e51396134eb9ce21564c72f
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/82/e4/17075a9f1951b031dfd92d57916505574e0d1eab3f2fb7deecabd2be581e
 PYTHON_ZEROCONF_SETUP_TYPE = pep517
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
