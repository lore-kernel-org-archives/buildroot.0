Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8BCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE064190C;
	Tue, 22 Mar 2022 23:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VzVkjULk-AX; Tue, 22 Mar 2022 23:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AB041903;
	Tue, 22 Mar 2022 23:24:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9E01BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09DE3848E9
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYmh1zrUIHQk for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9231848E6
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p22so1907315iod.2
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPzdwAbWbSIEPtSAv0SLaZEDAtnVzZOjeQr196Xf9rI=;
 b=g+niS79mry7JvjlaLRAbxuDy6UBHHuFwp6ATQ1QlIj3Bjcx30hdEnEt2jqAS/jybtX
 Z8RpxzUj5WfhYyrPBi58fq3tFXt15ZEpPOw8q+tsUp1TDwORUdLw3lK/jOIbNr4NmBW7
 hf0/c8E17A/BkHHS6W+Q70XDdkj9MSOMdj7kyt0GfNs0x/pviRiE7YwGhBBtE+0Ei6eN
 eEqN/rtj1NwKhv64ap4TJU6AhwFEqruTUDb69DYWdCT08VZK7+aYsfmCPqNuocQbaLTo
 fcNoQXdaEcgOSDl3Te5HT0qBQjhPyNvru/svDYE2eXiQNVYbX1FzlQbEBS/JLSj69XUk
 3VdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPzdwAbWbSIEPtSAv0SLaZEDAtnVzZOjeQr196Xf9rI=;
 b=yNSK4z36cHAuPy5AKR/PFhpli4bYkWb/0RI+bHdh+MB02xLZDdH4rpia2p0R9jiZeH
 TFc4yGX9y9MR1Ig4dUD98fnz9ATMsDbVhkdUB66a4tx77XLsduaIF5aYJUhCuXwQSQvj
 JAUhZKa5IIGxrZxdkDh3BrjVZtXQarAKWe62bYk14276jnKKlIT9n3wKs2Ux09fU6TAI
 t3r6Dww0zG51oMK2flwxe9BvXn6DRhzNiC6VqfyeY//741+zA4LwJlmI7a31XgGUhyW1
 ufubPDc0F4bFu2UMaR8q5hulWuX6ee7vtJo8uW/JvFj66YxqejS36UzhNpbv8/iUxqgn
 No0g==
X-Gm-Message-State: AOAM533AwueSIzoqhJVE2HKa/Qy1N08IIHWbY1qBTnRB58uFgrseWhhQ
 ncF84CxDCKSd7zteleS87huT4PdmYcqVQYCg
X-Google-Smtp-Source: ABdhPJydLGYD6mSfX4SfbyOwDKGvNnSfSDT/21iEnZZ+KX+wlE/uhb6YcspB8PlvZwYY/+pXKyte0Q==
X-Received: by 2002:a02:77d0:0:b0:321:422d:af6e with SMTP id
 g199-20020a0277d0000000b00321422daf6emr6185831jac.60.1647991359644; 
 Tue, 22 Mar 2022 16:22:39 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:22 -0600
Message-Id: <20220322232224.2842266-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 09/11] package/clang: help host-clang to
 find our external toolchain
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
 Bernd Kuhls <bernd.kuhls@t-online.de>, Romain Naour <romain.naour@smile.fr>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

To build libfuzzer package Matthew Weber noticed that (host) clang
doesn't run on the host without "-B $(HOST_DIR)/opt/ext-toolchain"
option. This option add a new search path for binaries and object
files used implicitly.

Without -B clang fail to link due to missing crtbeging.o file and libgcc:
output/host/bin/aarch64-linux-gnu-ld: cannot find crtbegin.o: No such file or directory
output/host/bin/aarch64-linux-gnu-ld: cannot find -lgcc

Indeed, clang search path doesn't include the dafault cross-gcc's search paths:

$ output/host/bin/clang -print-search-dirs
programs: = output/host/bin:output/host/bin:/..//bin
libraries: = output/host/lib/clang/8.0.0:
             output/host/bin/../lib64:
             /lib/../lib64:
             /usr/lib/../lib64:
             output/host/bin/../lib:
             /lib:/usr/lib

Here is the same command for cross-gcc:

$ output/host/bin/aarch64-linux-gnu-gcc -print-search-dirs
install: output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/
programs: = output/host/opt/ext-toolchain/bin/../libexec/gcc/aarch64-linux-gnu/8.3.0/:
            output/host/opt/ext-toolchain/bin/../libexec/gcc/:
            output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/aarch64-linux-gnu/8.3.0/:
            output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/
libraries: = output/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/aarch64-linux-gnu/8.3.0/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/../lib64/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/aarch64-linux-gnu/8.3.0/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/../lib64/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/8.3.0/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/../lib64/:
             output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/lib/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/lib/:
             output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/

We can see that gcc default search path contains
"output/host/opt/ext-toolchain" directory where the external toolchain
has been extracted.

