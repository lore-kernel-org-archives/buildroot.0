Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12A4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B1381AEF;
	Tue,  5 Jul 2022 20:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50B1381AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JO7QrMwXJDIU; Tue,  5 Jul 2022 20:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5745D81A92;
	Tue,  5 Jul 2022 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5745D81A92
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF2AC1BF271
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 20:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C0940546
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 20:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C0940546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIzMRVCBYJ-H for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 20:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D63400A8
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3D63400A8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5ADDF8261F; Tue,  5 Jul 2022 20:05:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 Jul 2022 22:17:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bba4dad9aa8e7eb497e7f83b7722b8c10596e34e
X-Git-Newrev: dedc1b71d90b56d98ee56f36f69f81cf23f18d5f
X-Patchwork-Hint: ignore
Message-Id: <20220705200522.5ADDF8261F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: bump to version 2022.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=dedc1b71d90b56d98ee56f36f69f81cf23f18d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...deploy-add-a-missing-include-for-stdint-h.patch | 24 ----------------------
 package/libostree/libostree.hash                   |  2 +-
 package/libostree/libostree.mk                     |  2 +-
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch b/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
deleted file mode 100644
index 35f92c37ff..0000000000
--- a/package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 4b7fc4f1e90bbeac89d2f939cde3070e69b4787a Mon Sep 17 00:00:00 2001
-From: Luca BRUNO <luca.bruno@coreos.com>
-Date: Fri, 6 May 2022 10:07:23 +0000
-Subject: [PATCH] lib/ostree-sysroot-deploy: add a missing include for stdint.h
-
-[Retrieved from:
-https://github.com/ostreedev/ostree/commit/4b7fc4f1e90bbeac89d2f939cde3070e69b4787a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/libostree/ostree-sysroot-deploy.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libostree/ostree-sysroot-deploy.c b/src/libostree/ostree-sysroot-deploy.c
-index 404f336fb5..96cc07531e 100644
---- a/src/libostree/ostree-sysroot-deploy.c
-+++ b/src/libostree/ostree-sysroot-deploy.c
-@@ -22,6 +22,7 @@
- #include <gio/gunixinputstream.h>
- #include <gio/gunixoutputstream.h>
- #include <glib-unix.h>
-+#include <stdint.h>
- #include <sys/mount.h>
- #include <sys/statvfs.h>
- #include <sys/socket.h>
diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 0395c1247d..d85b82f35c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b823fd9dcd5503c5caf9febde24b0ed63ff46ca95188032ac567a2a95624f612  libostree-2022.3.tar.xz
+sha256  14bbd351a95066f68c3b283e0bd0ddd03562e862af66f6f6d894c6c328d7eb81  libostree-2022.4.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 75485a79e0..3210ed3707 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.3
+LIBOSTREE_VERSION = 2022.4
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
