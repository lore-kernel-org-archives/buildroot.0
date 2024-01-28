Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8243BC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D4960774;
	Sun, 28 Jan 2024 18:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D4960774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-K3KJ1ILXG6; Sun, 28 Jan 2024 18:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E01FC607A1;
	Sun, 28 Jan 2024 18:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01FC607A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E22F31BF57B
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 18:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C425282512
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 18:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C425282512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3t-eal301yL for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 18:38:00 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82B8481EB7
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 18:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B8481EB7
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ddf26eba3cso1422236a34.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 10:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706467079; x=1707071879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVVNTwGkrqWl6gKkM3cHs9CJqMeBi0tvs/5GZFRcEVs=;
 b=Xt+FovvefK2MQWF3VbZWvZVeSarTKZGG65ef6kOxyC/Po6GNEi81zXXmqGcp/pEcQ2
 tbymIAAu2C1j4ss0HyypGUrkbSDBdlSQj0ivXVrbXiIXUK1WMye10Cul5Orx/waZXEae
 G7Si2Z8z6HBWoie0clbXf0VaP0hEeRXl8TzYLMnVUrbXHax37JOwpb6m9Te9+VNfGGVk
 JF74kcoDbnggsnAgZ13fWXlWfmVrZrcFvRrJm1cH5JNVqUxE4QIuB7l6RnyyTpSfS8oh
 zFQM+8HAqdRfpGSamCsyV1eqI56HsqziKCILBkRrqfHso5Gy6eR0TJ9AvLNyk05S+yy0
 /7Zg==
X-Gm-Message-State: AOJu0YzPbSWN38stcRDOyH+ddT5QYKho7akJkrl4b4WJxJhw4h1Megkx
 8Aw5hyhp0hYQ+Y9Pk7vkJe9B2L823XSkKAEB66qXY5vkfvh4Z274j3yokFCL
X-Google-Smtp-Source: AGHT+IHY4pY9pJbaU4a/gp0rRtAA7PEgxGqbBzXp2MhFqfHyDCHqoBAoZL03DlzYjyhsj8r1okfIbQ==
X-Received: by 2002:a05:6358:7249:b0:176:5cad:5144 with SMTP id
 i9-20020a056358724900b001765cad5144mr2496557rwa.45.1706467079234; 
 Sun, 28 Jan 2024 10:37:59 -0800 (PST)
Received: from thinkpad.lan ([2600:1700:3eca:ac1f:a11a:f043:3678:9ceb])
 by smtp.gmail.com with ESMTPSA id
 bk13-20020a17090b080d00b0028b89520c7asm4616737pjb.9.2024.01.28.10.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 10:37:58 -0800 (PST)
From: Abilio Marques <abiliojr@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 10:37:55 -0800
Message-ID: <20240128183755.3322967-1-abiliojr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706467079; x=1707071879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVVNTwGkrqWl6gKkM3cHs9CJqMeBi0tvs/5GZFRcEVs=;
 b=X1r7lG6l/1j0Y9rUJC8wUVqHscCyUvUmNPqMNCWVVRdldFUVlURvss8F21SofPo5Pm
 b/rfRdU0pV8kVghKFt96AxquUomu+A2m/LN3gChlRxIO+F3U0UkOHzdTavj9e8jFGy+0
 sAvWkSMVkJsjVZjcKpeBHag8H/N2UfEVyfj6bjEGiIKcANHdBmxOmA8ECTdzkCpQyTI9
 cddWYmN2tJSCtd4mKv75XxAdCybsRNXEmLMGvprFyXUJFdYR/z8SObt+9OpWC9izNwJY
 kLgJco/WsnCIoPFCwqd1TvKQTNt0jV4zGR8efWezVMPTR1CSSe0U/pG3dbl5ve++riCX
 xjqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X1r7lG6l
