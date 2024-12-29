Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D00E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 002644050B;
	Sun, 29 Dec 2024 12:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvLYba8q4Cl8; Sun, 29 Dec 2024 12:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB92B40541
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB92B40541;
	Sun, 29 Dec 2024 12:00:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC45C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 239E460850
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKUc2JoosOrG for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B99B6084B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B99B6084B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:00:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 232A180250; Sun, 29 Dec 2024 12:00:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 12:34:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6beee86c0d953dd67549d27c1f684132bc052a31
X-Git-Newrev: f27dcb9310464d21916625c892a9bc2a25664b9b
X-Patchwork-Hint: ignore
Message-Id: <20241229120014.232A180250@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland: bump to version 1.23.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f27dcb9310464d21916625c892a9bc2a25664b9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From
https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html:

This is a bugfix release for Wayland 1.23.

Joaquim Monteiro (1):
      meson: Fix use of install_data() without specifying install_dir

Kirill Primak (1):
      Put WL_DEPRECATED in front of the function declarations

Sebastian Wick (1):
      client: Handle proxies with no queue

Simon Ser (4):
      scanner: extract validator function emission to helper function
      scanner: fix validator for bitfields
      tests: add enum bitfield test
      build: bump version to 1.23.1 for the bugfix release

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 627cb5a1b0..f7c085513a 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
-sha256  05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2  wayland-1.23.0.tar.xz
-sha512  9c525231a7ea3e68d3178230d476285a960d23e38571ac96d885f86c0588c52ef01460bff6833db5adb9456ce8db7b996613611187aac972736748ba91b8fd81  wayland-1.23.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html
+sha256  864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed  wayland-1.23.1.tar.xz
+sha512  818eda003e3f7aa15690eedb1ff227a6056b2ce54bf23d45ffe573dc40a914623c5a1358218b59444dcdc483db0503324f0d27091d0ea954412a8b290de5f50a  wayland-1.23.1.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 06adafc3e1..bb5ceabb9c 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.23.0
+WAYLAND_VERSION = 1.23.1
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
