Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 23:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDDA4045F;
	Sat, 11 Dec 2021 23:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yw5LTxqMDgPz; Sat, 11 Dec 2021 23:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428AB40473;
	Sat, 11 Dec 2021 23:10:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 132DF1BF297
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D52D40291
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 23:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqNdOE2XFv1t for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 23:06:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C384F404B7
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 23:06:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A52B82AE1; Sat, 11 Dec 2021 23:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 00:03:22 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 86fae021284148c41fe4d3abadef3693395d0e1b
X-Git-Newrev: 8d83d809d0778aad6a5b57f3c71ab1f0f7de835e
X-Patchwork-Hint: ignore
Message-Id: <20211211230119.6A52B82AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libglib2: update
 fourth patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d83d809d0778aad6a5b57f3c71ab1f0f7de835e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Update fourth patch to add girdir in gio-2.0.pc. This will fix the
following build failure with libnice raised since commit
aade2fd293fc8a13bc5665fa70a4002ddac9aae6:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler nice/Nice-0.1.gir --output nice/Nice-0.1.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir

Fixes:
 - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2c916b400bc608512db790d97df010ca666b6dd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch} | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
similarity index 53%
rename from package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
rename to package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index 7eeecbe336..a29587bd31 100644
--- a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
+++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -1,21 +1,36 @@
-From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
+From ff3db531608eb0f9de8a88c1bc34fe0f1d93121c Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Nov 2021 18:01:05 +0100
-Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
+Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
 
-Add girdir to glib-2.0.pc to fix the following build failure with atk:
+Add girdir to gio-2.0.pc and glib-2.0.pc to fix the following build
+failure with atk or libnice:
 
 /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
 Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
 
 Fixes:
  - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
+ - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
+ gio/meson.build  | 1 +
  glib/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ 2 files changed, 2 insertions(+)
 
+diff --git a/gio/meson.build b/gio/meson.build
+index 29473d26b..112d4ada9 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -831,6 +831,7 @@ pkg.generate(libgio,
+   variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
+                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
+                'bindir=' + join_paths('${prefix}', get_option('bindir')),
++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+                'giomoduledir=' + pkgconfig_giomodulesdir,
+                'gio=' + join_paths('${bindir}', 'gio'),
+                'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
 diff --git a/glib/meson.build b/glib/meson.build
 index f78f32969..6c5486699 100644
 --- a/glib/meson.build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