Subject: [Buildroot] [PATCH] package/micropython: make use of recent
 micropython-lib
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Abilio Marques <abiliojr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Until now, micropython-lib was a package that installed v1.9.3,
which is more than 6 years old. This was acceptable since micropython
never made any other official release of the library until v1.20.

Meanwhile, the libraries underwent a reorganization, and they are now
available in a directory structure that cannot be copied directly into
the target. This is my theory on why v1.9.3 is still present in the
current day buildroot (which comes with micropython v1.22).

This commit introduces an auxiliary script to collect those libraries
and reorder them into a structure that can then be copied into
/usr/lib/micropython. The script utilizes a module from the tools
directory of the micropython repo.

As part of the changes made by the micropython project, the libraries
are now released together with the interpreter. They are cloned as a
submodule into the lib/micropython-lib directory.

These are the 2 main reasons why the old buildroot micropython-lib
package is being removed.

With this commit, micropython-lib is installed (optionally) as part
of micropython. The original config variable name was retained for
backwards compatibility.

This commit also ensures that the libraries in micropython-lib will
be updated together with newer versions of micropython.

Signed-off-by: Abilio Marques <abiliojr@gmail.com>
---
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 package/micropython-lib/Config.in             |  8 --
 package/micropython-lib/micropython-lib.hash  |  3 -
 package/micropython-lib/micropython-lib.mk    | 18 ----
 package/micropython/Config.in                 | 10 +++
 .../micropython/collect_micropython_lib.py    | 90 +++++++++++++++++++
 package/micropython/micropython.mk            | 12 +++
 8 files changed, 112 insertions(+), 31 deletions(-)
 delete mode 100644 package/micropython-lib/Config.in
 delete mode 100644 package/micropython-lib/micropython-lib.hash
 delete mode 100644 package/micropython-lib/micropython-lib.mk
 create mode 100755 package/micropython/collect_micropython_lib.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..cc9bc5b5cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -572,7 +572,6 @@ F:	package/coremark/
 F:	package/coremark-pro/
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
-F:	package/micropython-lib/
 F:	package/syslog-ng/
 
 N:	Christian Kellermann <christian.kellermann@solectrix.de>
diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..426bd7d090 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -798,7 +798,6 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/micropython/Config.in"
-	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 if BR2_PACKAGE_MONO
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
deleted file mode 100644
index 76557b220b..0000000000
--- a/package/micropython-lib/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_MICROPYTHON_LIB
-	bool "micropython-lib"
-	depends on BR2_PACKAGE_MICROPYTHON
-	select BR2_PACKAGE_PCRE # runtime
-	help
-	  Core Python libraries ported to MicroPython.
-
-	  http://micropython.org
diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
deleted file mode 100644
index cbdda23844..0000000000
--- a/package/micropython-lib/micropython-lib.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-1.9.3.tar.gz
-sha256  baed4196a4310c576c2010f0a49f987a49e63856df7cd45af11cb3571df4bf74  LICENSE
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
deleted file mode 100644
index 78ac0d3b35..0000000000
--- a/package/micropython-lib/micropython-lib.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# micropython-lib
-#
-################################################################################
-
-MICROPYTHON_LIB_VERSION = 1.9.3
-MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,v$(MICROPYTHON_LIB_VERSION))
-MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
-MICROPYTHON_LIB_LICENSE_FILES = LICENSE
-
-define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		PREFIX=$(TARGET_DIR)/usr/lib/micropython \
-		install
-endef
-
-$(eval $(generic-package))
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 30161c8b70..2c2ae7a4df 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -9,5 +9,15 @@ config BR2_PACKAGE_MICROPYTHON
 
 	  http://micropython.org
 
+config BR2_PACKAGE_MICROPYTHON_LIB
+	bool "micropython-lib"
+	default y
+	depends on BR2_PACKAGE_MICROPYTHON
+	select BR2_PACKAGE_PCRE # runtime
+	help
+	  Core Python libraries ported to MicroPython.
+
+	  http://micropython.org
+
 comment "micropython needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/micropython/collect_micropython_lib.py b/package/micropython/collect_micropython_lib.py
