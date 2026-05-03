Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4EBCD3427
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 21:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A07612A7;
	Sun,  3 May 2026 21:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4lKcmvZ1t5k; Sun,  3 May 2026 21:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 095626128F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777843572;
	bh=DVpm5C+QJpyACATKUm+uMH/r6Ann1EwIunjtqG6JDxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EZYErS/6vW2Jc9//IIJ5tYXW0+C0fL+jllQn9TW39mCVjzdLP95GI5LSqL4PHqtCE
	 /OHJPv/bk1RROnjKMzTVlC49kPU+kaGKgd/PfKBq4AO8mZ1Myujn48K15T5u6gm92D
	 DD6ImAsOjkrVpo0Y2S1j2x6f88ZpNQZaiXL6EAiDrGuMHPUtxvNkZuR9B2XVfk3LtR
	 r/ukAUR6xzw0V5jZVJgIB5H3UVKRWe1VHL2cmMtIs9nrBvH5Y74weX8OEHuYY1bf3n
	 tpQ8wJ2viiT81VCQRLmewp/dvZPlK7lKlvHblXreRv1cx+abMBkhJFDPNJLdvo4kuY
	 12AfxXK2z2VUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 095626128F;
	Sun,  3 May 2026 21:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5094204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA134842BD
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5lyDHIATSC6 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 21:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4D9E84104
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4D9E84104
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:26:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DFA584154; Sun,  3 May 2026 21:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 23:17:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b2030766f64c9259ddc6f3e3836abd6d7fb27e2
X-Git-Newrev: c1e6b201aaa815d54d8a8d00a02f8ec4168aed87
X-Patchwork-Hint: ignore
Message-Id: <20260503212609.5DFA584154@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 7.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1e6b201aaa815d54d8a8d00a02f8ec4168aed87
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release announce, see:
https://lore.kernel.org/netdev/20260413124459.1d6f40dd@phoenix.local/

- dpll: Fix notifications and add fractional frequency offset support
- tc: Add cake_mq support
- mptcp: Show interface names with color support
- devlink: Support param display and reset to defaults
- lib/bpf_legacy: Use userspace SHA-1
- Update kernel headers to 7.0-rc0
- Remove upstreamed musl patch

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: replace announce lwn URL with lore in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lib-bridge-avoid-redefinition-of-in6_addr.patch | 36 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch b/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
deleted file mode 100644
index c684b030a8..0000000000
--- a/package/iproute2/0001-lib-bridge-avoid-redefinition-of-in6_addr.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 7119f3736f689ab396ca4193ac593938affd55fa Mon Sep 17 00:00:00 2001
-From: Yureka <yureka@cyberchaos.dev>
-Date: Sun, 12 Oct 2025 14:39:47 +0200
-Subject: lib: bridge: avoid redefinition of in6_addr
-
-On musl libc, which does not use the kernel definitions of in6_addr, including
-the libc headers after the kernel (UAPI) headers would cause a redefinition
-error. The opposite order avoids the redefinition.
-
-Fixes: 9e89d5b94d749f37525cd8778311e1c9f28f172a
-Signed-off-by: Yureka <yureka@cyberchaos.dev>
-
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=7119f3736f689ab396ca4193ac593938affd55fa
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/bridge.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/bridge.c b/lib/bridge.c
-index 5386aa017..104f5858b 100644
---- a/lib/bridge.c
-+++ b/lib/bridge.c
-@@ -2,8 +2,8 @@
- 
- #include <net/if.h>
- 
--#include "bridge.h"
- #include "utils.h"
-+#include "bridge.h"
- 
- void bridge_print_vlan_flags(__u16 flags)
- {
--- 
-cgit 1.2.3-korg
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index e743b4fa0d..c918fcd2b3 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec  iproute2-6.17.0.tar.xz
+sha256  e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e  iproute2-7.0.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6d69a20126..4ca49d294e 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.17.0
+IPROUTE2_VERSION = 7.0.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
