Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE89C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BE040A97;
	Mon, 11 Jul 2022 17:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BE040A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xc_Qt44fCeMY; Mon, 11 Jul 2022 17:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DD804063F;
	Mon, 11 Jul 2022 17:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD804063F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2392A1BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD2CE60F31
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD2CE60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQGpkHuV-9K7 for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C7160F1E
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C7160F1E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E67E6837E7; Mon, 11 Jul 2022 17:15:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 18:51:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 54cddde910f4982070a43b927e45f421b7e448da
X-Git-Newrev: 197fa0f944b2d59b5d22485065cc9ca110d88f96
X-Patchwork-Hint: ignore
Message-Id: <20220711171516.E67E6837E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bpftool: add a
 patch to fix cross compilation
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

commit: https://git.buildroot.net/buildroot/commit/?id=197fa0f944b2d59b5d22485065cc9ca110d88f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

If on the host machine the "co-re" is supported, bpftool will
build a bootstrap version of itself as well. In that case, the
cross compilation can fail. This commit adds a patch to remedy
that. The fix that you see here is already upsteamed [1].

[1]
https://lore.kernel.org/bpf/165477661272.11342.13015777410417612477.git-patchwork-notify@kernel.org/T/#t

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
[Arnout: use upstream metadata for the patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ef65d04ccdb1fffd0151fa7b2979e000e586145d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-bootstrapping-during-a-cross-compilation.patch | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch b/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch
new file mode 100644
index 0000000000..fc192681e3
--- /dev/null
+++ b/package/bpftool/0001-bpftool-Fix-bootstrapping-during-a-cross-compilation.patch
@@ -0,0 +1,96 @@
+From 189f777ea4829bede0bf92f572c22fe1f2c37522 Mon Sep 17 00:00:00 2001
+From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
+Date: Wed, 8 Jun 2022 14:29:28 +0000
+Subject: [PATCH] bpftool: Fix bootstrapping during a cross compilation
+
+This change adjusts the Makefile to use "HOSTAR" as the archive tool
+to keep the sanity of the build process for the bootstrap part in
+check. For the rationale, please continue reading.
+
+When cross compiling bpftool with buildroot, it leads to an invocation
+like:
+
+$ AR="/path/to/buildroot/host/bin/arc-linux-gcc-ar" \
+  CC="/path/to/buildroot/host/bin/arc-linux-gcc"    \
+  ...
+  make
+
+Which in return fails while building the bootstrap section:
+
+----------------------------------8<----------------------------------
+
+  make: Entering directory '/src/bpftool-v6.7.0/src'
+  ...                        libbfd: [ on  ]
+  ...        disassembler-four-args: [ on  ]
+  ...                          zlib: [ on  ]
+  ...                        libcap: [ OFF ]
+  ...               clang-bpf-co-re: [ on  ] <-- triggers bootstrap
+
+  .
+  .
+  .
+
+    LINK     /src/bpftool-v6.7.0/src/bootstrap/bpftool
+  /usr/bin/ld: /src/bpftool-v6.7.0/src/bootstrap/libbpf/libbpf.a:
+               error adding symbols: archive has no index; run ranlib
+               to add one
+  collect2: error: ld returned 1 exit status
+  make: *** [Makefile:211: /src/bpftool-v6.7.0/src/bootstrap/bpftool]
+            Error 1
+  make: *** Waiting for unfinished jobs....
+    AR       /src/bpftool-v6.7.0/src/libbpf/libbpf.a
+    make[1]: Leaving directory '/src/bpftool-v6.7.0/libbpf/src'
+    make: Leaving directory '/src/bpftool-v6.7.0/src'
+
+---------------------------------->8----------------------------------
+
+This occurs because setting "AR" confuses the build process for the
+bootstrap section and it calls "arc-linux-gcc-ar" to create and index
+"libbpf.a" instead of the host "ar".
+
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
+Reviewed-by: Quentin Monnet <quentin@isovalent.com>
+Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
+Link: https://lore.kernel.org/bpf/8d297f0c-cfd0-ef6f-3970-6dddb3d9a87a@synopsys.com
+Upstream: https://github.com/libbpf/bpftool/commit/189f777ea4829bede0bf92f572c22fe1f2c37522
+
+This is an adapted version, else it won't be possible to cross compile
+bpftool if "clang-bpf-co-re" feature is enabled.
+---
+ src/Makefile | 2 +-
+ src/Makefile.include       | 2 ++
+ 2 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index b657502..b8b0808 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -51,7 +51,7 @@ $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_
+ $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
+ 	$(Q)$(MAKE) -C $(BPF_DIR) OBJDIR=$(patsubst %/,%,$(LIBBPF_BOOTSTRAP_OUTPUT)) \
+ 		PREFIX=$(LIBBPF_BOOTSTRAP_DESTDIR:/=) \
+-		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
++		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) AR=$(HOSTAR) $@ install_headers
+ 
+ $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
+ 	$(call QUIET_INSTALL, $@)
+--- a/src/Makefile.include
++++ b/src/Makefile.include
+@@ -12,11 +12,13 @@
+ ifneq ($(LLVM),)
+   $(if $(findstring default,$(origin CC)),$(eval CC := clang$(LLVM_VERSION)))
+   $(if $(findstring default,$(origin LD)),$(eval LD := ld.lld$(LLVM_VERSION)))
++  HOSTAR ?= llvm-ar
+   HOSTCC ?= clang
+   HOSTLD ?= ld.lld
+ else
+   $(if $(findstring default,$(origin CC)),$(eval CC = $(CROSS_COMPILE)$(CC)))
+   $(if $(findstring default,$(origin LD)),$(eval LD = $(CROSS_COMPILE)$(LD)))
++  HOSTAR ?= ar
+   HOSTCC ?= gcc
+   HOSTLD ?= ld
+ endif
+--
+2.35.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
