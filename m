Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD3606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LWodighE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A862605A7;
	Fri,  6 Nov 2026 15:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O68a43UAxfGy; Fri,  6 Nov 2026 15:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0852E608C5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980782;
	b=SCQVPF+XfBi7D0SnMUngI9HrUWy3cOzHZgwsHV2A30nTeAXBSWIfp1Ymls/Ev449B4N2
	 4qMl5oQhmTVGXCyksLR2UXFkMI3P0RlExq0+JROOrUflJ3Ya0ltTsy1swZzHndWH2u443
	 zcfDTf3nm8ZR3SoQOL9Ln7IBpQXUh5VVb9z8oHeOc3XpycIYZAW3MH3Od2PAJa5Sg/vNZ
	 56o7jG8MNc8ck9Z4vuIPa522shVBz72lmQ7Mo0N03ZCfi7UTayYmpCT7gZWwnPN+Ko0X5
	 SM9OKs/2Yf8oguOIoc7dNn6hHfGLhzEaLGM5rdWi+97ISawI4X6+A1XkAnm+eqzqWfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980782;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8z9We6NBN/G7rfPzoRp8m2NUo2xcOXwE7pc5suPoa1w=;
	b=Obycqr7KzbnhHCGbebRJYgVZZfSwb3oOh3Ycejd8RXbhKbpSji4xrIp4tKuyjAjqOPdK
	 iGzvTGrYTtfTvs1n+kzF+E0c+tvMw6XteNoUw/lbBpUbxd8A4ceCBRUso+H1s0gQ3rYCt
	 uhQPoIlvSr/aOVix/cTL2docXp90+Xp4kyPqZEPDJfhR/d9DRepS7A41ArE9a0RzCtT23
	 u2/jQxy6W1rNuBErG/uLR8Ye21fkC9ceueRCfJmgHZZdVpl0imBUQOL8PfsWgVJtuJIaI
	 hKXMAjkmZpGV1XOPnCuxT4we5QD4C0kK39oPXnX0EUrNAe7MAt32dRarSqx/ePv3BlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980782;
	bh=8z9We6NBN/G7rfPzoRp8m2NUo2xcOXwE7pc5suPoa1w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LWodighEAxi8AQF6EDmvTRrjeX1kVUMRIYJvWDk3LXiGQxtAYGs/NIkHZSKbLysXv
	 cQZU4vXWDvd1wcI4+09qzJ5hCoAYFa6CAI91jA2dZHqqtwE1HdeHgHtxuoZvdKnwun
	 VALgm7lzS6yQ+pPQ8KEVQGQolqI3g0Logirr1DpEkOHs7bLeAh9DRHr4mBVEZ4F/BN
	 Ad7KxdKzWr+hf7WEAX5tKvQEr3HQ3YK4mIx7rACz/7qwlrRjufEEFW9x7mQohC9K4Q
	 2xQS5p5xGVfAVBhyTQSBBjV64MZ9NsBY0WzIV7wXbhHA0uUJFVz+iJ/q/lUlv4ITdu
	 knXLwlqhvpRpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0852E608C5;
	Fri,  6 Nov 2026 15:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B82DAFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69621400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olKHmcGkRdxX for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 50B34403DD
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B34403DD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 888C29E09B; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 09:01:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 46d1cc02378c3fc3c3567224786b2afa7827830a
X-Git-Newrev: 51628caed763d102508497c981b29fbaefdb507d
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.888C29E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-numpy: fix
 build with BR2_i386
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
Content-Type: multipart/mixed; boundary="===============2996650957800021006=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2996650957800021006==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51628caed763d102508497c981b29fbaefdb507d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit [1] on the master branch introduced a method to pass
the 'longdouble_format' property for python-numpy.

On 2025.02, it was thought that this change was not required. The
program that check the architecture was introduced upstream in
v.1.25.1 [2] so was not present on 2025.02.x python-numpy v1.25.0.
However, the python-numpy build can still fail on some architecture
because of the 'long double size' with the following error:

