Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33373C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 02:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D39683E1A;
	Wed, 20 Jul 2022 02:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D39683E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xROfPUr466RS; Wed, 20 Jul 2022 02:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F158832EB;
	Wed, 20 Jul 2022 02:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F158832EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F61C1BF275
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 02:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C130441972
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 02:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C130441972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-N-x_tBlCsK for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 02:45:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A8341977
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A8341977
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 02:45:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.92,285,1650902400"; d="scan'208";a="207041439"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2022 10:45:37 +0800
IronPort-SDR: VFTLOhktnO2UKzSQehoIF4iZ6rcI4OOKYVQoMHOJzVlsLgl+BfsZvO3xR7pENl3Fa2Sqfdo+/p
 pZU6USmI83rWCZYyKRmkBXxM49LXyXlCUytFud9gQGcqWy6ikFHQzMXFoOs9I3NAFO/jg5nUkB
 uGePLHZYx9vlHRLFqKR1zYwAWcOg5OTp6dxr90vKKTCZ5hUqVkxHl0GqZ3m+SURkB5kyItNS6a
 z58nO7iKLwHjMyCcXsnDbtQ8H24CHLZVKy2YIQgGzpLWp9bNF6uGVOPgn4hqMaD1aRGDGr5yjL
 CC+dri7DfRovBKc6vOPYpXC5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 19:02:03 -0700
IronPort-SDR: 4Ab3+HtI8bXpq+y+D8AGOnql/qbfK0AR39eyZdjhQKZJu5tfTV3lM7apYPU+i9CaPoXcoKpCQ5
 lP5e72iv+s90I4j63DDyandx+LGhplyUlIPLLRDAGcw+H3Sa9ZRHq75US8pJ1pRI1sdrgJNma6
 HkDKK7ST2c6oi9tUD/QQtWm5ClvkGJ5UrJs48L9RYWtlRAzzSAMOtcxLvwKZj26u0fNkHp+ulT
 jLWjM895cipwnoilgrhv7EU1uE25YqntoYsz281Hb2wYf2HaA+KzVPrQLpunHS08L9qgcsrKdk
 BsM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2022 19:45:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lng6n2fxFz1Rwnm
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:45:37 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VWAP3ZJbzYEj for <buildroot@buildroot.org>;
 Tue, 19 Jul 2022 19:45:36 -0700 (PDT)
Received: from twashi.fujisawa.hgst.com (unknown [10.225.163.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lng6l1wg4z1Rw4L;
 Tue, 19 Jul 2022 19:45:34 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Jul 2022 11:45:25 +0900
Message-Id: <20220720024531.435748-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720024531.435748-1-damien.lemoal@opensource.wdc.com>
References: <20220720024531.435748-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658285139; x=1689821139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNiaQviUHmHIMmAeqhuyeWUF71iHH9jh33VF3o6WUHk=;
 b=eCnE4kPyWIpwX3CkOuSTK0uQ7x+jSrVJLYvyBL/fAHCu0IiCsU2j+Pqt
 h92Cq75e5QwsB+0HGffDl3vW7kyQYEaX1sL26WSqg0trYKIIrOU+Priku
 m+60/Sf3TYH7qUQcQHvYOKqUM6zV+TMqd+ikCjXQ3Zrclw4F3dLuw+KOM
 SK3py0yUlBRRhRnTOegNscQP9XpypayFQubKPuzPMmcbt+t5XKHsvCxy8
 Gx1orkAYr0OySbXLUON1tVKwD25Vbq32k4vpOVovDWdCwBMcm7ilyWw3l
 Bd2Zs+JVAsBJr+8ZmfceKfdfJVfVWA4MmgpruDJFWUk9iuMkJ+sDgQ+Ns
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1658285136; x=1660877137; bh=xNiaQviUHmHIMmAeqh
 uyeWUF71iHH9jh33VF3o6WUHk=; b=nlgkPg1VIa/lETfcWqtB0f7quAwJQBl7rn
 DyG8yeXtZMm9a2HrmhK+9oUfZyv8e63Lm98j+1St4/MR8WhFdotLlmd8Y5jpXUKF
 V+NtXaRz0WrftCk48AwXFobzRPCI66Mh//OoL8BnIIypdY3qzQEuYAF3duBQ7Dif
 jm54MU9vs/JBv9zC0nBgbjAjGaoTxP6/09g8cOP2Hz21CpIFXcP7QlbNuRGRG+QP
 1YDHraqtvcmnz4P+L2+pHimaAOYTeBnnXclPOTTz4/J1nmCkextSTRWVAAJlbqol
 NGiq5CE7VjI4Nc/292GJE7T+TkWTbopf3ivDwgmEDydrEU1qAA/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=eCnE4kPy; 
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim
 header.b=nlgkPg1V
X-Mailman-Original-Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
Subject: [Buildroot] [PATCH v4 1/7] package/elf2flt: Remove Config.in.host
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no need to have configuration files direbtly set the
BR2_PACKAGE_HOST_ELF2FLT option. The need for the elf2flt utility is
automatically determined by gcc build in package/gcc/gcc.mk according to
the BR2_BINFMT_FLAT option.

Accordingly, we can remove the file package/elf2flt/Config.in.host to
get rid of the BR2_PACKAGE_HOST_ELF2FLT option. BR2_STRIP_strip
dependency on this option is replaced with a dependency on
BR2_BINFMT_ELF.

To stay consistent with the fact that elf2flt supports only the arm, sh,
sparc, xtensa and riscv-64 architectures, a dependency on these
architectures is added to the BR2_BINFMT_FLAT option in arch/Config.in.

Board configuration files setting the BR2_PACKAGE_HOST_ELF2FLT option
are also updated.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 Config.in                                 |  2 +-
 arch/Config.in                            |  1 +
 configs/qemu_riscv64_nommu_virt_defconfig |  1 -
 configs/qemu_xtensa_lx60_nommu_defconfig  |  1 -
 package/elf2flt/Config.in.host            | 13 -------------
 toolchain/toolchain-buildroot/Config.in   |  1 -
 6 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100644 package/elf2flt/Config.in.host

diff --git a/Config.in b/Config.in
index 52c3c4b4c8..af9052d32b 100644
--- a/Config.in
+++ b/Config.in
@@ -432,7 +432,7 @@ config BR2_ENABLE_RUNTIME_DEBUG
 config BR2_STRIP_strip
 	bool "strip target binaries"
 	default y
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
+	depends on BR2_BINFMT_ELF
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to save
diff --git a/arch/Config.in b/arch/Config.in
index 366ce71f3a..26293d4986 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -384,6 +384,7 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable
diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index bfee9e710a..33fad50a3c 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -6,7 +6,6 @@ BR2_RISCV_64=y
 BR2_GLOBAL_PATCH_DIR="board/riscv/nommu/patches"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Busybox with hush
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 44fb81bd74..f107b7e73b 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -4,7 +4,6 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 
 # Toolchain
-BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
deleted file mode 100644
index 2bab0095c2..0000000000
--- a/package/elf2flt/Config.in.host
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_HOST_ELF2FLT
-	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
-	depends on !BR2_USE_MMU
-	help
-	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-	  is a relatively simple and lightweight executable format
-	  based on the original a.out format.
-
-	  This option compiles the required tools and makes the required
-	  modifications on your toolchain (linker).
-
-	  https://github.com/uclinux-dev/elf2flt
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 11566c27ff..56343daee7 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -89,5 +89,4 @@ source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
-source "package/elf2flt/Config.in.host"
 endif
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
