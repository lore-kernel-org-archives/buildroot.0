Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982ECC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35750415FF;
	Mon, 13 May 2024 21:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oy-FIx2LqPIR; Mon, 13 May 2024 21:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E113415AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E113415AF;
	Mon, 13 May 2024 21:49:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3C951BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED65E82486
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3uLmgfIwq6g for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2123881FB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2123881FB9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2123881FB9
 for <buildroot@busybox.net>; Mon, 13 May 2024 21:49:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.197]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1rpw0V3hZv-00KfJU
 for <buildroot@busybox.net>; Mon, 13 May 2024 23:49:12 +0200
To: buildroot@busybox.net
Date: Mon, 13 May 2024 23:49:12 +0200
Message-ID: <20240513214912.18201-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:7U5xXs0UDvOr2gZDrDr4O0u16Xa6RBGMyTS6rAjSGJkCGNBjuFV
 ohq6a6bXm573oriX83Dy9ZtxfBB2sH+dxEalU9E8F3hcaN3lSX9MN87ykb1ySfuQ2m3EN9a
 rMJ2jbpQM7QQGrWcyjuwVX0+o3Ydn8PEpO0bzS/B5vPr8Dfh6VtmrSfaSR7NTPQyjjJ403h
 oI5y/jTyXqR1U9mOyT2sg==
UI-OutboundReport: notjunk:1;M01:P0:KpgE0ceiB3s=;xpEn/zZNphOw7G6m/U7VBU43j3n
 PcabMVneMYc0iKoXhaL/UR5lQUgSvCOVDDppLgMb98icRYFoLT/txUjRJmzPRkH/qKW3/kX+Q
 gc/slZCCboWifdd73IYDibRClrbIQVeX1lM51AjHr94K/lKc+Qm32ihfcQmupkkKYybIbPM83
 +9eKE+r1j+rcHaxE4xk1KR99+ZVJwhu0ldZmM5oHKaZ2JJamULlnR940rWoDeg9g75Hil+VuE
 ZE58s5PVfOr4y+W18JbHZ8Mg/Bq3+/geHjX0van2BzQis//BXokfaR2dlZUr6aO9BPay06zDB
 DgSJpAYZelbdg7yQWDAXYD62zu5hlVRkptVW+ZCubB7l9zokgQFfoMWTLMPJyVhuOtNWeIUCI
 SAlKp8kNqytGOVZ2gbc6doTVOTLGa/VIlbMCzxwQ3SyL+2YWVA2R9roC2XSUnClOcrPN+SJie
 DcvxQbFmf9BNIdsdffMytydYRXxGxAbA0pAqJPcSTiDbJPa37K2QnLcC6rvvRl4RAJxzbIY0b
 W0yNQ1cVKxwf3JzdPVdEFRX38jmvjw4+QH88lxj+1NiZKfRkLC5C/hAzkKTLIP62axOmiK5kY
 Fy9lF3GlRpE+Wk4yia+ZTmlXIhw6v6BOOzhu6O2otWdmrb7jHwVHaVAMXpZ1kmRSrtgvZMYJh
 tmTzFIED99bAX7A+3cTbZNO5mkJveFt7e1HjHfxlHAB5vURJvL+dq+tiEdr3v7R0+2slMGRwA
 uZYbtCJ2Hj2hlkyh8hQCer3oQD28p/vHEN8Up9mBdijFipo9FoS0ED21VC7bxu3U6rt7+xfn+
 ewQ6mLL2gJaiIEFruIslavY+/QPzs9a3jCKEtzDme9He0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715636953; x=1716241753; i=ps.report@gmx.net;
 bh=ouZv4rR4vyQT8x5ftbM4qf/Mvf6wWSJGjZX61p7ofgE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Y2rAoQGU4IYaZKCEhXTBFbaOZuj9hTFRTm3dg7Di83Y1ZZVypj8yrDiFxi342Ope
 YFdkuGiRQeOWyYulUnqfCnyErnH/dFR/rbgIrQaJ98QXP84nWJqVRBPujj626oLMX
 vdfbQV8RyLiZDU8hQRQe5uSJ9bW3jlmSInL6cpOWrxKoLuQdR6z9UmNeEK4DGc9Eq
 +kCLF5H6cmD8G4SwgXZCPcxsrh5KlE2Cm4+W5yPpDBqlcPkn3JzKOhpgOHrJiLgwA
 B1BWxRHUy3QVmdWFLSEWL7y01DSDUqb7TQ1r3/GOOx0rntog7px8roUnqQZEJbW7U
 ateuFVlHLvd58hSwZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Y2rAoQGU
