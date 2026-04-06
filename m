Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8026EF46C56
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453F660A9B;
	Mon,  6 Apr 2026 16:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0z5zPNftujP; Mon,  6 Apr 2026 16:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF65C60AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775493213;
	bh=PLlzJVLkYHtVYzCHbRcS+3iwofJHAyqEpr9vgbrkoPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFQZxpBIuY/81+EH/AK8nXDcUHDbnRk2/7GCsysq1rROmjO5MMAma0e4KpK987QtD
	 cZHs+ZkrmuvM+svaUPJIy3wbz8ZCumDQhRtHhbs+0VlvtfVw/8IZ7bOJoKTSA5Xib/
	 zv+emaeH821AY/Q4gqlajwUeCPlQHzSXP1uC+d+7HXfid6QnNFkp5cyaa+Cvb6qcMq
	 e2zN2iFB1uFyQ+x3zTqh7XdIrq1PkHbAerJH30Z+7CJuKXOS1Ij77DViu1Nw47JZsj
	 Yq6KXN4d7fCVdOXvQGpmsc6Y90vxEgMxaMipGbJHI/m3oGDpjdjoFw2O1LRCe1Qecd
	 jsNYmqgTEzlqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF65C60AA5;
	Mon,  6 Apr 2026 16:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B79D2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6192C80EF2
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qL-vISFTJJ1a for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E31380CF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E31380CF8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9578E804E8; Mon,  6 Apr 2026 16:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 18:24:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8466476c4e47964517d2ec38f848dff348be14e
X-Git-Newrev: 37a21dc9392d9f6b755a658347449056d39c7fb7
X-Patchwork-Hint: ignore
Message-Id: <20260406163329.9578E804E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ngrep: bump version to 1.49.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37a21dc9392d9f6b755a658347449056d39c7fb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch 0001, included upstream:
https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe

Removed patch 0002, included upstream:
https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5

Removed patch 0003, included upstream:
https://github.com/jpr5/ngrep/commit/c9ddace67b6faee8d7dd0cdf376c9275a99224f9

Removed patch 0004 which was never sent upstream, also libnet still
provides libnet-config and causes no build errors. Porting this patch to
the modified configure.ac script does not create any benefits so we drop
this patch along with autoreconf.

Removed patch 0005, included upstream:
https://github.com/jpr5/ngrep/commit/742424ddd76e15bd151e40834e8f1fad65900b65

Removed patch 0006, included upstream:
https://github.com/jpr5/ngrep/commit/e97f8e9d4b80e6e26e0bc4f586c7abfd772d888c
https://github.com/jpr5/ngrep/commit/1e340b1eb334a74a6ab5373345aa1afce2e30c7c

Wchar is needed since this commit was added to 1.48.1:
https://github.com/jpr5/ngrep/commit/8107128098392862b34204ece13ca907f1f74436

Pcre2 is now required instead of pcre:
https://github.com/jpr5/ngrep/commit/cfcf1e6e9c4f8a2404810d8d1d90e6d1eaa0abdd

Updated license hash due to upstream commit:
https://github.com/jpr5/ngrep/commit/fc5db167dec085805e76ad1f97bf38e1e850ec2c

Removed /pcap from configure option pcap-includes due to upstream commit
https://github.com/jpr5/ngrep/commit/110fa39f8fae8efe2e9b35ad9bc922a305589f0b
which now searches for pcap/pcap.h instead of pcap.h:
https://github.com/jpr5/ngrep/commit/110fa39f8fae8efe2e9b35ad9bc922a305589f0b#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810R200-R303

Added ac_cv_path_NGREP_PCRE2_CONFIG_SCRIPT to _CONF_ENV to avoid
/usr/bin/pcre2-config being found.

Added ac_cv_path_LIBNET_CONFIG_BIN to _CONF_ENV as follow-up to the
removal of patch 0004.

Build-tested using this defconfig:

BR2_PACKAGE_LIBNET=y
BR2_PACKAGE_NGREP=y

                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: OK
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: OK
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: SKIPPED
                    br-arm-full-nothread [31/32]: OK
                      br-arm-full-static [32/32]: OK

32 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...in-configure-in-when-testing-for-use_pcre.patch | 24 ------------
 ...002-Check-for-libnet_init-in-configure-in.patch | 27 -------------
 package/ngrep/0003-fix-disable-tcpkill.patch       | 39 -------------------
 ...onfigure.in-use-pkg-config-to-find-libnet.patch | 38 -------------------
 package/ngrep/0005-gcc15.patch                     | 34 -----------------
 ....h-and-tcpkill.h-to-avoid-implicit-functi.patch | 44 ----------------------
 package/ngrep/Config.in                            |  6 ++-
 package/ngrep/ngrep.hash                           |  4 +-
 package/ngrep/ngrep.mk                             | 14 +++----
 9 files changed, 14 insertions(+), 216 deletions(-)

