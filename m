Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE40C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB76340A2A;
	Sat, 26 Nov 2022 18:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB76340A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSoFrYg9Xuzd; Sat, 26 Nov 2022 18:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDECF40A0E;
	Sat, 26 Nov 2022 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDECF40A0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5300C1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F88060E3E
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F88060E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_Rx1FAw-qwv for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F9D60E38
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F9D60E38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5418284705; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:24:53 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: da848bc81555b346ffe63afe8d0ac30326d5b088
X-Git-Newrev: 4f0351fcca663a0b89e5df0ae488e0a2d795f38f
X-Patchwork-Hint: ignore
Message-Id: <20221126183007.5418284705@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/edk2: fix the build
 for arm sgi575
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
Content-Type: multipart/mixed; boundary="===============0077276174493968593=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0077276174493968593==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4f0351fcca663a0b89e5df0ae488e0a2d795f38f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The edk2 package can be configured for platform Arm Sgi575 but this
does not build correctly:

Usage: build.exe [options] [all|fds|genc|genmake|clean|cleanall|cleanlib|modules|libraries|run]

build.exe: error: option -a: invalid choice: '-b' (choose from 'IA32', 'X64', 'EBC', 'ARM', 'AARCH64', 'RISCV64')
make[1]: *** [package/pkg-generic.mk:293: /home/thomas/buildroot/buildroot/output/build/edk2-edk2-stable202102/.stamp_built] Error 2
make: *** [Makefile:84: _all] Error 2

Add the necessary definitions to fix the build.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79591b76674a8c0ed150021a27771a73a70d159b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/edk2/edk2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index 5cbd9d152e..7d8765c310 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -75,6 +75,12 @@ EDK2_PACKAGE_NAME = ArmVirtPkg
 EDK2_PLATFORM_NAME = ArmVirtQemuKernel
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)-$(EDK2_ARCH)
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_SGI575),y)
+EDK2_ARCH = AARCH64
+EDK2_PACKAGE_NAME = Platform/ARM/SgiPkg/Sgi575
+EDK2_PLATFORM_NAME = Sgi575
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64),y)
 EDK2_ARCH = AARCH64
 EDK2_PACKAGE_NAME = Platform/ARM/VExpressPkg

--===============0077276174493968593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0077276174493968593==--
