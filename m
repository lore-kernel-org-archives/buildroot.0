Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE47EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E84141559;
	Thu,  6 Jul 2023 11:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E84141559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TgSHNxXXKHV; Thu,  6 Jul 2023 11:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 655044155E;
	Thu,  6 Jul 2023 11:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655044155E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 769011BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D67140136
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D67140136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsu4smw8m9m1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7DAF4027F
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7DAF4027F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8485868F1; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:45:30 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6e248a121c5b57e6980a213ed7b311dce4194ae6
X-Git-Newrev: 214a6454c61392fa533f12d7dae3096d2fd56508
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.B8485868F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/kodi: fix build
 error with flatbuffers 23.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=214a6454c61392fa533f12d7dae3096d2fd56508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes build error with defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

caused by bumping flatbuffers to version >= 23.x in commit
3d1ee7d624b71009ff61d4fa5ed860c52eb89b47

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 35b57c9e879389bcec045bc00d3c1e0761379ad1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...atBuffer-Remove-forward-declararion-of-Fl.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
new file mode 100644
index 0000000000..87df0e4c9a
--- /dev/null
+++ b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
@@ -0,0 +1,42 @@
+From 07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
+Date: Sun, 28 May 2023 00:49:40 +0200
+Subject: [PATCH] SavestateFlatBuffer: Remove forward declararion of
+ FlatBufferBuilder
+
+This caused a compiler error with recent faltbuffers because the type changed:
+
+In file included from xbmc/cores/RetroPlayer/savestates/SavestateDatabase.cpp:12:
+xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h:19:7: error: definition of type 'FlatBufferBuilder' conflicts with type alias of the same name
+class FlatBufferBuilder;
+      ^
+/usr/include/flatbuffers/flatbuffer_builder.h:1414:7: note: 'FlatBufferBuilder' declared here
+using FlatBufferBuilder = FlatBufferBuilderImpl<false>;
+      ^
+1 error generated.
+
+(cherry picked from commit 351184d7e4e3edc447d04a297769eb41a477ba68)
+
+Upstream: https://github.com/xbmc/xbmc/commit/07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
+index cb93e6bbc2e12..fa42a9bad7034 100644
+--- a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
++++ b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
+@@ -14,11 +14,6 @@
+ 
+ #include <flatbuffers/flatbuffers.h>
+ 
+-namespace flatbuffers
+-{
+-class FlatBufferBuilder;
+-}
+-
+ namespace KODI
+ {
+ namespace RETRO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