```
Checking for size of "long double" : 12

../output-1/build/python-numpy-1.25.0/numpy/core/meson.build:371:2: ERROR: Problem encountered: This should not be possible, 12 bits of "content" should still result in sizeof() being 16. Please report this error!
```

This error is reproducible with the following defconfig:

```
BR2_i386=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_NUMPY=y
```

This commit backport [2][3] to be able to pass the 'longdouble_format'
property to meson and backport the changes introduced on the master
branch [1] to pass the format to meson.

[1] 62648d9892 package/python-numpy: bump version to 2.4.0
[2] https://github.com/numpy/numpy/commit/f1cddd3a159f0fdba8bb744f6e721a5242859474
[3] https://github.com/numpy/numpy/commit/582a4024971f30674555d7bf3b8fdc194766f43f

Fixes: https://autobuild.buildroot.org/results/de2/de2781d82b634f91e54a72d00bd3f3b9b559012d
Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 62648d98926cc96c680ce4698bb631188b2f72d9)
[Raphaël: slightly reword the commit message]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...long-double-identification-to-C-for-meson.patch | 150 +++++++++++++++++++++
 ...D-allow-specifying-the-long-double-format.patch |  41 ++++++
 package/python-numpy/python-numpy.mk               |  45 +++++++
 3 files changed, 236 insertions(+)