Subject: [Buildroot] [PATCH v1] package/dillo: bump version to 3.1.0
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 3.1.0 (for details see [1])
- change download URL to github
- change home page URL to github
- remove 0001-usr-local-include.patch
  (no longer needed since upstream commit [2])
- remove 0002-Fix-openssl-detection.patch
  (no longer applicable)
- remove 0003-Support-OpenSSL-1.1.0.patch
  (original from upstream, no longer applicable)
- remove 0004-fix-build-with-gcc-10.patch
  (no longer applicable)
- adjust autreconf comment
- determine all autoconf options (with default values)

[1] https://github.com/dillo-browser/dillo/releases/tag/v3.1.0
[2] https://github.com/dillo-browser/dillo/commit/3ac33673869b6f1ae1a29a329e5fa5c100bdd562

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dillo/0001-usr-local-include.patch    |  27 ----
 .../dillo/0002-Fix-openssl-detection.patch    |  29 ----
 .../dillo/0003-Support-OpenSSL-1.1.0.patch    |  33 -----
 .../dillo/0004-fix-build-with-gcc-10.patch    | 124 ------------------
 package/dillo/Config.in                       |   2 +-
 package/dillo/dillo.hash                      |   2 +-
 package/dillo/dillo.mk                        |  23 +++-
 7 files changed, 19 insertions(+), 221 deletions(-)
 delete mode 100644 package/dillo/0001-usr-local-include.patch
 delete mode 100644 package/dillo/0002-Fix-openssl-detection.patch
 delete mode 100644 package/dillo/0003-Support-OpenSSL-1.1.0.patch
 delete mode 100644 package/dillo/0004-fix-build-with-gcc-10.patch

