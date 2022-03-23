Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24321C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB28040FDB;
	Wed, 23 Mar 2022 21:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AT5b2KENT0Da; Wed, 23 Mar 2022 21:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7306440278;
	Wed, 23 Mar 2022 21:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1183C1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005884173B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8z0Nz94pxor for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:47:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4513941A3D
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:47:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 58B7885735; Wed, 23 Mar 2022 21:38:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:42:18 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1e5f4ae1f4737dcb392e9b32d5b5525e9b591d8a
X-Git-Newrev: 0c4cfe71314a28f8d982148e7fa6b9966b97657f
X-Patchwork-Hint: ignore
Message-Id: <20220323213850.58B7885735@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libiec61850:
 security bump to version 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c4cfe71314a28f8d982148e7fa6b9966b97657f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Retrieve official tarball
- Fix CVE-2021-45769: A NULL pointer dereference in
  AcseConnection_parseMessage at src/mms/iso_acse/acse.c of libiec61850
  v1.5.0 can lead to a segmentation fault or application crash.
- Fix many other vulnerabilities:
  https://libiec61850.com/new-release-1-5-1-of-libiec61850

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 52c372446f034cf8277951ad083abe5e1c10f52d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 3a024be7c6..a416ecdb4d 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b832c195ae9f42faa1ccfe1b82b9ff187103155ce45aaca08881be98459d164  libiec61850-1.5.0.tar.gz
+sha256  b6d7ffac831e7d9aec3470e45e2f1734071859c95cab4cfe99ffd1091776b3cc  libiec61850-1.5.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 6da782ad39..9bd55cb76a 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.0
-LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
+LIBIEC61850_VERSION = 1.5.1
+LIBIEC61850_SITE = https://libiec61850.com/wp-content/uploads/2022/03
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
