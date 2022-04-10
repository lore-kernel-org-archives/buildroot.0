Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F8BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 23:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1CF60B9C;
	Sun, 10 Apr 2022 23:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QX_5QPoMMUrV; Sun, 10 Apr 2022 23:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E562F60B6F;
	Sun, 10 Apr 2022 23:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89EC61BF40A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 23:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77835415D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 23:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65-iGmlyrS-H for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 23:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BA02415D1
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 23:29:35 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id 8so10293278ilq.4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hN6LM8chW5mHJcJEGMI0rjNhcgcfEW31CJY01si7pVY=;
 b=l/h3XxDPrv1U4ANlf2lF+MLIcZHcSp5LPWIDDv85Wygbv4L0i2R0B8TKOcsv/4daqC
 l6PmQ8S74W8JpoMX6DprTVgJn113kBrrkIngr5zsryjjpuYfUYJ3G1i47FCKvNfwYGBE
 nurQ50zYW7RNZ3i57o9ICXZ+0WdhMlXRYC5atLxb3Kt2Kor6uds2VlI2GeyB89OpPK8d
 Oyq3JctbHtTI3jX6hultU9UZf8oSS7LpsBenHTUle4FUPKrlfynFn0fsq/jdqIMlkL+r
 TWsucmBDmaASNMG3isybglgyvN1WQWxp4kX+Xf/Y+yDSo4T+Sk3FvT9AiEYAuzCU234l
 lukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hN6LM8chW5mHJcJEGMI0rjNhcgcfEW31CJY01si7pVY=;
 b=Gl0C8DaREv8Sl0EvBaWkct0A2B7YewB/lkgX9Cgq9AocjYYuJYdYm0AbFnpCoab1nX
 h1D9wf1zacWqIuG0JabRWkeqdjeaJEsXFPO+CYk47VPAthWwaY7M3MWFfyYzd1z60B4G
 MLyrOKZaGEDZtHMUUUni86u/pNMnzsOxO5/iIw0gIdyuY6XR7oh4jZRa9M1wUTCrrvZd
 z6DRxte/HHuF6nnW8zhvLaN2QtdP7ULjSwkwPyO6b7woKVgvjP16C0BYOXzNgCCXEyT7
 yzlURvWAH6rMs5QynRp5SLZMDzOXbbQ4z+qnGImEsl32aChkhUFCxr8f1KkUC7wD+aVs
 4fAw==
X-Gm-Message-State: AOAM532iqt5B6lLyCLAHY05eurm+e9miDwHxvif5VjG30rkNGwS1fH3f
 qsCf00g29arsB+r2VERwAhrqAHnqeNq0vQ==
X-Google-Smtp-Source: ABdhPJzB9V08eYU7SV4yleY6uWW4krdZtCpjNq0h6DFgwI1jihkPabtxIlF9QLskold3d10HqXF2tQ==
X-Received: by 2002:a92:c545:0:b0:2ca:1066:3d6 with SMTP id
 a5-20020a92c545000000b002ca106603d6mr13566275ilj.229.1649633374785; 
 Sun, 10 Apr 2022 16:29:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 y17-20020a92d0d1000000b002ca8027016bsm6309412ila.45.2022.04.10.16.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 16:29:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:29:30 -0600
Message-Id: <20220410232930.153300-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: migrate to asyncio
 subprocess calls
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since genrandconfig no longer appears to support python2 we can
migrate the subprocess calls to use asyncio variants.

This has the advantage of allowing for runners like autobuild-run to
integrate directly into genrandconfig by calling the asyncio
gen_config using importlib instead of having to run genrandconfig as
a subprocess.

Using asyncio is advantageous here as it eliminates the requirement
for the runner to deal with blocking subprocess calls(by having to
use threading for example).

Also cleanup some unused functions/python2 compatibility shims.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 88 +++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 39 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 59fe34e58d..94bf2c158c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -18,24 +18,14 @@
 
 # This script generates a random configuration for testing Buildroot.
 
-import contextlib
+import asyncio
 import csv
 import os
 from random import randint
-import subprocess
 import sys
 from distutils.version import StrictVersion
 import platform
 
-if sys.hexversion >= 0x3000000:
-    import urllib.request as _urllib
-else:
-    import urllib2 as _urllib
-
-
-def urlopen_closing(uri):
-    return contextlib.closing(_urllib.urlopen(uri))
-
 
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
@@ -63,7 +53,7 @@ class SystemInfo:
         # --
         return None
 
-    def has(self, prog):
+    async def has(self, prog):
         """Checks whether a program is available.
         Lazily evaluates missing entries.
 
@@ -78,11 +68,13 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog,
-                                   shell=True,
-                                   stdout=devnull, stderr=devnull) != 1:
-                    have_it = False
+            proc = await asyncio.create_subprocess_shell(
+                "%s -version | grep gcj" % prog,
+                stdout=asyncio.subprocess.DEVNULL,
+                stderr=asyncio.subprocess.DEVNULL)
+            ret = await proc.wait()
+            if ret != 1:
+                have_it = False
         # --
         self.progs[prog] = have_it
         return have_it
@@ -159,7 +151,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     return configs
 
 
-def is_toolchain_usable(configfile, config):
+async def is_toolchain_usable(configfile, config):
     """Check if the toolchain is actually usable."""
 
     with open(configfile) as configf:
@@ -179,8 +171,12 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.check_output(['ldd', '--version'])
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
+            proc = await asyncio.create_subprocess_exec(
+                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
+            ldd_version_output, _ = await proc.communicate()
+            if proc.returncode:
+                return False
+            glibc_version = ldd_version_output.splitlines()[0].split()[-1].decode('utf-8')
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
                 return False
@@ -188,7 +184,7 @@ def is_toolchain_usable(configfile, config):
     return True
 
 
-def fixup_config(sysinfo, configfile):
+async def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -202,7 +198,7 @@ def fixup_config(sysinfo, configfile):
 
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -507,7 +503,7 @@ def fixup_config(sysinfo, configfile):
     return True
 
 
-def gen_config(args):
+async def gen_config(args):
     """Generate a new random configuration
 
     This function generates the configuration, by choosing a random
@@ -565,7 +561,7 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
+    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
@@ -579,10 +575,13 @@ def gen_config(args):
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = await asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = await proc.wait()
+    if ret:
+        return ret
 
-    if not is_toolchain_usable(configfile, toolchainconfig):
+    if not await is_toolchain_usable(configfile, toolchainconfig):
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -596,21 +595,32 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
-
-        if fixup_config(sysinfo, configfile):
+        proc = await asyncio.create_subprocess_exec(
+            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "randpackageconfig" if args.toolchains_csv else "randconfig")
+        ret = await proc.wait()
+        if ret:
+            return ret
+
+        if await fixup_config(sysinfo, configfile):
             break
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = await asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = await proc.wait()
+    if ret:
+        return ret
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+    proc = await asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
+    ret = await proc.wait()
+    if ret:
+        return ret
 
-    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "dependencies"])
+    proc = await asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
+    return await proc.wait()
 
 
 if __name__ == '__main__':
@@ -642,7 +652,7 @@ if __name__ == '__main__':
     args.outputdir = os.path.abspath(args.outputdir)
 
     try:
-        ret = gen_config(args)
+        ret = asyncio.run(gen_config(args))
     except Exception as e:
         print(str(e), file=sys.stderr)
         parser.exit(1)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
