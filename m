Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E26606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gV6bTQMe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830008169F;
	Sat, 24 Oct 2026 07:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2PECClnAc-W; Sat, 24 Oct 2026 07:56:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 603AF816DA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792828599;
	b=ljTi378s//CgHhfVxhIJ8fpta0jEypn93fpBFLp2N3rs0vR3yoV7lcKdD2LPl15Txb4T
	 3SVRgy96aoUKYp/2SLP3L429DQ/OLD+oTShEwcJmhxINQvFg78tWgpJT399BImswf2S39
	 AFc2zP4pR7Qh0E26qiKBv/UPzsaUJVJCgnNHJ/1mykD7BtexSveyh2ueCM8T/UXlzd3gj
	 TyLvAW21u7J5JW0qOLlgp2/utAawW5udJThdwkfgu0d59o/O/km1Aj8fPuVV38vZhatjd
	 6JdXnzXRjiVD+X18E/3m0oiabv2u7PSJotv1cr02P+VLpEL6S9JVG/UQow+bU9WytGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792828599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kc2E+cdAK5BJlQ7u3GNaR9T6AHFmUPcRGps3sGfpHbc=;
	b=dsf/9LPWdgEfVIGPOtazqA174nzec1n99h+Qo5qGC+oA0L23qiPR1pQe7z2d7/XqcRK1
	 iJ5eoQMFYhNZde5pD3qBU9A8Rj2SquDpXbk1srQsj4CX5BDJYdLoXapbSx8n3R4z8otSL
	 Jg3DTkC3/UaD+xkkgTxC5qINMlA7VdLTpjMIjIJZJYA51u3ZHb20xTjuTCSIQ663SIXsB
	 ayHOPeY4t3RvLW3MOyT31CcG7XUS2bFDeXtpEHBCzNgGwmVemiBqbYGA9Gm32vTr6ZfMQ
	 vfxOZPNkZUUtVR+FuK4osjDyD05IXsb0JJ/o8uyFnqYAtQue5O0pVIPQtffrbM0r42Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792828599;
	bh=Kc2E+cdAK5BJlQ7u3GNaR9T6AHFmUPcRGps3sGfpHbc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gV6bTQMeK81zCnEKV58bYpIr6gy0tKRpwaqVST9F50ByS5PiTMNPtk7BxzjW/cuOv
	 cDxjjpnwwzjwc21ln2PAruLiH+niHhOOtkXGmu/wyGonbgB5exH5SNGY/T6j/+gdbQ
	 zBU3xGbFZbARNRVbaRxbiX67txBpRmTnJNNwhtUh8wT1udpmKmTDSVhcFdw9bDGXXb
	 8xEaInDqMFv0WUwQWgiD/w0flYIazUHu5bwQnPNWGusFLEawJZr6m6dwfktdHYwxA6
	 /84smGs5FV7E+OeBXWzfKOSxPHqDQ8CB9fElKn5VlKv22AHJocGrKdHGYkltAWg5AD
	 bjTQ+AebXMeyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 603AF816DA;
	Sat, 24 Oct 2026 07:56:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA68765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24AB040ADF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oy_zNfXHF60I for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 07:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7C7440ADE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792828593;
 b=WCq9XsFaRErE4rr/pQAZs1ShMQ9t7HASC0IAGvcWWNCq2rsMRbQL3nq3/GppyWGkhxuI
 qk4XuflCU9z1ONT3YNIelp74ppm/TRpVfSYRE/uZn3CRrE/lOqHua7rPwDz4O7hp2VF00
 Mi4k1AroR9EKhO2ZrAxRk2Fvy7QbLkvZnJHWCuz8SmbXKyHap0M2C7BpGikA1iu5hVK6K
 pBI7+WRh1AZXJHnE+h7IHhQ0wnUWNRuUXHGi4Kpk5JADV7ocXbDeOXUjUeVNFhwPLpbGb
 oJUA10683GYH4yzsdDOfh/36eFW7uURdAvzsLmlcnGeO8dmZzm0pNzbFZA2vfu4yejw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792828593;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=MTfAFWEd5OOj4Nj+tV3OduNOKLThfW69fncc3vjhe+A=;
 b=HnpaX8TatVJkeEJ3gC3Tiaa4roDSFJnZ65lzm1789lThqRwcjHmdyHHnOO4oYzeNvgyo
 ZzqrZ5CpJW8FwtySu76VTsqXJcoLHkTBxbv9t4p31D5Ml3PddKRSLv838En1EeyBDOOZh
 XAL4AJxs1tFXcgHhF4CK8WAcSCHtbTYwfWR3dI8LW/koPtOHH65u3Q+sF/PP6mpiOwD0z
 z3fPDPfhov2iGTsTL6k1tZi0gU0D5dj1tUyXLpYJkCr0eAAlr6L38w0AtLgsXHopKhtyn
 gxsUXX04VoA57XP3477Ajxzu2UzrwHhCQsldK276eFchx6t4AwuqT3j4bgTAkW/akkg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=f9Gn3WXm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7C7440ADE
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6af8620a7d2so1805398a12.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 00:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792828590; x=1793433390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MTfAFWEd5OOj4Nj+tV3OduNOKLThfW69fncc3vjhe+A=;
 b=rSq1ePQg6QCDfK4Bn/ApgfEx/AHnekYWiZXleS6ysKB3SNKVn66tzv4k0rm6sTuDfe
 MDfb+tPvQFnfj9DaO7+PV1lUBAhKDVVq8hJoXVKF1QSiuqlWd2IGg9BjCsMGuDJB31UW
 2PQ3mm44IDu5qW6uRjYIQZEKrZGwv83a4H4rEGcsQHkM/16tY9dq+fUiJCNzyZ1JYDra
 E6eu2JFxYOUv45djvAvRhSTV6uDxP7eG+WtfLtCfdIPJYfXQpFp0reo1MhOBJr+TpYCN
 PudhE6b3mDNtlygl23XuOouKiHPpJCtWtOVJ/33ExxPJihgEIQ2809S7+hDhAXt2HmYa
 ZUmw==
