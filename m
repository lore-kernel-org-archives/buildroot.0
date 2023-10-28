Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02CFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520EF42F64;
	Sat, 28 Oct 2023 21:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 520EF42F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35XjXy1eu_sU; Sat, 28 Oct 2023 21:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5EC42F30;
	Sat, 28 Oct 2023 21:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5EC42F30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 362A91BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8A33613AE
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8A33613AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bKtrGEPHz3u for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 131DB613BA
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131DB613BA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0ED7186079; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c709ab6fff85285c3f44eacbe780302a29a32ede
X-Git-Newrev: 98d0a7b95f416c88581788b5ad3ee3d1d5cbbd67
X-Patchwork-Hint: ignore
Message-Id: <20231028210322.0ED7186079@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libX11: security bump
 to version 1.8.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=98d0a7b95f416c88581788b5ad3ee3d1d5cbbd67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-43785, CVE-2023-43786 and CVE-2023-43787

https://lists.x.org/archives/xorg-announce/2023-October/003424.html
https://lists.x.org/archives/xorg-announce/2023-October/003426.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index f443d947a4..56fecee9ff 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-June/003407.html
-sha256  59535b7cc6989ba806a022f7e8533b28c4397b9d86e9d07b6df0c0703fa25cc9  libX11-1.8.6.tar.xz
-sha512  b94a578003078a42cea43d80fae2c54a3aaa30f706088bb3546331e9abfc180131cafb37887117abcc5b6116992e299974981eef96ecfcf883cc8a1aba4d1ade  libX11-1.8.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003426.html
+sha256  05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee  libX11-1.8.7.tar.xz
+sha512  d53bfc18f38d339a6a695b09835b2ae96b323881678bfe7ddca697605e3bdf4102ff49cc3078880a6c55b5977fcdd0aadaf5429086132de3a5bda302f79a2fa6  libX11-1.8.7.tar.xz
 # Locally computed
 sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 75199f1a3d..920a5d9aed 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.6
+XLIB_LIBX11_VERSION = 1.8.7
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
