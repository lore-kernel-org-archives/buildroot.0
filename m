Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0072CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 18:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1438F82FD7;
	Sun,  5 Oct 2025 18:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf8hflGR-pEK; Sun,  5 Oct 2025 18:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61DBC83BF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DBC83BF8;
	Sun,  5 Oct 2025 18:07:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED3AD76
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 654EA40B37
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq7LzoyAk9c6 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF2E40912
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAF2E40912
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99AD58692B; Sun,  5 Oct 2025 18:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 20:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ecb2d2847701795d384ee9e4eaeb0669dcc2bef
X-Git-Newrev: 537555a37f53360020a11df8065450d88e9d107c
X-Patchwork-Hint: ignore
Message-Id: <20251005180659.99AD58692B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libudfread: bump version to 1.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=537555a37f53360020a11df8065450d88e9d107c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by libbluray bump to 1.4.0

Changelog:
https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/ChangeLog?ref_type=tags

Use xz tarball and sha512 hash provided by upstream.

Follow upstream switch to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix hash file spacing to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libudfread/libudfread.hash | 3 ++-
 package/libudfread/libudfread.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libudfread/libudfread.hash b/package/libudfread/libudfread.hash
index 332b472d59..90fd10d5e9 100644
--- a/package/libudfread/libudfread.hash
+++ b/package/libudfread/libudfread.hash
@@ -1,3 +1,4 @@
+# From https://download.videolan.org/pub/videolan/libudfread/libudfread-1.2.0.tar.xz.sha512
+sha512  e3ed8dc7fab472ad382b1b6cd068f1dc0084c34e5ec2c460c1dd84fa14a9d368c4d7af08a23efc5057e7f021f5812222c01247d5f304632716c94fc8c689a1a2  libudfread-1.2.0.tar.xz
 # Locally computed
-sha256  cd062016d78902da53a34c4d536479dbb70b2a05116354d46ead4d0c498ed375  libudfread-1.1.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
index 55d4fb8e47..1e74c42076 100644
--- a/package/libudfread/libudfread.mk
+++ b/package/libudfread/libudfread.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBUDFREAD_VERSION = 1.1.2
-LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
-LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
-LIBUDFREAD_AUTORECONF = YES
+LIBUDFREAD_VERSION = 1.2.0
+LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.xz
+LIBUDFREAD_SITE = https://download.videolan.org/pub/videolan/libudfread
 LIBUDFREAD_INSTALL_STAGING = YES
 LIBUDFREAD_LICENSE = LGPL-2.1+
 LIBUDFREAD_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
