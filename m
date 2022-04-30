Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D40840502;
	Sat, 30 Apr 2022 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ThmD3w86bBF; Sat, 30 Apr 2022 18:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DDA4404DB;
	Sat, 30 Apr 2022 18:56:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80E011BF951
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1676941626
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6-3ZgGPjeLV for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D2F4161C
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 763A484B54; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:20:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea86757e51cf424566f79896335d31d15b89d0d9
X-Git-Newrev: ebf745b6768689a088a1e51bdb4e7b941dfd15c5
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.763A484B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebf745b6768689a088a1e51bdb4e7b941dfd15c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure on mips32:

[9/10] Compiling C object tests/try-syscall.p/try-syscall.c.o
FAILED: tests/try-syscall.p/try-syscall.c.o
/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
   34 | #   error "Unknown MIPS ABI"
      |     ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../bubblewrap/0001-meson-add-tests-option.patch   | 54 ++++++++++++++++++++++
 package/bubblewrap/bubblewrap.mk                   |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/package/bubblewrap/0001-meson-add-tests-option.patch b/package/bubblewrap/0001-meson-add-tests-option.patch
new file mode 100644
index 0000000000..32836f925d
--- /dev/null
+++ b/package/bubblewrap/0001-meson-add-tests-option.patch
@@ -0,0 +1,54 @@
+From 34ea0ad841d6f9167db391c08e6cd51471fed6be Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Apr 2022 11:27:06 +0200
+Subject: [PATCH] meson: add tests option
+
+Allow the user to disable tests, for example to avoid the following
+build failure on mips32:
+
+FAILED: tests/try-syscall.p/try-syscall.c.o
+/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
+../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
+   34 | #   error "Unknown MIPS ABI"
+      |     ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/containers/bubblewrap/commit/34ea0ad841d6f9167db391c08e6cd51471fed6be]
+---
+ meson.build       | 4 +++-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5b63aa64..9277ac4e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -152,4 +152,6 @@ if not meson.is_subproject()
+   subdir('completions')
+ endif
+ 
+-subdir('tests')
++if get_option('tests')
++  subdir('tests')
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 2fa3a8c3..a136a3c3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -38,6 +38,12 @@ option(
+   description : 'enable optional SELINUX support',
+   value : 'auto',
+ )
++option(
++  'tests',
++  type : 'boolean',
++  description : 'build tests',
++  value : 'true',
++)
+ option(
+   'zsh_completion',
+   type : 'feature',
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 5875b0d6e2..81456e9e0d 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -17,7 +17,8 @@ BUBBLEWRAP_CONF_OPTS = \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
-	-Drequire_userns=false
+	-Drequire_userns=false \
+	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 BUBBLEWRAP_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
