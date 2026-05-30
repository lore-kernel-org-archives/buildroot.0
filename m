Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AEFCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5948C42A2A;
	Sat, 30 May 2026 10:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DFYlQdacr4h; Sat, 30 May 2026 10:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C6F842A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137842;
	bh=NP9B7WildTfY2WDGFxx4NUIdZSSyx4xeimuvVg7Z2kI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f07f7KAuVWYXkBMA6txiBpktNfZdoBYSLpnDNoyvgmzSsTOUfRbPrxsAHlpSa0EYc
	 tvIqMIixkRYC/PBwlXTAQTj/wQAQ+8EvOeIVmSdsYpRGkmqjAuZBtmjIlDQc22pBts
	 41M0/9QpILXuUPREjKXmBH3mOj4NyjhnOZhJgXkdkYDzXSV3vFokKxQtxDjqcY1XFD
	 a67MWajoVxtNX1cUiqY6e5ZoW/A4V54r/USkMLS0j0sI/UjRIYB+EmPN75RXkpm3Xm
	 QcMmjaHef6Zml4jLzwOijUcOlr5Le9YeKSOwernFx08f3i2rpN4XoEvUAqsRH7eTaT
	 wOxekdri+JLmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6F842A30;
	Sat, 30 May 2026 10:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA24218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 783A560F02
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7B9kPmgnXAC for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F3A60E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6F3A60E6B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C66AF8749A; Sat, 30 May 2026 10:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:40:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10d428f9c36204ab2262ac6c34ac227fb9f377a5
X-Git-Newrev: 6b15fa64e6b75f75191c845aea43c349e0080986
X-Patchwork-Hint: ignore
Message-Id: <20260530104344.C66AF8749A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jemalloc: fix build on m68k/uClibc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b15fa64e6b75f75191c845aea43c349e0080986
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
