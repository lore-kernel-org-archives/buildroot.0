Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B3C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE5180B3F;
	Fri, 17 Jul 2026 15:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M4zatIJnLa8; Fri, 17 Jul 2026 15:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA7B080C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303074;
	bh=LHNbyQfsPqo00qvZmfGgzrKm3y5v/S9lUnA99U0uxJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aT7a3VX8rta2visG8NTZqScDwTHPBKSqWchqkIDhWw7jvXDvsEHnjbHPnDYLLio6L
	 egFnWgvEjzFm1Ks/5jx+fMhpG02Iu6idl3zqKkIewZB/47V9/e39bkbAnMXTMfu2XY
	 oCZ5u5Pio/meTdxF6YximoVh5+YmjHiBKSyZIyjtpwFENH7P56tgxg1NqmMcY5koly
	 3KyoYup604tT1Gz/g1nTTIKUUFb++AHtDJzJrC2TKG+euRfAQ08q7WiD36GLbJa+MG
	 /hZ2UWBZGfJ8kW86sd9n6255D+fWqMzLS2hzc3QH051bH2HF+EJrEh2t8hnJ/nImjL
	 mJ9bJH2Ab4R+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7B080C48;
	Fri, 17 Jul 2026 15:44:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26E5936E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C45F40291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOO_cII-dGeb for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4898740316
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4898740316
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1517488E53; Fri, 17 Jul 2026 15:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:15:48 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c8f60dff7af44157b460b1873e98de567ebd0d7c
X-Git-Newrev: d485a6b0029728d35cfde3902b4274c285a36142
X-Patchwork-Hint: ignore
Message-Id: <20260717154344.1517488E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgpg-error:
 make sure to use host-gawk
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4970943117971257999=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4970943117971257999==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d485a6b0029728d35cfde3902b4274c285a36142
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

During its configure step, libgpg-error needs awk:

  configure -> src/gen-lock-obj.sh -> objdump + awk on test binary

This call is used on the output from objdump on a test binary to
retrieve the size of some data structure, and generate accordingly an
internal header (lock-obj-pub.native.h). However, libgpg-error buildroot
package does not depend explicitely on host-gawk: if host-gawk is not
part of the build, or if it is built later than libgpg-error,
libgpg-error autotool tooling will eventually pick the build machine
awk. On top of this issue, despite the configure.ac suggesting that it
supports different implementations of awk, libgpg-error configure step
will not parse correctly the output from objdump when using mawk,
leading to a wrong lock-obj-pub.native.h header being generated:

With gawk:

  typedef struct
  {
    long _vers;
    union {
      volatile char _priv[24];
      long _x_align;
      long *_xp_align;
    } u;
  } gpgrt_lock_t;

  #define GPGRT_LOCK_INITIALIZER {1,{{0,0,0,0,0,0,0,0, \
                                      0,0,0,0,0,0,0,0, \
                                      0,0,0,0,0,0,0,0}}}

With mawk:

  typedef struct
  {
    long _vers;
    union {
      volatile char _priv[0];
      long _x_align;
      long *_xp_align;
    } u;
  } gpgrt_lock_t;

  #define GPGRT_LOCK_INITIALIZER {1,{{}}}

This issue has been observed for example on Debian 13 with mawk
installed: it fails to parse mtx_size, leading to a size 0, and so
generating crashes at runtime because of the invalid size embedded in
libgpg-error.

Side note: the lock-obj-pub.native.h header file is correctly
generated, when using mawk 1.3.4 20200120 from Debian 12.
The described issue happen with mawk 1.3.4 20250131 from Debian 13.

libgpg-error should be fixed upstream to properly handle this data
structure size guessing even when using mawk, but anyway the
corresponding buildroot package should not randomly use the build
machine host tooling or buildroot-provided host tooling depending on
whether host-gawk has been selected and built before it.

Enforce an explicit dependency on host-gawk for libgpg-error to make
sure that it systematically uses the buildroot-provided awk.

Co-developped-by: Bernard Gautier <bernard.gautier@nav-timing.safrangroup.com>
Signed-off-by: Bernard Gautier <bernard.gautier@nav-timing.safrangroup.com>
Co-developped-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Julien: add the side note that mawk from debian 12 works]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21bf78411ea52c1f67afac7b76a6f56f75b28434)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpg-error/libgpg-error.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index df95e5fe0c..31ffcee743 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -12,7 +12,7 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_CPE_ID_VENDOR = gnupg
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
-LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-gawk
 LIBGPG_ERROR_CONF_OPTS = \
 	cross_compiling=yes \
 	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \

--===============4970943117971257999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4970943117971257999==--
