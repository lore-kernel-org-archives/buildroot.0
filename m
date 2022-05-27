Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0516C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E81A412F0;
	Fri, 27 May 2022 08:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwY7YZUzXnGY; Fri, 27 May 2022 08:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C7FE412EE;
	Fri, 27 May 2022 08:12:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 059561BF302
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4416883118
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSuvrTrSAh1s for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 915CF81442
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3E0C865C3; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:10:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: af5875c6aa73bbe7fd9b3d7a22da23462ea2cf3f
X-Git-Newrev: 38aa6f09d99c501625c9ed79e4c14b05ac8f0461
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.B3E0C865C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libinput: bump
 version to 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=38aa6f09d99c501625c9ed79e4c14b05ac8f0461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- change site URL to new gitlab.freedesktop.org location
- change hash from upstream provided to locally computed (and drop sha512)

For details see [1] and [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2022-February/042111.html
[2] https://gitlab.freedesktop.org/libinput/libinput/-/releases/1.20.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9cddb7bd56b8e430f6b798426b5c111c7b7d8fdd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 5 ++---
 package/libinput/libinput.mk   | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f18a727810..d1c7cfb104 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-December/042068.html
-sha256  3cae78ccde19d7d0f387e58bc734d4d17ab5f6426f54a9e8b728c90b17baa068  libinput-1.19.3.tar.xz
-sha512  f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298  libinput-1.19.3.tar.xz
+# Locally computed
+sha256  6c1f97892a7d599f97349e5e7c1239901fe00edcd4f6289f410034d5dc06cc85  libinput-1.20.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2f9c639c22..b814e3416d 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.3
-LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
-LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
+LIBINPUT_VERSION = 1.20.0
+LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
+LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
