Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D8AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 22:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32886112B;
	Wed, 13 Apr 2022 22:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PdfFe39MJkW; Wed, 13 Apr 2022 22:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8627860BD0;
	Wed, 13 Apr 2022 22:40:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC1DF1BF471
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 22:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37C88278F
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 22:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvwsaXGLY5kH for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 22:40:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A41038277E
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 22:40:10 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id x4so3538998iop.7
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zW2Jx3Dqh/x2j1gWI6StAVfUWB+C5GKMUzYcmwMgraE=;
 b=YfJC07/mnYXGmNal0golkednXsu/kBAgcEYULIwpHkDrRgr+XuYziVYM+6uWTfpim2
 mNIf8wXIA4bmyxg4ffwM2jFYDpk04yuYlOK82d2R1voFbBObqEhIhnOU+jXu8qTv6mIo
 Jot9hNv4qIKfkznE/BhDTzX21p+8fhvqup+HInK1VpsNkZrUgjjW3+MvadC8ETUeQ5Hd
 2C4TKvh5GChpk5uU59O5D+qAzTEMvJ3wGqvuFB8wWIG0P0Dfk1Htn9qZF/M73aYzVDi+
 /uqucYCipOe7F2wKyczEMTScfky1RlDLGnbNIZHCUJclKcEzNxJc28+BxNZWvnWkY1Id
 Yhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zW2Jx3Dqh/x2j1gWI6StAVfUWB+C5GKMUzYcmwMgraE=;
 b=Csay0v2f93ilcnqkyJLSlSDELgoNG/yyXKnrl80RJqzNrf/aZHCA08vUg5Cwy6zjLz
 XsxsUVJnXvAms5/FWCMfa4ZzftZQkirdheAnCPC3HU4+y0DjDbGhGLxypv3NTTqnLkpP
 4frOpfhiUxyv+ArHQKzjsgZEeuUwJRplPhzsw16ODdX4haaaZdNc2CpUvDHbsh6I5OQt
 2GznhBBr81fJ9V7JHPNm9d+dcQyGpKwRY7TngdiSPuBrg/YLYpSI6Tx+CGlDPaIxDhGZ
 5QlLFMlSCMvoznyC8aCDbkCHYhwCYed9ajHwhfKcssApQaMxITUrWRPB9bweidYIdww9
 2YBw==
X-Gm-Message-State: AOAM531xEva3+zJcEiuzK0s1rnDOF44TCuWO8Km5AzFJ1O4Y55dk8Dlw
 bMpIzReul/8P6p0PbT80HIRJJMCwdfKXtA==
X-Google-Smtp-Source: ABdhPJxVg8pFiRKn2LDEXK3hbDR0d1pVKIeoIVXKVyOrqpKqCHQHGxd9Mi8L84ryld0dSxxdF2X+yA==
X-Received: by 2002:a05:6638:d51:b0:326:4f60:f2c4 with SMTP id
 d17-20020a0566380d5100b003264f60f2c4mr4442659jak.211.1649889609421; 
 Wed, 13 Apr 2022 15:40:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 c22-20020a5ea816000000b00649d360663asm134662ioa.40.2022.04.13.15.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 15:40:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 16:40:04 -0600
Message-Id: <20220413224004.1225568-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: migrate to asyncio
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
Changes v1 -> v2:
  - compatibility shims for python 3.4 and newer
---
 utils/genrandconfig | 94 +++++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 59fe34e58d..aa82a41d5c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -18,23 +18,18 @@
 
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
+if sys.version_info < (3, 8):
+    from asyncio import coroutine
 else:
-    import urllib2 as _urllib
-
-
-def urlopen_closing(uri):
-    return contextlib.closing(_urllib.urlopen(uri))
+    from types import coroutine
 
 
 class SystemInfo:
@@ -63,6 +58,7 @@ class SystemInfo:
         # --
         return None
 
+    @coroutine
     def has(self, prog):
         """Checks whether a program is available.
         Lazily evaluates missing entries.
@@ -78,11 +74,13 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog,
-                                   shell=True,
-                                   stdout=devnull, stderr=devnull) != 1:
-                    have_it = False
+            proc = yield from asyncio.create_subprocess_shell(
+                "%s -version | grep gcj" % prog,
+                stdout=asyncio.subprocess.DEVNULL,
+                stderr=asyncio.subprocess.DEVNULL)
+            ret = yield from proc.wait()
+            if ret != 1:
+                have_it = False
         # --
         self.progs[prog] = have_it
         return have_it
@@ -159,6 +157,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     return configs
 
 
+@coroutine
 def is_toolchain_usable(configfile, config):
     """Check if the toolchain is actually usable."""
 
@@ -179,8 +178,12 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.check_output(['ldd', '--version'])
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
+            proc = yield from asyncio.create_subprocess_exec(
+                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
+            ldd_version_output, _ = yield from proc.communicate()
+            if proc.returncode:
+                return False
+            glibc_version = ldd_version_output.splitlines()[0].split()[-1].decode('utf-8')
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
                 return False
@@ -188,6 +191,7 @@ def is_toolchain_usable(configfile, config):
     return True
 
 
+@coroutine
 def fixup_config(sysinfo, configfile):
     """Finalize the configuration and reject any problematic combinations
 
@@ -202,7 +206,8 @@ def fixup_config(sysinfo, configfile):
 
     BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
 
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
+    has_java = yield from sysinfo.has("java")
+    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
@@ -507,6 +512,7 @@ def fixup_config(sysinfo, configfile):
     return True
 
 
+@coroutine
 def gen_config(args):
     """Generate a new random configuration
 
@@ -565,7 +571,8 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
+    has_diffoscope = yield from sysinfo.has("diffoscope")
+    if has_diffoscope and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
@@ -579,10 +586,14 @@ def gen_config(args):
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    if not is_toolchain_usable(configfile, toolchainconfig):
+    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
+    if not toolchain_usable:
         return 2
 
     # Now, generate the random selection of packages, and fixup
@@ -596,21 +607,34 @@ def gen_config(args):
                   file=sys.stderr)
             return 1
         bounded_loop -= 1
-        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
-
-        if fixup_config(sysinfo, configfile):
+        proc = yield from asyncio.create_subprocess_exec(
+            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "randpackageconfig" if args.toolchains_csv else "randconfig")
+        ret = yield from proc.wait()
+        if ret:
+            return ret
+
+        ret = yield from fixup_config(sysinfo, configfile)
+        if ret:
             break
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
+    ret = yield from proc.wait()
+    if ret:
+        return ret
 
-    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "dependencies"])
+    proc = yield from asyncio.create_subprocess_exec(
+        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
+    ret = yield from proc.wait()
+    return ret
 
 
 if __name__ == '__main__':
@@ -642,7 +666,11 @@ if __name__ == '__main__':
     args.outputdir = os.path.abspath(args.outputdir)
 
     try:
-        ret = gen_config(args)
+        if sys.version_info < (3, 7):
+            loop = asyncio.get_event_loop()
+            ret = loop.run_until_complete(gen_config(args))
+        else:
+            ret = asyncio.run(gen_config(args))
     except Exception as e:
         print(str(e), file=sys.stderr)
         parser.exit(1)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
