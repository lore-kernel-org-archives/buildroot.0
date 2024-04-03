Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19CCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42BB418EE;
	Wed,  3 Apr 2024 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJ944gqFGZ1B; Wed,  3 Apr 2024 21:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C1C418E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C1C418E7;
	Wed,  3 Apr 2024 21:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFC091BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9613C4042B
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sA9bIKkqk1A for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C5040543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C5040543
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 828C2848D4; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:09:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a26701a0dbe2654f4a1e2a53c709ac12077e18f4
X-Git-Newrev: 146498d13c487e8f43d6725e343eae4474147695
X-Patchwork-Hint: ignore
Message-Id: <20240403210939.828C2848D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=146498d13c487e8f43d6725e343eae4474147695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bcc is a front-end tool for eBPF:
https://github.com/iovisor/bcc/blob/master/README.md
eBPF is the most powerful Linux tracer, and bcc allows writing eBPF
scripts in C and PYTHON3.

bcc can help to troubleshoot issues quickly on embedded systems (as long
as Linux kernel version >= 4.1).

bcc can also make it easy to create observabilty tools, SDN
configuration, ddos mitigation, intrusion detection and secure
containers. More information is available at: https://ebpf.io/

BCC can be tested on the target :
$ mount -t debugfs none /sys/kernel/debug
$ cd /usr/share/bcc/tools
$ ./execsnoop

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Qais Yousef <qais.yousef@arm.com>
Reviewed-by: Qais Yousef <qais.yousef@arm.com>
Cc: Qais Yousef <qyousef@layalina.io>
Signed-off-by: Mat Martineau <martineau@kernel.org>
[Arnout: order dependencies alphabetically, fix Config.in comment]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS            |  2 ++
 package/Config.in     |  1 +
 package/bcc/Config.in | 45 ++++++++++++++++++++++++++++++++++++++++++++
 package/bcc/bcc.hash  |  3 +++
 package/bcc/bcc.mk    | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7dca6a441a..3a6b06bcbf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1682,6 +1682,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/bcc/
 F:	package/python-aiofiles/
 F:	package/python-crayons/
 F:	package/python-cycler/
@@ -2683,6 +2684,7 @@ F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	package/alure/
 F:	package/aubio/
+F:	package/bcc/
 F:	package/binutils/
 F:	package/bullet/
 F:	package/clinfo/
diff --git a/package/Config.in b/package/Config.in
index b1237e5d6d..84c9aff51f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -87,6 +87,7 @@ endmenu
 
 menu "Debugging, profiling and benchmark"
 	source "package/babeltrace2/Config.in"
+	source "package/bcc/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
diff --git a/package/bcc/Config.in b/package/bcc/Config.in
new file mode 100644
index 0000000000..b91e0e5ee3
--- /dev/null
+++ b/package/bcc/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_BCC
+	bool "bcc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # clang
+	depends on BR2_INSTALL_LIBSTDCPP # clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # clang
+	depends on BR2_USE_WCHAR # clang, python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # clang, python3
+	depends on !BR2_STATIC_LIBS # clang, python3
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_FLEX # needs FlexLexer.h
+	select BR2_PACKAGE_HOST_ZIP
+	select BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_LLVM_BPF
+	select BR2_PACKAGE_PYTHON3
+	help
+	  BPF Compiler Collection (BCC)
+
+	  BCC is a toolkit for creating efficient kernel tracing and
+	  manipulation programs, and includes several useful tools and
+	  examples. It makes use of extended BPF (Berkeley Packet
+	  Filters), formally known as eBPF, a new feature that was
+	  first added to Linux 3.15. Much of what BCC uses requires
+	  Linux 4.1 and above.
+
+	  Note: Before using bcc, you need either need to :
+	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
+	  to target folder /lib/module/<kernel_ver>/build.
+	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
+	  and use generated headers under /sys/kernel/kheaders.tar.xz
+	  to populate /lib/module/<kernel_ver>/build.
+
+	  That's because the clang frontend build eBPF code at runtime.
+
+	  https://github.com/iovisor/bcc
+	  http://www.ebpf.io
+
+comment "bcc needs a glibc toolchain, C++, gcc >= 7, host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
new file mode 100644
index 0000000000..b37e125b1a
--- /dev/null
+++ b/package/bcc/bcc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  321575fa94f3274040379dd2d4535217f45099f4240b58a4dfc171aa8c78402f  bcc-src-with-submodule.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
new file mode 100644
index 0000000000..e496c4b344
--- /dev/null
+++ b/package/bcc/bcc.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# bcc
+#
+################################################################################
+
+BCC_VERSION = 0.29.1
+BCC_SITE = https://github.com/iovisor/bcc/releases/download/v$(BCC_VERSION)
+BCC_SOURCE = bcc-src-with-submodule.tar.gz
+BCC_LICENSE = Apache-2.0
+BCC_LICENSE_FILES = LICENSE.txt
+BCC_INSTALL_STAGING = YES
+BCC_DEPENDENCIES = \
+	clang \
+	elfutils \
+	flex \
+	host-bison \
+	host-flex \
+	host-python-setuptools \
+	host-zip \
+	llvm \
+	python3
+
+# ENABLE_LLVM_SHARED=ON to use llvm.so - we only support shared libs
+# Force REVISION otherwise bcc will use git describe to generate a version number.
+BCC_CONF_OPTS = \
+	-DENABLE_LLVM_SHARED:BOOL=ON \
+	-DREVISION:STRING=$(BCC_VERSION) \
+	-DENABLE_CLANG_JIT:BOOL=ON \
+	-DENABLE_MAN:BOOL=OFF \
+	-DENABLE_EXAMPLES:BOOL=OFF \
+	-DPY_SKIP_DEB_LAYOUT:BOOL=ON
+
+define BCC_LINUX_CONFIG_FIXUPS
+	# Enable kernel support for eBPF
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
+	# [for Linux kernel versions 4.1 through 4.6]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
+	# [for Linux kernel versions 4.7 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
+	# [for Linux kernel versions 5.2 and later]
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
+	# bcc needs debugfs at runtime
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
