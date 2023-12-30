Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5494C4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A272560D67;
	Sat, 30 Dec 2023 17:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A272560D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17fXzU8iBsy2; Sat, 30 Dec 2023 17:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50CF60AA0;
	Sat, 30 Dec 2023 17:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B50CF60AA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC3941BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FCED409C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FCED409C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-oJ-v1SW5vl for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66B8A409F8
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B8A409F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DB76839AF; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:51:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 091036dc84c580691e77100f456d24f3e58337ec
X-Git-Newrev: 5efd903ef0b92c7ef0deca8b4f050df5c19c31f4
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.4DB76839AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atest: bump to latest commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=5efd903ef0b92c7ef0deca8b4f050df5c19c31f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../atest/0001-seq.h-fix-build-with-gcc-10.patch   | 40 ----------------------
 package/atest/atest.hash                           |  2 +-
 package/atest/atest.mk                             |  2 +-
 4 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fccfb82ade..e76f6e829e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -163,7 +163,6 @@ package/asterisk/0005-configure-fix-detection-of-re-entrant-resolver-funct.patch
 package/asterisk/0006-main-iostream.c-fix-build-with-libressl.patch Upstream
 package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch Upstream
 package/at/S99at Indent Variables
-package/atest/0001-seq.h-fix-build-with-gcc-10.patch Upstream
 package/attr/0001-build-with-older-GCCs.patch Upstream
 package/audit/S02auditd Shellcheck Variables
 package/aufs-util/0001-remove-user-settings.patch Upstream
diff --git a/package/atest/0001-seq.h-fix-build-with-gcc-10.patch b/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index c0ae042b01..0000000000
--- a/package/atest/0001-seq.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fb374e0775fd9772a2cd7b99a5c21f96f7fe2a9a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Aug 2020 12:12:07 +0200
-Subject: [PATCH] seq.h: fix build with gcc 10
-
-Rename state structure to avoid the following build failure with gcc
-10.0:
-
-/bin/bash ./libtool  --tag=CC   --mode=link /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h   -Wall -Wno-sign-compare -Wno-strict-aliasing  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lasound -lev
-libtool: link: /home/test/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -include config.h -Wall -Wno-sign-compare -Wno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -o atest atest.o seq.o alsa.o capture.o playback.o loopback_delay.o  -L/home/test/autobuild/run/instance-0/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libasound.so -ldl -lpthread -lrt /home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libev.so -lm -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -Wl,-rpath -Wl,/home/test/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: seq.o:(.bss+0x8): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: capture.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: playback.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-/home/test/autobuild/run/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: loopback_delay.o:(.bss+0x0): multiple definition of `state'; atest.o:(.bss+0xbc): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/amouiche/atest/pull/3]
----
- seq.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/seq.h b/seq.h
-index 0fa1a95..b7ba8d1 100644
---- a/seq.h
-+++ b/seq.h
-@@ -30,7 +30,7 @@ enum seq_stat_e {
-     NULL_FRAME = 0,
-     INVALID_FRAME,
-     VALID_FRAME,
--} state;
-+};
- 
- 
- struct seq_info {
--- 
-2.27.0
-
diff --git a/package/atest/atest.hash b/package/atest/atest.hash
index e411a934e5..a7ade8ad37 100644
--- a/package/atest/atest.hash
+++ b/package/atest/atest.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
+sha256  53980d44af542cc02cbcecba1f10c8a16523aa80196fbb8fc257ff6e949344de  atest-9ff52ee5d7764984e21fe40a381b41ecd2d63548.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atest/atest.mk b/package/atest/atest.mk
index 68def46cf9..e9f338acf2 100644
--- a/package/atest/atest.mk
+++ b/package/atest/atest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATEST_VERSION = 895b0183a89c15f5e2305a6795bb1667753cd3f0
+ATEST_VERSION = 9ff52ee5d7764984e21fe40a381b41ecd2d63548
 ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
 ATEST_LICENSE = GPL-2.0+
 ATEST_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
