Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B940606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=COlm5BRt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F5280C43;
	Mon, 26 Oct 2026 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOYyCK87onw2; Mon, 26 Oct 2026 20:23:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5C7380C38
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046180;
	b=ceEF6S7WUBMRI3N6t4LltfU6bWMwxucqt17HrDr1iIjMhQyz3oaDlmraXCWz+YhsTIFV
	 oenX8XdvZO+NxFHb6xkcCKtaw5HNMsN2DZliaJBw4XL16AoyTZS4fyerGtRSdR3DXjtrA
	 IPGH56qlj0BGt4vJcTIjXAUIxVxiM2yhuAW/Bwt2tmAdHe734Q9QsQuwuFVbNmklhe17k
	 JpCkrSwch/maC7E3nCxWS7kFziLgUBVuw2PmOuXumf2nVlSSHuO2WMmvWJm2XXrHT+EbS
	 KiqTgz5gWz0Qji81JdHIu0Dmn9zUrzLEgyLwYSXRjEoDTp3fMxKOZ9DEgDOL5U1wKUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046180;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pQt/+GepxYH6YuUNYOIPAmyo8Z0jaZ2vWAOXcQHg+Z4=;
	b=ecrzs6VQ1dXnMYvK5Uu5Z+gw/3oVcNS5pgJrW9wkOI32owVd6GjRqdG57Xi0mCBhBrL4
	 YHZunqxPtUibytzsaeH04zXFtK2ikX+GugMODGWmuaTqalPPIP/2jqvyamlTWP5UXXIcq
	 TBZsIbBClN/y/qHb3238WGrphFOsVPToLxhJKWrL2Z5xY0ekuXk43Xi1JVd7xvATzZnk3
	 u49za/b2UIMmJk7QmRk/Kr5G0MZKQINP9GNTZLgIblwU363KpnHnzY5Ynp0j/u/3XxICG
	 yxRuMm5c2VFkH++Ay1szbDvBKbb0IMCrCElhnr1Fjs7gmrapTtP4NpvAlpk/xyyUf5Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046180;
	bh=pQt/+GepxYH6YuUNYOIPAmyo8Z0jaZ2vWAOXcQHg+Z4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=COlm5BRtE94nYxg5zW+uSX9kdLiese+vYDmZezRQdkZg5mi60xnRrnh3dN0zBD3Aw
	 +DZTDpGoIAGu1egoTeQCiDSthoBOJww5jLPeOGFYRa8baqP8ZZarC0lZNFkRCWLXYr
	 HdLy3VYNkmgy/wr71FziORxrCr/T3Liy5voXJEDnHush1w4AEhtXHsEyI9gDtinhbB
	 o+Yqf1SNb/pOKsPmtRZ7R7vMA3Z/A6qL3FzfpM5dDWO/AeVovjuQ5X05cEKXVA+UpC
	 cS9G3e2L5k2uSMexBCfoLn8G7f8XQzKlcQb3idjhBhN3Z94YSuwO3U/eu4kzOO1kTV
	 HlElPyFx8zIdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C7380C38;
	Mon, 26 Oct 2026 20:23:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B284D4BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 987AC400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2CIEzzhs7LF for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 554C040062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046174;
 b=mQy26ZpfQF0mB6glui99ERwvZYBH2YZClejgoB5PqMpMbKIt139jZxrfFJtClebWihho
 82UH+I0KJsRrXVfOVVJzV4KBIQ0LdPwkrEVIDUjiO4fIUIpdAErRmkD51IROQW3XA4Tdg
 inH9iZNHOV328/J7eCwYO19UOKV+vZ0FxNgrXi72mvc5TaB1sW4rpTtVLO0vvPUk3lp7V
 HNtJ1FYILCMOm21zwUB09jUI3iR76SpBdjTa3xAyfSVI8zbaLEEuOcvvy8zBjT5X9Ckmb
 kXtW+gB+KGtREWfndnzLi70Y+xlRSC6uVI9ItPo8TOM5udCxGufYYRC2DydErzmr7cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=j3bPHG5niurNm8Lls4oZjglKBFzTbPsMydb0dp5tJ2Y=;
 b=i4JVgVkRRgbj8egZvayElXcmkXD6+BsDbNi4aZu7UbgS5Zf1n3z5fEzyIEUguaMJDSEw
 hnqJNsQEuAxBj/1EfdEDq8+i9Ep+2PkKjpHTDO5TeBM3PYE68deqHsh5jJ/k+hyPOqdPf
 6Tmcxoz2u5KyFZ6xbDs0PC9UeafxWBL8EAn+8YoLVxSBn3W8ryovook+OrBl8JO6sbVxH
 1c0Zu6ywtNRNUCnb8P6QWX8YuyisgozHmqjk0ngHsruncTuNkGVTbxtqYBApegINldt1U
 j/Vndaj+dRyPZCfyLTr28DrdTV7rUVokmd660TutKuPCJhrQ387rsCSwSBHq804053A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 554C040062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 381D89CFA9; Mon, 26 Oct 2026 20:21:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 21:05:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57e1b04f39fe1ae50efda34e74df9ec93f2c59f9