diff --git a/package/python-numpy/0003-BLD-Port-long-double-identification-to-C-for-meson.patch b/package/python-numpy/0003-BLD-Port-long-double-identification-to-C-for-meson.patch
new file mode 100644
index 0000000000..7ffb09a6b7
--- /dev/null
+++ b/package/python-numpy/0003-BLD-Port-long-double-identification-to-C-for-meson.patch
@@ -0,0 +1,150 @@
+From f1cddd3a159f0fdba8bb744f6e721a5242859474 Mon Sep 17 00:00:00 2001
+From: matoro <matoro@users.noreply.github.com>
+Date: Sun, 18 Jun 2023 19:39:06 -0400
+Subject: [PATCH] BLD: Port long double identification to C for meson
+
+This ports the old Python code for identifying the long double
+representation to C, so that it can be easily invoked by meson.  The
+original implementation is at https://github.com/numpy/numpy/blob/eead09a3d02c09374942cdc787c0b5e4fe9e7472/numpy/core/setup_common.py#L264-L434
+
+The C portion of the code has been tested and confirmed to work on
+systems with the following formats, either natively or via an
+alternative ABI:  INTEL_EXTENDED_16_BYTES_LE, IEEE_QUAD_BE,
+IEEE_QUAD_LE, IBM_DOUBLE_DOUBLE_BE, IBM_DOUBLE_DOUBLE_LE,
+IEEE_DOUBLE_BE, INTEL_EXTENDED_12_BYTES_LE.
+
+The original meson port includes an error condition with the comment
+"This should not be possible, 12 bits of "content" should still result
+in sizeof() being 16."  As far as I can tell this is incorrect, as
+compiling on an x86_64 system with 32-bit ABI (gcc -m32) does indeed
+have sizeof(long double)==12.  This is reflected in the C code.
+
+Closes gh-23972, closes
+https://github.com/mesonbuild/meson/issues/11068.
+Upstream: https://github.com/numpy/numpy/commit/f1cddd3a159f0fdba8bb744f6e721a5242859474
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ numpy/core/meson.build | 110 ++++++++++++++++++++++++++++++++---------
+ 1 file changed, 87 insertions(+), 23 deletions(-)
+
+diff --git a/numpy/core/meson.build b/numpy/core/meson.build
+index f375e9647f3a..754005c8306a 100644
+--- a/numpy/core/meson.build
++++ b/numpy/core/meson.build
+@@ -357,29 +357,93 @@ foreach intrin: optional_intrinsics
+   endif
+ endforeach
+ 
+-# long double representation detection (see setup_common.py)
+-# TODO: this is still incomplete, and different from how it's done in the
+-# numpy.distutils based build, see https://github.com/mesonbuild/meson/issues/11068
+-longdouble_size = cc.sizeof('long double')
+-if longdouble_size == 8
+-  if host_machine.endian() == 'little'
+-    longdouble_format = 'IEEE_DOUBLE_LE'
+-  else
+-    longdouble_format = 'IEEE_DOUBLE_BE'
+-  endif
+-elif longdouble_size == 12
+-  error('This should not be possible, 12 bits of "content" should still result in sizeof() being 16. Please report this error!'
+-  )
+-elif longdouble_size == 16
+-  if host_machine.endian() == 'little'
+-    # FIXME: this varies, there's multiple formats here! Not yet implemented.
+-    #        TBD how we deal with the mess of old long double formats.
+-    longdouble_format = 'INTEL_EXTENDED_16_BYTES_LE'
+-  else
+-    error('No idea what this is ....')
+-  endif
+-else
+-  error('Unknown long double size: ' + londouble_size)
++# This is a port of the old python code for identifying the long double
++# representation to C.  The old Python code is in this range:
++# https://github.com/numpy/numpy/blob/eead09a3d02c09374942cdc787c0b5e4fe9e7472/numpy/core/setup_common.py#L264-L434
++# This port is in service of solving gh-23972
++# as well as https://github.com/mesonbuild/meson/issues/11068
++longdouble_format = meson.get_compiler('c').run(
++'''
++#include <stdio.h>
++#include <string.h>
++
++#define repcmp(z) (memcmp((const char *)&foo.x, z, sizeof(foo.x)) == 0)
++
++const struct {
++  char before[16];
++  long double x;
++  char after[8];
++} foo = {{'\0'}, -123456789.0, {'\0'}};
++
++int main(void) {
++  switch (sizeof(foo.x)) {
++  case 8: {
++    if (repcmp(
++            ((const char[]){0000, 0000, 0000, 0124, 0064, 0157, 0235, 0301}))) {
++      fprintf(stdout, "IEEE_DOUBLE_LE");
++      return 0;
++    }
++    if (repcmp(
++            ((const char[]){0301, 0235, 0157, 0064, 0124, 0000, 0000, 0000}))) {
++      fprintf(stdout, "IEEE_DOUBLE_BE");
++      return 0;
++    }
++    fprintf(stdout, "UNKNOWN");
++    return 1;
++  }
++  case 12: {
++    if (repcmp(((const char[]){0000, 0000, 0000, 0000, 0240, 0242, 0171, 0353,
++                               0031, 0300, 0000, 0000}))) {
++      fprintf(stdout, "INTEL_EXTENDED_12_BYTES_LE");
++      return 0;
++    }
++    if (repcmp(((const char[]){0300, 0031, 0000, 0000, 0353, 0171, 0242, 0240,
++                               0000, 0000, 0000, 0000}))) {
++      fprintf(stdout, "MOTOROLA_EXTENDED_12_BYTES_BE");
++      return 0;
++    }
++    fprintf(stdout, "UNKNOWN");
++    return 1;
++  }
++  case 16: {
++    if (repcmp(
++            ((const char[]){0000, 0000, 0000, 0000, 0240, 0242, 0171, 0353,
++                            0031, 0300, 0000, 0000, 0000, 0000, 0000, 0000}))) {
++      fprintf(stdout, "INTEL_EXTENDED_16_BYTES_LE");
++      return 0;
++    }
++    if (repcmp(
++            ((const char[]){0300, 0031, 0326, 0363, 0105, 0100, 0000, 0000,
++                            0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000}))) {
++      fprintf(stdout, "IEEE_QUAD_BE");
++      return 0;
++    }
++    if (repcmp(
++            ((const char[]){0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000,
++                            0000, 0000, 0100, 0105, 0363, 0326, 0031, 0300}))) {
++      fprintf(stdout, "IEEE_QUAD_LE");
++      return 0;
++    }
++    if (repcmp(
++            ((const char[]){0000, 0000, 0000, 0124, 0064, 0157, 0235, 0301,
++                            0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000}))) {
++      fprintf(stdout, "IBM_DOUBLE_DOUBLE_LE");
++      return 0;
++    }
++    if (repcmp(
++            ((const char[]){0301, 0235, 0157, 0064, 0124, 0000, 0000, 0000,
++                            0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000}))) {
++      fprintf(stdout, "IBM_DOUBLE_DOUBLE_BE");
++      return 0;
++    }
++    fprintf(stdout, "UNKNOWN");
++    return 1;
++  }
++  }
++}
++''').stdout()
++if longdouble_format == 'UNKNOWN' or longdouble_format == 'UNDEFINED'
++  error('Unknown long double format of size: ' + cc.sizeof('long double').to_string())
+ endif
+ cdata.set10('HAVE_LDOUBLE_' + longdouble_format, true)
+ 
diff --git a/package/python-numpy/0004-BLD-allow-specifying-the-long-double-format.patch b/package/python-numpy/0004-BLD-allow-specifying-the-long-double-format.patch
new file mode 100644
index 0000000000..e2bf990891
--- /dev/null
+++ b/package/python-numpy/0004-BLD-allow-specifying-the-long-double-format.patch
@@ -0,0 +1,41 @@
+From 582a4024971f30674555d7bf3b8fdc194766f43f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
+Date: Mon, 14 Aug 2023 15:28:17 +0100
+Subject: [PATCH] BLD: allow specifying the long double format to avoid the
+ runtime check
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Filipe Laíns <lains@riseup.net>
+Upstream: https://github.com/numpy/numpy/commit/582a4024971f30674555d7bf3b8fdc194766f43f
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ numpy/core/meson.build | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/meson.build b/numpy/core/meson.build
+index 56e805edb855..15bf493bcf7f 100644
+--- a/numpy/core/meson.build
++++ b/numpy/core/meson.build
+@@ -380,7 +380,9 @@ endforeach
+ # https://github.com/numpy/numpy/blob/eead09a3d02c09374942cdc787c0b5e4fe9e7472/numpy/core/setup_common.py#L264-L434
+ # This port is in service of solving gh-23972
+ # as well as https://github.com/mesonbuild/meson/issues/11068
+-longdouble_format = meson.get_compiler('c').run(
++longdouble_format = meson.get_external_property('longdouble_format', 'UNKNOWN')
++if longdouble_format == 'UNKNOWN'
++  longdouble_format = meson.get_compiler('c').run(
+ '''
+ #include <stdio.h>
+ #include <string.h>
+@@ -459,7 +461,8 @@ int main(void) {
+   }
+   }
+ }
+-''').stdout()
++  ''').stdout()
++endif
+ if longdouble_format == 'UNKNOWN' or longdouble_format == 'UNDEFINED'
+   error('Unknown long double format of size: ' + cc.sizeof('long double').to_string())
+ endif
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 200fac20a1..3845b6c653 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -38,6 +38,51 @@ else
 PYTHON_NUMPY_CONF_OPTS += -Dblas=""
 endif
 
+# Generated by running this test program under QEMU:
+# https://github.com/numpy/numpy/blob/v1.26.4/numpy/core/meson.build#L376-L455
+ifeq ($(BR2_arcle),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_aarch64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_aarch64_be),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_arm),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_armeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_i386),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
+else ifeq ($(BR2_or1k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_m68k),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
+else ifeq ($(BR2_mips),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_mipsel),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_powerpc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_BE
+else ifeq ($(BR2_powerpc64le),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IBM_DOUBLE_DOUBLE_LE
+else ifeq ($(BR2_riscv),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
+else ifeq ($(BR2_sh4)$(BR2_sh4a),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
+else ifeq ($(BR2_sh4eb)$(BR2_sh4aeb),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
+else ifeq ($(BR2_sparc64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
+else ifeq ($(BR2_x86_64),y)
+PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_16_BYTES_LE
+endif
+
+PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
+	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'
+
 # Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
 # in-tree code.
 HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""

--===============2996650957800021006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2996650957800021006==--
