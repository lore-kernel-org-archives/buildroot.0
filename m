Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8760A4ACB
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F07+ZoE9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CCEF80F88;
	Tue, 20 Oct 2026 13:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi7KM-8j5cMd; Tue, 20 Oct 2026 13:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80D5180D1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792501289;
	b=Rh/gpeD8lyWRe33Q0SxnSj7/B8TjSJrg6glW5gWfFIaK7PTCteknvMKsKtpJZimC6RZS
	 HJS92TAdQH1WqvC744KjDvtKJWzPeOrZuIfZaGfmJ/1G6kahVmL4g8Ieks08jo4DbR2eZ
	 eTILF7VkLx/c4HpdRB0bh+ljWOVlNmoqo7Jkh7WnXELnYflVvqJldaojWN1lGNgNGo5Vo
	 KYgPGbmy5cpyJQaKdliB/7MO9oA99Sjc5LFSO5/UU2ndWam07fUATYhWReFukvpeYJ4iS
	 YZNn7SASk+DK5MInJIpFkAL/GgWYrKeq6iY3TKpPssfdSigA4ueBKWgrTNHooj8vcQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792501289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=AiLFCJvObXPLwkZmHwMTTpsZBT4XbbdfFiRo1TiCa7o=;
	b=AfOEUTbofDOBOhpuWWg5CrnHt6sMPTIYCC8JV1c732zX05tLcLa+zSsivjnyJJY13Ix9
	 kBjnnoi6bkixGtoUneMbeefpnqzEwUIxW0Aplp5mqqKc6sWQ+tjQVv6Qe4MWZ8eIMSFvg
	 I4kA4fAV5iVobw+RbkJzdEyYn8lPm08Y1RWXHk3Om4TfRhZkbceaSRyX2Q0e8wFNFvPpg
	 inkA2CwVyB4SYOMWkDO0iejSrr5wdodAY4fReONSgke3J1bqoyr4z0zxW2kx9iiKEONxV
	 SMCwKKTnb2xCFy9mm6qtq4ziwBt4yfBf2HmuiJLYtfOJpxaiZyOvFt0BoXXW2lyIg6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792501289;
	bh=AiLFCJvObXPLwkZmHwMTTpsZBT4XbbdfFiRo1TiCa7o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=F07+ZoE9YdVCVKxfSWrmXp+nkfVZKIoIv1mIrtSM0DNjDCWsojI1cNeYl/4ggAsAx
	 V6QUQNdelhdGuZhDhKge0cVXrQGCwHT86JZjeSigBF6GZgO+MJp053BetFbEy2WLme
	 ie5tYJReXfHChWI6ah+5WkwLC9hPSiR1luYm7YeudCs0AVdoyc2hl8+E1fpJdbfAjb
	 tCneSGQzRreJVGCCkKzr1LHMjZBiQRfql49EqSwSpf2gc1/Nu+OjdbfelZRm3PcXN+
	 gddRAQSnkBVY5lcpzcIw9aqXSqN3UoL2QiUDlDgXJ7JgQa5h8pWBntS7eFmCifAoU6
	 jc1S6apGdqjfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D5180D1B;
	Tue, 20 Oct 2026 13:01:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C390769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DEFC40342
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Vf5HotVA-0X for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AE0DC400F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792501286;
 b=oeFugJHdN43vhINbYSEN2Z786+Z0BJc6hLoVb/BH2O7GdiWKZMcti7ageHjRqpY2/56i
 e364FU93iwlDKHdhtCcDsoq7J3b0ygFMYtVcEi2ToJDIT33SshU4+NOWX2Y2E7BBOiMcd
 krrFRHCT4dgR6sm4T3WKe5CEF5Dsz1uRxJhz7oFwto1AciX7tamFrwTtbjS0txiBJ5LeQ
 MON1qU/l53x+CppTaA+D/qcXWXN+x33/8fNc4CWtkLBuvDoWMdhaAehSz5uoLw2XP7qPK
 jOsORYvAYq4Q90ITMjeBiEdW0KNCi9BGl4uEpFo6hQt9I9yWZ+QtCQ2E9WLjwXqtUpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792501286;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=PFLANnlQ92DGcosW6JodKVLpXNhT9/5VT/u7UpKwSJw=;
 b=q408pIV0X0X2w4dvbOKKgIqGPL8/Wb3u/sdUAsKoxG7GXLbniI+AGcECwCjETt+0ayrD
 uHMqyOZHmDHEG87ffMQopsPaNUyYAcx8hRCc7NEGwD09iTbSCqxxST0RvW6r18gs8oVHs
 nnFyWO9RJnxqgZL27w1gD0/9vd639OBBLOou2HEQRK4RTHqbcKjb0LdC2Ne2dAGUmciNf
 bLCxXqfNnVu0LIaQq0OS6O/E0vr9h5aVVeVZSEaugk3vxVa5bRhnDbOtnF7ldd3vpqn+A
 TKvQ49GDorgI8gKKzebYNsKpR785UnHRO3UROjGezOnShEw70CMxjAB/txxKHxpHREA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W3qyTbGF; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE0DC400F1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:01:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EEBB2C62200
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:02:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6184B60393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 598AD10328934; 
 Tue, 20 Oct 2026 15:01:08 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 15:00:44 +0200
