Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95193CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68CFB418A6;
	Wed,  3 Apr 2024 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZDRKkPVizxL; Wed,  3 Apr 2024 21:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01F85418CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F85418CE;
	Wed,  3 Apr 2024 21:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 038B11BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E401C41899
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzXH5sJJeJbk for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5B541889
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5B541889
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9392084A7C; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:09:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146498d13c487e8f43d6725e343eae4474147695
X-Git-Newrev: 338acb27ff3e07560290085d7c6a2feab633c869
X-Patchwork-Hint: ignore
Message-Id: <20240403210939.9392084A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=338acb27ff3e07560290085d7c6a2feab633c869
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bpftrace is a high-level tracing language for Linux enhanced Berkeley
Packet Filter (eBPF) available in recent Linux kernels (4.1 and later).

Only tested on x86_64.

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Cc: Qais Yousef <qyousef@layalina.io>
Signed-off-by: Mat Martineau <martineau@kernel.org>
[Arnout:
 - Remove duplicate 'depends on BR2_TOOLCHAIN_HAS_THREADS'
 - Fix Config.in comment text and dependencies
 - Order dependencies alphabetically
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                     |  4 +++
 package/Config.in              |  1 +
 package/bpftrace/Config.in     | 56 ++++++++++++++++++++++++++++++++++++++++++
 package/bpftrace/bpftrace.hash |  3 +++
 package/bpftrace/bpftrace.mk   | 34 +++++++++++++++++++++++++
 5 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a6b06bcbf..8d7f8bcba5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2583,6 +2583,9 @@ F:	package/synergy/
 N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
 F:	package/redis-plus-plus/
 
+N:	Qais Yousef <qais.yousef@arm.com>
+F:	package/bpftrace/
+
 N:	Rafal Susz <rafal.susz@gmail.com>
 F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
@@ -2686,6 +2689,7 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
+F:	package/bpftrace/
 F:	package/bullet/
 F:	package/clinfo/
 F:	package/efl/
diff --git a/package/Config.in b/package/Config.in
index 84c9aff51f..60d8947778 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
+	source "package/bpftrace/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/clpeak/Config.in"
diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
new file mode 100644
index 0000000000..8af94443ab
--- /dev/null
+++ b/package/bpftrace/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+
+config BR2_PACKAGE_BPFTRACE
+	bool "bpftrace"
+	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # bcc -> python3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libbpf
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc
+	depends on BR2_TOOLCHAIN_USES_GLIBC # bcc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
+	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
+	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3, libbpf
+	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
+	select BR2_PACKAGE_BCC
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_CEREAL
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBBPF
+	select BR2_PACKAGE_LLVM
+	# LLVM RTTI mendatory: https://github.com/iovisor/bpftrace/issues/1156
+	select BR2_PACKAGE_LLVM_RTTI
+	select BR2_PACKAGE_XZ
+	help
+	  bpftrace is a high-level tracing language for Linux enhanced
+	  Berkeley Packet Filter (eBPF) available in recent Linux
+	  kernels (4.x).
+
+	  bpftrace uses LLVM as a backend to compile scripts to
+	  BPF-bytecode and makes use of BCC for interacting with the
+	  Linux BPF system, as well as existing Linux tracing
+	  capabilities: kernel dynamic tracing (kprobes), user-level
+	  dynamic tracing (uprobes), and tracepoints. The bpftrace
+	  language is inspired by awk and C, and predecessor tracers
+	  such as DTrace and SystemTap.
+
+	  It's highly recommended to NOT strip bpftrace binary.
+	  To do so, add "bpftrace" to BR2_STRIP_EXCLUDE_FILES.
+	  See:
+	    https://bugzilla.redhat.com/show_bug.cgi?id=1865787
+
+	  https://www.github.com/iovisor/bpftrace
+
+comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 4.13"
+	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7 \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
new file mode 100644
index 0000000000..c2ecc927da
--- /dev/null
+++ b/package/bpftrace/bpftrace.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  b520340f28ce4d6f2fb2355f1675b6801ff8498ed9e8bff14abbbf6baff5a08e  bpftrace-0.19.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
new file mode 100644
index 0000000000..dc4c9728cc
--- /dev/null
+++ b/package/bpftrace/bpftrace.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# bpftrace
+#
+################################################################################
+
+BPFTRACE_VERSION = 0.19.1
+BPFTRACE_SITE = $(call github,iovisor,bpftrace,v$(BPFTRACE_VERSION))
+BPFTRACE_LICENSE = Apache-2.0
+BPFTRACE_LICENSE_FILES = LICENSE
+BPFTRACE_DEPENDENCIES = \
+	bcc \
+	bzip2 \
+	cereal \
+	elfutils \
+	host-bison \
+	host-flex \
+	libbpf \
+	llvm \
+	xz
+
+# libbfd, libopcodes
+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+BPFTRACE_DEPENDENCIES += binutils
+endif
+
+BPFTRACE_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS:BOOL=OFF \
+	-DBUILD_TESTING:BOOL=OFF \
+	-DENABLE_MAN:BOOL=OFF \
+	-DINSTALL_TOOL_DOCS:BOOL=OFF \
+	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
