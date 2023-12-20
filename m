Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3113C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD314208B;
	Wed, 20 Dec 2023 10:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AD314208B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJ3ms9KhaV3L; Wed, 20 Dec 2023 10:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8333342099;
	Wed, 20 Dec 2023 10:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8333342099
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25B501BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5630F82C21
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5630F82C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WodB2StZUYmN for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C0BC81E66
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0BC81E66
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26C3E87C2E; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 11:49:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 620a88f755f81a241e9e64f53d8f611977de5e7a
X-Git-Newrev: 7150660668b343c22f44554553fbaf0931acdce1
X-Patchwork-Hint: ignore
Message-Id: <20231220105005.26C3E87C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: bump to version 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=7150660668b343c22f44554553fbaf0931acdce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patches that have been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-test-handle-POSIX-ioctl-prototype.patch   | 70 ----------------------
 ...002-meson-make-building-tests-conditional.patch | 46 --------------
 package/libnvme/libnvme.hash                       |  2 +-
 package/libnvme/libnvme.mk                         |  2 +-
 4 files changed, 2 insertions(+), 118 deletions(-)

diff --git a/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch b/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
deleted file mode 100644
index 175cdcd7dd..0000000000
--- a/package/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From ca47ba3119365eafac0ab25a86cab9d9a1b29bd4 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sat, 30 Sep 2023 06:38:53 +0100
-Subject: [PATCH] test: handle POSIX ioctl prototype
-
-glibc has the following prototype for ioctl: int ioctl(int fd, unsigned long request, ...)
-POSIX (inc. musl) has the following for ioctl: int ioctl(int fd, int request, ...)
-
-Check which prototype is used in <sys/ioctl.h> to avoid a conflict and conditionally
-define the right one for the system.
-
-Upstream: https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4
-
-Bug: https://bugs.gentoo.org/914921
-Signed-off-by: Sam James <sam@gentoo.org>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build       | 10 ++++++++++
- test/ioctl/mock.c |  6 +++++-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 6fcf1da..2c979cc 100644
---- a/meson.build
-+++ b/meson.build
-@@ -230,6 +230,16 @@ conf.set(
-     ),
-     description: 'Is network address and service translation available'
- )
-+conf.set(
-+    'HAVE_GLIBC_IOCTL',
-+    cc.compiles(
-+        '''#include <sys/ioctl.h>
-+        int ioctl(int fd, unsigned long request, ...);
-+        ''',
-+        name: 'ioctl has glibc-style prototype'
-+    ),
-+    description: 'Is ioctl the glibc interface (rather than POSIX)'
-+)
- 
- if cc.has_function_attribute('fallthrough')
-   conf.set('fallthrough', '__attribute__((__fallthrough__))')
-diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
-index e917244..5d2ac94 100644
---- a/test/ioctl/mock.c
-+++ b/test/ioctl/mock.c
-@@ -114,7 +114,11 @@ void end_mock_cmds(void)
- 	} \
- })
- 
-+#ifdef HAVE_GLIBC_IOCTL
- int ioctl(int fd, unsigned long request, ...)
-+#else
-+int ioctl(int fd, int request, ...)
-+#endif
- {
- 	struct mock_cmds *mock_cmds;
- 	bool result64;
-@@ -141,7 +145,7 @@ int ioctl(int fd, unsigned long request, ...)
- 		result64 = true;
- 		break;
- 	default:
--		fail("unexpected %s %lu", __func__, request);
-+		fail("unexpected %s %lu", __func__, (unsigned long) request);
- 	}
- 	check(mock_cmds->remaining_cmds,
- 	      "unexpected %s command", mock_cmds->name);
--- 
-2.34.1
-
diff --git a/package/libnvme/0002-meson-make-building-tests-conditional.patch b/package/libnvme/0002-meson-make-building-tests-conditional.patch
deleted file mode 100644
index 0b6d3681ca..0000000000
--- a/package/libnvme/0002-meson-make-building-tests-conditional.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ff742e792725c316ba6de0800188bf36751bd1d1 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sat, 30 Sep 2023 06:43:39 +0100
-Subject: [PATCH] meson: make building tests conditional
-
-Just like we do for docs.
-
-Upstream: https://github.com/linux-nvme/libnvme/commit/ff742e792725c316ba6de0800188bf36751bd1d1
-
-Signed-off-by: Sam James <sam@gentoo.org>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build       | 4 +++-
- meson_options.txt | 1 +
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 2c979cc..a9263b5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -273,7 +273,9 @@ subdir('internal')
- subdir('ccan')
- subdir('src')
- subdir('libnvme')
--subdir('test')
-+if get_option('tests')
-+    subdir('test')
-+endif
- subdir('examples')
- subdir('doc')
- 
-diff --git a/meson_options.txt b/meson_options.txt
-index a1ed79f..251ae11 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -6,6 +6,7 @@ option('rstdir', type : 'string', value : '', description : 'directory for ReST
- 
- option('docs', type : 'combo', choices : ['false', 'html', 'man', 'rst', 'all'], description : 'install documentation')
- option('docs-build', type : 'boolean', value : false,  description : 'build documentation')
-+option('tests', type : 'boolean', value : true, description : 'build tests')
- 
- option('python', type : 'feature', value: 'auto', description : 'Generate libnvme python bindings')
- option('openssl', type : 'feature', value: 'auto', description : 'OpenSSL support')
--- 
-2.34.1
-
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index b9e0281189..2a446eaf0a 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  0dd8ba8b655abe78c09833edb66632aa6bee82aebf117dd252ded968deaaeec7  libnvme-1.6.tar.gz
+sha256  93febccd2e4201a6a9c696a0208a7227adfd1649ad0523754c1885503890e77c  libnvme-1.7.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index b393122c85..688624a79e 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.6
+LIBNVME_VERSION = 1.7
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
