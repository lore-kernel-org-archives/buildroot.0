Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8634FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E8960F56
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37E8960F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1469C83D61;
	Tue,  3 Aug 2021 23:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mT22Ji2YHImK; Tue,  3 Aug 2021 23:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBEA83D4E;
	Tue,  3 Aug 2021 23:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C77EA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E824067C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXYhzBfkllTR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 445CA40608
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C4F186EB0; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f1d536e7e373a42b0f3d8af4711abfcf8959805
X-Git-Newrev: 026d447c2c2a3b0092c45c2afa3d17284aa31276
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.9C4F186EB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pipewire: remove
 already-applied patch and renumber
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

commit: https://git.buildroot.net/buildroot/commit/?id=026d447c2c2a3b0092c45c2afa3d17284aa31276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop 0002-meson.build-fix-build-with-uclibc-ng.patch which is not needed
since 0dda1a44a0859fc15b318e493c151ca1d807ba24 which has been merged in
master in commit 8d07baab43b5624ad6d73ee58f5a9d4ab8b27049

While at it, renumber
0002-meson-fix-getrandom-detection-for-uclibc.patch to
0001-meson-fix-getrandom-detection-for-uclibc.patch (patch number was
wrong since its addition in commit
b003cb5d16de9c92baba7dea7a6626c71cefc4fb) and also renumber remaining
patch

Fixes:
 - http://autobuild.buildroot.org/results/4d442c61b137ca1bd2dd32c6802ff0251d39e7a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...meson-fix-getrandom-detection-for-uclibc.patch} |  0
 ...c.patch => 0002-fix-linking-with-latomic.patch} |  0
 ...0002-meson.build-fix-build-with-uclibc-ng.patch | 52 ----------------------
 3 files changed, 52 deletions(-)

diff --git a/package/pipewire/0002-meson-fix-getrandom-detection-for-uclibc.patch b/package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
similarity index 100%
rename from package/pipewire/0002-meson-fix-getrandom-detection-for-uclibc.patch
rename to package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
diff --git a/package/pipewire/0003-fix-linking-with-latomic.patch b/package/pipewire/0002-fix-linking-with-latomic.patch
similarity index 100%
rename from package/pipewire/0003-fix-linking-with-latomic.patch
rename to package/pipewire/0002-fix-linking-with-latomic.patch
diff --git a/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch b/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
deleted file mode 100644
index 36b14d3f16..0000000000
--- a/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 8f1de87381d270a8f4e5927187ae0466a9c9504a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 4 May 2021 22:56:54 +0200
-Subject: [PATCH] meson.build: fix build with uclibc-ng
-
-Build with uclib-ng fails since commit
-a4b0b9afe5a782a7f4a8fe153ecf51bcb0180ae3 on:
-
-FAILED: src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o
-/srv/storage/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -Isrc/pipewire/libpipewire-0.3.so.0.326.0.p -Isrc/pipewire -I../src/pipewire -Isrc -I../src -I. -I.. -Ispa/include -I../spa/include -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu99 -O3 -fvisibility=hidden -Werror=suggest-attribute=format -Wsign-compare -Wpointer-arith -Wpointer-sign -Wformat -Wformat-security -Wimplicit-fallthrough -Wmissing-braces -Wtype-limits -Wvariadic-macros -Wno-missing-field-initializers -Wno-unused-parameter -Wno-pedantic -Wold-style-declaration -Wunused-result -DFASTPATH -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -pthread -DHAVE_CONFIG_H -D_GNU_SOURCE -D_POSIX_C_SOURCE -MD -MQ src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -MF src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o.d -o src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -c ../src/pipewire/impl-core.c
-../src/pipewire/impl-core.c:54:9: error: conflicting types for 'getrandom'
- ssize_t getrandom(void *buf, size_t buflen, unsigned int flags) {
-         ^~~~~~~~~
-In file included from ../src/pipewire/impl-core.c:34:
-/srv/storage/autobuild/run/instance-2/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:28:12: note: previous declaration of 'getrandom' was here
- extern int getrandom(void *__buf, size_t count, unsigned int flags)
-            ^~~~~~~~~
-
-Fix this build failure by adding -D_GNU_SOURCE as getrandom is protected
-by:
-
-if defined __UCLIBC_LINUX_SPECIFIC__ && defined __USE_GNU
-
-Extracted from:
- - https://github.com/wbx-github/uclibc-ng/blob/master/libc/sysdeps/linux/common/sys/random.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/a45f0ee009d90cef867dee4b1093225610fa10df
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/649]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 0a9963fb..11b63c08 100644
---- a/meson.build
-+++ b/meson.build
-@@ -274,7 +274,7 @@ if cc.has_function('memfd_create', prefix : '#include <sys/mman.h>', args : [ '-
-   cdata.set('HAVE_MEMFD_CREATE', 1)
- endif
- 
--if cc.has_function('getrandom', prefix : '#include <sys/random.h>')
-+if cc.has_function('getrandom', prefix : '#include <sys/random.h>', args : [ '-D_GNU_SOURCE' ])
-   cdata.set('HAVE_GETRANDOM', 1)
- endif
- 
--- 
-2.30.2
-
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
