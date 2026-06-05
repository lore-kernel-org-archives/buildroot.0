Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87963CD6E7E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8866105E;
	Fri,  5 Jun 2026 20:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeKigzJhjWNn; Fri,  5 Jun 2026 20:04:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE64B6104E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780689870;
	bh=QVvtA5esSq1R4eGBd+FM/aIz4rJtpmeQl/Tq3CTWgb0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J/IrfMnWAewHmmhioOptpjowEPU3MuztkpRel5x8HJABWpAjNn0OvnzznL+/oIZzz
	 dleD+dHHvjQORDuFHOm7nnRvlKE1ORYThkSJaakL1K9yXpC/qRxSxaNkF/k0p4bgeF
	 j9d/kHL51LR0rcSo7IScbIQoIRIjdSfI2cmQY+k8R8P3I0SF94Yj5LewmDLB4tNY7s
	 +MIcKGe9dzsQoBNDYdrhFB+pr7JrwEHa3mLqiom7IHuLdOs3vd7/4/OYugxCAstrcU
	 10P5cou1fLsNYoQpRxIICJnIHY2xhNHWiZVPryhh9H4dmJ+Wd8tCgEsYqHrUZZ8/Y/
	 vJXdJ2z2chs2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE64B6104E;
	Fri,  5 Jun 2026 20:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CDC140A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FEC830C0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSenjj2qZoT7 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 20:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 624288309A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 624288309A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 20:04:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5732287B7A; Fri,  5 Jun 2026 20:04:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 21:33:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35b57a0787a07b71051a180ebe2ebaafca989ee7
X-Git-Newrev: aef531162ca0ec9422526d9c3e2f66eaf8edb2c8
X-Patchwork-Hint: ignore
Message-Id: <20260605200411.5732287B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jailhouse: backport gcc-15/std c23
 from imx-jailhouse fork
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aef531162ca0ec9422526d9c3e2f66eaf8edb2c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The jailhouse runtime test doesn't build since the last ARM aarch64
toolchain version bump [1]. This new gcc 15 compiler use a new C
standard by default (c23) but since the jailhouse build system
doesn't specify any versions of the C standard, so it doesn't build
with gcc 15.

As reported by John Ernberg on the mailing list [2], jailhouse git
repository has not seen any activity since 2023.

As suggested by Julien Olivain and Peter Korsgaard [3] backport gcc-15/stdc
23 fix from imx-jailhouse fork as a short term solution.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843463

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://lore.kernel.org/buildroot/20260601204735.888967-8-j@j-ernberg.se/
[3] https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-YOCIMX-9281-1-Fix-gcc15-errors.patch      | 119 +++++++++++++++++++++
 ...MX-9281-2-hypervisor-arm64-fix-strh-usage.patch |  38 +++++++
 2 files changed, 157 insertions(+)

