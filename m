Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03510CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC53D60B18;
	Fri,  5 Jun 2026 12:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SpCtW4PPZox; Fri,  5 Jun 2026 12:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A5560B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663105;
	bh=HZIfacv3gbTb6hlwMMTLgH36G3IH1dYeI2m9BE0F4Pk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RHvInixBmn/4Rwu1DJGP9KeQUK/mpmqi1fCr9tDQ/JdDggnnPUcwC56QnbaYwUKSR
	 /RXWEDEWOuP7xjiXNQeslcn3lam4t9uPeFMHG5pnqpVIjRFKO1xdZ7r6bUdgy99c6k
	 IROaekKXypNiHoj7ZTu7WnRgv1oSIKZ55oor0jad2VDeSWt5su8f5ms9utbqjfkHlz
	 l6BqQRSajH9S9FrXSNilaUsxmMKPcpRaoFC42+NrHSGEMkuxTwV6gqGQOt4OuK0zki
	 gdFthdp5TKT2xctok6YYnfKwGPMwuGiT42pqAJPz259FetrmzRXLAVHFRwNfe5/o/Q
	 W7b6h+oaeZOUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A5560B33;
	Fri,  5 Jun 2026 12:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2E9F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB34D81E4F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv9zVDjaRFsQ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF24C81E51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF24C81E51
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05B6087B3B; Fri,  5 Jun 2026 12:37:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:02:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7fcea9d89e5e640155fed001fe40e6eb58ddcb61
X-Git-Newrev: ea564408cdd74fdd4c17d3429672cc30d65e0132
X-Patchwork-Hint: ignore
Message-Id: <20260605123713.05B6087B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jemalloc: fix
 build on m68k/uClibc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea564408cdd74fdd4c17d3429672cc30d65e0132
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

include/jemalloc/internal/jemalloc_internal_inlines_a.h:16:32: error:
 implicit declaration of function 'sched_getcpu'; did you mean
 'SYS_getcpu'? [-Wimplicit-function-declaration]
   16 |         return (malloc_cpuid_t)sched_getcpu();

Added -D_GNU_SOURCE to CFLAGS because

  extern int sched_getcpu

is wrapped with __USE_GNU:
https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/sched.h#L80C1-L80C17

Fixes:
https://autobuild.buildroot.net/results/57c/57c68aad9abcce7621fbff52081da041485e8830/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6b15fa64e6b75f75191c845aea43c349e0080986)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jemalloc/jemalloc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index bd8a2d7654..0c46f65029 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -12,11 +12,15 @@ JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
 JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
 
+JEMALLOC_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
+
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.
 ifeq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-JEMALLOC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+JEMALLOC_CFLAGS += -O0
 endif
 
+JEMALLOC_CONF_ENV += CFLAGS="$(JEMALLOC_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
