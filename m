Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB296C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C2B361060;
	Sun, 29 May 2022 21:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrLdAkQcNszD; Sun, 29 May 2022 21:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F21B60EBF;
	Sun, 29 May 2022 21:26:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF6C1BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C9C7419A3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VEgV8PkPQM5 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:26:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B96D414CA
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:26:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E2C758671E; Sun, 29 May 2022 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 23:25:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7a5626e8e9a813c6f7d8493fec3df2bae9b8f9b
X-Git-Newrev: bd40451b9746c0dd317c2037070fc2f93ffcc712
X-Patchwork-Hint: ignore
Message-Id: <20220529211501.E2C758671E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ktap: drop package
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
Content-Type: multipart/mixed; boundary="===============5107999948419139533=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5107999948419139533==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bd40451b9746c0dd317c2037070fc2f93ffcc712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ktap doesn't build with recent kernels (e.g. 5.10.104-cip3 or 5.15.37)
and is not maintained anymore (latest release in 2013 and latest commit
more than 5 years ago):

In file included from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:21:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c:30:6: warning: "CONFIG_EVENT_TRACING" is not defined, evaluates to 0 [-Wundef]
   30 | #if !CONFIG_EVENT_TRACING
      |      ^~~~~~~~~~~~~~~~~~~~
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c:31:2: error: #error "Please enable CONFIG_EVENT_TRACING before compile ktap"
   31 | #error "Please enable CONFIG_EVENT_TRACING before compile ktap"
      |  ^~~~~
In file included from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:21:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c: In function ‘gettimeofday_ns’:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c:56:18: error: storage size of ‘now’ isn’t known
   56 |  struct timespec now;
      |                  ^~~
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c:58:2: error: implicit declaration of function ‘getnstimeofday’; did you mean ‘gettimeofday_ns’? [-Werror=implicit-function-declaration]
   58 |  getnstimeofday(&now);
      |  ^~~~~~~~~~~~~~
      |  gettimeofday_ns
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/ktap.c:56:18: warning: unused variable ‘now’ [-Wunused-variable]
   56 |  struct timespec now;
      |                  ^~~
In file included from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:22:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_obj.c: In function ‘kp_obj_kstack2str’:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_obj.c:243:21: error: storage size of ‘trace’ isn’t known
  243 |  struct stack_trace trace;
      |                     ^~~~~
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_obj.c:253:2: error: implicit declaration of function ‘save_stack_trace’ [-Werror=implicit-function-declaration]
  253 |  save_stack_trace(&trace);
      |  ^~~~~~~~~~~~~~~~
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_obj.c:243:21: warning: unused variable ‘trace’ [-Wunused-variable]
  243 |  struct stack_trace trace;
      |                     ^~~~~
In file included from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:27:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_transport.c: In function ‘trace_empty’:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_transport.c:105:39: error: passing argument 1 of ‘ring_buffer_empty_cpu’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  105 |   if (!ring_buffer_empty_cpu(ktap_iter->buffer, cpu))
      |                              ~~~~~~~~~^~~~~~~~
      |                                       |
      |                                       struct ring_buffer *
In file included from ./include/linux/trace_events.h:6,
                 from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/trace_events.h:5,
                 from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_events.h:4,
                 from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_str.c:35,
                 from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:24:
./include/linux/ring_buffer.h:162:49: note: expected ‘struct trace_buffer *’ but argument is of type ‘struct ring_buffer *’
  162 | bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu);
      |                            ~~~~~~~~~~~~~~~~~~~~~^~~~~~
In file included from /home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/amalg.c:27:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_transport.c: In function ‘trace_consume’:
/home/autobuild/autobuild/instance-6/output-1/build/ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f/./runtime/kp_transport.c:116:31: error: passing argument 1 of ‘ring_buffer_consume’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  116 |  ring_buffer_consume(ktap_iter->buffer, iter->cpu, &iter->ts,
      |                      ~~~~~~~~~^~~~~~~~
      |                               |
      |                               struct ring_buffer *

Fixes:
 - http://autobuild.buildroot.org/results/9067192962b4011e0da27ac2b2dc53eb1e31582c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy       |  7 +++++++
 DEVELOPERS             |  3 ---
 package/Config.in      |  1 -
 package/ktap/Config.in | 31 -------------------------------
 package/ktap/ktap.hash |  3 ---
 package/ktap/ktap.mk   | 36 ------------------------------------
 6 files changed, 7 insertions(+), 74 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3d5df3abbb..853a8917be 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_PACKAGE_KTAP
+	bool "ktap removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it is not compatible with latest
+	  kernels and is not maintained anymore (no release since 2013).
+
 config BR2_KERNEL_HEADERS_5_16
 	bool "kernel headers version 5.16.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c33959fa45..71cc3da6d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -127,9 +127,6 @@ F:	package/dcron/
 F:	package/libxmlrpc/
 F:	package/python-docopt/
 
-N:	Anders Darander <anders@chargestorm.se>
-F:	package/ktap/
-
 N:	André Zwing <nerv@dawncrow.de>
 F:	package/libkrb5/
 F:	package/openal/
diff --git a/package/Config.in b/package/Config.in
index 8892134133..00f061015f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -107,7 +107,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
-	source "package/ktap/Config.in"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
deleted file mode 100644
index 38293f6dde..0000000000
--- a/package/ktap/Config.in
+++ /dev/null
@@ -1,31 +0,0 @@
-config BR2_PACKAGE_KTAP
-	bool "ktap"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  ktap is a script-based dynamic tracing tool for Linux
-
-	  It uses a scripting language and lets users trace the Linux
-	  kernel dynamically. ktap is designed to give operational
-	  insights with interoperability that allows users to tune,
-	  troubleshoot and extend kernel and application.
-	  It's similar to Linux Systemtap and Solaris Dtrace.
-
-	  ktap doesn't support kernels older than 3.1.
-
-	  To be able to resolve symbols in DSO and for sdt, you need to
-	  enable elfutils.
-
-	  Your kernel must have CONFIG_EVENT_TRACING,
-	  CONFIG_PERF_EVENTS, and CONFIG_DEBUG_FS enabled to compile.
-
-	  Buildroot automatically enables these in the kernel
-	  configuration.
-
-	  http://www.ktap.org
-
-comment "ktap needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
-
-comment "ktap needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ktap/ktap.hash b/package/ktap/ktap.hash
deleted file mode 100644
index 1eff712501..0000000000
--- a/package/ktap/ktap.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256 44a0808d57175cf9d15466f720e1e10d5ed1abc3497aedf9ddd6469545552345  ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f.tar.gz
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE-GPL
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
deleted file mode 100644
index eec8b75b7f..0000000000
--- a/package/ktap/ktap.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# ktap
-#
-################################################################################
-
-KTAP_VERSION = 23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f
-KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
-KTAP_LICENSE = GPL-2.0
-KTAP_LICENSE_FILES = LICENSE-GPL
-
-ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-KTAP_DEPENDENCIES += elfutils
-else
-KTAP_FLAGS += NO_LIBELF=1
-endif
-
-define KTAP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(KTAP_FLAGS) ktap
-endef
-
-define KTAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m755 $(@D)/ktap $(TARGET_DIR)/usr/bin/ktap
-endef
-
-KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
-
-define KTAP_LINUX_CONFIG_FIXUPS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER)
-endef
-
-$(eval $(kernel-module))
-$(eval $(generic-package))

--===============5107999948419139533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5107999948419139533==--