X-Gm-Message-State: AFq9FYKsyu5QOKbSh/DfwL9jRVlabq4dcAuhrQbX6MWk5tXI7cnHHBPw
 znwQRJIphBJ7yEh35w27umwj2MVN/tHPRAnGKa2ZrFf/5/xMgiF60d+K0qJwgA==
X-Gm-Gg: AYBFou02ju6eeFEBYljbAnWH4VM/tVnyCKtmFfKl66J0X5+wgMTG0a4mbYswlE4acNY
 eKQfGTkFFIp7yCBxgcrrrJQh71xFxxPLAhN3Zh44PpDtqQrt9hNZ+SwmC16XiZsH592xjJiXw0I
 RVgt4+FrDGafx3p3pLASoYRckj3uHCyfVkNrm3+eXbVT5+d/kECD68WWhqpwTmQlIahEu6ynqCK
 O5zUjgB0tRML1vHJG2J2lHWF/1s74+snKByvz3EQorIu8DRMGZrPYU+f7h/2snlj5wxdCzCUJ9G
 zsk9CkDM3LcTU6MMpJsMKc2YYMk05w6H6sZlbl8/LSKzXt4XR06IHj8/08DKRShUQAlWrLHf2kh
 gVxUHCxoAJ50TjTMKEbeZOGyWjfGn/eJtgiBJQGjsMQLCD+ZIzF5ohF4NiPMbFxdbWoTTfq3dSd
 TdEebEXA0Z8vJzlCnJGaTISFtvn6XfS5elpbK8fOvlSchWKNUGQHx8IB445GdFUHD0/6GhGTUAt
 TVOiN9lsCkPIngHQU17bIkyTv0/28QdJTUK7rbP9E+YizvyIYA0bgfvGNKHyGHv6HO/eEYY1FSH
 CugnuVMUq1LJ87LHjn2IUNaG4VOImcr6J4Po
X-Received: by 2002:a05:6402:454d:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6b442fece01mr1271620a12.32.1792828590169; 
 Sat, 24 Oct 2026 00:56:30 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984ca4sm708564a12.26.2026.10.24.00.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 00:56:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 09:56:27 +0200
Message-Id: <20261024075628.3205436-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024075628.3205436-1-yegorslists@googlemail.com>
References: <20261024075628.3205436-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/openocd: fix static build with
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
 ...-configure-Use-pkg-config-for-jimtcl.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/openocd/0004-configure-Use-pkg-config-for-jimtcl.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
