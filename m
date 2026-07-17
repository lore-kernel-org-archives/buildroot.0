Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9B3C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B79040B32;
	Fri, 17 Jul 2026 15:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVBwc_X3Mwel; Fri, 17 Jul 2026 15:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5481240B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303178;
	bh=Ym5FjwJxb/uhpYW2gK5d1WXRKizlZUqKH9abxsbvtgg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QO3fsaBAb0XzhOhJz0pZOErk15Wwk5pJh4Pz4hb2NoBh32+UA1YKa4tlUtZ0pk98o
	 YD2CZPhkqXTyT/eVZuDINOVOxIhfJjZgwOJ2/jRjnCEO8Nb1PHl4R779ZOTtWuxqU+
	 mSPR1sbU2ACfWnxXzgxfOA+f1sUuYUPugqNT1OQDG+JnAWB4KbRj6fwVywMECtJUkA
	 mWf4xUJ6lZzVc3ur2/e0GcJ0RgId4hRmdc/l0e6wRroJP9m+NwNt8TOMpnnb9cEdLk
	 Hig1qLxuFEty9hQc5MMknrmJ5xRF7WcDSPaXBWAglv7UDtybMb24BwYxXm7OrV2VEG
	 FuT6AidwDWTJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5481240B26;
	Fri, 17 Jul 2026 15:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8797536E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8573B40A27
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go8tj1dhn_Zy for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7993A40A62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7993A40A62
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4696788E53; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:15:50 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ad20ef6ad26ee86cd9b8339d94ca7eab22a0e868
X-Git-Newrev: 3cb7a729940b8e674be407cca35d1fac3b3f2a50
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.4696788E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libgpg-error:
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
Content-Type: multipart/mixed; boundary="===============0906377540324887867=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0906377540324887867==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3cb7a729940b8e674be407cca35d1fac3b3f2a50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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

--===============0906377540324887867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0906377540324887867==--
