Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66344C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC2AF8250B;
	Sun,  5 Dec 2021 19:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfj7fOna5pbt; Sun,  5 Dec 2021 19:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4E682503;
	Sun,  5 Dec 2021 19:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 079721BF383
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 19:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2736070E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 19:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2w0VirQAHfPt for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 19:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 283DA605F8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 19:11:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E522480DF9; Sun,  5 Dec 2021 19:06:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 20:10:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e56a2d86197fdd5671e2b726b40a4cf333090096
X-Git-Newrev: 60f912e569a9d983a25ec4c8573d7a5a0ce62876
X-Patchwork-Hint: ignore
Message-Id: <20211205190609.E522480DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: bump to version 2.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=60f912e569a9d983a25ec4c8573d7a5a0ce62876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump is mainly to fix the header file nameclash problem with LiTE,
in package/lite.  See the libite project's README for how to adapt to
this change, and the ChangeLog for details.  In short, libite now use
the /usr/include/libite/*.h prefix.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 6f461f9b76..1dec65bd6b 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  8fad6b8a1e7e0d6b546863104dfe25dfe0bb2d2a9b98ec8e155d23392ef58514  libite-2.4.1.tar.xz
+sha256  5278fa0ca933727c78f4e05082cea58256d9302afac30bad0c3760cf2a18ef8f  libite-2.5.1.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 7ccf642e50..185ffe77de 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.4.1
+LIBITE_VERSION = 2.5.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
+LIBITE_CONF_OPTS = --without-symlink
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
