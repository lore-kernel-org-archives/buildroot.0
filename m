Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OudcpR+V
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35E6D8116D;
	Sat, 24 Oct 2026 21:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEEOz3t76uUp; Sat, 24 Oct 2026 21:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2D76A81172
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877533;
	b=rPUOPBDyskBd8AOQtquzFXcE/eiff4gj8Uqd8EGeLZ5uNf/QS34EasajjG/48UC1AZzm
	 mdBPhFfYFfhO5tDhkM1q+5OqSWqIGoK1TlIGIlBsvz4p0m2R/V+mgNvw2bepn9uJ7bHUM
	 fQSYpmnlgTBWZh2HXCJ/uaek+w/1yA+fRFN5jdQhhxR5mK4FgNJ1ROSPQziioVrh/L9WD
	 hyyjaSWZxPBLGqKvTMVVR3UbU4KrqgNseG/uUwchmwZzshYb5sNUFHO+YTxC+59+dzxI7
	 MEXdcpZpKKHYcRxMPeIaHDavBZUO9fZ4PdgveECRHSof/xNqbCV3yKfuFhUi+WvLvuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f1w7vMKMaqxZWdRZuG4mY1RXbztEuWE+M1o+psJKZiY=;
	b=UJepXM1gVQ3nKFRRDtCLXyorLmKJFqukCCYJ0R9PHVhEevPYQ7Pm9YdcZHbG8fualZ5W
	 R2hHzebbzIR/GtQA2XIXFBwoamj7htzpp2esJbD0B26V+Fr4XPb9L/qh8TK9lf5gS6l4P
	 X4xPnfCRBwteS2nTmmgcnMk5k02SC2Z74yn7nTG3wNC2fMb9cVKfZgNUoVDjBlNRgOPFk
	 1ARd/NOb6tFg3JP9tyi13fKJsY1zxstuz9Q0EQSLomzH7SoYbo7GCgTR0nENOW9Z5DpGh
	 gtZpopEqkOJUZYQA9ja3iYKgFxIKcmxeRNd0quowrY2v4wriBoZzflK4R11Sbl4wj6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877533;
	bh=f1w7vMKMaqxZWdRZuG4mY1RXbztEuWE+M1o+psJKZiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OudcpR+V30+l4uBSHd8fzFtZsuzCMCOQ2ficsxppnDaq0/786GwUQRZ8xshubw1A2
	 1K2GqfG0JUVCsxj3FKfymHkQ+PqSzd0aw1Y71fdHp/Q17wMjt/gcmzjbjJ0t3gMEBq
	 4HaCCjTenBdlugvOg22qpaAvOUGiUzbrE/UKMfyz+CdHaulfTqCc4oZr+oLV0Y5vxm
	 upsgWAIgJ6VRgF2QNRDPgS9aX+lDqVKmHt+zfRywbco5bD6Sia7RdScfpX8KHqWP3l
	 VZe7MMIOBtSe+VV1dwB6hllmzXWhRDstftD0ubFr6dkrOIUwyRQYephTIPtcYDIQ2X
	 Y7d/aap0e181Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D76A81172;
	Sat, 24 Oct 2026 21:32:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2391B3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2059B400AE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbyucrwGQRIv for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4FB174006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877528;
 b=sEcJNmAufmS+udrwPdiQFIs9OuuYhcbQQ7u94essWYgCz0VMFtsg0sQJYeXH+TvCEKWH
 htn0Eeb/wzChC3ALDuVkBbtUAGyPQEhgEGDC5dyrt7VekgNRWxjFgUU4NgbnKmK143c5l
 vtHFPJUxTApBBlOhIyXUlVg18BL1zHK5pgUvMEKlG3Yhb5aX2YnV6LTj+vpvKurToy8Po
 z8dqWtA+W72mfpsSLkpKIhoS67leavXPW8g7QcEXOZnBiRw3vUfAgjEbI0r52SFEBjiCM
 q84n8zvOq9qoQqTcZ0amdHHyGBli9pBhKm7Mm0JCUqxs8P6nKfLZSAUPWRCIkBmdUIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877528;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T0lVNMRSrD9k9tHsIc4ro+t/CZFaKQ6O0/xDbBptaIk=;
 b=VG7wu53qBQQzW8AdpWBqKU0r68H34xm7O5sRSzDoDLn8lymaPBINBr5u47LDj/bCivNa
 skwxOh1ZxPmmjm/ErlH/oUgXnRLw/2Ulf7yxEOgv+cbsEUzky6UIC2zrFndgUZRTSnZRn
 Y4/onRx6QaZ0oIHsp4tuQgOM6WCKTNyUpqaKj9tP3tmUuY9T/md+qI1umRYYy8vJupcfS
 +BCbbkk2BMs/KD5+GJ4oIWOWff9IY1bqv4YcGozhFOaiqgW4Ta+wGnTwNDtCdEPvpMBaV
 AVUr7JRnWhBNYi5Ytf8Dzon1Fj71THAXYh/PT/hY1jPaiEOoPsplwuDMDSClXvrrEFQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB174006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24FBB9CDF5; Sat, 24 Oct 2026 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b712fd22857dfeda4d95280323d987d060682557
