Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A980FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5853B46F1F;
	Mon, 20 Feb 2023 21:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5853B46F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0ffB3QipGOH; Mon, 20 Feb 2023 21:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2876E4EBCA;
	Mon, 20 Feb 2023 21:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2876E4EBCA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5E511BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90226610BE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90226610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAQtNEqqu3gj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A42B7610FF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42B7610FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CCD58648F; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 08:14:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 34c7b86224556822ce1003b639f98bf87d7496b6
X-Git-Newrev: 5c1f67428af623b39312270a490dfc9a6d647773
X-Patchwork-Hint: ignore
Message-Id: <20230220205155.9CCD58648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/genrandconfig: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c1f67428af623b39312270a490dfc9a6d647773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
