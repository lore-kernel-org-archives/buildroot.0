Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A08EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73EE3421C6;
	Fri, 28 Jul 2023 20:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73EE3421C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnFgSkpNXCFp; Fri, 28 Jul 2023 20:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E23421F1;
	Fri, 28 Jul 2023 20:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59E23421F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAA0C1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 940B160BAA
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940B160BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0C1A-r5YH_fi for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFFBD60B15
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFFBD60B15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A069D83976; Fri, 28 Jul 2023 20:11:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f4ae1f15e5686aff4448d62386f3a3e68ef405
X-Git-Newrev: 056539bc45d8b0d1b0a736a548dd7822357cdaa9
X-Patchwork-Hint: ignore
Message-Id: <20230728201141.A069D83976@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=056539bc45d8b0d1b0a736a548dd7822357cdaa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/vsajip/python-gnupg/releases/tag/0.5.1

This commit also adds a comment about the archive being checked with the
PGP signature published by the package author.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gnupg/python-gnupg.hash | 7 +++++--
 package/python-gnupg/python-gnupg.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 7886ff7dae..d52b634b8d 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  19cc1aef3a612b7b5f13e388260e65d4  python-gnupg-0.5.0.tar.gz
-sha256  70758e387fc0e0c4badbcb394f61acbe68b34970a8fed7e0f7c89469fe17912a  python-gnupg-0.5.0.tar.gz
+# also checked PGP signature from:
+# https://bitbucket.org/vinay.sajip/python-gnupg/downloads/python-gnupg-0.5.1.tar.gz.asc
+# with key: 9147B477339A9B86
+md5  c5d99c5f0456f8cbf69324ec5e6acaff  python-gnupg-0.5.1.tar.gz
+sha256  5674bad4e93876c0b0d3197e314d7f942d39018bf31e2b833f6788a6813c3fb8  python-gnupg-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index b51ac61892..f582f4cdb7 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.0
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/e3/5c/5ff9877001616912a74f4377cd5f80925b31a678087800beae5b28bdb80e
+PYTHON_GNUPG_VERSION = 0.5.1
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/62/7737485f44bd4d7d904f4094372f4119195865b29f119fa51a98e121a13a
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
