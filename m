Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57043C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA63941DE7;
	Sat,  3 Jun 2023 19:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA63941DE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDF7EhbcP7Ks; Sat,  3 Jun 2023 19:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7301E41DB0;
	Sat,  3 Jun 2023 19:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7301E41DB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA34C1BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFCD060E91
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFCD060E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVueQEkvInhC for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6058660E4D
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6058660E4D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D8A58681D; Sat,  3 Jun 2023 19:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 21:33:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51b60c8acf3f4b534d0954b801f1034491b59c94
X-Git-Newrev: 11db2d6fde313fc832baef38a25b4a24c31375ce
X-Patchwork-Hint: ignore
Message-Id: <20230603194325.4D8A58681D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: fix build error with the
 i915 Gallium driver
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11db2d6fde313fc832baef38a25b4a24c31375ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The error was introduced by mesa3d commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=dfd20f002f388be3f168938bc1f25e91bb08bf98
which was first introduced in mesa3d 23.0.0, added with buildroot commit
89944e2c459d45dd4271c49e35dd4a13dfd850a4

Fixes:
http://autobuild.buildroot.net/results/9c1/9c1407ca5be221dbb3ee03d2a95ada65bb7eb36b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout:
 - rename 0005 -> 0006 - another patch was added in parallel;
 - use gitlab instead of cgit for upstream link
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...e-i915-Gallium-driver-includes-Intel-sour.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch b/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
new file mode 100644
index 0000000000..6831bdafd3
--- /dev/null
+++ b/package/mesa3d/0006-meson-ensure-i915-Gallium-driver-includes-Intel-sour.patch
@@ -0,0 +1,46 @@
+From cd861b7f38e448822ce765aee61304d1e0a3a8b5 Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Thu, 13 Apr 2023 16:38:51 -0400
+Subject: meson: ensure i915 Gallium driver includes Intel sources
+
+Ensure builds flag the use of Intel sources when the i915 Gallium driver
+is configured (`-Dgallium-drivers=i915`). Otherwise, a build may fail if
+other Intel-based configuration options are not enabled:
+
+    ./src/gallium/winsys/i915/drm/meson.build:21:0: ERROR: Unknown variable "libintel_common".
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22490>
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/cd861b7f38e448822ce765aee61304d1e0a3a8b5
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ meson.build | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+(limited to 'meson.build')
+
+diff --git a/meson.build b/meson.build
+index 23d2d965b37..a3e3c5478a8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -245,7 +245,14 @@ with_microsoft_vk = _vulkan_drivers.contains('microsoft-experimental')
+ with_any_vk = _vulkan_drivers.length() != 0
+ 
+ with_any_broadcom = with_gallium_vc4 or with_gallium_v3d or with_broadcom_vk
+-with_any_intel = with_intel_vk or with_intel_hasvk or with_gallium_iris or with_gallium_crocus or with_intel_tools
++with_any_intel = [
++  with_gallium_crocus,
++  with_gallium_i915,
++  with_gallium_iris,
++  with_intel_hasvk,
++  with_intel_tools,
++  with_intel_vk,
++].contains(true)
+ 
+ if with_swrast_vk and not with_gallium_softpipe
+   error('swrast vulkan requires gallium swrast')
+-- 
+cgit v1.2.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
