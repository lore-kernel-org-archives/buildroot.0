Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C283ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2590640575;
	Wed, 21 Sep 2022 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2590640575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51ycrOwKz9oj; Wed, 21 Sep 2022 19:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA6E240566;
	Wed, 21 Sep 2022 19:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA6E240566
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA8691BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787774053F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787774053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQsLQhjE1ZNN for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5240E4051B
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5240E4051B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40A0A85CFC; Wed, 21 Sep 2022 19:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:24:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58d5166d9f779b60a0fa022996f214087269de2d
X-Git-Newrev: 8bfc2afd6f00299781240db877aac8ff6e47148d
X-Patchwork-Hint: ignore
Message-Id: <20220921193119.40A0A85CFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: bump to version 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bfc2afd6f00299781240db877aac8ff6e47148d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches which are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland/0001-build-set-c_std-c99.patch     |  34 -------
 ...ild-don-t-rely-on-implicit-GNU-extensions.patch | 108 ---------------------
 package/wayland/wayland.hash                       |   6 +-
 package/wayland/wayland.mk                         |   4 +-
 4 files changed, 5 insertions(+), 147 deletions(-)

diff --git a/package/wayland/0001-build-set-c_std-c99.patch b/package/wayland/0001-build-set-c_std-c99.patch
deleted file mode 100644
index 69f728aa11..0000000000
--- a/package/wayland/0001-build-set-c_std-c99.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 40c275f642e3895aeb748403fcdfd92d7d875d65 Mon Sep 17 00:00:00 2001
-From: Simon Ser <contact@emersion.fr>
-Date: Mon, 10 Jan 2022 14:54:02 +0100
-Subject: [PATCH] build: set c_std=c99
-
-Set explicitly the C standard to use to make sure we don't use
-features not available on our target platforms.
-
-Signed-off-by: Simon Ser <contact@emersion.fr>
-
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/wayland/-/commit/40c275f642e3895aeb748403fcdfd92d7d875d65]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index cab267e9..e9691ffe 100644
---- a/meson.build
-+++ b/meson.build
-@@ -5,7 +5,8 @@ project(
- 	meson_version: '>= 0.52.1',
- 	default_options: [
- 		'warning_level=2',
--		'buildtype=debugoptimized'
-+		'buildtype=debugoptimized',
-+		'c_std=c99',
- 	]
- )
- wayland_version = meson.project_version().split('.')
--- 
-GitLab
-
diff --git a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
deleted file mode 100644
index fcafa98f46..0000000000
--- a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9 Mon Sep 17 00:00:00 2001
-From: Simon Ser <contact@emersion.fr>
-Date: Mon, 10 Jan 2022 14:51:55 +0100
-Subject: [PATCH] build: don't rely on implicit GNU extensions
-
-Currently libwayland assumes GNU extensions will be available, but
-doesn't define the C standard to use. Instead, let's unconditionally
-enable POSIX extensions, and enable GNU extensions on a case-by-case
-basis as needed.
-
-Signed-off-by: Simon Ser <contact@emersion.fr>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9]
----
- cursor/xcursor.c        |  1 +
- meson.build             | 10 ++++++++--
- tests/display-test.c    |  1 +
- tests/event-loop-test.c |  1 +
- tests/fixed-test.c      |  1 +
- 5 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/cursor/xcursor.c b/cursor/xcursor.c
-index 0506680..188be7c 100644
---- a/cursor/xcursor.c
-+++ b/cursor/xcursor.c
-@@ -23,6 +23,7 @@
-  * SOFTWARE.
-  */
- 
-+#define _GNU_SOURCE
- #include "xcursor.h"
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/meson.build b/meson.build
-index 07bbd29..cab267e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -14,6 +14,12 @@ config_h = configuration_data()
- config_h.set_quoted('PACKAGE', meson.project_name())
- config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
- 
-+cc_args = []
-+if host_machine.system() != 'freebsd'
-+	cc_args += ['-D_POSIX_C_SOURCE=200809L']
-+endif
-+add_project_arguments(cc_args, language: 'c')
-+
- compiler_flags = [
- 	'-Wno-unused-parameter',
- 	'-Wstrict-prototypes',
-@@ -79,7 +85,7 @@ if get_option('libraries')
- 	]
- 
- 	foreach d: decls
--		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep)
-+		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep, args: cc_args)
- 			error('@0@ is needed to compile Wayland libraries'.format(d['symbol']))
- 		endif
- 	endforeach
-@@ -87,7 +93,7 @@ if get_option('libraries')
- 	rt_dep = []
- 	if not cc.has_function('clock_gettime', prefix: '#include <time.h>')
- 		rt_dep = cc.find_library('rt')
--		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep)
-+		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep, args: cc_args)
- 			error('clock_gettime not found')
- 		endif
- 	endif
-diff --git a/tests/display-test.c b/tests/display-test.c
-index 763adc9..a6f410d 100644
---- a/tests/display-test.c
-+++ b/tests/display-test.c
-@@ -24,6 +24,7 @@
-  * SOFTWARE.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdbool.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
-index 9d43c91..a51ba8f 100644
---- a/tests/event-loop-test.c
-+++ b/tests/event-loop-test.c
-@@ -24,6 +24,7 @@
-  * SOFTWARE.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdlib.h>
- #include <stdint.h>
- #include <assert.h>
-diff --git a/tests/fixed-test.c b/tests/fixed-test.c
-index 47a4dae..0b58797 100644
---- a/tests/fixed-test.c
-+++ b/tests/fixed-test.c
-@@ -23,6 +23,7 @@
-  * SOFTWARE.
-  */
- 
-+#define _GNU_SOURCE
- #include <stdlib.h>
- #include <stdio.h>
- #include <assert.h>
--- 
-2.25.1
-
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index cd4cb1a474..1c7fe705e1 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042064.html
-sha256  b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725  wayland-1.20.0.tar.xz
-sha512  e8a1f410994b947f850799bdd0d95a2429d8467f853e62a0ab3915a4e9fe130f8aa977e03715114ab740c6ec546edea63d275ce7f927d4f3029ea126e6a7d215  wayland-1.20.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042268.html
+sha256  6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac  wayland-1.21.0.tar.xz
+sha512  5575216d30fdf5c63caa6bcad071e15f2a4f3acb12df776806073f65db37a50b5b5b3cc7957c5497636f4ac01893e2eaab26e453ded44b287acde01762f5fdc3  wayland-1.21.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 4c19875bba..0a6e5e9ec7 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.20.0
-WAYLAND_SITE = https://wayland.freedesktop.org/releases
+WAYLAND_VERSION = 1.21.0
+WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
