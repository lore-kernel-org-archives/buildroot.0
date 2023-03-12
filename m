Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA5C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0961A416C8;
	Sun, 12 Mar 2023 21:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0961A416C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHiqpkOafWrU; Sun, 12 Mar 2023 21:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC42416F5;
	Sun, 12 Mar 2023 21:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC42416F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6939B1BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61CE960D64
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61CE960D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4DJxYN9Xs2a for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E7A60E1B
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E7A60E1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 832CF87006; Sun, 12 Mar 2023 21:46:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 19:01:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6c79d6d40e37fada0c50430f27b9aeaf68bae74
X-Git-Newrev: bcf9d2f51cd5c80191b63020412631a548e32a7d
X-Patchwork-Hint: ignore
Message-Id: <20230312214625.832CF87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openmpi: bump to version 4.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcf9d2f51cd5c80191b63020412631a548e32a7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/open-mpi/ompi/blob/v4.1.5/NEWS#L61

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openmpi/openmpi.hash | 6 +++---
 package/openmpi/openmpi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 745ed7c580..567ffe4833 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
 # From: https://www.open-mpi.org/software/ompi/v4.1/
-md5  f057e12aabaf7dd5a6a658180fca404e  openmpi-4.1.4.tar.bz2
-sha1  357c61a8e06e103d987c0e4a054e8780a034c8b1  openmpi-4.1.4.tar.bz2
-sha256  92912e175fd1234368c8730c03f4996fe5942e7479bb1d10059405e7f2b3930d  openmpi-4.1.4.tar.bz2
+md5  bb045df2d600744c2231c78b31a20da3  openmpi-4.1.5.tar.bz2
+sha1  eba2e6f9ee0c39fbca0a8cf53a79c9ed29643284  openmpi-4.1.5.tar.bz2
+sha256  a640986bc257389dd379886fdae6264c8cfa56bc98b71ce3ae3dfbd8ce61dbe3  openmpi-4.1.5.tar.bz2
 # Locally computed
 sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index f14b55ced5..82a4b3eb1c 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENMPI_VERSION_MAJOR = 4.1
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).4
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).5
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
@@ -15,7 +15,7 @@ OPENMPI_INSTALL_STAGING = YES
 # The macro searching for IME (Infinite Memory Engine) filesystem
 # brings "-I/usr/local/include" in the CPPFLAGS, even if not
 # found. This makes the configuration fail. See:
-# https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
+# https://github.com/open-mpi/ompi/blob/v4.1.5/config/ompi_check_ime.m4#L35
 # Disable explicitly to avoid the issue.
 OPENMPI_CONF_OPTS = --without-ime
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