new file mode 100755
index 0000000000..778a1c4c7d
--- /dev/null
+++ b/package/micropython/collect_micropython_lib.py
@@ -0,0 +1,90 @@
+#!/usr/bin/env python3
+
+"""
+Sometime after v1.9.3, micropython-lib's directory structure was cleaned up and
+enhanced with manifest files.
+
+Though cleaner, it means it cannot be directly copied into the target.
+This script is during build process to perform that conversion.
+
+It makes use of manifestfile.py, which is normally located in micropython's
+tool directory.
+
+It also depends on the micropython-lib that is cloned in lib/micropython-lib
+during build.
+"""
+
+import argparse
+import importlib
+import os
+import shutil
+import sys
+
+
+def get_library_name_type(manifest_path: str) -> tuple[str, bool]:
+    split = manifest_path.split("/")
+    return (split[-2], "unix-ffi" in split)  # -1: "manifest.py", -2: library name
+
+
+def get_all_libraries(mpy_lib_dir: str):
+    # reuse manifestfile module capabilities to scan the micropython-lib directory
+
+    collected_list = manifestfile.ManifestFile(
+        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
+    )
+    collected_list.freeze(mpy_lib_dir)
+
+    for file in collected_list.files():
+        if file.target_path.endswith("manifest.py"):
+            yield get_library_name_type(file.full_path)
+
+
+def copy_file(src: str, target: str, destination: str):
+    s = target.split("/")
+    s.pop()
+    d = f"{destination}/{'/'.join(s)}"
+    if not os.path.exists(d):
+        os.makedirs(d)
+    shutil.copy(src, f"{destination}/{target}")
+
+
+def copy_libraries(manifest, destination: str):
+    for f in manifest.files():
+        copy_file(f.full_path, f.target_path, destination)
+
+
+def process_cmdline_args():
+    parser = argparse.ArgumentParser(
+        description="Prepare micropython-lib to be installed"
+    )
+    parser.add_argument("micropython", help="Path to micropython source directory")
+    parser.add_argument("destination", help="Destination directory")
+
+    args = parser.parse_args()
+    return os.path.abspath(args.micropython), os.path.abspath(args.destination)
+
+
+def load_manifestfile_module(micropython_dir: str):
+    global manifestfile
+    sys.path.append(f"{micropython_dir}/tools")
+    manifestfile = importlib.import_module("manifestfile")
+
+
+def main():
+    micropython_dir, destination_dir = process_cmdline_args()
+    mpy_lib_dir = f"{micropython_dir}/lib/micropython-lib"
+
+    # load manifest file after knowing where it is
+    load_manifestfile_module(micropython_dir)
+
+    manifest = manifestfile.ManifestFile(
+        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
+    )
+
+    for library, is_ffi in get_all_libraries(mpy_lib_dir):
+        manifest.require(library, unix_ffi=is_ffi)
+
+    copy_libraries(manifest, destination_dir)
+
+
+main()
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 37c148da94..a9757e266c 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -47,6 +47,8 @@ define MICROPYTHON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
 		$(MICROPYTHON_MAKE_OPTS)
+	$(EXTRA_ENV) package/micropython/collect_micropython_lib.py \
+		$(@D) $(@D)/.built_pylib
 endef
 
 define MICROPYTHON_INSTALL_TARGET_CMDS
@@ -57,4 +59,14 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
 		install
 endef
 
+define MICROPYTHON_INSTALL_LIBS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/micropython
+	cp -a $(@D)/.built_pylib/* $(TARGET_DIR)/usr/lib/micropython
+endef
+
+ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
+MICROPYTHON_POST_INSTALL_TARGET_HOOKS += MICROPYTHON_INSTALL_LIBS
+endif
+
+
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
