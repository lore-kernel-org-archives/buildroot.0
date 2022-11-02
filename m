Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E55C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD7C81E40;
	Wed,  2 Nov 2022 21:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBD7C81E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1kQSlK-X2ob; Wed,  2 Nov 2022 21:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F138281E38;
	Wed,  2 Nov 2022 21:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F138281E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0785E1BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D640B60767
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D640B60767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zxaS28U2EXx for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:03:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BE960737
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BE960737
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA57587A6D; Wed,  2 Nov 2022 21:03:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 22:02:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb2a53c26f17b1affe98c982da7a805a85c96990
X-Git-Newrev: 28bcaf1e746849f156d8778689a8702d95e6a6d9
X-Patchwork-Hint: ignore
Message-Id: <20221102210310.EA57587A6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: prepare for 2022.11-rc1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=28bcaf1e746849f156d8778689a8702d95e6a6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/CHANGES b/CHANGES
index ef58d17d89..72b874de34 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,53 @@
+2022.11-rc1, to be released
+
+	Fixes all over the tree and new features.
+
+	Architecture:
+
+	- PowerPC: add Power9 CPU type
+	- ARM: support dropped for iWMMXt processors
+
+	Toolchain:
+
+	- binutils 2.39 added, binutils 2.38 is now the default
+	- gdb 12 added, gdb 11 is now the default
+	- support for 5.18, 5.19 and 6.0 kernel headers
+	- glibc updated to 2.36
+
+	Filesystem:
+
+	- Ability to use dracut to create an initramfs that contains a
+          subset of the root filesystem contents.
+
+	New packages: agent-proxy, catatonit, cni-plugins, crun,
+	docopt-cpp, dracut, forge, kmemd, libmanette, mdio-tools,
+	open-isns, python-editables, python-hatch-fancy-pypi-readme,
+	python-hatch-vcs, python-hatchling, python-libevdev,
+	python-minimalmodbus, python-pathspec, qt6-serialport,
+	rtl8192eu, signal-estimator, slirp4netns, tinycompress
+
+	More than 400 packages have been updated to a newer version.
+
+	New defconfigs: ls1028ardb, qemu_aarch64_ebbr, visionfive.
+
+	Issues resolved:
+
+	#11776: qt5webengine 5.12.2 build failed with arm toolchain
+	        and linaro toolchain
+	#12131: qt5webengine builderror in the latest stable Buildroot
+	        2019.05.01 version
+	#13216: 2020.02.6 requires GNU find  utils
+	#14601: Python build fails on 2022.02-rc2
+	#14746: Lack of management after loading
+	#14796: 64 bit time and seccomp conflict (OpenSSH  server crash)
+	#14921: wpewebkit build fails because of internal  build order
+	#14936: nodejs does not build
+	#15006: toolchain Arm AArch64 toolchain 11.2-2022.02
+	#15021: Buildroot not compiling with systemd  and glibc.
+	#15026: package/udisks: install to staging
+	#15061: Node.js Package fails to build against musl  i386
+	#15071: RTL8723BS library is outdated
+
 2022.08.1, released October 2nd, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
