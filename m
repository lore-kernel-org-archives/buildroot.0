Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11D583F0A;
	Thu, 16 Dec 2021 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hg1tmH1nJJMy; Thu, 16 Dec 2021 18:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A19883F0C;
	Thu, 16 Dec 2021 18:25:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6A261BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B33D783F0D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqfSvOJWgDyF for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05AC283F09
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 92D9282293; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9864815c7c04a85d6c5932e5ae05e980c974667d
X-Git-Newrev: b6e6c45327c6311117dc3316ad8413fc7540597a
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.92D9282293@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gupnp-tools: bump to version 0.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6e6c45327c6311117dc3316ad8413fc7540597a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://gitlab.gnome.org/GNOME/gupnp-tools/-/blob/gupnp-tools-0.10.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