diff --git a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
deleted file mode 100644
index c7f0dec360..0000000000
--- a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe Mon Sep 17 00:00:00 2001
-From: Romain Francoise <romain@rfr.io>
-Date: Mon, 1 Jan 2018 18:00:34 +0100
-Subject: [PATCH] Fix typo in configure.in when testing for use_pcre
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index cff37e9..06c050a 100644
---- a/configure.in
-+++ b/configure.in
-@@ -146,7 +146,7 @@ AC_ARG_ENABLE(pcre,
- [ use_pcre="$enableval" ],
- [ use_pcre="no" ])
- 
--if test use_pcre = yes; then
-+if test $use_pcre = yes; then
-   USE_PCRE="1"
-   EXTRA_LIBS="$EXTRA_LIBS -lpcre"
- else
diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
deleted file mode 100644
index 7fa2e2f3bc..0000000000
--- a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 0a51c8bc62c7b49b8d67a360daa6b1957256f4f5 Mon Sep 17 00:00:00 2001
-From: Romain Francoise <romain@rfr.io>
-Date: Mon, 1 Jan 2018 18:01:13 +0100
-Subject: [PATCH] Check for libnet_init in configure.in
-
-libnet_init_packet was the old libnet 1.0 function which is now long
-deprecated.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 06c050a..dbef39b 100644
---- a/configure.in
-+++ b/configure.in
-@@ -174,7 +174,7 @@ dnl
- AC_ARG_ENABLE(tcpkill,
- [  --enable-tcpkill        enable connection killing support (default off)],
- [
--  AC_CHECK_LIB(net, libnet_init_packet,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
-+  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
-   use_tcpkill="$enableval"
- ],
- [ use_tcpkill="no" ])
diff --git a/package/ngrep/0003-fix-disable-tcpkill.patch b/package/ngrep/0003-fix-disable-tcpkill.patch
deleted file mode 100644
index 894cd95b0f..0000000000
--- a/package/ngrep/0003-fix-disable-tcpkill.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e8522284ef326bd9f222e04c4a970ffafa56fba6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 3 Nov 2018 23:23:36 +0100
-Subject: [PATCH] fix --disable-tcpkill
-
-If the user uses --disable-tcpkill, build can fail if libnet is not
-found on the system.
-
-To fix this, move AC_CHECK_LIB to found libnet outside AC_ARG_ENABLE
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/jpr5/ngrep/pull/15
----
- configure.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index dbef39b..7c3dd43 100644
---- a/configure.in
-+++ b/configure.in
-@@ -173,13 +173,11 @@ dnl
- 
- AC_ARG_ENABLE(tcpkill,
- [  --enable-tcpkill        enable connection killing support (default off)],
--[
--  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
--  use_tcpkill="$enableval"
--],
-+[ use_tcpkill="$enableval" ],
- [ use_tcpkill="no" ])
- 
- if test $use_tcpkill = yes; then
-+  AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
-   USE_TCPKILL="1"
-   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
-   EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
--- 
-2.17.1
-
diff --git a/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
deleted file mode 100644
index 71550da943..0000000000
--- a/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4788988827bf4c0d996d3e1e3b6ac52a23b97941 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 9 Jan 2024 21:15:47 +0100
-Subject: [PATCH] configure.in: use pkg-config to find libnet
-
-libnet-config is deprecated:
-https://github.com/libnet/libnet/commit/1ec4a6e7d1d23811f0a14ecb51e46489a0175727
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: unsent (upstream seems dead, no commit since 5 years
----
- configure.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 7c3dd43..882ff86 100644
---- a/configure.in
-+++ b/configure.in
-@@ -176,12 +176,14 @@ AC_ARG_ENABLE(tcpkill,
- [ use_tcpkill="$enableval" ],
- [ use_tcpkill="no" ])
- 
-+PKG_PROG_PKG_CONFIG
- if test $use_tcpkill = yes; then
-   AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
-   USE_TCPKILL="1"
-   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
--  EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
--  EXTRA_LIBS="$EXTRA_LIBS $(libnet-config --libs)"
-+  PKG_CHECK_MODULES(LIBNET, libnet)
-+  EXTRA_DEFINES="$EXTRA_DEFINES $LIBNET_CFLAGS"
-+  EXTRA_LIBS="$EXTRA_LIBS $LIBNET_LIBS"
- else
-   USE_TCPKILL="0"
- fi
--- 
-2.43.0
-
diff --git a/package/ngrep/0005-gcc15.patch b/package/ngrep/0005-gcc15.patch
deleted file mode 100644
index e1dd7785b8..0000000000
--- a/package/ngrep/0005-gcc15.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 742424ddd76e15bd151e40834e8f1fad65900b65 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 09:44:12 +0000
-Subject: [PATCH] fix build with gcc-15
-
-Upstream: https://github.com/jpr5/ngrep/commit/742424ddd76e15bd151e40834e8f1fad65900b65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- ngrep.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ngrep.c b/ngrep.c
-index 3df9389..57b4ddd 100644
---- a/ngrep.c
-+++ b/ngrep.c
-@@ -146,7 +146,7 @@ struct re_pattern_buffer pattern;
- 
- char *match_data = NULL, *bin_data = NULL;
- uint16_t match_len = 0;
--int8_t (*match_func)() = &blank_match_func;
-+int8_t (*match_func)(unsigned char *, uint32_t, uint16_t *, uint16_t *) = &blank_match_func;
- 
- int8_t dump_single = 0;
- void (*dump_func)(unsigned char *, uint32_t, uint16_t, uint16_t) = &dump_formatted;
-@@ -177,7 +177,7 @@ FD_SET delay_fds;
- SOCKET delay_socket = 0;
- #endif
- 
--void (*print_time)() = NULL, (*dump_delay)() = dump_delay_proc_init;
-+void (*print_time)(struct pcap_pkthdr *) = NULL, (*dump_delay)(struct pcap_pkthdr *) = dump_delay_proc_init;
- 
- 
- /*
diff --git a/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch b/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
deleted file mode 100644
index 6d596bfe37..0000000000
--- a/package/ngrep/0006-Include-err.h-and-tcpkill.h-to-avoid-implicit-functi.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 52515bae377f221b5473d9040f5f43ab1c672672 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Mon, 19 Dec 2022 11:49:06 +0100
-Subject: [PATCH] Include <err.h> and "tcpkill.h" to avoid implicit function
- declarations
-
-Implicit function declarations are a historic language feature that
-were removed from C in 1999.
-
-Upstream: https://github.com/jpr5/ngrep/pull/28
-
-Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
----
- ngrep.c   | 1 +
- tcpkill.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ngrep.c b/ngrep.c
-index 3df9389..b2fcceb 100644
---- a/ngrep.c
-+++ b/ngrep.c
-@@ -98,6 +98,7 @@
- #endif
- 
- #include "ngrep.h"
-+#include "tcpkill.h"
- 
- 
- /*
-diff --git a/tcpkill.c b/tcpkill.c
-index 5388ec5..ac8fd2e 100644
---- a/tcpkill.c
-+++ b/tcpkill.c
-@@ -14,6 +14,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <string.h>
-+#include <err.h>
- #include <libnet.h>
- #include <pcap.h>
- 
--- 
-2.50.1
-
diff --git a/package/ngrep/Config.in b/package/ngrep/Config.in
index 5f87f2f79b..6decaa60a9 100644
--- a/package/ngrep/Config.in
+++ b/package/ngrep/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_NGREP
 	bool "ngrep"
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Network grep.
 
 	  https://github.com/jpr5/ngrep/
+
+comment "ngrep needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/ngrep/ngrep.hash b/package/ngrep/ngrep.hash
index 7dd13b3b67..7cc9872ecc 100644
--- a/package/ngrep/ngrep.hash
+++ b/package/ngrep/ngrep.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dc4dbe20991cc36bac5e97e99475e2a1522fd88c59ee2e08f813432c04c5fff3  ngrep-1.47.tar.gz
-sha256  d46e593e048e0b9fc803561ed4c283f37a2d5447e4dcfa10cad29b394c2b8b9e  LICENSE
+sha256  6c94b31681316b7469a3ace92d2aeec7c9f490bd6782453dff2ade0e289a3348  ngrep-1.49.0.tar.gz
+sha256  de8f2aca6f09c8b7d6e4dde36ece0fc71be1584ff8ce6b1ef40fbe47f054467e  LICENSE
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index dc69a34235..7232705895 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -4,29 +4,29 @@
 #
 ################################################################################
 
-NGREP_VERSION = 1.47
-NGREP_SITE = $(call github,jpr5,ngrep,$(subst .,_,V$(NGREP_VERSION)))
+NGREP_VERSION = 1.49.0
+NGREP_SITE = $(call github,jpr5,ngrep,v$(NGREP_VERSION))
 NGREP_LICENSE = BSD-4-Clause-like, BSD-3-Clause (tcpkill)
 NGREP_LICENSE_FILES = LICENSE
 NGREP_INSTALL_STAGING = YES
-# We're patching configure.in
-NGREP_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 NGREP_CONF_ENV += LIBS=`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 NGREP_CONF_OPTS = \
-	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
-	--enable-pcre \
+	--with-pcap-includes=$(STAGING_DIR)/usr/include \
+	--enable-pcre2 \
 	--disable-dropprivs \
 	--disable-pcap-restart
+NGREP_CONF_ENV += ac_cv_path_NGREP_PCRE2_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/pcre2-config
 
-NGREP_DEPENDENCIES = host-pkgconf libpcap pcre
+NGREP_DEPENDENCIES = host-pkgconf libpcap pcre2
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 NGREP_DEPENDENCIES += libnet
 NGREP_CONF_OPTS += --enable-tcpkill
+NGREP_CONF_ENV += ac_cv_path_LIBNET_CONFIG_BIN=$(STAGING_DIR)/usr/bin/libnet-config
 else
 NGREP_CONF_OPTS += --disable-tcpkill
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
