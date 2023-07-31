Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B87C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF2A8610B5;
	Mon, 31 Jul 2023 14:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF2A8610B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnHMFL3j9ATO; Mon, 31 Jul 2023 14:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A006109A;
	Mon, 31 Jul 2023 14:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23A006109A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A94531BF97D
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81D5181A34
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D5181A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvTJ2ZY2r7S0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:55:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DCDE81A29
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DCDE81A29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 891A683D9C; Mon, 31 Jul 2023 14:55:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 16:48:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2db3a704369e65795cba8f38290df1f60713e2bb
X-Git-Newrev: 2650b519ff9bd80011768633d3d00c5ac252d3eb
X-Patchwork-Hint: ignore
Message-Id: <20230731145500.891A683D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 8.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2650b519ff9bd80011768633d3d00c5ac252d3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch | 2 +-
 package/qemu/qemu.hash                                             | 2 +-
 package/qemu/qemu.mk                                               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
index 60518bcfa3..fb7a9a6989 100644
--- a/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
+++ b/package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
@@ -15,7 +15,7 @@ diff --git a/tests/fp/meson.build b/tests/fp/meson.build
 index 8bd0979f67..2fe019d2c6 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
-@@ -636,6 +636,7 @@ fpbench = executable(
+@@ -640,6 +640,7 @@ fpbench = executable(
    dependencies: [qemuutil],
    include_directories: [sfinc, include_directories(tfdir)],
    c_args: fpcflags,
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index b6fcad83e2..e71742c243 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5  qemu-8.0.2.tar.xz
+sha256  ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09  qemu-8.0.3.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index c530896fa8..b341d0220d 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.2
+QEMU_VERSION = 8.0.3
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
