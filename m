Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD42C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F354F05E;
	Fri, 28 Feb 2025 16:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFw4AyrXfRYZ; Fri, 28 Feb 2025 16:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DDAE424D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DDAE424D6;
	Fri, 28 Feb 2025 16:33:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1693C711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF626FAB7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jj4GNMUg-xJx for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069F56FACC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 069F56FACC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A0E81793; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 12:34:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f27dcb9310464d21916625c892a9bc2a25664b9b
X-Git-Newrev: 6f74ee11b484b55b4d314195b4e5abf2f3625382
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.F3A0E81793@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/weston: bump to
 version 14.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f74ee11b484b55b4d314195b4e5abf2f3625382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From
https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html:

This is Weston 14.0.1, a bug-fix release. Most of the fixes here are
addressing some build issues with a C++ compiler, but also addressing a
more critical issue that was causing the gtk4 test suite or other clients
to crash when using the headless backend.

Some distros already carry a patch to address that, but in case they
have not, this would be a good time to update.

David Edmundson (1):
      libweston: Send seat name before announcing devices

EatingSumo (1):
      libweston/screenshooter: Fix build when __builtin_clz is not available

Jan Alexander Steffens (heftig) (1):
      libweston/noop-renderer: Check shm_buffer for NULL

Jan Engelhardt (1):
      build: insert missing wayland-server-protocol dependency

Jeri Li (1):
      libweston/desktop: avoid weston crash while xdg_surface ack_configure

Marius Vlad (4):
      libweston: Move weston_get_backend_type after enum declaration
      desktop-shell: Don't attempt to re-add the view to panel layer
      libweston/matrix: Fix narrow conversion with C++
      build: bump to version 14.0.1 for the point release

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 2fdc6ec1f4..35fe608e20 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-September/043776.html
-sha256  47fd0325b0b948e9b003a38fdf4eb3a8581f3fdc740b8932b35ae8793bf4e4a5  weston-14.0.0.tar.xz
-sha512  8bdeed91befd5cbb0bde0f1860ff7775c1835a5fa8c3bf26e99d2f0c16e81255fcf35bf338ae02d7826463d0efdf41ba3fe78e38e4c27787831dfa331acafc08  weston-14.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html
+sha256  a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3  weston-14.0.1.tar.xz
+sha512  2d782f98f28b39b990acecfc885f62ab34c9cdd22ef06b09c5d8df792112c47b365f89c2bf05d871e36ddfb4c49aa7e6d05ff60fe67a2657727162e4f564a412  weston-14.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index d879dcc965..7d43132073 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.0
+WESTON_VERSION = 14.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