X-Git-Newrev: c7874e2a772ab9f1c801c2f4cf6281bccc16d5c4
X-Patchwork-Hint: ignore
Message-Id: <20261026202128.381D89CFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpreplay: bump to version 4.6.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8365793518685686600=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8365793518685686600==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7874e2a772ab9f1c801c2f4cf6281bccc16d5c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.6.2

This release fixes six issues found by OSS-Fuzz in fragroute, a --pps
regression with -T select, and the build on musl, uClibc and when
cross compiling.

Drop all patches, as they are included in this release:
- 0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch, upstream
  commit d7e8593b515e53f6f6b7e2df496955568146ecdd, which was then
  reworked to also accept -DWITH_TCPDUMP=OFF/0/FALSE
- 0002-build-look-for-fts_read-in-libfts.patch, upstream commit
  a829c8a247cfb688f6c2103d750f72a1f0fc348a
- 0003-txring.h-fix-build-with-musl.patch, upstream commit
  da763d37b2b275ef977e5a9bf4424bbe1fb2b22d

LICENSE moved from docs/ to the top level, and no longer starts with a
note about files distributed under other licenses. The license is
unchanged.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ix-tcpdump-detection-when-cross-compiling.patch | 43 ------------
 .../0002-build-look-for-fts_read-in-libfts.patch   | 77 ----------------------
 .../0003-txring.h-fix-build-with-musl.patch        | 41 ------------
 package/tcpreplay/tcpreplay.hash                   |  6 +-
 package/tcpreplay/tcpreplay.mk                     |  4 +-
 5 files changed, 5 insertions(+), 166 deletions(-)

