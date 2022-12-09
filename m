Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F0BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 16:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C360C61195;
	Fri,  9 Dec 2022 16:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C360C61195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYcvK66Mt2go; Fri,  9 Dec 2022 16:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05ED960F31;
	Fri,  9 Dec 2022 16:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05ED960F31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37DCC1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1363040002
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1363040002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgCs2xHJWNUw for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 16:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4692041006
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 16:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4692041006
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34DA685E90; Fri,  9 Dec 2022 16:20:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:19:07 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 49ec8c2cd4f37e8f7d57dc44d5deba4ddc8bd7b0
X-Git-Newrev: a2272be318cddda16cb802bcefcc4fba0af1db48
X-Patchwork-Hint: ignore
Message-Id: <20221209162027.34DA685E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/genrandconfig: add
 mxs-bootlets board handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2272be318cddda16cb802bcefcc4fba0af1db48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Add a custom case to make sure that a random configuration with an empty
board for mxs-bootlets doesn't fail. It reverts to
BR2_TARGET_MXS_BOOTLETS_STMP37xx in that case.

>>> mxs-bootlets 10.12.01 Building
BOARD= CROSS_COMPILE="/home/thomas/autobuild/instance-1/output-1/per-package/mxs-bootlets/host/bin/arm-buildroot-linux-uclibcgnueabi-" /usr/bin/make -j1 -C /home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01 power_prep
/home/thomas/autobuild/instance-1/output-1/per-package/xinetd/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -static -DNO_RPC  -I../../include   -c -o inet_aton.o inet_aton.c
make[1]: Entering directory '/home/thomas/autobuild/instance-1/buildroot'
make[1]: warning: -j1 forced in submake: resetting jobserver mode.
build power_prep
/usr/bin/make -C power_prep ARCH= BOARD=
make[2]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
/usr/bin/make -C ./../mach-/hw
make[3]: Entering directory '/home/thomas/autobuild/instance-1/output-1/build/mxs-bootlets-10.12.01/power_prep'
make[3]: *** ../mach-/hw: No such file or directory.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/44a2efc64b9b8ff4541430d6b649e7a11a4e4873

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c1f67428af623b39312270a490dfc9a6d647773)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index eccd3a228e..b4ebb9a9be 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -559,6 +559,13 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y\n' in configlines and \
+       'BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME=""\n' in configlines:
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y\n')
+        configlines.append('BR2_TARGET_MXS_BOOTLETS_STMP37xx=y\n')
+        configlines.remove('BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME=""\n')
+
     if 'BR2_TARGET_MXS_BOOTLETS=y\n' in configlines and \
        'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT=y\n' in configlines and \
        'BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