diff --git a/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch b/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
new file mode 100644
index 0000000000..15e10714c1
--- /dev/null
+++ b/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
@@ -0,0 +1,119 @@
+From da2aa3c97fe9a374709c4bddf9b55253d53e1350 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Thu, 12 Jun 2025 06:49:58 -0700
+Subject: [PATCH] YOCIMX-9281-1: Fix gcc15 errors
+
+Fix several instances of the following errors:
+
+```
+| inmates/lib/include/inmate_common.h:87:16: error: cannot use keyword 'true' as enumeration constant
+|    87 | typedef enum { true = 1, false = 0 } bool;
+|       |                ^~~~
+```
+
+```
+| In file included from configs/arm64/hikey.c:16:
+| include/jailhouse/cell-config.h:318:41: error: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (6 chars into 5 available) [-Werror=unterminated-string-initialization]
+|   318 | #define JAILHOUSE_SYSTEM_SIGNATURE      "JHSYS"
+|       |                                         ^~~~~~~
+| configs/arm64/hikey.c:26:30: note: in expansion of macro 'JAILHOUSE_SYSTEM_SIGNATURE'
+|    26 |                 .signature = JAILHOUSE_SYSTEM_SIGNATURE,
+|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/2be7793ca658015470fe0d60c0c973e12ce68d73
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Peng Fan <peng.fan@nxp.com>
+[Romain:
+  use "__STDC_VERSION__ < 202311L" as suggested by Peter Korsgaard
+  https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hypervisor/include/jailhouse/header.h | 2 +-
+ hypervisor/include/jailhouse/types.h  | 2 ++
+ include/jailhouse/cell-config.h       | 4 ++--
+ include/jailhouse/hypercall.h         | 2 +-
+ inmates/lib/include/inmate_common.h   | 2 ++
+ 5 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
+index 518bc5cb..324eb94b 100644
+--- a/hypervisor/include/jailhouse/header.h
++++ b/hypervisor/include/jailhouse/header.h
+@@ -55,7 +55,7 @@ struct jailhouse_header {
+ 	/** Signature "JAILHOUS" used for basic validity check of the
+ 	 * hypervisor image.
+ 	 * @note Filled at build time. */
+-	char signature[8];
++	char signature[8] __attribute__ ((nonstring));
+ 	/** Size of hypervisor core.
+ 	 * It starts with the hypervisor's header and ends after its bss
+ 	 * section. Rounded up to page boundary.
+diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
+index 6d78ad6d..80f2a9ca 100644
+--- a/hypervisor/include/jailhouse/types.h
++++ b/hypervisor/include/jailhouse/types.h
+@@ -19,7 +19,9 @@
+ 
+ #ifndef __ASSEMBLY__
+ 
++#if __STDC_VERSION__ < 202311L
+ typedef enum { true = 1, false = 0 } bool;
++#endif
+ 
+ /** Describes a CPU set. */
+ struct cpu_set {
+diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
+index 17d59306..affce1c2 100644
+--- a/include/jailhouse/cell-config.h
++++ b/include/jailhouse/cell-config.h
+@@ -91,7 +91,7 @@
+  * structure.
+  */
+ struct jailhouse_cell_desc {
+-	char signature[5];
++	char signature[5] __attribute__ ((nonstring));
+ 	__u8 architecture;
+ 	__u16 revision;
+ 
+@@ -330,7 +330,7 @@ struct jailhouse_pio {
+  * General descriptor of the system.
+  */
+ struct jailhouse_system {
+-	char signature[5];
++	char signature[5] __attribute__ ((nonstring));
+ 	__u8 architecture;
+ 	__u16 revision;
+ 
+diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
+index 07574d3d..cf58a4c9 100644
+--- a/include/jailhouse/hypercall.h
++++ b/include/jailhouse/hypercall.h
+@@ -107,7 +107,7 @@
+ 
+ #define COMM_REGION_GENERIC_HEADER					\
+ 	/** Communication region magic JHCOMM */			\
+-	char signature[6];						\
++	char signature[6] __attribute__ ((nonstring));						\
+ 	/** Communication region ABI revision */			\
+ 	__u16 revision;							\
+ 	/** Cell state, initialized by hypervisor, updated by cell. */	\
+diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
+index 1c20a0af..cae2a673 100644
+--- a/inmates/lib/include/inmate_common.h
++++ b/inmates/lib/include/inmate_common.h
+@@ -84,7 +84,9 @@ typedef u32 __u32;
+ typedef s64 __s64;
+ typedef u64 __u64;
+ 
++#if __STDC_VERSION__ < 202311L
+ typedef enum { true = 1, false = 0 } bool;
++#endif
+ 
+ #include <jailhouse/hypercall.h>
+ 
+-- 
+2.54.0
+
diff --git a/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch b/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
new file mode 100644
index 0000000000..9b75b8bdbe
--- /dev/null
+++ b/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
@@ -0,0 +1,38 @@
+From bc09bd33a23f9599b0cb4596a0b7f5c601a74c75 Mon Sep 17 00:00:00 2001
+From: Peng Fan <peng.fan@nxp.com>
+Date: Mon, 25 Aug 2025 09:48:05 +0800
+Subject: [PATCH] YOCIMX-9281-2: hypervisor: arm64: fix strh usage
+
+hypervisor/arch/arm64/entry.S:555: Error: immediate offset out of range
+
+Per ARM spec:
+STRH (immediate)
+<pimm> Is the optional positive immediate byte offset, a multiple of 2 in
+the range 0 to 8190, defaulting to 0 and encoded in the "imm12" field
+as <pimm>/2.
+
+So align sdei_event to 2 bytes aligned.
+
+Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/98f6f8dc23d6b3d4fe5b15045ccb3d3ef36747be
+
+Signed-off-by: Peng Fan <peng.fan@nxp.com>
+[Romain: rebase on top of latest commit on upstream repo
+  https://github.com/siemens/jailhouse/commit/e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ hypervisor/arch/arm64/include/asm/percpu_fields.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hypervisor/arch/arm64/include/asm/percpu_fields.h b/hypervisor/arch/arm64/include/asm/percpu_fields.h
+index 67573fd6..118d69d0 100644
+--- a/hypervisor/arch/arm64/include/asm/percpu_fields.h
++++ b/hypervisor/arch/arm64/include/asm/percpu_fields.h
+@@ -13,4 +13,4 @@
+ #define ARCH_PERCPU_FIELDS						\
+ 	ARM_PERCPU_FIELDS						\
+ 	unsigned long id_aa64mmfr0;					\
+-	bool sdei_event;
++	bool sdei_event __attribute__((aligned(2)));
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
