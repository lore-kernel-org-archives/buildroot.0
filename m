Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C0CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6168482F;
	Wed,  3 Jun 2026 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDQ4JIvXtIQ5; Wed,  3 Jun 2026 20:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC73A8480E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780518057;
	bh=geN06QDAh2M05UMimLWEiJ9ce+z9MyoT6/zXFzhTnsA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mhwZywkqdoO8qyyglurHsolZJr6WkB4l2/0/B2MTJyufSVyKJto53xKBvmW6fR8kf
	 W1jOU9yFccQq9XgMc2+cDQqC4QV8b5gH8B9nTvZ4nOgWZeM7ZNag6mGL16inLJF+q8
	 D9w7FZA6GJ+dTurXn8G63TuXZpOzaDrO1G3hFn327vWaROxhl30owBWB960J/4hqJ8
	 pVX3WTdRIrz0RmA9CzoxXMog4VqIKp6s2moo2jUdP97txwvswKDP8Z5YgkMQyGquL0
	 uwnccqCahKQRNODT5qXjBeccb/dYyYCQJvwybHUsFJQauu0KoSZfSkQA+yF72n4Rm9
	 c0Fk4EGRRU0Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC73A8480E;
	Wed,  3 Jun 2026 20:20:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 713532F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6319642342
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxGtBzbA0Ecj for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80C8842279
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80C8842279
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B6AA8799D; Wed,  3 Jun 2026 20:20:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 22:13:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50bc0b5fdad80d3f1bf8bb6796b6fffe0b986503
X-Git-Newrev: 21057a30f2244a1a68092de294027a34fb6ee103
X-Patchwork-Hint: ignore
Message-Id: <20260603202040.6B6AA8799D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestAtop: use the default
 toolchain (BASIC_TOOLCHAIN_CONFIG)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21057a30f2244a1a68092de294027a34fb6ee103
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The TestAtop use the really old toolchain br-arm-full-2019.05.1 because
BASIC_TOOLCHAIN_CONFIG from Buildroot 2019.08 provide an uClibc-ng
toolchain with 3.10 kernel headers (br-arm-full-2017.05-1078-g95b1dae)
[1].

Since then, we switched to glibc toolchains by default in Buildroot [2]
(2022.11) and BASIC_TOOLCHAIN_CONFIG was updated several time and now
use a Bootlin toolchain stable (2025.08-1). This toolchain use gcc 14,
5.3 kernel headers, glibc 2.41.

We need to update the toolchain in TestAtop since Busybox 1.38.0 added
yescrypt algorithms that requires explicit_bzero() introduced in Glibc
2.25 [4], uClibc-ng 1.0.47 [5] and musl 1.1.20 [6].

There is no real reason to keep this really old toolchain, so bump
the toolchain to Bootlin toolchain stable (2025.08-1).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622325905

[1] 9609a7c2c22160523bda5cb5b4417c9278ac27d9
[2] 4057e36ca9665edd5248512e4edba2c243b8f4be
[3] https://github.com/vda-linux/busybox_mirror/commit/80e676664e1d7a0b07f14bff44f93d1fef709cf4
[4] https://sourceware.org/git/?p=glibc.git;a=commit;h=ea1bd74defcf9d5291d14972e63105168ca9eb4f
[5] https://github.com/wbx-github/uclibc-ng/commit/9e7b342fde5505c0a1d4968e9d70537ac406f640
[6] https://git.musl-libc.org/cgit/musl/commit/?id=05ac345f895098657cf44d419b5d572161ebaf43

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_atop.py | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/support/testing/tests/package/test_atop.py b/support/testing/tests/package/test_atop.py
index 5a96684799..a5b549ef90 100644
--- a/support/testing/tests/package/test_atop.py
+++ b/support/testing/tests/package/test_atop.py
@@ -2,23 +2,9 @@ import os
 
 import infra.basetest
 
-BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 = \
-    """
-    BR2_arm=y
-    BR2_TOOLCHAIN_EXTERNAL=y
-    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
-    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
-    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
-    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-    BR2_TOOLCHAIN_EXTERNAL_CXX=y
-    """
-
 
 class TestAtop(infra.basetest.BRTest):
-    config = BASIC_TOOLCHAIN_CONFIG_HEADERS_AT_LEAST_3_14 + \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_ATOP=y
         BR2_TARGET_ROOTFS_CPIO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
