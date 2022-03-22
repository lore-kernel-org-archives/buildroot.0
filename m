Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DEAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5688A8426B;
	Tue, 22 Mar 2022 23:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liRBt2esbcor; Tue, 22 Mar 2022 23:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 155C0841D6;
	Tue, 22 Mar 2022 23:23:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA361BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6621C848E6
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvBHC1hvTqSr for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF6D848EA
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z6so12503435iot.0
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mz544N9BM9bt+t71L69W5mBNURc1ZtK1kpKgR2dsntI=;
 b=kCUl1Du1TxtG6JkAVJUuPKqwt9DAX67rauU//Vt7cpdp3tjdSc+r7g3etiT4PC3i/C
 5TYO3LY92KxiBI4m94MV3E+Z+nBXDGnFEo3qvhBDS0UX/OK8YjbGD3bq14l5NsE6+x3R
 lJDEMHooAKBKekr3PujU+zVG9UpPrqQbp/8v9Cvqg/rL+ZsrEhxPuB+J/hbdguIdagaR
 pJ+hHH6oxzzxlIe3eyb32beR67G7Hd9rSdaujKDTQbiCPtPKSI4QB/8LWNSoUJADWJdi
 Z+hjzjLYOi06v+wNdRbYDVNW09H02F+lsQSeKS0sGYkavmTtswm34ImHJI+WP2ZL/3d4
 q6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mz544N9BM9bt+t71L69W5mBNURc1ZtK1kpKgR2dsntI=;
 b=aDw9pnUYihnJVclQLIfs3jBdhShtBvopLiCVKKa4MmsenSMUJWpsuX43IhagpE3X/h
 DM0YzFEPmOpa3e1wThhQGZZzG57LjVQ2UASCIsZSy7pVkxOEvSnmyos7ZL6FDi/Teiqj
 nzSkmmuRiuxF8EKAu0cP2W8F97m+cLshXvA3YcPQzc8iC/auz/ocKY5bgylgXg/QUESR
 NUvmwyb3p3MrJqShBLDDag9tfMAHxvzHNKOiFv1UYjVN0xHfABHtzGWjZE9mJVn2CO2j
 bumhNRLbnt89tkR3CnfV2go7OV1JNJUizrDA70osAVUqjIvJVVu9CuaE2w0Oqgpbki6b
 pH5g==
X-Gm-Message-State: AOAM531IjxhrFF3wdU5kyhItMyUIpJ2Ruu4rtrVMTih8ltu5601eCN9y
 Iahn+7T062VEzAyx3MwLPNZgfoP4/y7Oz3G2
X-Google-Smtp-Source: ABdhPJwzeh8tfR+Gbg1K4lj87ZnGIaktXDuJfzPYmmpNA8jtX5Qs04DUfZ/fR1s6B/5LchIEFOsCog==
X-Received: by 2002:a02:5b85:0:b0:319:ff85:ff5 with SMTP id
 g127-20020a025b85000000b00319ff850ff5mr15257547jab.250.1647991357986; 
 Tue, 22 Mar 2022 16:22:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:20 -0600
Message-Id: <20220322232224.2842266-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 07/11] package/compiler-rt: new package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Drake <michael.drake@codethink.co.uk>,
 Romain Naour <romain.naour@smile.fr>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

This patch adds support for the compiler-rt (CLANG runtime) library.
It builds a set of static libraries and installs them into the
CLANG/LLVM toolchain resource folder. These libraries can then be
used by developers in the SDK for building target applications for
analysis.

What is fuzzing and why libfuzzer?
https://www.moritz.systems/blog/an-introduction-to-llvm-libfuzzer/

The compiler-rt fuzzer and address sanitizer tools require additional
LLVM binary tools installed to allow stack trace decoding actively during
executable analysis.  This patch conditionally enables these tools.
https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Michael Drake <michael.drake@codethink.co.uk>