diff --git a/package/dillo/0001-usr-local-include.patch b/package/dillo/0001-usr-local-include.patch
deleted file mode 100644
index 0c3fed2bfa..0000000000
--- a/package/dillo/0001-usr-local-include.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Do not add (possibly poisoned) /usr/local/include and /usr/local/lib
-to gcc and ld search paths in configure.
-
-With BR2_COMPILER_PARANOID_UNSAFE_PATH enabled, poisoned paths result
-in hard errors, failing affected configure tests.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -57,16 +57,6 @@
- AC_TYPE_INT32_T
- AC_TYPE_UINT32_T
- 
--dnl --------------------------------------
--dnl Check whether to add /usr/local or not
--dnl (this is somewhat a religious problem)
--dnl --------------------------------------
--dnl
--if test "`$CPP -v < /dev/null 2>&1 | grep '/usr/local/include' 2>&1`" = ""; then
--  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--  LDFLAGS="$LDFLAGS -L/usr/local/lib"
--fi
--
- dnl ------------------------------------
- dnl Check for socket libs (AIX, Solaris)
- dnl ------------------------------------
diff --git a/package/dillo/0002-Fix-openssl-detection.patch b/package/dillo/0002-Fix-openssl-detection.patch
deleted file mode 100644
index 6e5f1d021f..0000000000
--- a/package/dillo/0002-Fix-openssl-detection.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 96dde9dedf806256cdc6cbf5cacbd5c8d74e6288 Mon Sep 17 00:00:00 2001
-From: Jonathan Kimmitt <jrrk2@cam.ac.uk>
-Date: Thu, 9 Jan 2020 22:01:42 +0100
-Subject: [PATCH] Fix openssl detection
-
-SSL_library_init is now a define, use OPENSSL_init_ssl instead.
-
-Signed-off-by: Jonathan Kimmitt <jrrk2@cam.ac.uk>
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 66b5e9f..206fd53 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -276,7 +276,7 @@ if test "x$enable_ssl" = "xyes"; then
- 
-   if test "x$ssl_ok" = "xyes"; then
-     old_libs="$LIBS"
--    AC_CHECK_LIB(ssl, SSL_library_init, ssl_ok=yes, ssl_ok=no, -lcrypto)
-+    AC_CHECK_LIB(ssl, OPENSSL_init_ssl, ssl_ok=yes, ssl_ok=no, -lcrypto)
-     LIBS="$old_libs"
-   fi
- 
--- 
-2.24.1
-
diff --git a/package/dillo/0003-Support-OpenSSL-1.1.0.patch b/package/dillo/0003-Support-OpenSSL-1.1.0.patch
deleted file mode 100644
index 87b9d0dce3..0000000000
--- a/package/dillo/0003-Support-OpenSSL-1.1.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ff44d8b2d5211a502afdb3e612dae0e8133b5124 Mon Sep 17 00:00:00 2001
-From: Johannes Hofmann <Johannes.Hofmann@gmx.de>
-Date: Thu, 9 Jan 2020 22:07:15 +0100
-Subject: [PATCH] Support OpenSSL 1.1.0
-
-taken-from: pkgsrc (Ryo ONODERA)
-submitted-by: Jun Ebihara <jun@soum.co.jp>
-
-Upstream: https://hg.dillo.org/dillo/rev/b171b8610400
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- dpi/https.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/dpi/https.c b/dpi/https.c
-index 766b3af..025cfc4 100644
---- a/dpi/https.c
-+++ b/dpi/https.c
-@@ -476,7 +476,11 @@ static int handle_certificate_problem(SSL * ssl_connection)
-       case X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT:
-          /*Either self signed and untrusted*/
-          /*Extract CN from certificate name information*/
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-          if ((cn = strstr(remote_cert->name, "/CN=")) == NULL) {
-+#else
-+         if ((cn = strstr(X509_get_subject_name(remote_cert), "/CN=")) == NULL) {
-+#endif
-             strcpy(buf, "(no CN given)");
-          } else {
-             char *cn_end;
--- 
-2.24.1
-
diff --git a/package/dillo/0004-fix-build-with-gcc-10.patch b/package/dillo/0004-fix-build-with-gcc-10.patch
deleted file mode 100644
index 413bccb00b..0000000000
--- a/package/dillo/0004-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-fix build with gcc 10
-
-gcc 10 is now defaulting to -fno-common resulting in the following build
-failures:
-
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2 -D_FORTIFY_SOURCE=1 -DENABLE_IPV6 -DD_DNS_THREADED -D_REENTRANT -D_THREAD_SAFE -Wall -W -Wno-unused-parameter -Waggregate-return   -o dpid dpi.o dpi_socket_dir.o dpid.o dpid_common.o main.o misc_new.o ../dpip/libDpip.a ../dlib/libDlib.a 
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: dpi_socket_dir.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: multiple definition of `dpi_errno'; dpi.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: multiple definition of `dpi_errno'; dpi.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: dpid_common.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: multiple definition of `dpi_errno'; dpi.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:64: multiple definition of `sock_set'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:64: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:61: multiple definition of `services_list'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:61: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:58: multiple definition of `dpi_attr_list'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:58: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:55: multiple definition of `numsocks'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:55: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:52: multiple definition of `numdpis'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:52: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:31: multiple definition of `srs_fd'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:31: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:28: multiple definition of `srs_name'; dpid.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid.h:28: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: main.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: multiple definition of `dpi_errno'; dpi.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: first defined here
-/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: misc_new.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: multiple definition of `dpi_errno'; dpi.o:/nvme/rc-buildroot-test/scripts/instance-0/output-1/build/dillo-3.0.5/dpid/dpid_common.h:44: first defined here
-
-So add missing extern for srs_fd, numdpis, numsocks, dpi_attr_list,
-services_list and sock_set
-
-Also remove srs_name which is never used and give a name to dpi_errno
-enum
-
-Fixes:
- - http://autobuild.buildroot.org/results/9c777af97fe50143c6a68f0170fc86c87d8ead3f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to jcid@dillo.org]
-
-diff -r f60d55c02567 dpid/dpid.c
---- a/dpid/dpid.c	Fri Oct 05 22:05:08 2018 +0200
-+++ b/dpid/dpid.c	Thu Aug 27 18:16:50 2020 +0200
-@@ -38,6 +38,12 @@
- 
- #define QUEUE 5
- 
-+int srs_fd;
-+int numdpis;
-+int numsocks;
-+struct dp *dpi_attr_list;
-+Dlist *services_list;
-+fd_set sock_set;
- volatile sig_atomic_t caught_sigchld = 0;
- char *SharedKey = NULL;
- 
-diff -r f60d55c02567 dpid/dpid.h
---- a/dpid/dpid.h	Fri Oct 05 22:05:08 2018 +0200
-+++ b/dpid/dpid.h	Thu Aug 27 18:16:50 2020 +0200
-@@ -25,10 +25,9 @@
- 
- /*! \TODO: Should read this from dillorc */
- #define SRS_NAME "dpid.srs"
--char *srs_name;
- 
- /*! dpid's service request socket file descriptor */
--int srs_fd;
-+extern int srs_fd;
- 
- /*! plugin state information
-  */
-@@ -49,19 +48,19 @@
- };
- 
- /*! Number of available plugins */
--int numdpis;
-+extern int numdpis;
- 
- /*! Number of sockets being watched */
--int numsocks;
-+extern int numsocks;
- 
- /*! State information for each plugin. */
--struct dp *dpi_attr_list;
-+extern struct dp *dpi_attr_list;
- 
- /*! service served for each plugin  */
--Dlist *services_list;
-+extern Dlist *services_list;
- 
- /*! Set of sockets watched for connections */
--fd_set sock_set;
-+extern fd_set sock_set;
- 
- /*! Set to 1 by the SIGCHLD handler dpi_sigchld */
- extern volatile sig_atomic_t caught_sigchld;
-diff -r f60d55c02567 dpid/dpid_common.h
---- a/dpid/dpid_common.h	Fri Oct 05 22:05:08 2018 +0200
-+++ b/dpid/dpid_common.h	Thu Aug 27 18:16:50 2020 +0200
-@@ -37,10 +37,10 @@
- 
- 
- /*! Error codes for dpid */
--enum {
-+enum dpi_errno {
-    no_errors,
-    dpid_srs_addrinuse /* dpid service request socket address already in use */
--} dpi_errno;
-+};
- 
- /*! Intended for identifying dillo plugins
-  * and related files
-diff -r f60d55c02567 dpid/main.c
---- a/dpid/main.c	Fri Oct 05 22:05:08 2018 +0200
-+++ b/dpid/main.c	Thu Aug 27 18:16:50 2020 +0200
-@@ -231,7 +231,7 @@
-    /* this sleep used to unmask a race condition */
-    // sleep(2);
- 
--   dpi_errno = no_errors;
-+   enum dpi_errno error_code = no_errors;
- 
-    /* Get list of available dpis */
-    numdpis = register_all(&dpi_attr_list);
-@@ -254,7 +254,7 @@
- 
-    /* Initialise sockets */
-    if ((numsocks = init_ids_srs_socket()) == -1) {
--      switch (dpi_errno) {
-+      switch (error_code) {
-       case dpid_srs_addrinuse:
-          MSG_ERR("dpid refuses to start, possibly because:\n");
-          MSG_ERR("\t1) An instance of dpid is already running.\n");
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index d06f2d1f51..3aa831ae02 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DILLO
 
 	  Enable openssl package to gain https support.
 
-	  http://www.dillo.org
+	  https://github.com/dillo-browser/dillo
 
 comment "dillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
index fa46702a63..0a524530e7 100644
--- a/package/dillo/dillo.hash
+++ b/package/dillo/dillo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  db1be16c1c5842ebe07b419aa7c6ef11a45603a75df2877f99635f4f8345148b  dillo-3.0.5.tar.bz2
+sha256  3aa2a686648b383417a0c1f575c3d5431d6a2d53f35c2e11bf579cb25b2b45e7  dillo-3.1.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index a6885f5c14..52708ed8ab 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -4,22 +4,33 @@
 #
 ################################################################################
 
-DILLO_VERSION = 3.0.5
-DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = http://www.dillo.org/download
+DILLO_VERSION = 3.1.0
+DILLO_SITE = $(call github,dillo-browser,dillo,v$(DILLO_VERSION))
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
-# configure.ac gets patched, so autoreconf is necessary
+# no configure file, so autoreconf is necessary
 DILLO_AUTORECONF = YES
 DILLO_DEPENDENCIES = fltk zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
+DILLO_CONF_OPTS = \
+	--disable-efence \
+	--disable-mbedtls \
+	--disable-gprof \
+	--disable-insure \
+	--enable-ipv6 \
+	--enable-cookies \
+	--enable-gif \
+	--disable-rtfl \
+	--enable-xembed \
+	--disable-html-tests
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-DILLO_CONF_OPTS += --enable-ssl
+DILLO_CONF_OPTS += --enable-tls --enable-openssl
 DILLO_DEPENDENCIES += openssl
 else
-DILLO_CONF_OPTS += --disable-ssl
+DILLO_CONF_OPTS += --disable-tls --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
