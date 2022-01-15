Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B43C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACBB140004;
	Sat, 15 Jan 2022 15:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQS87o3nbXmg; Sat, 15 Jan 2022 15:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740284010E;
	Sat, 15 Jan 2022 15:37:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 453A21BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 311134010E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJDWHFJYVef5 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17EEC40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BAD4B82B52; Sat, 15 Jan 2022 15:30:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:19:40 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d80c0e4488f45f14dc7a686a3d3251c93552c342
X-Git-Newrev: 26b2c756e7eb8ac383d505497627e180007c8b1c
X-Patchwork-Hint: ignore
Message-Id: <20220115153049.BAD4B82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/gupnp-tools: bump
 to version 0.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=26b2c756e7eb8ac383d505497627e180007c8b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Drop patch (already in version)

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b6e6c45327c6311117dc3316ad8413fc7540597a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-src-meson.build-upload-needs-gupnp-av.patch | 30 ----------------------
 package/gupnp-tools/gupnp-tools.hash               |  4 +--
 package/gupnp-tools/gupnp-tools.mk                 |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch b/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
deleted file mode 100644
index f8eba76773..0000000000
--- a/package/gupnp-tools/0001-src-meson.build-upload-needs-gupnp-av.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0831f77e990e363f78e3f6a5c461084988824f7b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 2 Jul 2019 23:48:12 +0200
-Subject: [PATCH] src/meson.build: upload needs gupnp-av
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/gupnp-tools/merge_requests/3]
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 84b2ca2..6601f45 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -2,9 +2,9 @@ subdir('common')
- 
- if get_option('av-tools') and gupnp_av.found()
-     subdir('av-cp')
-+    subdir('upload')
- endif
- 
- subdir('discover')
- subdir('network-light')
- subdir('universal-cp')
--subdir('upload')
--- 
-2.20.1
-
diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index 30f1b8293d..28a1d26ede 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.0.sha256sum:
-sha256  41da7ff5ba8e2425adcb64ca5e04c81f57ca20ec6fdb84923939fdad42c6a18d  gupnp-tools-0.10.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.2.sha256sum:
+sha256  6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4f5341f08dfd85d6c  gupnp-tools-0.10.2.tar.xz
 
 # Locally computed:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 182b0145c8..7b34de52a0 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.10
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).0
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).2
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
