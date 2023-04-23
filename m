Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE76FC77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E2982128;
	Sun, 23 Apr 2023 11:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E2982128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RROTglEkR_Sz; Sun, 23 Apr 2023 11:03:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 506FA8212F;
	Sun, 23 Apr 2023 11:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 506FA8212F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70DDB1C2B8E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5242160F5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5242160F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdLpQCH9Cd2c for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74CFC60BA6
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74CFC60BA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B9B18448A; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 13:01:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f9332229e52f1792c1296dfacc910a330b3d850
X-Git-Newrev: d2758794a453aa1eacdcb048070e6434ec601ca5
X-Patchwork-Hint: ignore
Message-Id: <20230423110248.5B9B18448A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: add upstream status to
 girdir patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2758794a453aa1eacdcb048070e6434ec601ca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Providing an upstream status for the remaining libglib2 patch from a
recent version bump. This patch was introduced in Buildroot around
November 2021 to help deal with build errors where `GObject-2.0.gir`
could not be found (tied to Buildroot changes made in
`gobject-introspection.mk`). The discussion thread mentions this could
be submitted upstream, but looks like it never was. Reflecting that this
package has not been submitted upstream.

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                                      | 1 -
 .../0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e11b5b6bb8..f0ad3e88bd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -804,7 +804,6 @@ package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
 package/libglib2/0001-fix-compile-time-atomic-detection.patch Upstream
 package/libglib2/0002-remove-cpp-requirement.patch Upstream
 package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch Upstream
-package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch Upstream
 package/libgpgme/0001-Fix-build-without-threads.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
 package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
diff --git a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index db77a73203..fb99057242 100644
--- a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -14,6 +14,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: Never submitted
 ---
  gio/meson.build  | 1 +
  glib/meson.build | 1 +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
