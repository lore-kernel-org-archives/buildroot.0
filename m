Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F66C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 963C36101B;
	Sun, 30 Jul 2023 21:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 963C36101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rISXJv7I4sV; Sun, 30 Jul 2023 21:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E1161019;
	Sun, 30 Jul 2023 21:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E1161019
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43EF51BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D24E6101A
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D24E6101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtteEImkSyZt for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28DFA60B0D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DFA60B0D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D5C83CE4; Sun, 30 Jul 2023 21:10:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 22:47:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d219fd34f280d2d4a1ff86f5fcbf451d9297576
X-Git-Newrev: 0626a2b61a509654bdc2f1a8403a041667e40572
X-Patchwork-Hint: ignore
Message-Id: <20230730211025.12D5C83CE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiberty: bump version to 2.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=0626a2b61a509654bdc2f1a8403a041667e40572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the libiberty package is not the same version as the one packaged
with binutils AND if libiberty is installed before binutils, then the
below error is observed. Hence for now let us keep the versions in sync.

/usr/bin/ld: ../libiberty/libiberty.a(hashtab.o):(.data.rel.local+0x0)
: multiple definition of `htab_eq_pointer'

Fixes:
http://autobuild.buildroot.net/results/f07/f077ec588b395102ad501a18c85d5030c0765031/

Build-tested using these four defconfigs:
----------
BR2_arceb=y
----------
BR2_BINUTILS_VERSION_2_38_X=y
----------
(empty defconfig meaning binutils-2.39)
----------
BR2_BINUTILS_VERSION_2_40_X=y
----------
each using these commands:

$ make host-libiberty
$ make host-binutils

Signed-off-by: Akshay Bhat <nodeax@gmail.com>
[Bernd: bump to version 2.40, replace hash file with link to binutils]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiberty/libiberty.hash | 6 +-----
 package/libiberty/libiberty.mk   | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
deleted file mode 100644
index 0dafcea520..0000000000
--- a/package/libiberty/libiberty.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
-
-# Locally computed, same as binutils.hash
-sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
new file mode 120000
index 0000000000..e0655d3af3
--- /dev/null
+++ b/package/libiberty/libiberty.hash
@@ -0,0 +1 @@
+../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
index 6235a8b956..e7a02c963a 100644
--- a/package/libiberty/libiberty.mk
+++ b/package/libiberty/libiberty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIBERTY_VERSION = 2.32
+LIBIBERTY_VERSION = 2.40
 LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
 LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_LIBIBERTY_DL_SUBDIR = binutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
