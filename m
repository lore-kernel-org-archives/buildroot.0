Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B7C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B80E40323;
	Sun, 11 Feb 2024 15:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seSYfeg_5RqJ; Sun, 11 Feb 2024 15:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46192403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46192403A4;
	Sun, 11 Feb 2024 15:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA6291BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84B181F1D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2oYht_vMr5ro for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0977A81D24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0977A81D24
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:34:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F35CF8770E; Sun, 11 Feb 2024 15:34:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 16:33:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e0826d0672e9347fba03cf96ac9e7a48c36dac6
X-Git-Newrev: 614e05f91524ae0f4c7d0bb8c7844645a85497fb
X-Patchwork-Hint: ignore
Message-Id: <20240211153429.F35CF8770E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqrtr-glib: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=614e05f91524ae0f4c7d0bb8c7844645a85497fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version
1.2.2 in commit b50bb982208011841fe0a9a7e4309808085cf493:

[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0

Fixes:
 - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-libqrtr-lib-meson.build-fix-static-build.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
new file mode 100644
index 0000000000..8c0db7bed5
--- /dev/null
+++ b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
@@ -0,0 +1,36 @@
+From dd9d68259c1fb79bcf40fcdf6aa1e6026edec9b2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 9 Feb 2024 21:16:39 +0100
+Subject: [PATCH] src/libqrtr-lib/meson.build: fix static build
+
+Replace shared_library by library to avoid the following static build
+failure:
+
+[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
+FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/merge_requests/24
+---
+ src/libqrtr-glib/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libqrtr-glib/meson.build b/src/libqrtr-glib/meson.build
+index bbdd869..0cddcc7 100644
+--- a/src/libqrtr-glib/meson.build
++++ b/src/libqrtr-glib/meson.build
+@@ -39,7 +39,7 @@ c_flags = [
+   '-DLIBEXEC_PATH="@0@"'.format(qrtr_prefix / qrtr_libexecdir),
+ ]
+ 
+-libqrtr_glib = shared_library(
++libqrtr_glib = library(
+   libname,
+   version: qrtr_glib_version,
+   sources: sources + [version_header],
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
