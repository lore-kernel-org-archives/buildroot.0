Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3FBCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8519840A17;
	Fri,  5 Jun 2026 12:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APFH4LdvRb9I; Fri,  5 Jun 2026 12:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F3F4086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663261;
	bh=mKEhogUyVouwTAitK+FOg3DD+LceXJh+9T/afIDzFaI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U2UJ5GNfT7dz6RO2y+Fl0jPKzpTtrM9amn9SSyTnUcgBk4keAqZSLCyr2eHg3clMe
	 xk93pRR/hNSjqrqXruPK5SNtir/o9zumFmKSAqhS7FiZ47sz44hpARjVM+q3g5IKob
	 uVc/OVdyD/kPL4+2XMYeAHvXt9/p27MZtWRA5zZFfkUUz012zeXoevEukYywJDfsu4
	 yPqvQ7JEsqhaCNtfkmCz7c0zMC6UKXnSzRRIkj0I9ukvhSRwwkZ+RgZozrj7K9XqZR
	 HJ9HdKAUAUcQQOo2BX+OeoIybGp45Il7rTD7MLyWM34gdp93UngVL35gTaXnmpYlIf
	 AiX38qNoY91Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F3F4086F;
	Fri,  5 Jun 2026 12:41:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0556B388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00B348203A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBbJwxwz__o4 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4214D81FEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4214D81FEE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BD5C87B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:02:28 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: df47e4fec2acecbd98a56b65316c81f74e4cb186
X-Git-Newrev: 4539cb556bd9660bc66f1050a77f60b6b5f1056d
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.6BD5C87B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/jemalloc: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4539cb556bd9660bc66f1050a77f60b6b5f1056d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