X-Git-Newrev: bf751c39daff643d5b762149c29ae15f5223141c
X-Patchwork-Hint: ignore
Message-Id: <20261024213043.24FBB9CDF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: fix static build with
 jimtcl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf751c39daff643d5b762149c29ae15f5223141c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since jimtcl 0.83, jimtcl enables ssl support in the aio extension and
the zlib extension when openssl and zlib are found. With
BR2_STATIC_LIBS, openocd then fails to link, as it only uses -ljim to
link against libjim.a:

  jim-aio.c:(.text+0x16f4): undefined reference to `SSL_set_fd'
  [...]
  jim-zlib.c:(.text+0x11c): undefined reference to `deflateInit2_'

Backport an upstream commit making openocd use pkg-config to find
jimtcl, which adds the libraries from Libs.private when linking
statically. This requires the jimtcl.pc file installed by the previous
commit.

This issue has been present since commit 283821fc31c4 ("package/jimtcl:
bump to version 0.83"), as jimtcl 0.83 made its optional features
enabled by default. It therefore affects 2025.11 and later.

Fixes:
https://autobuild.buildroot.org/results/6436c7c81cda5eeb8331f18d40f33f4bf1dadd79

Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-configure-Use-pkg-config-for-jimtcl.patch | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch b/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch
new file mode 100644
index 0000000000..65f0f9424b
--- /dev/null
+++ b/package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch
@@ -0,0 +1,83 @@
+From a8a0b4c50768fb8bbcbd1683d020a31ad2bb0cad Mon Sep 17 00:00:00 2001
+From: Marc Schink <dev@zapb.de>
+Date: Tue, 2 Jul 2024 17:14:22 +0200
+Subject: [PATCH] configure: Use pkg-config for jimtcl
+
+The jimtcl project supports pkg-config, use it for a simpler
+configuration of compiler and linker flags and to enforce the minimum
+required package version.
+
+Since the jimtcl pkg-config file is not available on all systems, use
+AC_CHECK_HEADER() as fallback.
+
+Change-Id: I6fdcc818a8fdd205a126b0a46356434dbe890226
+Upstream: https://github.com/openocd-org/openocd/commit/a8a0b4c50768fb8bbcbd1683d020a31ad2bb0cad
+Signed-off-by: Marc Schink <dev@zapb.de>
+Reviewed-on: https://review.openocd.org/c/openocd/+/8383
+Reviewed-by: Antonio Borneo <borneo.antonio@gmail.com>
+Tested-by: jenkins
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ Makefile.am     |  2 ++
+ configure.ac    | 10 ++++++++++
+ src/Makefile.am |  4 ++++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 647b571cfa..2230e628f8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -48,6 +48,8 @@ AM_CPPFLAGS = $(HOST_CPPFLAGS)\
+ if INTERNAL_JIMTCL
+ AM_CPPFLAGS += -I$(top_srcdir)/jimtcl \
+ 			   -I$(top_builddir)/jimtcl
++else
++AM_CPPFLAGS += $(JIMTCL_CFLAGS)
+ endif
+ EXTRA_DIST += \
+ 	BUGS \
+diff --git a/configure.ac b/configure.ac
+index becc531b0d..b7aed245e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -594,6 +594,15 @@ AS_IF([test "x$use_internal_jimtcl" = "xyes"], [
+   ], [
+     AC_MSG_ERROR([jimtcl not found, run git submodule init and git submodule update.])
+   ])
++], [
++  PKG_CHECK_MODULES([JIMTCL], [jimtcl >= 0.79], [
++      have_jimtcl_pkg_config=yes
++    ], [
++      have_jimtcl_pkg_config=no
++      AC_CHECK_HEADER([jim.h], [], [
++        AC_MSG_ERROR([jimtcl is required but not found via pkg-config and system includes])
++      ])
++  ])
+ ])
+ 
+ AS_IF([test "x$build_remote_bitbang" = "xyes"], [
+@@ -781,6 +790,7 @@ AM_CONDITIONAL([DMEM], [test "x$build_dmem" = "xyes"])
+ AM_CONDITIONAL([HAVE_CAPSTONE], [test "x$enable_capstone" != "xno"])
+ 
+ AM_CONDITIONAL([INTERNAL_JIMTCL], [test "x$use_internal_jimtcl" = "xyes"])
++AM_CONDITIONAL([HAVE_JIMTCL_PKG_CONFIG], [test "x$have_jimtcl_pkg_config" = "xyes"])
+ AM_CONDITIONAL([INTERNAL_LIBJAYLINK], [test "x$use_internal_libjaylink" = "xyes"])
+ 
+ # Look for environ alternatives.  Possibility #1: is environ in unistd.h or stdlib.h?
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6d79cd6311..4d1c1a2509 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -17,8 +17,12 @@ bin_PROGRAMS += %D%/openocd
+ if INTERNAL_JIMTCL
+ %C%_openocd_LDADD += $(top_builddir)/jimtcl/libjim.a
+ else
++if HAVE_JIMTCL_PKG_CONFIG
++%C%_openocd_LDADD += $(JIMTCL_LIBS)
++else
+ %C%_openocd_LDADD += -ljim
+ endif
++endif
+ 
+ %C%_libopenocd_la_CPPFLAGS =
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
