Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E3B606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pSG9TFET
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C526C819F5;
	Fri, 30 Oct 2026 14:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f92dmj4tfQSb; Fri, 30 Oct 2026 14:20:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C6D2C819D5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370048;
	b=ZMsioZAUu6Z/vfMzHdP9+B1TI3gRIBXFkTHsEEyrH9cVF9KG7ypUAeDvwNP9XBlmVJ6K
	 QiTqEeQDwinLKJngCVT/LJs0RvUKyUAPLVXPCmwTuHVivw0PEcP9oPuUUl+RlXbEIYGz4
	 m8bSlOt0Nv7dzSHYyC2Cx6dbQvFolFsGhE+nLeWv7f883XgvWZpy4lhm4WFsR9MQltFgG
	 QIRt0onBisG1afc9SboffxZb9tNZDy5LYxh6cnbNzgKjCgk9jIvkLTBii+5dVgFJ1+rC/
	 Do9sH9F2l/Dzx7MW4TPpzKBML0Mdhq4AL/wVj+iBL94piOo+AynzdFXIjceW1MIdC8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=x36b2ihC6DNgyMOlubv+mNeCuziVuArU9dMMe/WiGO0=;
	b=nFRxz/kfeFY2x0ki3Vidt5OE+SaxErg/l5JNsj91qbXujpz1Or3i/csjs0E7iSzpGN6x
	 aRFzxyDBzNWxCz0U/QgFxCrqrnG+uOG8s24ci9ZO5PjFTuthIuoorPNaRiSzeiQ/z4Iv3
	 k2bi9TRsYQ0Yu9iqZ6zf1F7gVvqZynOzc1XHwgOjEa+L8o86hZRA1RGPKPAy34rPSsD0j
	 VVDxo9e2hZzo+JDnIo6mMLPYIqGmznp+RdNi+aLbbPotzRzvXlN1bm/kLGmObX96poHUx
	 TBgn1kMkRtCkQVrzm6JXYCbKzuYNb10l/OPciST3Et/4YVx5CjAzFThmeQ/Q9k8Cb4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370048;
	bh=x36b2ihC6DNgyMOlubv+mNeCuziVuArU9dMMe/WiGO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pSG9TFETEQeChsDw4ZOi9/GkkYAYBPOGLiX6HbHWMDMKVhX7XGqnVrjz3zdUjNyDT
	 dqNbp6RBvWLqJnnNL3sT+fsxiVP7yam4lfyHs7ao2qTXdsUoLrNuC7T7TcpRzMqxrb
	 4Bxc/4PxEwko56QkgrxUUPSJDc+LMfX4h5R+XWULNUGgg2MUQvVtbOw57aESAD0+6x
	 AmTzYV3PtwV9cN1kt3H9d7mvdHyptP9HrWFTNK0enOKUbOWcRyd/zBF1dfdMmfVoCP
	 8D8smjJ2zJb3NjQDcuuixzyrFE204p22iSPRQtvbjyNIfe779xgDCQ5GIp8dRGw+3U
	 iQP1KERs6Mu/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D2C819D5;
	Fri, 30 Oct 2026 14:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A3AD44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A304D812E1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asEjQzdGRfT9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E0E881324
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=g8JgNwbih1TJrnosyxhBn1bHhnHDCLcoWjtVXOZNGwr9am7rhBSswXtKH6ts87NpAviG
 Ea0jgSnIXlHQgdR0w/lfiPfP8OAB7nntNoEB1IUrTg2yIZVExPpNsnLJR5Q+pAeEkNNus
 C0tne24FvXi6w3V+ydcA8crsp2pCvW5s/BTQ/dljyoyCG6OKklVJuPotKP5ucTOgdeKcu
 WuYagIFDQP1/hq9hN89/WZuqHpSP1r0TBB2lkMBCU4miVoJ4Sqa53TT0M7DphyOx+Ibvx
 UHF5nfprFUCZzUOGxAb0eQK+bnc2KaE0frxUn09oSPqxrAQHnCG+xcaeZwe3WIYvdqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YbW0RREg9giC02jialSyy8q6R3Qi31C9yBnFd9hQJmc=;
 b=sWIMUty3vDjCBL4g1FQ5bF6ZH0hXlfP4oK0Ce1JkNdJQ0Y52RNJBL0t8y+fnXL3qFSlZ
 33sJ2KZtkYMAiaTQSLwy3TJay2DGCczhJPT/5NhzGFcAwAkaK9R+vd8VGqYrktIVZRKMk
 TZzYTOaqWy29Eg7IyiXtTeK3zR37pZjUEzCHr6NPnqTe8oQskfY+7O+Bok4Z0G2kP34VG
 5mW9Io0LOEIg8c/2dzkARshoKHPmhN4asZ1ce5BBdn9rWXwMFmZG3BQQPWmxgEpnDpjRZ
 KEhxEWdUVD8inV/28WUR0FhXxwAvmKSn31J8J7zMQrLq6xBKClqYtB5yZL268g6pJYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E0E881324
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD7DE9D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2d6fbe9245542ee5a7fc8a154515fbae1fcfcc2a
X-Git-Newrev: 61cbae760968f73d2d44a072536ec88e4788a8df
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.AD7DE9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openocd: fix
 static build with jimtcl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7014172472286618305=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7014172472286618305==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/61cbae760968f73d2d44a072536ec88e4788a8df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit bf751c39daff643d5b762149c29ae15f5223141c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============7014172472286618305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7014172472286618305==--
