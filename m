Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B2C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFAB60A9B;
	Sun, 30 Jul 2023 10:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BFAB60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z97VF1tKLW5I; Sun, 30 Jul 2023 10:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3383060A9C;
	Sun, 30 Jul 2023 10:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3383060A9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6F21BF95C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25EF981E05
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25EF981E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ul-eXuO7SiaK for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE3381E04
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE3381E04
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE74838C9; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:11:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb99c88a151aa95d1ecdbf93b9cf0ce3f753bca2
X-Git-Newrev: a9523e3f72bc05fc2ecfa9ebf597fde0e512ff95
X-Patchwork-Hint: ignore
Message-Id: <20230730101157.EDE74838C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9523e3f72bc05fc2ecfa9ebf597fde0e512ff95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to version 1.5.3 with buildroot commit
f8147e27cdac8f998ec6644a09ce4e8d62b6433c added the file patched.

Please note that the next version will include
https://github.com/linux-pam/linux-pam/commit/5fa961fd3b5b8cf5ba1a0cf49b10ebf79e273e96
which adds --enable-examples as configure option to disable examples.
This patch, although it would also fix the problem, is not added instead
to avoid autoreconf.

Fixes:
http://autobuild.buildroot.net/results/1d9/1d96d4c57969536c14340ae5542e62a9459246f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-examples-tty_conv-fix-build-on-musl.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch b/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
new file mode 100644
index 0000000000..c1257d64da
--- /dev/null
+++ b/package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
@@ -0,0 +1,40 @@
+From 5374f677e4cae669eb9accf2449178b602e8a40a Mon Sep 17 00:00:00 2001
+From: Violet Purcell <vimproved@inventati.org>
+Date: Thu, 11 May 2023 12:50:34 -0400
+Subject: [PATCH] examples/tty_conv: fix build on musl
+
+termio.h is the old System V version of the interface header, and is
+only provided in glibc and dietlibc as far as I can tell.
+This fixes it to use the POSIX termios.h instead.
+
+Upstream: https://github.com/linux-pam/linux-pam/commit/5374f677e4cae669eb9accf2449178b602e8a40a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ examples/tty_conv.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/examples/tty_conv.c b/examples/tty_conv.c
+index 23f0684cc..9a0e1ad99 100644
+--- a/examples/tty_conv.c
++++ b/examples/tty_conv.c
+@@ -6,8 +6,9 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>
+-#include <termio.h>
++#include <termios.h>
+ #include <security/pam_appl.h>
++#include <sys/ioctl.h>
+ 
+ /***************************************
+  * @brief echo off/on
+@@ -16,7 +17,7 @@
+  ***************************************/
+ static void echoOff(int fd, int off)
+ {
+-    struct termio tty;
++    struct termios tty;
+     if (ioctl(fd, TCGETA, &tty) < 0)
+     {
+         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
