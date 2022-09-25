Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33197C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6DA402BC;
	Sun, 25 Sep 2022 09:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA6DA402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKJUNZCbTppb; Sun, 25 Sep 2022 09:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6272400FD;
	Sun, 25 Sep 2022 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6272400FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0FA91BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 712BA81699
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 712BA81699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kw_dPFuDYjXL for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:44:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BE38161D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BE38161D
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:44:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9C86AE0004;
 Sun, 25 Sep 2022 09:44:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 11:44:03 +0200
Message-Id: <20220925094403.1593562-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664099050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ti6Bd0PZXZGMKPfANeQUaRbHvlFpwbw8C9iQuUKk6f4=;
 b=lyfUwybSUw7RX3HN7/AdcIrVUn6wt43mKYHvLgxzrfCymFdjELa7CqNNifuooe/FVKTWH6
 HC6iayar50TQWGYFjmhrIq0KJYDBsOSkbYb81kaPd/KAq1QYnKWCB9VtSjU3AFVKGuUOJX
 jb2qUawkSOGCC9+Dd119GrPc+7JtNB1R3tAYPcO1TikzsJ4j3cVoW0rAyULOddghh4uUO4
 mTeZpc0ponHmPHEgm3ZxsVVuBtO19L28dgjA9RkqYfu7XqMcv/Xw71BGtaoAPn/FOwnymb
 gITyeiZ5IGq0m7H2ds91DQH411ojunOyWGs/vV/0QObO0UggbHi2WletKsetdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lyfUwybS
Subject: [Buildroot] [PATCH] arch/Config.in.arm: drop support for iwmmxt
 architecture variant
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This architecture variant is broken in GCC, causing build failures:

../../../libgcc/config/arm/unwind-arm.c:467:1: error: unrecognizable insn:
  467 | }
      | ^
(insn 2 4 3 2 (set (reg/v/f:SI 118 [ p ])
        (reg:SI 0 r0 [ p ])) "../../../libgcc/config/arm/unwind-arm.c":456:1 -1
     (nil))
during RTL pass: vregs
../../../libgcc/config/arm/unwind-arm.c:467:1: internal compiler error: in extract_insn, at recog.c:2770

Reported to the GCC developers, the feedback was "iwmmxt support is
definitely bitrotten and most likely should be removed from GCC.".

See:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972#c1

So this commit simply drops support for iwmmxt, which anyway is
probably barely used nowadays: it's for old Marvell PXA cores that
implemented a special SIMD instruction set. The BR2_xscale option can
be used instead, it's just that it won't use this SIMD instruction
set.

Fixes:

  http://autobuild.buildroot.net/results/8e4c4512902c34d8ec0c6f8dfff92b7a198e4b4a/

and the numerous other build failures at:

  http://autobuild.buildroot.net/?reason=host-gcc-initial%&subarch=iwmmxt

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         | 10 ++++++++++
 arch/Config.in.arm       |  5 -----
 package/pixman/pixman.mk |  9 ++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5f7274e84b..5892dfd44f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_iwmmxt
+	bool "ARM iwmmxt variant removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARM iwmmxt architecture variant in GCC has
+	  bitroten and is no longer maintained. GCC maintainers
+	  recommend to no longer use it, and suggest to use "xscale"
+	  as a replacement architecture variant. See
+	  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972
+
 config BR2_PACKAGE_GPSD_OLDSTYLE
 	bool "gpsd oldstyle removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c391d6c72b..78621e321c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -129,10 +129,6 @@ config BR2_arm926t
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-config BR2_iwmmxt
-	bool "iwmmxt"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_ARMV5
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
@@ -817,7 +813,6 @@ config BR2_GCC_TARGET_CPU
 	default "strongarm"	if BR2_strongarm
 	# armv5
 	default "arm926ej-s"	if BR2_arm926t
-	default "iwmmxt"	if BR2_iwmmxt
 	default "xscale"	if BR2_xscale
 	# armv6
 	default "arm1136j-s"	if BR2_arm1136j_s
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 64302fa49a..3f65f0484d 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -21,7 +21,8 @@ PIXMAN_AUTORECONF = YES
 # don't build gtk based demos
 PIXMAN_CONF_OPTS = \
 	--disable-gtk \
-	--disable-loongson-mmi
+	--disable-loongson-mmi \
+	--disable-arm-iwmmxt
 
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
@@ -40,12 +41,6 @@ else
 PIXMAN_CONF_OPTS += --disable-arm-neon
 endif
 
-# disable iwmmxt support for CPU's that don't have
-# this feature
-ifneq ($(BR2_iwmmxt),y)
-PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
-endif
-
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
 # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