diff --git a/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch b/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch
deleted file mode 100644
index efcc291636..0000000000
--- a/package/tcpreplay/0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d7e8593b515e53f6f6b7e2df496955568146ecdd Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 29 Sep 2026 11:21:30 +0200
-Subject: [PATCH] cmake: fix tcpdump detection when cross compiling
-
-WITH_TCPDUMP names the tcpdump binary on the machine tcpreplay will run
-on. When cross compiling, that path doesn't exist on the build machine,
-so the EXISTS check always fails and --verbose gets disabled.
-
-Trust WITH_TCPDUMP when cross compiling, and accept WITH_TCPDUMP=no
-(like WITH_LIBDNET=no) to skip the host find_program() lookup, which
-would otherwise pick up the build machine's tcpdump.
-
-Upstream: https://github.com/appneta/tcpreplay/pull/1152
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Assisted-by: Claude:claude-opus-5-5
----
- cmake/OptionalDeps.cmake | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cmake/OptionalDeps.cmake b/cmake/OptionalDeps.cmake
-index 6c73a20e..5239630a 100644
---- a/cmake/OptionalDeps.cmake
-+++ b/cmake/OptionalDeps.cmake
-@@ -177,12 +177,16 @@ endif()
- # tcpdump binary (--with-tcpdump → WITH_TCPDUMP)
- # ---------------------------------------------------------------------------
- set(HAVE_TCPDUMP "")
--if(WITH_TCPDUMP)
-+if(WITH_TCPDUMP STREQUAL "no")
-+    set(TCPDUMP_PATH "")
-+elseif(WITH_TCPDUMP)
-     set(TCPDUMP_PATH ${WITH_TCPDUMP})
- else()
-     find_program(TCPDUMP_PATH tcpdump PATHS /usr/sbin /sbin /usr/local/sbin)
- endif()
--if(TCPDUMP_PATH AND EXISTS ${TCPDUMP_PATH})
-+# When cross compiling, WITH_TCPDUMP is a path on the target, which can't
-+# be checked for existence on the build machine.
-+if(TCPDUMP_PATH AND (EXISTS "${TCPDUMP_PATH}" OR (CMAKE_CROSSCOMPILING AND WITH_TCPDUMP)))
-     set(HAVE_TCPDUMP 1)
-     message(STATUS "Using tcpdump in ${TCPDUMP_PATH}")
- else()
diff --git a/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch b/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch
deleted file mode 100644
index ce5344316e..0000000000
--- a/package/tcpreplay/0002-build-look-for-fts_read-in-libfts.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From a829c8a247cfb688f6c2103d750f72a1f0fc348a Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 29 Sep 2026 11:33:40 +0200
-Subject: [PATCH] build: look for fts_read() in libfts
-
-On musl and uClibc, fts_*() is not part of the C library but provided
-by the standalone musl-fts library (libfts). Look for it there when
-it's neither in libc nor in libbsd, in both configure.ac and CMake.
-
-Without this, cross builds against these C libraries have to pass
--lfts by hand, and with CMake that doesn't work for static builds, as
-CMAKE_EXE_LINKER_FLAGS ends up before the objects on the link line:
-
-  tcpreplay.c:(.text.startup+0x1e8): undefined reference to `fts_open'
-
-Upstream: https://github.com/appneta/tcpreplay/pull/1153
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Assisted-by: Claude:claude-opus-5-5
----
- cmake/ConfigureChecks.cmake | 7 ++++++-
- cmake/config.h.cmake        | 3 +++
- configure.ac                | 5 +++--
- 3 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/ConfigureChecks.cmake b/cmake/ConfigureChecks.cmake
-index 5b829a5d..b8c81aeb 100644
---- a/cmake/ConfigureChecks.cmake
-+++ b/cmake/ConfigureChecks.cmake
-@@ -365,12 +365,17 @@ if(NOT HAVE_INET_ADDR)
-     message(FATAL_ERROR "We need inet_addr.  See bug 26")
- endif()
- 
--# Haiku: fts_*() lives in libbsd
-+# Haiku: fts_*() lives in libbsd; musl and uClibc: in the standalone libfts
- check_function_exists(fts_read HAVE_FTS_READ)
- if(NOT HAVE_FTS_READ)
-     check_library_exists(bsd fts_read "" HAVE_LIBBSD)
-     if(HAVE_LIBBSD)
-         list(APPEND TCPR_SYSTEM_LIBS bsd)
-+    else()
-+        check_library_exists(fts fts_read "" HAVE_LIBFTS)
-+        if(HAVE_LIBFTS)
-+            list(APPEND TCPR_SYSTEM_LIBS fts)
-+        endif()
-     endif()
- endif()
- 
-diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
-index 15531ca3..12084d28 100644
---- a/cmake/config.h.cmake
-+++ b/cmake/config.h.cmake
-@@ -232,6 +232,9 @@
- /* Do we have libdnet? */
- #cmakedefine HAVE_LIBDNET @HAVE_LIBDNET@
- 
-+/* Define to 1 if you have the 'fts' library (-lfts). */
-+#cmakedefine HAVE_LIBFTS @HAVE_LIBFTS@
-+
- /* Define to 1 if you have the 'gen' library (-lgen). */
- #cmakedefine HAVE_LIBGEN @HAVE_LIBGEN@
- 
-diff --git a/configure.ac b/configure.ac
-index 20e4f465..00fd13bd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -718,8 +718,9 @@ if test x$inet_addr = xno ; then
-     AC_MSG_ERROR([We need inet_addr.  See bug 26])
- fi
- 
--dnl On Haiku fts_*() functions are in libbsd.
--AC_CHECK_FUNC(fts_read,,[AC_CHECK_LIB(bsd, fts_read)])
-+dnl On Haiku fts_*() functions are in libbsd, on musl and uClibc in the
-+dnl standalone libfts (musl-fts).
-+AC_CHECK_FUNC(fts_read,,[AC_CHECK_LIB(bsd, fts_read,,[AC_CHECK_LIB(fts, fts_read)])])
- 
- dnl #####################################################
- dnl Checks for tuntap device support
diff --git a/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch b/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch
deleted file mode 100644
index 6bbe2314e2..0000000000
--- a/package/tcpreplay/0003-txring.h-fix-build-with-musl.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From da763d37b2b275ef977e5a9bf4424bbe1fb2b22d Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 29 Sep 2026 11:33:40 +0200
-Subject: [PATCH] txring.h: fix build with musl
-
-Commit 78076385 ("txring: fix __GLIBC_MINOR typo and include the header
-that defines the TX_RING API (#1043)") made the libc check work, so
-non-glibc C libraries now include <linux/if_ether.h>. On musl, that
-clashes with <netinet/if_ether.h>, included later via sendpacket.h:
-
-  netinet/if_ether.h:122:1: error: redefinition of struct or union 'struct ethhdr'
-
-<net/ethernet.h> is available on all Linux C libraries, so use it
-unconditionally.
-
-Upstream: https://github.com/appneta/tcpreplay/pull/1154
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Assisted-by: Claude:claude-opus-5-5
----
- src/common/txring.h | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/src/common/txring.h b/src/common/txring.h
-index 59dabd1a..0c1e4bfd 100644
---- a/src/common/txring.h
-+++ b/src/common/txring.h
-@@ -38,14 +38,8 @@
- 
- #ifdef HAVE_TX_RING
- 
--#if __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 1
- #include <net/ethernet.h> /* the L2 protocols */
- #include <linux/if_packet.h>
--#else
--#include <asm/types.h>
--#include <linux/if_ether.h> /* The L2 protocols */
--#include <linux/if_packet.h>
--#endif
- #include <pthread.h>
- 
- struct txring_s {
diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 023830f9a5..c41e651edb 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.6.1/tcpreplay-4.6.1.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.6.2/tcpreplay-4.6.2.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  14b96e3565d6e66e813000d0d510afeaecb871f2b533182c391c6ccf948c3e21  tcpreplay-4.6.1.tar.xz
-sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
+sha256  83a7ca2f9daa367949926cfe34d30193e756c233c164b38f84f0d6d272a87e66  tcpreplay-4.6.2.tar.xz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 4a50e88aaf..5d47d9d162 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.6.1
+TCPREPLAY_VERSION = 4.6.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-TCPREPLAY_LICENSE_FILES = docs/LICENSE
+TCPREPLAY_LICENSE_FILES = LICENSE
 TCPREPLAY_CPE_ID_VENDOR = broadcom
 TCPREPLAY_DEPENDENCIES = libpcap
 # The option parsers, tcpedit_stub.h and man pages are pre-generated in

--===============8365793518685686600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8365793518685686600==--