---
Changes
v1 -> v2
[Romain
 - Removed unnecessary host-cmake dependency

v2 -> v3
[Romain
 - Update to use COMPILER_RT_INSTALL_PATH for library install
[Ricardo
 - Fixed check-package extra line
 - Spelling in commit message

v3 -> v4
[Valentin
 - Pointed out that non-glibc libraries won't build. Further
   investigation shows that the lib asan support in compiler-rt
   doesn't have the libc checks yet to support multiple libraries.
   (https://patchwork.ozlabs.org/patch/339938/ was the best example
    I could find and it doesn't look like anything has changed in the
    recent codebase)

v4 -> v5
[Thomas P
 - Revisited staging install step and found a cleaner way to use the
   default and then a hook to setup the runtime library path

v6
 - Bumped to 7.0.1 to match current LLVM/Clang version

v7
 - Rebased on master for 8.0 LLVM/Clang version
 - Added comment about bumping verions of LLVM/Clang and Compiler-rt
   together
[Romain
 - Disabled test cases (-DCOMPILER_RT_INCLUDE_TESTS=OFF)

v8
 - Rebased and updated version to 9.x to match llvm/clang

[Romain
 - Squashed "[v7,1/5]package/llvm: install target binary/debug tools" to
   be included in this patch

[Michael D
 - compiler-rt symlink creation to include shared folder such
   that control flow lists work

v9
 - Rebased post 2020.05

v10
 - Switched compiler-rt site to point towards new github project
 - Updated compiler-rt version to 11.0.0
 - Tested against master[8640e8ffde3f61c5838] using
   support/testing/run-tests -o runtest -k \
      tests.package.test_clang.TestClangCompilerRT

v11
 - Updated compiler-rt version to 11.1.0

v12
 - overwrite target llvm-config in staging with host llvm-config
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/compiler-rt/Config.in        | 14 +++++++++++
 package/compiler-rt/compiler-rt.hash |  3 +++
 package/compiler-rt/compiler-rt.mk   | 37 ++++++++++++++++++++++++++++
 package/llvm/llvm.mk                 | 20 ++++++++++++---
 6 files changed, 72 insertions(+), 4 deletions(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 942bb8fe9c..5219626e45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1886,6 +1886,7 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
+F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..e3ef75b0da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1928,6 +1928,7 @@ menu "Other"
 	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
new file mode 100644
index 0000000000..9afc0d9d60
--- /dev/null
+++ b/package/compiler-rt/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_COMPILER_RT
+	bool "compiler-rt"
+	depends on BR2_PACKAGE_LLVM
+	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
+	help
+	  A collection of runtime libraries primarily used by clang and
+	  llvm to provide builtins, sanitizer runtimes, and profiling
+	  at runtime.
+
+	  https://compiler-rt.llvm.org/
+
+comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
+	depends on !BR2_PACKAGE_LLVM
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
new file mode 100644
index 0000000000..0689ec3d2a
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 def1fc00c764cd3abbba925c712ac38860a756a43b696b291f46fee09e453274  compiler-rt-11.1.0.src.tar.xz
+sha256 1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
new file mode 100644
index 0000000000..57f9c26854
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# compiler-rt
+#
+################################################################################
+
+# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
+# tied to the version of those tools
+COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
+COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_LICENSE = NCSA MIT
+COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_DEPENDENCIES = host-clang llvm
+
+COMPILER_RT_INSTALL_STAGING = YES
+COMPILER_RT_INSTALL_TARGET = NO
+
+COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
+	-DCOMPILER_RT_STANDALONE_BUILD=ON \
+	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
+
+# The installation of the target runtime libraries defaults to DESTDIR, however
+# host-clang resources directory needs a link so Clang can find the runtime
+# libraries in the same location they would be if built as part of the Clang
+# build. The "resources" directory is loosely documented and seems to be
+# assumed, as compiler-rt is usually build at the same time as Clang and not
+# standalone.
+define COMPILER_RT_SETUP_RUNTIME_LIBS
+	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
+endef
+COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
+
+$(eval $(cmake-package))
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 825de96392..7c73d5b564 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -214,8 +214,7 @@ HOST_LLVM_CONF_OPTS += \
 # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
 # libLLVM.so
 LLVM_CONF_OPTS += \
-	-DLLVM_INCLUDE_TOOLS=ON \
-	-DLLVM_BUILD_TOOLS=OFF
+	-DLLVM_INCLUDE_TOOLS=ON
 
 ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=ON
@@ -278,11 +277,24 @@ LLVM_CONF_OPTS += \
 # directories from STAGING_DIR.
 # output/staging/usr/bin/llvm-config --includedir
 # output/staging/usr/include
-define HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+define LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
 	$(INSTALL) -D -m 0755 $(HOST_DIR)/bin/llvm-config \
 		$(STAGING_DIR)/usr/bin/llvm-config
 endef
-HOST_LLVM_POST_INSTALL_HOOKS = HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+HOST_LLVM_POST_INSTALL_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+
+# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
+# and AddressSanitizer tools for stack traces.
+# If we set -DLLVM_BUILD_TOOLS=ON we need to re-copy host llvm-config to
+# replace the target llvm-config variant in staging that gets installed.
+ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=ON
+LLVM_POST_INSTALL_STAGING_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+else
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=OFF
+endif
 
 # By default llvm-tblgen is built and installed on the target but it is
 # not necessary. Also erase LLVMHello.so from /usr/lib
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
