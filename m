Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231AEC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B722641B91;
	Thu, 18 Aug 2022 06:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B722641B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjoEVDv_TpQp; Thu, 18 Aug 2022 06:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD4F41B71;
	Thu, 18 Aug 2022 06:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD4F41B71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55F371C11A5
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EE01408F0
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EE01408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkubR9J8q7ZE for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A2EA408B6
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A2EA408B6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC0868790C; Thu, 18 Aug 2022 06:07:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:54:37 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 50e8aacea02f486ce26734d10f384e240595d72a
X-Git-Newrev: 1e0ee35a9dba9f5f8b91e751b17950a540063546
X-Patchwork-Hint: ignore
Message-Id: <20220818060740.CC0868790C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bird: fix build
 with autoconf >= 2.70
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e0ee35a9dba9f5f8b91e751b17950a540063546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

checking for glob.h... no
configure: error: glob.h not found.

configure:5207: checking for glob.h
configure:5230: /data/buildroot-autobuilder/instance-0/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.0943dc99'
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.0943dc99'

This is the same problem that we tried to fix in
03c148c8dec4e8c3fa13fcde4a730b3ab97f3f10 by adding AUTORECONF = YES.

The analysis made back then is probably not entirely correct - the issue
only seems to occur with GCC8, not with any earlier or later version,
which hints at a compiler bug. Since the error involves some
LTO-generated functions, the trigger is probably the -flto=4.

Whatever the exact issue is, it is avoided if we make sure that our
CFLAGS replace the default ones instead of being added to them.
Currently, they are added because the configure script doesn't properly
detect that CFLAGS was set.

Add a patch (sent upstream months ago, but it didn't appear in the
release that has been done since then) that makes sure CFLAGS is
properly detected.

Fixes:
 - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1d3d2d2741a27d5caed09906eba1402afe906f35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...configure.ac-fix-build-with-autoconf-2.70.patch | 33 ++++++++++++++++++++++
 package/bird/bird.mk                               |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..c1adf48424
--- /dev/null
+++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
@@ -0,0 +1,33 @@
+From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Nov 2021 20:58:41 +0100
+Subject: [PATCH] configure.ac: properly evaluate ac_test_CFLAGS
+
+Since autoconf 2.69 and
+https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=76754e04fce5f6a7701bec57b057020585df2ae3
+ac_test_CFLAGS is set to ${CFLAGS+y} instead of ${CFLAGS+set}.
+
+Just test that ac_test_CFLAGS is not empty, to support both cases.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 64181d29..b4b3fcfb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,7 +114,7 @@ AC_SEARCH_LIBS([clock_gettime], [rt posix4],
+ AC_CANONICAL_HOST
+ 
+ # Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
+-if test "$ac_test_CFLAGS" != set ; then
++if ! test "$ac_test_CFLAGS" ; then
+   bird_cflags_default=yes
+ fi
+ 
+-- 
+2.33.0
+
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 7d7002d5f2..b77e1aba19 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -11,6 +11,8 @@ BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
 BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
+
+# 0001-configure.ac-fix-build-with-autoconf-2.70.patch
 BIRD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