Message-ID: <20261020130045.1323516-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/jailhouse: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jailhouse fails to build against recent Linux kernel versions:

driver/sysfs.c:571:17: error: initialization of 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t ' {aka 'long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)'} from incompatible p
ointer type 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct
 kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)'} [-Wincompatible-pointer-types]
  571 |         .read = core_show,
      |                 ^~~~~~~~~

[...]

driver/pci.c: In function 'create_vpci_of_overlay':
driver/pci.c:336:13: error: too few arguments to function 'of_overlay_fdt_apply'; expected 4, have 3
  336 |         if (of_overlay_fdt_apply(__dtb_vpci_template_begin,
      |             ^~~~~~~~~~~~~~~~~~~~

However, the project seems to be unmaintained: there has been no
commits for the past 4 years in the upstream Git repository at
https://github.com/siemens/jailhouse/.

Since maintaining an hypervisor like this requires keeping up with
Linux kernel changes, seeing the project being inactive for the past 4
years makes it basically unusable, which is why we're removing it.

There are a number of autobuilder failures related to jailhouse for
the same reason.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              |   7 ++
 DEVELOPERS                                    |   2 -
 package/Config.in                             |   1 -
 .../0001-YOCIMX-9281-1-Fix-gcc15-errors.patch | 119 ------------------
 ...81-2-hypervisor-arm64-fix-strh-usage.patch |  38 ------
 package/jailhouse/Config.in                   |  28 -----
 package/jailhouse/jailhouse.hash              |   3 -
 package/jailhouse/jailhouse.mk                |  71 -----------
 .../testing/tests/package/test_jailhouse.py   | 103 ---------------
 9 files changed, 7 insertions(+), 365 deletions(-)
 delete mode 100644 package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
 delete mode 100644 package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
 delete mode 100644 package/jailhouse/Config.in
 delete mode 100644 package/jailhouse/jailhouse.hash
 delete mode 100644 package/jailhouse/jailhouse.mk
 delete mode 100644 support/testing/tests/package/test_jailhouse.py

diff --git a/Config.in.legacy b/Config.in.legacy
index db320ea981..566f723ac4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_JAILHOUSE
+	bool "jailhouse"
+	select BR2_LEGACY
+	help
+	  jailhouse has been removed. It was no longer maintained
+	  upstream.
+
 config BR2_PACKAGE_IFENSLAVE
 	bool "ifenslave"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0f52ba2267..1d8869f09c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -602,7 +602,6 @@ F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
 N:	Carlo Caione <carlo.caione@gmail.com>
-F:	package/jailhouse/
 F:	package/sunxi-boards/
 
 N:	Carsten Schoenert <c.schoenert@gmail.com>
@@ -1962,7 +1961,6 @@ F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_iputils.py
-F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
diff --git a/package/Config.in b/package/Config.in
index 6615c2b2af..54af5e7450 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2856,7 +2856,6 @@ menu "System tools"
 	source "package/iotop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/irqbalance/Config.in"
-	source "package/jailhouse/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
 	source "package/kmon/Config.in"
diff --git a/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch b/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
deleted file mode 100644
index 15e10714c1..0000000000
--- a/package/jailhouse/0001-YOCIMX-9281-1-Fix-gcc15-errors.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From da2aa3c97fe9a374709c4bddf9b55253d53e1350 Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Thu, 12 Jun 2025 06:49:58 -0700
-Subject: [PATCH] YOCIMX-9281-1: Fix gcc15 errors
-
-Fix several instances of the following errors:
-
-```
-| inmates/lib/include/inmate_common.h:87:16: error: cannot use keyword 'true' as enumeration constant
-|    87 | typedef enum { true = 1, false = 0 } bool;
-|       |                ^~~~
-```
-
-```
-| In file included from configs/arm64/hikey.c:16:
-| include/jailhouse/cell-config.h:318:41: error: initializer-string for array of 'char' truncates NUL terminator but destination lacks 'nonstring' attribute (6 chars into 5 available) [-Werror=unterminated-string-initialization]
-|   318 | #define JAILHOUSE_SYSTEM_SIGNATURE      "JHSYS"
-|       |                                         ^~~~~~~
-| configs/arm64/hikey.c:26:30: note: in expansion of macro 'JAILHOUSE_SYSTEM_SIGNATURE'
-|    26 |                 .signature = JAILHOUSE_SYSTEM_SIGNATURE,
-|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
-```
-
-Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/2be7793ca658015470fe0d60c0c973e12ce68d73
-
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
-Signed-off-by: Peng Fan <peng.fan@nxp.com>
-[Romain:
-  use "__STDC_VERSION__ < 202311L" as suggested by Peter Korsgaard
-  https://lore.kernel.org/buildroot/878q8uk9qf.fsf@dell.be.48ers.dk/
-]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hypervisor/include/jailhouse/header.h | 2 +-
- hypervisor/include/jailhouse/types.h  | 2 ++
- include/jailhouse/cell-config.h       | 4 ++--
- include/jailhouse/hypercall.h         | 2 +-
- inmates/lib/include/inmate_common.h   | 2 ++
- 5 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
-index 518bc5cb..324eb94b 100644
---- a/hypervisor/include/jailhouse/header.h
-+++ b/hypervisor/include/jailhouse/header.h
-@@ -55,7 +55,7 @@ struct jailhouse_header {
- 	/** Signature "JAILHOUS" used for basic validity check of the
- 	 * hypervisor image.
- 	 * @note Filled at build time. */
--	char signature[8];
-+	char signature[8] __attribute__ ((nonstring));
- 	/** Size of hypervisor core.
- 	 * It starts with the hypervisor's header and ends after its bss
- 	 * section. Rounded up to page boundary.
-diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
-index 6d78ad6d..80f2a9ca 100644
---- a/hypervisor/include/jailhouse/types.h
-+++ b/hypervisor/include/jailhouse/types.h
-@@ -19,7 +19,9 @@
- 
- #ifndef __ASSEMBLY__
- 
-+#if __STDC_VERSION__ < 202311L
- typedef enum { true = 1, false = 0 } bool;
-+#endif
- 
- /** Describes a CPU set. */
- struct cpu_set {
-diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
-index 17d59306..affce1c2 100644
---- a/include/jailhouse/cell-config.h
-+++ b/include/jailhouse/cell-config.h
-@@ -91,7 +91,7 @@
-  * structure.
-  */
- struct jailhouse_cell_desc {
--	char signature[5];
-+	char signature[5] __attribute__ ((nonstring));
- 	__u8 architecture;
- 	__u16 revision;
- 
-@@ -330,7 +330,7 @@ struct jailhouse_pio {
-  * General descriptor of the system.
-  */
- struct jailhouse_system {
--	char signature[5];
-+	char signature[5] __attribute__ ((nonstring));
- 	__u8 architecture;
- 	__u16 revision;
- 
-diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
-index 07574d3d..cf58a4c9 100644
---- a/include/jailhouse/hypercall.h
-+++ b/include/jailhouse/hypercall.h
-@@ -107,7 +107,7 @@
- 
- #define COMM_REGION_GENERIC_HEADER					\
- 	/** Communication region magic JHCOMM */			\
--	char signature[6];						\
-+	char signature[6] __attribute__ ((nonstring));						\
- 	/** Communication region ABI revision */			\
- 	__u16 revision;							\
- 	/** Cell state, initialized by hypervisor, updated by cell. */	\
-diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
-index 1c20a0af..cae2a673 100644
---- a/inmates/lib/include/inmate_common.h
-+++ b/inmates/lib/include/inmate_common.h
-@@ -84,7 +84,9 @@ typedef u32 __u32;
- typedef s64 __s64;
- typedef u64 __u64;
- 
-+#if __STDC_VERSION__ < 202311L
- typedef enum { true = 1, false = 0 } bool;
-+#endif
- 
- #include <jailhouse/hypercall.h>
- 
--- 
-2.54.0
-
diff --git a/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch b/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
deleted file mode 100644
index 9b75b8bdbe..0000000000
--- a/package/jailhouse/0002-YOCIMX-9281-2-hypervisor-arm64-fix-strh-usage.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bc09bd33a23f9599b0cb4596a0b7f5c601a74c75 Mon Sep 17 00:00:00 2001
-From: Peng Fan <peng.fan@nxp.com>
-Date: Mon, 25 Aug 2025 09:48:05 +0800
-Subject: [PATCH] YOCIMX-9281-2: hypervisor: arm64: fix strh usage
-
-hypervisor/arch/arm64/entry.S:555: Error: immediate offset out of range
-
-Per ARM spec:
-STRH (immediate)
-<pimm> Is the optional positive immediate byte offset, a multiple of 2 in
-the range 0 to 8190, defaulting to 0 and encoded in the "imm12" field
-as <pimm>/2.
-
-So align sdei_event to 2 bytes aligned.
-
-Upstream: https://github.com/nxp-imx/imx-jailhouse/commit/98f6f8dc23d6b3d4fe5b15045ccb3d3ef36747be
-
-Signed-off-by: Peng Fan <peng.fan@nxp.com>
-[Romain: rebase on top of latest commit on upstream repo
-  https://github.com/siemens/jailhouse/commit/e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hypervisor/arch/arm64/include/asm/percpu_fields.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hypervisor/arch/arm64/include/asm/percpu_fields.h b/hypervisor/arch/arm64/include/asm/percpu_fields.h
-index 67573fd6..118d69d0 100644
---- a/hypervisor/arch/arm64/include/asm/percpu_fields.h
-+++ b/hypervisor/arch/arm64/include/asm/percpu_fields.h
-@@ -13,4 +13,4 @@
- #define ARCH_PERCPU_FIELDS						\
- 	ARM_PERCPU_FIELDS						\
- 	unsigned long id_aa64mmfr0;					\
--	bool sdei_event;
-+	bool sdei_event __attribute__((aligned(2)));
--- 
-2.54.0
-
diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
deleted file mode 100644
index 445414162f..0000000000
--- a/package/jailhouse/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_JAILHOUSE
-	bool "jailhouse"
-	depends on BR2_aarch64 || BR2_x86_64
-	depends on BR2_LINUX_KERNEL
-	help
-	  The Jailhouse partitioning Hypervisor based on Linux.
-
-	  https://github.com/siemens/jailhouse
-
-if BR2_PACKAGE_JAILHOUSE
-
-config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
-	bool "helper scripts"
-	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_MAKO # runtime
-	help
-	  Python-based helpers for the Jailhouse Hypervisor.
-
-	  https://github.com/siemens/jailhouse
-
-comment "helper scripts require Python3"
-	depends on !BR2_PACKAGE_PYTHON3
-
-endif
-
-comment "jailhouse needs a Linux kernel to be built"
-	depends on BR2_aarch64 || BR2_x86_64
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/jailhouse/jailhouse.hash b/package/jailhouse/jailhouse.hash
deleted file mode 100644
index 96d5819847..0000000000
--- a/package/jailhouse/jailhouse.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  38ea5d2d9672ce7f76fd0c163edaa8968711aca58f245aec3c8934f140e828b6  jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560.tar.gz
-sha256  3aafb31a2436178323663e00511f16d58fc36ea654b1457532e79d017205efd8  COPYING
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
deleted file mode 100644
index a1c86f0e91..0000000000
--- a/package/jailhouse/jailhouse.mk
+++ /dev/null
@@ -1,71 +0,0 @@
-################################################################################
-#
-# jailhouse
-#
-################################################################################
-
-JAILHOUSE_VERSION = e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,$(JAILHOUSE_VERSION))
-JAILHOUSE_LICENSE = GPL-2.0
-JAILHOUSE_LICENSE_FILES = COPYING
-JAILHOUSE_DEPENDENCIES = \
-	linux
-
-JAILHOUSE_MAKE_OPTS = \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	ARCH="$(KERNEL_ARCH)" \
-	KDIR="$(LINUX_DIR)" \
-	DESTDIR="$(TARGET_DIR)" \
-	prefix=/usr
-
-ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
-JAILHOUSE_DEPENDENCIES += \
-	host-python-mako \
-	host-python-setuptools \
-	python3
-JAILHOUSE_MAKE_OPTS += \
-	HAS_PYTHON_MAKO="yes" \
-	PYTHON_PIP_USABLE="yes"
-else
-JAILHOUSE_MAKE_OPTS += \
-	HAS_PYTHON_MAKO="no" \
-	PYTHON_PIP_USABLE="no"
-endif
-
-ifeq ($(BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS),y)
-define JAILHOUSE_BUILD_HELPER_SCRIPTS
-	cd $(@D) && \
-	$(PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(HOST_DIR)/bin/python setup.py \
-		build
-endef
-define JAILHOUSE_INSTALL_HELPER_SCRIPTS
-	cd $(@D) && \
-	$(PKG_PYTHON_SETUPTOOLS_ENV) \
-	$(HOST_DIR)/bin/python setup.py \
-		install --no-compile \
-		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
-		--root=$(TARGET_DIR)
-endef
-endif
-
-define JAILHOUSE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)
-
-	$(JAILHOUSE_BUILD_HELPER_SCRIPTS)
-endef
-
-define JAILHOUSE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D) modules_install firmware_install tool_inmates_install
-	$(TARGET_MAKE_ENV) $(MAKE) $(JAILHOUSE_MAKE_OPTS) -C $(@D)/tools src=$(@D)/tools install
-
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/jailhouse
-	$(INSTALL) -D -m 0644 $(@D)/configs/*/*.cell $(TARGET_DIR)/etc/jailhouse
-
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/libexec/jailhouse/demos
-	$(INSTALL) -D -m 0755 $(@D)/inmates/demos/*/*.bin $(TARGET_DIR)/usr/libexec/jailhouse/demos
-
-	$(JAILHOUSE_INSTALL_HELPER_SCRIPTS)
-endef
-
-$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
deleted file mode 100644
index 4634fc4de2..0000000000
--- a/support/testing/tests/package/test_jailhouse.py
+++ /dev/null
@@ -1,103 +0,0 @@
-import os
-import time
-
-import infra.basetest
-
-
-class TestJailhouse(infra.basetest.BRTest):
-    # This test uses a specific configuration, mainly for matching the
-    # requirements of the Jailhouse Qemu inmate demo. We also use the
-    # Linux kernel from Siemens, which includes patches for
-    # Jailhouse. Finally, we use the kernel config from
-    # board/qemu/aarch64-virt rather than the Kernel defconfig, for
-    # faster build (as it enable less components, but includes
-    # everything needed for this test).
-    kernel_ver = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
-    kernel_url = \
-        f"$(call github,siemens,linux,{kernel_ver})/linux-{kernel_ver}.tar.gz"
-    config = \
-        f"""
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-        BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="{kernel_url}"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_PACKAGE_JAILHOUSE=y
-        BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_4=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
-        kern = os.path.join(self.builddir, "images", "Image")
-        # Qemu option and Kernel args are taken from Jailhouse demo. See:
-        # https://github.com/siemens/jailhouse/blob/master/README.md
-        # We also add oops=panic to improve the test coverage.
-        self.emulator.boot(arch="aarch64",
-                           kernel=kern,
-                           kernel_cmdline=["root=/dev/vda console=ttyAMA0 mem=768M oops=panic"],
-                           options=["-M", "virt,gic-version=3,virtualization=on,its=off",
-                                    "-cpu", "cortex-a57",
-                                    "-m", "1G",
-                                    "-smp", "16",
-                                    "-drive", f"file={drive},if=none,format=raw,id=hd0",
-                                    "-device", "virtio-blk-device,drive=hd0"])
-        self.emulator.login()
-
-        # Check the program can execute.
-        self.assertRunOk("jailhouse --version")
-
-        # Load the kernel module.
-        self.assertRunOk("modprobe jailhouse")
-
-        # Check the device is present.
-        self.assertRunOk("ls -al /dev/jailhouse")
-
-        # Load the cell config this this qemu test.
-        self.assertRunOk("jailhouse enable /etc/jailhouse/qemu-arm64.cell")
-
-        # Dump the jailhouse console, and check we see its
-        # initialization string.
-        out, ret = self.emulator.run("jailhouse console")
-        self.assertEqual(ret, 0)
-        self.assertIn("Initializing Jailhouse hypervisor", "\n".join(out))
-
-        # Create the cell.
-        cell_cfg = "/etc/jailhouse/qemu-arm64-inmate-demo.cell"
-        cmd = f"jailhouse cell create {cell_cfg}"
-        self.assertRunOk(cmd)
-
-        # Load the demo image.
-        cell_name = "inmate-demo"
-        img = "/usr/libexec/jailhouse/demos/gic-demo.bin"
-        cmd = f"jailhouse cell load {cell_name} {img}"
-        self.assertRunOk(cmd)
-
-        # List Jailhouse cells and check we see the one we loaded.
-        out, ret = self.emulator.run("jailhouse cell list")
-        self.assertEqual(ret, 0)
-        self.assertIn(cell_name, "\n".join(out))
-
-        # We should also see our cell in sysfs.
-        cmd = "cat /sys/devices/jailhouse/cells/1/name"
-        out, ret = self.emulator.run(cmd)
-        self.assertEqual(ret, 0)
-        self.assertEqual(out[0], cell_name)
-
-        # Start the cell.
-        self.assertRunOk(f"jailhouse cell start {cell_name}")
-
-        # Let the demo cell run for few seconds...
-        time.sleep(3)
-
-        # Stop and unload the cell.
-        self.assertRunOk(f"jailhouse cell shutdown {cell_name}")
-        self.assertRunOk(f"jailhouse cell destroy {cell_name}")
-
-        # Stop and unload jailhouse.
-        self.assertRunOk("jailhouse disable")
-        self.assertRunOk("modprobe -r jailhouse")
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