Since we want to use clang without additional option like -B,
patch clang in order to use GCC_INSTALL_PREFIX instead of
using automatic detection (which doesn't work for Buildroot).

We eventually want to relocate the Buildroot SDK containing the clang
cross-compiler, so we provide a relative path to GCC_INSTALL_PREFIX
in order to avoid to hardcode the path to the GCC toolchain.

Also the path between clang and the GCC external toolchain is not always
the same, we have the following case:

* Toolchain to be downloaded and installed
  The toolchain is extracted into $(HOST_DIR)/opt/ext-toolchain, so the
  path is "../opt/ext-toolchain".

* Pre-installed toolchain
  The toolchain is localed somewhere in the host filesystem and
  defined by the user using BR2_TOOLCHAIN_EXTERNAL_PATH.

So, set GCC_INSTALL_PREFIX using realpath:

-DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`

When we use a Buildroot's internal toolchain, clang will find theses
crt*.o files and libgcc.

http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1 -> v2
[Arnout
 - Can't dropped ":PATH" from "-DGCC_INSTALL_PREFIX:PATH=" as suggested,
   The string isn't set correctly and results in "cannot find crtbegin.o"
 - Attempting to post patch upstream
 - I did not address the relative vs absolute path comment. The
   current approach seemed correct per my understanding for handling
   the two toolchain install location cases
---
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 78 +++++++++++++++++++
 package/clang/clang.mk                        |  7 ++
 2 files changed, 85 insertions(+)
 create mode 100644 package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch

diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
new file mode 100644
index 0000000000..08371154d5
--- /dev/null
+++ b/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
@@ -0,0 +1,78 @@
+From fe21cede3939a435d62efbd5799547fab6af1b0a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 5 Aug 2019 16:06:48 +0200
+Subject: [PATCH] lib/Driver/ToolChains/Gnu: Use GCC_INSTALL_PREFIX in the set
+ of prefixes for searching the gcc toolchain
+
+By default, the Gnu Toolchains driver is looking at the parent
+directory while looking for the gcc toolchain when clang is installed
+at "D.InstalledDir"
+
+But this doesn't work with Buildroot since the external
+toolchain is installed in host/opt/ext-toolchain and the sysroot is
+moved to host/<arch>-buildroot-linux-gnu/sysroot/ directory.
+
+We tried by setting GCC_INSTALL_PREFIX in clang.mk for host-clang
+but it doesn't work since we already provide a sysroot [1].
+
+Help the Gnu Toolchains driver by using GCC_INSTALL_PREFIX path.
+
+Since we want to be able to relocate the clang toolchain,
+allow to use a relative path with GCC_INSTALL_PREFIX.
+
+Buildroot will provide such relative path by using:
+HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
+
+Doing so allow to use clang without providing additional search
+paths with -B option on the clang's command line.
+
+[1] https://reviews.llvm.org/D49244
+[2] http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+Pending, access to llvm mailing lists to submit it is pending. They
+seem to be having issues with their listserv.
+---
+ lib/Driver/ToolChains/Gnu.cpp | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/Driver/ToolChains/Gnu.cpp b/lib/Driver/ToolChains/Gnu.cpp
+index 2ad45097dc..90d6b5b748 100644
+--- a/lib/Driver/ToolChains/Gnu.cpp
++++ b/lib/Driver/ToolChains/Gnu.cpp
+@@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
+ 
+     Prefixes.push_back(GCCToolchainDir);
+   } else {
++    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
++
+     // If we have a SysRoot, try that first.
+     if (!D.SysRoot.empty()) {
+       Prefixes.push_back(D.SysRoot);
+@@ -1734,6 +1736,21 @@ void Generic_GCC::GCCInstallationDetector::init(
+     // Then look for gcc installed alongside clang.
+     Prefixes.push_back(D.InstalledDir + "/..");
+ 
++    // Use GCC_INSTALL_PREFIX if provided by the buildsystem.
++    if (!GccIinstallPrefix.empty())
++    {
++        if (llvm::sys::path::is_relative(GccIinstallPrefix))
++        {
++            // Use a relative path to gcc from clang install path.
++            Prefixes.push_back(D.InstalledDir + "/" + GccIinstallPrefix.str());
++        }
++        else
++        {
++            // Hardcode the absolute path provided by GCC_INSTALL_PREFIX.
++            Prefixes.push_back(GCC_INSTALL_PREFIX);
++        }
++    }
++
+     // Next, look for prefix(es) that correspond to distribution-supplied gcc
+     // installations.
+     if (D.SysRoot.empty()) {
+-- 
+2.20.1
+
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index d1667d79b6..95b4964be3 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -105,5 +105,12 @@ CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 HOST_CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 
+# Help host-clang to find our external toolchain, use a relative path from the clang
+# installation directory to the external toolchain installation directory in order to
+# not hardcode the toolchain absolute path.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
