Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4FFC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85ACB84A9F;
	Sat,  8 Jun 2024 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7q8IHzCEAvQw; Sat,  8 Jun 2024 19:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8E584CD7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8E584CD7;
	Sat,  8 Jun 2024 19:17:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5051BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2DC400EA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kw9JTZBPc_Ty for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6684340437
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6684340437
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B37287C6F; Sat,  8 Jun 2024 19:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:18:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d9bb7bb688b6201c6f1678e38c3018ea193d0237
X-Git-Newrev: 97d7a8e9c81dab338d7e5faae47471eeda0109d6
X-Patchwork-Hint: ignore
Message-Id: <20240608191502.5B37287C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig: drop
 glibc Linaro toolchain version check
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

commit: https://git.buildroot.net/buildroot/commit/?id=97d7a8e9c81dab338d7e5faae47471eeda0109d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

It has been well over 10 years since glibc 2.14 was released; the last
Debian version that had an earlier glibc was Wheezy, which Freexian
stopped to maintain as an ELTS in June 2020, 4 years ago, while the
oldest still maintained Ubuntu has glibc 2.21. It is now safe to assume
glibc 2.14 on all major, relevant distributions nowadays.

The distutils module is no longer bundled with python 3.12 so this
eliminates the need to install additional python modules under python
3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add Debian and Ubuntu references]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 929a491f4073d600cd95be4cf97d53faa9a6e38e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index d00b9cb36f..f2f1e33361 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -25,8 +25,6 @@ import os
 from random import randint
 import sys
 import traceback
-from distutils.version import StrictVersion
-import platform
 
 
 class SystemInfo:
@@ -166,23 +164,6 @@ async def is_toolchain_usable(configfile, config):
             print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
             return False
 
-    # The latest Linaro toolchains on x86-64 hosts requires glibc
-    # 2.14+ on the host.
-    if platform.machine() == 'x86_64':
-        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            proc = await asyncio.create_subprocess_exec(
-                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
-            ldd_version_output, _ = await proc.communicate()
-            if proc.returncode:
-                return False
-            glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
-            if StrictVersion('2.14') > StrictVersion(glibc_version):
-                print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
-                return False
-
     return True
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
