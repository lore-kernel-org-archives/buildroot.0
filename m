Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24531C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3BF9601FC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3BF9601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F5D402A2;
	Tue,  3 Aug 2021 22:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtQkuFhegdX5; Tue,  3 Aug 2021 22:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE57E40251;
	Tue,  3 Aug 2021 22:14:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0AA71BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A3B4608E3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9hpLUptObFo for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7D0608D8
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7948D8827E; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:42:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d61bf0f90ef651eb486ef69054f129bb0c41a54f
X-Git-Newrev: 932f6a0a2adafce9ddecfeb9460d15a5762a85cc
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.7948D8827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pdbg: Bump version to
 v3.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=932f6a0a2adafce9ddecfeb9460d15a5762a85cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patches that now are upstream.

Upstream changes:
 - Implement p10 thread controls
 - Update p10 sbefifo chip-ops
 - For p10 switch default backend to sbefifo
 - Separate sbe api into new header libpdbg_sbe.h

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../pdbg/0001-build-Fix-build-with-DNDEBUG.patch   | 78 ----------------------
 .../pdbg/0002-build-Fix-build-with-DNDEBUG.patch   | 71 --------------------
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  2 +-
 4 files changed, 2 insertions(+), 151 deletions(-)

diff --git a/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch b/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch
deleted file mode 100644
index fba5d38693..0000000000
--- a/package/pdbg/0001-build-Fix-build-with-DNDEBUG.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 9b4276d33c8637ca912911e720d6c760812a769b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 9 Jun 2021 21:15:31 +0200
-Subject: [PATCH] build: Fix build with -DNDEBUG
-
-Fix the following build failures with -DNDEBUG:
-
-libpdbg/adu.c: In function 'blog2':
-libpdbg/adu.c:112:1: error: control reaches end of non-void function [-Werror=return-type]
-  112 | }
-      | ^
-  CC       libpdbg/libpdbg_la-chip.lo
-  CC       libpdbg/libpdbg_la-cronus.lo
-libpdbg/cfam.c: In function 'cfam_hmfsi_probe':
-libpdbg/cfam.c:325:13: error: 'port' is used uninitialized in this function [-Werror=uninitialized]
-  325 |  value |= 1 << (31 - port);
-      |           ~~^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/9d90ede1ff7425cbb25b95aed3bf8d27ced865a4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-by: Amitay Isaacs <amitay@ozlabs.org>
-[Retrieved from:
-https://github.com/open-power/pdbg/commit/9b4276d33c8637ca912911e720d6c760812a769b]
----
- libpdbg/adu.c    | 3 ++-
- libpdbg/device.c | 2 +-
- src/mem.c        | 2 +-
- 3 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/libpdbg/adu.c b/libpdbg/adu.c
-index 6358e7a3f..7ee15c350 100644
---- a/libpdbg/adu.c
-+++ b/libpdbg/adu.c
-@@ -15,6 +15,7 @@
-  */
- #include <stdio.h>
- #include <stdint.h>
-+#include <stdlib.h>
- #include <string.h>
- #include <inttypes.h>
- 
-@@ -107,7 +108,7 @@ uint8_t blog2(uint8_t x)
- 	case 64:
- 		return 6;
- 	default:
--		assert(0);
-+		abort();
- 	}
- }
- 
-diff --git a/libpdbg/device.c b/libpdbg/device.c
-index 8884baa45..502ca38ab 100644
---- a/libpdbg/device.c
-+++ b/libpdbg/device.c
-@@ -501,7 +501,7 @@ static enum pdbg_target_status str_to_status(const char *status)
- 	else if (!strcmp(status, "unknown"))
- 		return PDBG_TARGET_UNKNOWN;
- 	else
--		assert(0);
-+		abort();
- }
- 
- static int dt_expand_node(struct pdbg_target *node, void *fdt, int fdt_node)
-diff --git a/src/mem.c b/src/mem.c
-index 99a673f36..878ac029a 100644
---- a/src/mem.c
-+++ b/src/mem.c
-@@ -166,7 +166,7 @@ OPTCMD_DEFINE_CMD_WITH_FLAGS(getmemio, getmemio, (ADDRESS, DATA, BLOCK_SIZE),
- static int _putmem(const char *mem_prefix, uint64_t addr, uint8_t block_size, bool ci)
- {
- 	uint8_t *buf;
--	size_t buflen;
-+	size_t buflen = 0;
- 	int rc, count = 0;
- 	struct pdbg_target *target;
- 
diff --git a/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch b/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
deleted file mode 100644
index 323a87d779..0000000000
--- a/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From cd1a44bac413e8a6bc2572720153cc5e703762e1 Mon Sep 17 00:00:00 2001
-From: Amitay Isaacs <amitay@ozlabs.org>
-Date: Fri, 11 Jun 2021 15:27:29 +1000
-Subject: [PATCH] build: Fix build with -DNDEBUG
-
-Signed-off-by: Amitay Isaacs <amitay@ozlabs.org>
-[Retrieved from:
-https://github.com/open-power/pdbg/commit/cd1a44bac413e8a6bc2572720153cc5e703762e1]
----
- libpdbg/cfam.c   | 6 +++++-
- libpdbg/device.c | 9 ++++++---
- 2 files changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/libpdbg/cfam.c b/libpdbg/cfam.c
-index ffe69296e..976ce5a6d 100644
---- a/libpdbg/cfam.c
-+++ b/libpdbg/cfam.c
-@@ -17,6 +17,7 @@
-  */
- #include <unistd.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <inttypes.h>
- 
- #include "hwunit.h"
-@@ -320,7 +321,10 @@ static int cfam_hmfsi_probe(struct pdbg_target *target)
- 	int rc;
- 
- 	/* Enable the port in the upstream control register */
--	assert(!(pdbg_target_u32_property(target, "port", &port)));
-+	if (pdbg_target_u32_property(target, "port", &port)) {
-+		PR_ERROR("Attribute port not defined for %s\n", pdbg_target_path(target));
-+		abort();
-+	}
- 	fsi_read(fsi_parent, 0x3404, &value);
- 	value |= 1 << (31 - port);
- 	if ((rc = fsi_write(fsi_parent, 0x3404, value))) {
-diff --git a/libpdbg/device.c b/libpdbg/device.c
-index 502ca38ab..ab821d387 100644
---- a/libpdbg/device.c
-+++ b/libpdbg/device.c
-@@ -417,7 +417,7 @@ static const void *dt_require_property(struct pdbg_target *node,
- 
- 		prerror("DT: Missing required property %s/%s\n",
- 			path, name);
--		assert(false);
-+		abort();
- 	}
- 	if (wanted_len >= 0 && len != wanted_len) {
- 		const char *path = dt_get_path(node);
-@@ -426,7 +426,7 @@ static const void *dt_require_property(struct pdbg_target *node,
- 			path, name);
- 		prerror("DT: Expected len: %d got len: %zu\n",
- 			wanted_len, len);
--		assert(false);
-+		abort();
- 	}
- 
- 	if (prop_len) {
-@@ -604,7 +604,10 @@ uint64_t pdbg_target_address(struct pdbg_target *target, uint64_t *out_size)
- 
- 	p = dt_require_property(target, "reg", -1, &len);
- 	n = (na + ns) * sizeof(u32);
--	assert(n <= len);
-+	if (n > len) {
-+		PR_ERROR("Invalid reg value for %s\n", pdbg_target_path(target));
-+		abort();
-+	}
- 	if (out_size)
- 		*out_size = dt_get_number(p + na * sizeof(u32), ns);
- 	return dt_get_number(p, na);
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index bc9f99b149..9a58fa842c 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c47adcac1c404266217be8c4acb408d9eba59562b094c941e96e4f77f3ced7d2 pdbg-3.2.tar.gz
+sha256 87fe68977f72885e46d321da806d30f33a901de817461eb44fa727cd81d1d109 pdbg-3.3.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index e8bb36c327..7f6b48e6eb 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.2
+PDBG_VERSION = 3.3
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
