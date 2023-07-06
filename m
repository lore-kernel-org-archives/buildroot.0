Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C6BEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8539D40A87;
	Thu,  6 Jul 2023 11:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8539D40A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmkO9w_rO6bK; Thu,  6 Jul 2023 11:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B34C4151B;
	Thu,  6 Jul 2023 11:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B34C4151B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07A681BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B872D82144
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B872D82144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joh3SPeKOPgK for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1151813C2
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1151813C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D046F868EE; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:47:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: a3726f9b5ef8738080f3ae08315bf8044065a71d
X-Git-Newrev: 1d030119fc6571b615fb8bf7b65d286ff7e56df2
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.D046F868EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mesa3d: fix
 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d030119fc6571b615fb8bf7b65d286ff7e56df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Update 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch to
fix an syntax error introduced by commit 'package/{mesa3d, mesa3d-headers}:
bump version to 23.1.0' ([1])

Fixes:

  .../build/mesa3d-23.1.2/src/gallium/drivers/vc4/meson.build:87:76: ERROR:
  Trying to compare values of different types (UserFeatureOption, str) using !=.
  This was deprecated and undefined behavior previously and is as of 0.60.0 a hard error.

[1] https://git.buildroot.net/buildroot/commit/?id=e6203db11ed40122a2d9f29012db5683a7eb10d0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit da19c18af2d531b63b6d54f02dc2f16785756e66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...on-option-to-disable-optional-neon-suppor.patch | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index a5564fcf3a..430bd3b4b9 100644
--- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -1,4 +1,4 @@
-From e3b47c1b84964c62b3e1fa782f1ffa4be0ae62f9 Mon Sep 17 00:00:00 2001
+From f719e942dde0a46a9ff0080001cb3466012ffcc0 Mon Sep 17 00:00:00 2001
 From: Peter Seiderer <ps.report@gmx.net>
 Date: Mon, 9 Mar 2020 13:01:14 +0100
 Subject: [PATCH] vc4: add meson option to disable optional neon support
@@ -11,6 +11,8 @@ Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 [rebased for 20.2.0, 20.3.0, 21.1.0 & 23.1.0]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[fix syntax error after previous rebases]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -18,25 +20,25 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  3 files changed, 11 insertions(+), 4 deletions(-)
 
 diff --git a/meson_options.txt b/meson_options.txt
-index a39596a6f19..0f6b6c62b55 100644
+index 8e0bf2a..1cf0e07 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -117,6 +117,13 @@
+@@ -116,6 +116,13 @@ option(
+   description : 'enable gallium va frontend.',
  )
  
- option(
++option(
 +  'gallium-vc4-neon',
 +  type : 'feature',
 +  deprecated: {'true': 'enabled', 'false': 'disabled'},
 +  description : 'enable gallium vc4 optional neon support.',
 +)
 +
-+option(
+ option(
    'va-libs-path',
    type : 'string',
-   value : '',
 diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson.build
-index 5ce5af5f6b4..e3f7d8d62ae 100644
+index 84da951..7f950de 100644
 --- a/src/gallium/drivers/vc4/meson.build
 +++ b/src/gallium/drivers/vc4/meson.build
 @@ -84,7 +84,7 @@ files_libvc4 = files(
@@ -44,7 +46,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
  
  libvc4_neon = []
 -if host_machine.cpu_family() == 'arm'
-+if host_machine.cpu_family() == 'arm' and get_option('gallium-vc4-neon') != 'disabled'
++if host_machine.cpu_family() == 'arm' and not get_option('gallium-vc4-neon').disabled()
    libvc4_neon = static_library(
      'vc4_neon',
      'vc4_tiling_lt_neon.c',
@@ -58,7 +60,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
  
  if dep_simpenrose.found()
 diff --git a/src/gallium/drivers/vc4/vc4_tiling.h b/src/gallium/drivers/vc4/vc4_tiling.h
-index 66767e7f1f8..7446f1c3d0c 100644
+index 5afe329..919b299 100644
 --- a/src/gallium/drivers/vc4/vc4_tiling.h
 +++ b/src/gallium/drivers/vc4/vc4_tiling.h
 @@ -89,7 +89,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
@@ -80,5 +82,5 @@ index 66767e7f1f8..7446f1c3d0c 100644
                  vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
                                          cpp, box);
 -- 
-2.25.1
+2.41.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
