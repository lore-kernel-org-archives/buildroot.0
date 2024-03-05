Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB9DC54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 13:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205D582404;
	Tue,  5 Mar 2024 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id froDC69CZr4T; Tue,  5 Mar 2024 13:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E96823FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E96823FF;
	Tue,  5 Mar 2024 13:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A18C11BF32A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F518416DD
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mySREAIJxgup for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 13:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63D6C4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63D6C4012F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63D6C4012F
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 13:57:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412ecc1064cso5570245e9.2
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 05:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709647047; x=1710251847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jdMubazflN43iQnLJ3juRvf2+cODMDKOSKHImDJVhBs=;
 b=Y6HLU7wkWUOFSS+ADdl2V3m+G5/I+zMZ8oQ09o6F1emjOQJC8tQB4ZJ95JuvTdhv9x
 7Ga0j0EshnaWqNcbMbB+XpNLSMpIMZuZ5sitsTdlA9NLfBeqaURj0Zsg75ADcR5Ddh9z
 YWGwwJJmhAcU6VYLuOuHCS4FBCVYmflD1lKIjOr38toPZjcqohFy4osU+KiA/PLRWkGC
 kQANMoYpfR5SdvwX022zAeF27CqSGjxdc1hBUOZKS2GKnbWLq89l/VXVRLLT7FSroyua
 5KWe5xSa/a7Q2yiVpMdaysbtF1KChZvRfYC7thPYfKvCeZzFgTEeQAhOJNarVSIc4T/c
 /Y3Q==
X-Gm-Message-State: AOJu0YwgVq9XS26EvVGQMLfmeRRIdyyTmOk/O0z5wZI3DPkO/ekduAGv
 +v0jji0oHF0eaJx4SOBlteOF9Vq/25/9WRp/XKZZrw3Dt5S+NisS2ElRLNTH
X-Google-Smtp-Source: AGHT+IFTMVHH7UHKKop2W0JeduNvv2F2Vy5ScdP0lSc3OleBP+2i/hMvQRMvldKTjuxFQs+HENZRJg==
X-Received: by 2002:a05:600c:458b:b0:412:a403:e6c9 with SMTP id
 r11-20020a05600c458b00b00412a403e6c9mr8417303wmo.5.1709647047222; 
 Tue, 05 Mar 2024 05:57:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b00412b0ef22basm18081674wmo.10.2024.03.05.05.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:57:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 14:57:24 +0100
Message-ID: <20240305135724.1146746-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709647047; x=1710251847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jdMubazflN43iQnLJ3juRvf2+cODMDKOSKHImDJVhBs=;
 b=caz6ZMwjiQR8X8Id5yc3dbiXsaT5CMnhc63j7vFptTwGfPAkg+byF4MJq52sE2HbvW
 4PqDtkQfWDIwL4rVoxhBXePU/CZW693+Ddme7Xy0U8dRVK6jP97QK7IJ35wdHl/c+em2
 DRo0aDliBMkVYewAPW5eYXkQu7Lf6hGfZYMmE+g/RzSPqQgLZ0+0f49odHDp2+5Nlbx4
 GC2sw7meZLWNtDBtmgpLlMZ51tUQLRd9Ig9zcDDd1sSNtLUd0CenIWTL0JKZnynzkhKS
 1pYuThUeWpZNjpzMyupeBgoX3bnu+LHsmku2Rp09VfV734CDXbzmZFAi8D755/G0vMXe
 j23A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=caz6ZMwj
Subject: [Buildroot] [PATCH v2,
 1/1] package/policycoreutils: fix build with BR2_TIME_BITS_64
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/errno.h:25,
                 from pp.c:20:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was there since the addition of the package
in commit cb328f77f8f07bfd89d6b69385c941a7b281732b  and is only needed
to fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Also fix host package

 package/policycoreutils/policycoreutils.mk | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 56889242e3..3ad7e9a5b3 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -11,7 +11,7 @@ POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
-POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
+POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
@@ -28,14 +28,6 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
 POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
 endif
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-POLICYCOREUTILS_MAKE_OPTS += \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
-
 POLICYCOREUTILS_MAKE_DIRS = \
 	hll load_policy newrole run_init \
 	secon semodule sestatus setfiles \
@@ -59,14 +51,9 @@ endef
 
 HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
-# We also need to pass PREFIX because it defaults to $(DESTDIR)/usr
+# We need to pass PREFIX because it defaults to $(DESTDIR)/usr
 HOST_POLICYCOREUTILS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
-	CPPFLAGS="$(HOST_CPPFLAGS) -U_FILE_OFFSET_BITS" \
 	PREFIX=$(HOST_DIR) \
 	ETCDIR=$(HOST_DIR)/etc \
 	SBINDIR=$(HOST_DIR)/sbin
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
