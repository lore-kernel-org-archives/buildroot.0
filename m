Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E59CC54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 09:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC8304159C;
	Tue,  5 Mar 2024 09:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZt43q_nDamd; Tue,  5 Mar 2024 09:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84035415A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84035415A3;
	Tue,  5 Mar 2024 09:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5DC71BF25F
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC3240733
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUGDY79LjEOw for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 09:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17BB140709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17BB140709
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17BB140709
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 09:13:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d509ab80eso206960f8f.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 01:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709629984; x=1710234784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CnqzLQeS8YiQfdkWSk2Lvv7RJZgkHXT+oZJAEw4wS28=;
 b=mld7xLVBSGS8Cf8ovPOZgcMKTkJDKePnjxNXr9UW+cenynezdT1XhGCb5UDSRb5BAb
 szuk2EL6AHT8z8DVxCMjEtI5K1z4ZwXHGfR5R0Qm+vvjtAJIxloH8UxPfTkv0Jg31iA5
 wIz5kibQU7k2sE+NS2fuUMNKnIX7l+5a4NVC6butCyqqeT+ZahoRVClgvI/f+ySxpF8v
 m9DzDMRM0vhxpB+kZUC47m1LOA/wXMlyv9Od9iwxE8aaE112WAjq9YuoV3K36AnGB3xf
 UhZTh+1OpiMXekzlNlSRrI5dP3B32XIg3yiL11+V3eW5LVPSph23AsbHUdnkfKbHCXSI
 E8CQ==
X-Gm-Message-State: AOJu0YyNj6OWuFYH+hVsTu48jVmmmkW9J2ouVdziOACvrnLRweh93Z/A
 GfuZUh0hWbW6qu3VfJ3lHxhaWBi60QEqErjY+6cwJ0G/PhA0XvFoq514mwy1
X-Google-Smtp-Source: AGHT+IFar6cBC8g6HAJ1tosQ2nYgd621l5rWPsjrt4dGrn2hKvX0i4D170qhnkoV05WA3PCdI8wD/A==
X-Received: by 2002:a5d:48d1:0:b0:33d:f719:83c7 with SMTP id
 p17-20020a5d48d1000000b0033df71983c7mr7373059wrs.71.1709629984381; 
 Tue, 05 Mar 2024 01:13:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r18-20020adfca92000000b0033dcc0d1399sm14419321wrh.25.2024.03.05.01.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:13:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 10:13:02 +0100
Message-ID: <20240305091302.7403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709629984; x=1710234784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CnqzLQeS8YiQfdkWSk2Lvv7RJZgkHXT+oZJAEw4wS28=;
 b=OshA+//dHmfGAaQbPCeDUdcUZhoWLd3qaPgdAhKHi0NgHh8/1wee/cs5Z1fA1f7ZR5
 5k+M8Uri/Esh/2y0GqqmAq33snwXHIahGEDrvpZr2tTRd+uJ5+iQuThWMU2V4LMW+qF7
 PdYn5TQEMGjcXEObetJS/TQWdIqj8S3HI4MLQ/fpO8KM4i0r6MDszr8J7C/FE2HvrPMH
 tiHHtsxeXDg+gj7YnKQUWUMuKDZz/oBgB0H2wx1eMeJszyOgYmj19G8utK2rxoGG9bw8
 UEbvaI9eHeLwUCVMZy2wBrRC4RQdjmMXrEl2Fjjxc+pH+4SLcB8Qb3J9l/Uu4NuM6o0K
 YwBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OshA+//d
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 BR2_TIME_BITS_64
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

configure:5239: /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Os -g2 -I/home/autobuild/autobuild/instance-1/output-1/host/bin/../mips-buildroot-linux-gnu/sysroot/usr/include/tirpc  -fno-builtin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 conftest.c >&5
In file included from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/limits.h:26,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:205,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/syslimits.h:7,
                 from /home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/mips-buildroot-linux-gnu/13.2.0/include/limits.h:34,
                 from conftest.c:12:
/home/autobuild/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

[...]

checking for /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc options needed to detect all undeclared functions... cannot detect
configure: error: in `/home/autobuild/autobuild/instance-1/output-1/build/ltp-testsuite-20240129':
configure: error: cannot make /home/autobuild/autobuild/instance-1/output-1/host/bin/mips-buildroot-linux-gnu-gcc report undeclared builtins

Indeed, this LFS workaround was added by commit
ca3524ba707126de7284210c00268a8e7ca6379a and is only needed to fix a
build failure with the old codesourcery-arm toolchain from 2014 which
uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes:
 - http://autobuild.buildroot.org/results/d2e75a79bc42b6a9a2b407fd557aca5c7f207d84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ea57686a9c..0996b77e58 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -47,10 +47,7 @@ else
 LTP_TESTSUITE_CONF_ENV += have_numa_headers=no
 endif
 
-# ltp-testsuite uses <fts.h>, which isn't compatible with largefile
-# support.
-LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-LTP_TESTSUITE_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+LTP_TESTSUITE_CFLAGS = $(TARGET_CFLAGS)
 LTP_TESTSUITE_LIBS =
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
@@ -66,7 +63,6 @@ endif
 
 LTP_TESTSUITE_CONF_ENV += \
 	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
-	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
 	LIBS="$(LTP_TESTSUITE_LIBS)" \
 	SYSROOT="$(STAGING_DIR)"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
