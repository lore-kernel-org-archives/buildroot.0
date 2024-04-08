Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27003C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD2CE60AD2;
	Mon,  8 Apr 2024 13:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kl6kYnZg4DPD; Mon,  8 Apr 2024 13:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EF060B00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2EF060B00;
	Mon,  8 Apr 2024 13:01:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 826821BF3C2
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 700AE40494
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifXeKjeeS_Dk for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=chinhuat@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6046640159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6046640159
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6046640159
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:01:49 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1e45b9a5c53so3388395ad.3
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712581308; x=1713186108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vqOaDukeFk17kTu/xzWHpB15c5r/96kQxkjRor4uR+Y=;
 b=LjtjQfQg+jFf3SqCPGhGUt3pZq1NWGpaefZTnzbNogtRCGjUT5VZ3zhJcgSpzYlfP3
 DYpyag5vti+9ReqZfdC0jTpOs9xawN5DGiav+xX+CCUB0e9qKUTW2O5AbTFOmtPJjoYC
 OJsgOQ40R8dHHLwGSI5ElCfU2ZT8T0wqJK2vns9PNslGGVDtGzlcGJyTKUeYCFwjPrVQ
 pnHq+APkIYyzX4FBfxd5TFxxhgP5oFOiaU/Zn4pee6XreKSnQQdXtsd/U9bDziwTqCiv
 R42O+bHc6sp0GReCNlf++tcMlutsBKsP2JXqIM4dXlJrGf8dc2BJHfh1dZIzYzdJ5I6m
 Q/cg==
X-Gm-Message-State: AOJu0YwalfTRm5FDN49fgRoJFlj7WfaQefVPYR5GQDFJM5q74fZKlgLW
 FBw40+uw9c34O4cgF2pN1kCFVBV7rgEgX22Dv31Dz+MZ2xJrzlFkn2cVZJqD/+QeIA==
X-Google-Smtp-Source: AGHT+IEsZW/D6dre5l1dR6wjuUYzqXNSZu5/tuJyeUHSfC9eoqVnBrNiAyFuHFY9LDMDJd2NAPubhg==
X-Received: by 2002:a17:902:f552:b0:1e2:44c7:b2af with SMTP id
 h18-20020a170902f55200b001e244c7b2afmr12428860plf.61.1712581306128; 
 Mon, 08 Apr 2024 06:01:46 -0700 (PDT)
Received: from NUC7CJYS.. ([175.144.129.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020a170902ce9100b001e219142f18sm6412319plg.114.2024.04.08.06.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 06:01:45 -0700 (PDT)
From: Chin Huat Ang <chinhuat@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 21:01:03 +0800
Message-Id: <20240408130103.3680258-1-chinhuat@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712581308; x=1713186108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vqOaDukeFk17kTu/xzWHpB15c5r/96kQxkjRor4uR+Y=;
 b=DuojCXqLtgllXMLQtvMCzFzbkZz4VhuPXtOhDSNxkOpBIFLZ0vfcdSVd1f8SeTLQxM
 4of1Juv2bnpmAWPPosawOBhFADuc8Hc/dxW6+ZDuKMCyWfC1WY9ofVHCwpyhMyMq1AVH
 coKw/HGDndBJxysKOYOt9gWmiqEBoE/bCGmyh/S2PgAMTfpkIgPIrezHZWOHwluQunqW
 BzAbrptYfzHJiVpZOoCWr+eBmhDYTAcLc+5nv/Y0x1f01+cSb0sgantzKDuwjmowurJM
 2gsjNs3fOQGR+6JlLsyV+p3cFn2xzuf0kmYVZr4m3Mf06lDo0aCd8ZpUpYrDQCjfN5fg
 EbHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DuojCXqL
Subject: [Buildroot] [PATCH] package/uclibc: bump to version 1.0.47
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
Cc: Chin Huat Ang <chinhuat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Git shortlog:

Dmitry Chestnykh (23):
      Fix redefinition of _GNU_SOURCE.
      ld.so: Add support of DT_RELR relocation format.
      libc: Fix dns-related build issues.
      Add extra `-shared` to link.so command.
      Fix broken compilation of uClibc-ng.
      Rename `reloc_addr` to suppress `-Wshadow` warning.
      Introduce time64 support.
      xtensa: Add time64 support.
      ldso: Remove unneeded semicolons.
      Remove unneeded comparisons.
      Add support for using time64 on big-endian machines.
      Add time64 support for PowerPC.
      Refactor `ts32_struct` and `TO_ITS64_P`.
      Add time64 support for MIPS32.
      Fix *stat() and *stat64() when the time is beyond year 2038.
      ldso: Use statx() when time64 is enabled.
      libc: always redirect *stat() family to statx() with time64 enabled.
      libc: Pass 64bit-only time structures to syscalls.
      Add time64 support to OpenRISC.
      Add time64 support for sparc.
      libc: restore correct definition of semid_ds struct.
      libc: Remove 32bit timespec structures everywhere.
      Add time64 support to ARC.

Frank Mehnert (1):
      ldso: add null-pointer check

Marcus Haehnel (4):
      Remove duplicate semicolons
      libm/w_j0f.c: Call correct ieee754 function
      libpthread: Remove no longer valid attribute_unused
      libpthread/linuxthreads: add missing string.h include in condvar.c

Marius Melzer (2):
      Fix -Wgnu-designator clang warnings
      Fix -Wnon-literal-null-conversion clang warning

Paul Cercueil (3):
      sys/stat.h: Make S_ISSOCK() available if __USE_XOPEN2K
      sys/stat.h: Make fchmod() available if __USE_XOPEN2K
      features.h: Rework _DEFAULT_SOURCE

Sven Linker (3):
      Avoid fall-through if file matching temporary name exists
      libc: Fix some unused parameter warnings
      Replace null subtraction with cast

Waldemar Brodkorb (25):
      c6x: fix duplicate include
      add newline at end of file
      fix c6x toolchain compile
      remove symlink
      riscv32: decouple from riscv64
      riscv32: add ldso support, enable time64.
      riscv32: add basic support for NPTL
      microblaze: enable time64
      superh: enable time64
      m68k: enable time64
      x86: enable time64
      update MAINTAINERS
      bump version for 1.0.46 release
      add reallocarray from musl
      add explicit_bzero from musl
      riscv64: sync with glibc, fix all TLS errors in uClibc-ng-test
      riscv64: page size is 4096, reported by sorear
      riscv64: sync with glibc clone.S
      riscv64: clone behaves like on aarch64, fixes tst-basic3, reported by sorear
      riscv64: add atomic.h, fixes tst-cond16, suggested by sorear
      riscv32: sync with riscv64
      riscv64: enable CTORS, fixes C++ applications, found by sorear
      riscv: fix pread64/pwrite64 users like git, suggested by sorear
      riscv: add __UCLIBC_ABORT_INSTRUCTION__, suggested by sorear
      bump version for 1.0.47 release

Signed-off-by: Chin Huat Ang <chinhuat@gmail.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index ae1f3178d9..a10ceab54c 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.45.tar.xz.sha256
-sha256  c2f4c6b6e19d7c9c226992a3746efd7ab932040463c15ee0bc8f4132b5777ac4  uClibc-ng-1.0.45.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
+sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 88623840bf..a7b18133ff 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.45
+UCLIBC_VERSION = 1.0.47
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
